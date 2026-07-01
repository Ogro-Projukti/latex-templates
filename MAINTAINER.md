# Maintainer Guide — Template Library

How to publish contributor templates from GitHub issues into the [latex-templates](https://github.com/Ogro-Projukti/latex-templates) repo so they appear in LATIUM.

## Roles

| Role | Responsibility |
|------|----------------|
| **Contributor** | Opens an issue with a public folder link and a valid `meta.json` inside that folder |
| **Maintainer** | Reviews, validates, compiles, lands files on `main`, runs `build_registry.py` |

> **Important:** LATIUM only reads `registry.json` and raw files on `main`. Issues alone do not publish a template. **Never edit `registry.json` by hand** — use `scripts/build_registry.py`.

---

## Repository layout

```
latex-templates/
├── registry.json              # Generated — do not edit by hand
├── README.md
├── MAINTAINER.md              # This file
├── scripts/
│   ├── build_registry.py      # Builds registry.json from meta.json
│   ├── badge-templates.json   # Shields.io badge (auto-generated)
│   └── badge-updated.json     # Shields.io badge (auto-generated)
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   └── submit_template.md
│   └── workflows/
│       └── registry.yml       # CI: fails if registry is stale
└── templates/
    └── {template-id}/
        ├── meta.json          # Contributor + maintainer metadata
        ├── main.tex
        ├── references.bib
        ├── figures/...
        └── preview.png        # Optional
```

---

## Contributor `meta.json` (fixed — do not change for users)

Contributors must include this file at the **root** of their template folder.

```json
{
  "id": "thesis-chaptered",
  "version": "1.0.0",
  "preview": false,
  "previewImagePath": "preview.png",
  "lastUpdated": "2026-06-17",
  "author": {
    "name": "Original author or source",
    "github": "github-username"
  },
  "contributor": {
    "name": "Person submitting to LATIUM",
    "github": "github-username"
  },
  "description": "Short summary of what this template is for.",
  "compatibleWith": [
    "tectonic",
    "pdflatex",
    "xelatex"
  ],
  "packages": [
    "geometry",
    "graphicx"
  ]
}
```

### Maintainer-only fields (add when landing the template)

When copying a contributor folder into `templates/{id}/`, the maintainer must ensure these fields are present in `meta.json` (they may come from the issue body):

| Field | Source |
|-------|--------|
| `name` | Issue → Template name |
| `category` | Issue → Category |
| `license` | Issue → License |

Optional maintainer fields (only if you have real data):

| Field | Purpose |
|-------|---------|
| `tags` | Search/filter tags in LATIUM |
| `details` | Extra bullet points in the detail panel |

Do **not** add `identifier` or fabricated `details`/`tags`.

### Field rules

| Field | Rule |
|-------|------|
| `id` | Unique kebab-case identifier; must match folder name `templates/{id}/` |
| `version` | Semantic version, e.g. `1.0.0` |
| `preview` | `true` only if a preview image exists |
| `previewImagePath` | Relative path; required when `preview` is `true` |
| `lastUpdated` | Date or version note |
| `author` | Original template author or upstream source |
| `contributor` | Person who submitted the template to LATIUM |
| `description` | Short summary shown in the app |
| `compatibleWith` | Compilers actually tested |
| `packages` | LaTeX packages required by the template |

---

## Maintainer workflow (per issue)

```text
Issue received
  → Step 1: Triage
  → Step 2: Download & inspect
  → Step 3: Validate meta.json
  → Step 4: Compile test
  → Step 5: Normalize into templates/{id}/
  → Step 6: Update registry.json
  → Step 7: Open PR & merge
  → Step 8: Verify in LATIUM
  → Step 9: Close issue
```

---

## Step 1 — Triage the issue

### Required issue fields

| Field | If missing |
|-------|------------|
| Template name | Request update; label `triage:needs-info` |
| Category | Same |
| Description | Same |
| **Folder link** (public) | **Block** — cannot proceed |
| Files included | Use for verification later |
| Packages used | Cross-check with `.tex` |
| License | Block if missing or unclear |

### Quick reject / defer

Close or defer if:

- Duplicate of existing template or open issue
- Folder link is private, expired, or broken
- No `meta.json` in folder root
- License does not allow redistribution
- Not LaTeX source (PDF-only, Word-only, etc.)
- Spam or off-topic

### Comment template (needs info)

```text
Thanks for submitting! We can't review this yet because:

- [ ] Folder link is missing or not publicly accessible
- [ ] meta.json is missing from the folder root
- [ ] License is not specified

Please update the issue and we'll continue review.
```

### Labels

| Label | Meaning |
|-------|---------|
| `triage:needs-info` | Waiting on contributor |
| `triage:in-review` | Maintainer reviewing |
| `triage:compile-failed` | Does not compile |
| `triage:accepted` | Ready to land |
| `triage:rejected` | Will not publish |
| `published` | Live on main |

Assign yourself and comment **Review started** when you begin.

---

## Step 2 — Download and inspect

1. Download the entire folder from the issue link (GitHub, Drive, Dropbox, etc.).
2. Save locally, e.g. `~/template-reviews/issue-42/`.
3. Confirm all files listed in the issue are present.
4. Confirm `meta.json` is at the **root** of the template folder.

### Remove before committing

- `.DS_Store`, `Thumbs.db`, `__MACOSX/`
- Build artifacts: `*.aux`, `*.log`, `*.out`, `*.pdf` (unless `preview.png` is intentional)
- Editor junk: `.vscode/`, `.idea/`

### Common problems

| Problem | Action |
|---------|--------|
| `meta.json` missing | Ask contributor; stop |
| `meta.json` in subfolder | Move to root during normalize |
| Missing assets referenced in `.tex` | Ask contributor to add |
| Only PDF, no `.tex` | Reject or request sources |

---

## Step 3 — Validate `meta.json`

- [ ] `id` is unique kebab-case (not already in `registry.json`)
- [ ] `id` will match folder name `templates/{id}/`
- [ ] `version` is valid semver
- [ ] `description` is non-empty
- [ ] `preview: true` → preview file exists at `previewImagePath`
- [ ] `preview: false` → no preview required
- [ ] `compatibleWith` lists only compilers you will test
- [ ] `packages` matches `\usepackage` usage in source
- [ ] `author` and `contributor` are present

### Cross-check with issue body

| Issue field | Maps to |
|-------------|---------|
| Template name | `registry.json` → `name` |
| Category | `registry.json` → `category` |
| Description | Should match `meta.json` → `description` (prefer meta.json) |
| License | `registry.json` → `license` |
| Packages used | Should match `meta.json` → `packages` |

---

## Step 4 — Compile test (required)

Test with every compiler listed in `meta.json` → `compatibleWith`.

```bash
cd /path/to/downloaded-folder
tectonic main.tex
# pdflatex main.tex
# xelatex main.tex
```

| Result | Action |
|--------|--------|
| Compiles | Proceed |
| Missing packages | Update `packages` in meta or ask contributor |
| Hard errors | Comment with log; label `triage:compile-failed`; stop |
| Warnings only | OK for v1 |

**Do not merge** if it fails on all listed compilers.

---

## Step 5 — Normalize for the repo

Copy validated files into:

```text
templates/{meta.json.id}/
```

### Maintainer may fix

- Remove junk files
- Obvious compile-blocking typos in `.tex`
- Line ending normalization
- Generate `preview.png` from PDF (optional)

### Maintainer should not change without contributor

- Template `id` (unless duplicate — ask for new id)
- Layout / design
- `meta.json` fields except obvious errors

### Preview image (optional)

- Recommended size: **300×400**
- Filename: `preview.png` (or path in `previewImagePath`)
- Set `preview: true` in `meta.json` only when file exists

---

## Step 6 — Generate `registry.json` with `build_registry.py`

Contributors **never** edit `registry.json`. Maintainers **never** edit it by hand either.

After `templates/{id}/` is in place with a complete `meta.json`, run from the repo root:

```bash
python scripts/build_registry.py
```

This command:

- Reads every `templates/*/meta.json`
- Validates `id` matches the folder name
- Scans the folder for downloadable files (skips `meta.json`, preview image, hidden paths like `.kb/`)
- Computes `size`, `hasPreview`, `baseUrl`, and `sourceUrl`
- Writes `registry.json`
- Updates `scripts/badge-templates.json` and `scripts/badge-updated.json` for README badges

### Verify before committing

```bash
python scripts/build_registry.py --check
```

`--check` exits with code `1` if `registry.json` or badge files are stale. CI runs this on every PR that touches `templates/`.

### What lands in `registry.json`

| Registry field | Source |
|----------------|--------|
| `id` | `meta.json` → `id` |
| `name` | `meta.json` → `name` (or derived from `id`) |
| `shortDescription` | `meta.json` → `description` |
| `category` | `meta.json` → `category` |
| `contributor` | `meta.json` → `contributor.name` or `author.name` |
| `version` | `meta.json` → `version` |
| `lastUpdated` | `meta.json` → `lastUpdated` |
| `license` | `meta.json` → `license` |
| `packages` | `meta.json` → `packages` |
| `compatibleWith` | `meta.json` → `compatibleWith` (if present) |
| `tags` | `meta.json` → `tags` (only if present) |
| `details` | `meta.json` → `details` (only if present) |
| `files` | Scanned from folder |
| `hasPreview` | `meta.preview` + preview file exists |
| `size` | Sum of downloadable file bytes |
| `baseUrl` / `sourceUrl` | Computed from repo + branch + `id` |
| `updated` (top-level) | Today's date when the script runs |

Fields **not** generated (no fabricated data): `identifier`.

### Common script errors

| Error | Fix |
|-------|-----|
| `missing category` | Add `"category"` to `meta.json` from the issue |
| `missing license` | Add `"license"` to `meta.json` from the issue |
| `id does not match folder name` | Rename folder or fix `meta.json` → `id` |
| `preview is true but preview file not found` | Add image or set `"preview": false` |
| `Registry artifacts are out of date` | Run `python scripts/build_registry.py` and commit outputs |

### Commit generated files together

```bash
git add templates/<id>/ registry.json scripts/badge-templates.json scripts/badge-updated.json
```

---

## Using `build_registry.py` (reference)

### Commands

```bash
# Regenerate registry.json and badge files
python scripts/build_registry.py

# CI / pre-PR check (no writes)
python scripts/build_registry.py --check

# Custom repo (forks)
python scripts/build_registry.py --github-repo YOUR_ORG/latex-templates --branch main
```

### Options

| Flag | Default | Purpose |
|------|---------|---------|
| `--root` | repo root | Path containing `templates/` |
| `--github-repo` | `Ogro-Projukti/latex-templates` | Used in `baseUrl` / `sourceUrl` |
| `--branch` | `main` | Git branch in URLs |
| `--check` | off | Fail if outputs are stale |
| `--quiet` | off | Only print errors |

### Workflow when publishing from an issue

```text
1. Copy contributor folder → templates/{id}/
2. Add maintainer fields to meta.json (name, category, license)
3. python scripts/build_registry.py
4. python scripts/build_registry.py --check   # optional local verify
5. git commit templates/{id}/ registry.json scripts/badge-*.json
6. Open PR → CI must pass → merge to main
```

### README badges

The README uses [Shields.io endpoint badges](https://shields.io/badges/endpoint-badge) that read the generated JSON files on `main`:

- `scripts/badge-templates.json` — template count
- `scripts/badge-updated.json` — registry date

After adding templates, run `build_registry.py` so badge counts stay accurate.

---

## Step 7 — Open PR and merge

### Branch name

```text
template/add-<id>
```

### PR title

```text
Add template: <Template name> (<id>)
```

### PR description

```markdown
## Source
- Closes #<issue-number>
- Contributor: @<github-user>
- Reviewed from: <folder link from issue>

## Checklist
- [ ] `meta.json` validated (including maintainer fields)
- [ ] Compiles with: tectonic / pdflatex / xelatex
- [ ] License confirmed: <license>
- [ ] `python scripts/build_registry.py` run
- [ ] `registry.json` and badge files committed
- [ ] `hasPreview` matches preview file

## Maintainer notes
<any fixes applied>
```

### Review checklist (second maintainer)

- [ ] `templates/{id}/` matches issue submission
- [ ] `meta.json.id` equals folder name
- [ ] `python scripts/build_registry.py --check` passes
- [ ] No secrets or personal data in files
- [ ] License allows redistribution

Merge to `main`.

---

## Step 8 — Post-merge verification

### Raw URL checks

```bash
curl -s "https://raw.githubusercontent.com/Ogro-Projukti/latex-templates/main/registry.json"
curl -s -o /dev/null -w "%{http_code}\n" \
  "https://raw.githubusercontent.com/Ogro-Projukti/latex-templates/main/templates/<id>/main.tex"
```

Expect HTTP `200`.

### LATIUM app checks

1. Open **Template Library**
2. Click **Retry** (or wait up to 5 minutes)
3. Confirm template appears with correct name, description, category
4. **Download template** — succeeds
5. **Use template** — new project contains all files

---

## Step 9 — Close the issue

```text
Thanks! Your template has been published.

- Template ID: `<id>`
- Folder: https://github.com/Ogro-Projukti/latex-templates/tree/main/templates/<id>
- It will appear in LATIUM after the catalog refreshes (up to ~5 minutes, or use Retry in the template panel).

For future updates, open a PR with a bumped `version` in meta.json.
```

- Close issue (link PR: `Closes #N`)
- Label: `published`
- Remove `triage:in-review`

---

## Decision tree

```text
Issue opened
├─ Missing folder link or meta.json? → Ask contributor → STOP
├─ Duplicate? → Link existing → Close
├─ License unclear? → Ask → STOP
├─ Download folder
├─ Validate meta.json
├─ Compile fails? → Report log → STOP
├─ Copy to templates/{id}/
├─ Update registry.json
├─ PR → merge to main
├─ Verify raw URLs + LATIUM download
└─ Close issue
```

---

## Cheat sheet

| Step | Action | Done when |
|------|--------|-----------|
| 1 | Triage issue | Go / no-go |
| 2 | Download folder | Files local |
| 3 | Validate `meta.json` | Schema + unique `id` |
| 4 | Compile test | Builds on listed compilers |
| 5 | Copy to `templates/{id}/` | Repo-ready |
| 6 | Run `build_registry.py` | Catalog + badges updated |
| 7 | PR + merge | On `main` |
| 8 | Verify URLs + LATIUM | Download works |
| 9 | Close issue | Contributor notified |

---

## Contributor vs maintainer

| Task | Contributor | Maintainer |
|------|-------------|------------|
| Open issue | Yes | — |
| Provide folder link | Yes | — |
| Write `meta.json` | Yes | Validate only |
| Fix compile errors | If asked | Initial test |
| Edit `registry.json` by hand | **No** | **No** — use `build_registry.py` |
| Run `build_registry.py` | **No** | **Yes** |
| Set `baseUrl` / `sourceUrl` | **No** | **Yes** |
| Build `files` list | **No** | **Yes** |
| Appears in LATIUM | **No** | After merge to `main` |

---

## Processing many issues (batch tips)

1. **Triage all issues first** — sort into ready / needs-info / duplicate / reject.
2. **Prefer contributor PRs** — skip external downloads when possible.
3. **Merge in batches** — 5–10 templates per week for review quality.
4. **Automate registry** — always run `python scripts/build_registry.py` before merge; CI enforces with `--check`.
5. **Never publish from issues alone** — always land on `main`.

---

## Related links

- [latex-templates repository](https://github.com/Ogro-Projukti/latex-templates)
- Issue template: `.github/ISSUE_TEMPLATE/submit_template.md`
- Registry builder: `scripts/build_registry.py`
- Live registry: `https://raw.githubusercontent.com/Ogro-Projukti/latex-templates/main/registry.json`
