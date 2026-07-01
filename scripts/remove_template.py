#!/usr/bin/env python3
"""Remove template folders by id and regenerate registry.json."""
from __future__ import annotations

import argparse
import re
import shutil
import subprocess
import sys
from pathlib import Path

KEBAB_CASE = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")


def repo_root_from_script() -> Path:
    return Path(__file__).resolve().parents[1]


def validate_template_id(template_id: str) -> str | None:
    cleaned = template_id.strip()
    if not cleaned:
        return "Template id is required"
    if not KEBAB_CASE.match(cleaned):
        return f"Invalid template id '{cleaned}' (expected kebab-case)"
    if cleaned in {".", ".."}:
        return f"Invalid template id '{cleaned}'"
    return None


def remove_templates(
    root: Path,
    template_ids: list[str],
    *,
    dry_run: bool = False,
) -> list[str]:
    """Remove templates/{id}/ folders. Returns list of removed ids."""
    templates_root = root / "templates"
    if not templates_root.is_dir():
        raise FileNotFoundError(f"Missing templates directory: {templates_root}")

    removed: list[str] = []
    errors: list[str] = []

    for raw_id in template_ids:
        template_id = raw_id.strip()
        error = validate_template_id(template_id)
        if error:
            errors.append(error)
            continue

        target = templates_root / template_id
        if not target.is_dir():
            errors.append(f"Template folder not found: templates/{template_id}/")
            continue

        if dry_run:
            print(f"[dry-run] Would remove templates/{template_id}/")
            removed.append(template_id)
            continue

        shutil.rmtree(target)
        print(f"Removed templates/{template_id}/")
        removed.append(template_id)

    if errors:
        for error in errors:
            print(error, file=sys.stderr)
        raise RuntimeError("Template removal failed")

    return removed


def regenerate_registry(root: Path, *, quiet: bool = False) -> None:
    script = root / "scripts" / "build_registry.py"
    if not script.is_file():
        raise FileNotFoundError(f"Missing build script: {script}")

    command = [sys.executable, str(script), "--root", str(root)]
    if quiet:
        command.append("--quiet")
    result = subprocess.run(command, check=False)
    if result.returncode != 0:
        raise RuntimeError("build_registry.py failed after template removal")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Remove one or more templates from templates/ and regenerate registry.json",
    )
    parser.add_argument(
        "template_ids",
        nargs="+",
        metavar="id",
        help="Template id(s) to remove (must match templates/{id}/ folder names)",
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=repo_root_from_script(),
        help="Repository root (default: parent of scripts/)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show what would be removed without deleting files or updating registry.json",
    )
    parser.add_argument(
        "--skip-registry",
        action="store_true",
        help="Remove folders only; do not run build_registry.py",
    )
    parser.add_argument(
        "--quiet",
        action="store_true",
        help="Only print errors",
    )
    args = parser.parse_args(argv)

    root = args.root.resolve()
    unique_ids: list[str] = []
    seen: set[str] = set()
    for template_id in args.template_ids:
        cleaned = template_id.strip()
        if cleaned and cleaned not in seen:
            seen.add(cleaned)
            unique_ids.append(cleaned)

    if not unique_ids:
        print("No template ids provided.", file=sys.stderr)
        return 1

    try:
        removed = remove_templates(root, unique_ids, dry_run=args.dry_run)
    except RuntimeError:
        return 1

    if not removed:
        print("No templates were removed.", file=sys.stderr)
        return 1

    if args.dry_run:
        if not args.quiet:
            print("Dry run complete. Re-run without --dry-run to apply changes.")
        return 0

    if not args.skip_registry:
        try:
            regenerate_registry(root, quiet=args.quiet)
        except RuntimeError as error:
            print(str(error), file=sys.stderr)
            return 1

    if not args.quiet:
        print(f"Done. Removed {len(removed)} template(s).")
        if not args.skip_registry:
            print("Updated registry.json and badge files.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
