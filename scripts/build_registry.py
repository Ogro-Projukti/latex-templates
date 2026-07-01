#!/usr/bin/env python3
"""Build registry.json and badge files from templates/*/meta.json."""
from __future__ import annotations

import argparse
import json
import re
import sys
from datetime import date
from pathlib import Path

DEFAULT_GITHUB_REPO = "Ogro-Projukti/latex-templates"
DEFAULT_BRANCH = "main"
REGISTRY_VERSION = "1"
EXCLUDED_FILES = {"meta.json"}
EXCLUDED_DIR_NAMES = {".git", ".kb", ".latium", "__pycache__", "node_modules"}
KEBAB_CASE = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")


def repo_root_from_script() -> Path:
    return Path(__file__).resolve().parents[1]


def title_from_id(template_id: str) -> str:
    return " ".join(part.capitalize() for part in template_id.split("-"))


def person_name(value: object) -> str | None:
    if isinstance(value, dict):
        name = str(value.get("name", "")).strip()
        return name or None
    if isinstance(value, str):
        stripped = value.strip()
        return stripped or None
    return None


def person_profile(value: object) -> dict | None:
    if not isinstance(value, dict):
        return None
    name = str(value.get("name", "")).strip()
    if not name:
        return None
    profile = {"name": name}
    github = str(value.get("github", "")).strip()
    if github:
        profile["github"] = github
    return profile


def format_size(num_bytes: int) -> str:
    if num_bytes < 1024:
        return f"{num_bytes}B"
    size_kb = num_bytes / 1024
    if size_kb < 1024:
        return f"{size_kb:.1f}KB"
    return f"{size_kb / 1024:.1f}MB"


def normalize_json(payload: object) -> str:
    return json.dumps(payload, indent=2, ensure_ascii=False) + "\n"


def list_template_files(template_dir: Path, preview_path: str | None) -> list[str]:
    files: list[str] = []
    preview_norm = preview_path.replace("\\", "/") if preview_path else None
    for path in sorted(template_dir.rglob("*")):
        if not path.is_file():
            continue
        relative = path.relative_to(template_dir)
        if any(part in EXCLUDED_DIR_NAMES or part.startswith(".") for part in relative.parts):
            continue
        relative_posix = relative.as_posix()
        if relative_posix in EXCLUDED_FILES:
            continue
        if preview_norm and relative_posix == preview_norm:
            continue
        files.append(relative_posix)
    return files


def validate_meta(meta: dict, template_dir: Path) -> list[str]:
    errors: list[str] = []
    folder_name = template_dir.name
    template_id = str(meta.get("id", "")).strip()
    if not template_id:
        errors.append(f"{folder_name}: meta.json is missing 'id'")
    elif not KEBAB_CASE.match(template_id):
        errors.append(f"{folder_name}: id '{template_id}' must be kebab-case")
    elif template_id != folder_name:
        errors.append(
            f"{folder_name}: meta.json id '{template_id}' does not match folder name"
        )

    if not str(meta.get("description", "")).strip():
        errors.append(f"{folder_name}: meta.json is missing 'description'")

    if not str(meta.get("version", "")).strip():
        errors.append(f"{folder_name}: meta.json is missing 'version'")

    if not str(meta.get("category", "")).strip():
        errors.append(f"{folder_name}: meta.json is missing 'category' (maintainer field)")

    if not str(meta.get("license", "")).strip():
        errors.append(f"{folder_name}: meta.json is missing 'license' (maintainer field)")

    if not person_name(meta.get("contributor")) and not person_name(meta.get("author")):
        errors.append(f"{folder_name}: meta.json needs contributor.name or author.name")

    preview = bool(meta.get("preview"))
    preview_path = str(meta.get("previewImagePath", "preview.png")).strip() or "preview.png"
    if preview and not (template_dir / preview_path).is_file():
        errors.append(
            f"{folder_name}: preview is true but preview file '{preview_path}' was not found"
        )
    return errors


def build_entry(
    template_dir: Path,
    meta: dict,
    *,
    github_repo: str,
    branch: str,
) -> dict:
    template_id = str(meta["id"]).strip()
    preview_path = str(meta.get("previewImagePath", "preview.png")).strip() or "preview.png"
    preview_file = template_dir / preview_path
    files = list_template_files(template_dir, preview_path)
    total_bytes = sum((template_dir / name).stat().st_size for name in files)

    base_url = (
        f"https://raw.githubusercontent.com/{github_repo}/{branch}/templates/{template_id}"
    )
    source_url = f"https://github.com/{github_repo}/tree/{branch}/templates/{template_id}"

    entry: dict = {
        "id": template_id,
        "name": str(meta.get("name", "")).strip() or title_from_id(template_id),
        "shortDescription": str(meta.get("description", "")).strip(),
        "category": str(meta.get("category", "")).strip(),
        "contributor": person_name(meta.get("contributor")) or person_name(meta.get("author")) or "",
        "version": str(meta.get("version", "")).strip(),
        "lastUpdated": str(meta.get("lastUpdated", "")).strip() or date.today().isoformat(),
        "license": str(meta.get("license", "")).strip(),
        "packages": list(meta.get("packages") or []),
        "files": files,
        "hasPreview": bool(meta.get("preview")) and preview_file.is_file(),
        "sourceUrl": source_url,
        "baseUrl": base_url,
        "size": format_size(total_bytes),
    }

    compatible_with = meta.get("compatibleWith")
    if isinstance(compatible_with, list) and compatible_with:
        entry["compatibleWith"] = compatible_with

    tags = meta.get("tags")
    if isinstance(tags, list) and tags:
        entry["tags"] = tags

    details = meta.get("details")
    if isinstance(details, list) and details:
        entry["details"] = details

    author = person_profile(meta.get("author"))
    if author:
        entry["author"] = author

    contributor_profile = person_profile(meta.get("contributor"))
    if contributor_profile:
        entry["contributorProfile"] = contributor_profile

    return entry


def build_registry(
    root: Path,
    *,
    github_repo: str,
    branch: str,
) -> tuple[dict, list[str]]:
    templates_root = root / "templates"
    if not templates_root.is_dir():
        raise FileNotFoundError(f"Missing templates directory: {templates_root}")

    errors: list[str] = []
    entries: list[dict] = []

    for template_dir in sorted(templates_root.iterdir()):
        if not template_dir.is_dir():
            continue
        meta_path = template_dir / "meta.json"
        if not meta_path.is_file():
            errors.append(f"{template_dir.name}: missing meta.json")
            continue

        try:
            meta = json.loads(meta_path.read_text(encoding="utf-8"))
        except json.JSONDecodeError as error:
            errors.append(f"{template_dir.name}: invalid meta.json ({error})")
            continue

        if not isinstance(meta, dict):
            errors.append(f"{template_dir.name}: meta.json must be a JSON object")
            continue

        errors.extend(validate_meta(meta, template_dir))
        entries.append(
            build_entry(
                template_dir,
                meta,
                github_repo=github_repo,
                branch=branch,
            )
        )

    if errors:
        return {}, errors

    payload = {
        "version": REGISTRY_VERSION,
        "updated": date.today().isoformat(),
        "templates": entries,
    }
    return payload, []


def write_badges(root: Path, registry: dict) -> None:
    scripts_dir = root / "scripts"
    scripts_dir.mkdir(parents=True, exist_ok=True)
    count = len(registry.get("templates", []))
    updated = str(registry.get("updated", date.today().isoformat()))

    templates_badge = {
        "schemaVersion": 1,
        "label": "templates",
        "message": str(count),
        "color": "2468f2",
    }
    updated_badge = {
        "schemaVersion": 1,
        "label": "registry",
        "message": f"updated {updated}",
        "color": "4c1",
    }
    (scripts_dir / "badge-templates.json").write_text(
        normalize_json(templates_badge),
        encoding="utf-8",
    )
    (scripts_dir / "badge-updated.json").write_text(
        normalize_json(updated_badge),
        encoding="utf-8",
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root",
        type=Path,
        default=repo_root_from_script(),
        help="Repository root (default: parent of scripts/)",
    )
    parser.add_argument("--github-repo", default=DEFAULT_GITHUB_REPO)
    parser.add_argument("--branch", default=DEFAULT_BRANCH)
    parser.add_argument(
        "--check",
        action="store_true",
        help="Exit with code 1 if registry.json or badges are out of date",
    )
    parser.add_argument(
        "--quiet",
        action="store_true",
        help="Only print errors",
    )
    args = parser.parse_args(argv)

    root = args.root.resolve()
    registry, errors = build_registry(
        root,
        github_repo=args.github_repo,
        branch=args.branch,
    )
    if errors:
        for error in errors:
            print(error, file=sys.stderr)
        return 1

    registry_path = root / "registry.json"
    registry_text = normalize_json(registry)
    write_badges(root, registry)

    if args.check:
        stale: list[str] = []
        if not registry_path.is_file():
            stale.append("registry.json")
        elif registry_path.read_text(encoding="utf-8") != registry_text:
            stale.append("registry.json")

        for badge_name in ("badge-templates.json", "badge-updated.json"):
            badge_path = root / "scripts" / badge_name
            if not badge_path.is_file():
                stale.append(badge_name)

        if stale:
            print(
                "Registry artifacts are out of date. Run:\n"
                "  python scripts/build_registry.py",
                file=sys.stderr,
            )
            print("Stale:", ", ".join(stale), file=sys.stderr)
            return 1

        if not args.quiet:
            print(f"Registry check passed ({len(registry['templates'])} templates).")
        return 0

    registry_path.write_text(registry_text, encoding="utf-8")
    if not args.quiet:
        print(f"Wrote {registry_path} ({len(registry['templates'])} templates)")
        print(f"Wrote {root / 'scripts' / 'badge-templates.json'}")
        print(f"Wrote {root / 'scripts' / 'badge-updated.json'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
