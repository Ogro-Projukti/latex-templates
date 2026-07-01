# Maintainer Guide — Template Library

How to publish contributor templates from GitHub issues into the [latex-templates](https://github.com/Ogro-Projukti/latex-templates) repo so they appear in LATIUM.

## Roles

| Role | Responsibility |
|------|----------------|
| **Contributor** | Opens an issue with a public folder link and a valid `meta.json` inside that folder |
| **Maintainer** | Reviews, validates, compiles, lands files on `main`, updates `registry.json` |

> **Important:** LATIUM only reads `registry.json` and raw files on `main`. Issues alone do not publish a template.

---

## Repository layout

```
latex-templates/
├── registry.json              # Catalog (maintainer-maintained)
├── README.md
├── MAINTAINER.md              # This file
├── .github/
│   └── ISSUE_TEMPLATE/
│       └── submit_template.md
└── templates/
    └── {template-id}/
        ├── meta.json          # Contributor-provided (required)
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

## Step 6 — Update `registry.json` (maintainer only)

Contributors **never** edit `registry.json`.

Add one entry to the `templates` array:

```json
{
  "id": "<from meta.json>",
  "name": "<from issue: Template name>",
  "shortDescription": "<from meta.json description>",
  "category": "<from issue: Category>",
  "contributor": "<meta.contributor.name>",
  "version": "<from meta.json>",
  "lastUpdated": "<from meta.json>",
  "license": "<from issue: License>",
  "packages": ["<from meta.json packages>"],
  "files": ["main.tex", "references.bib"],
  "hasPreview": false,
  "sourceUrl": "https://github.com/Ogro-Projukti/latex-templates/tree/main/templates/<id>",
  "baseUrl": "https://raw.githubusercontent.com/Ogro-Projukti/latex-templates/main/templates/<id>"
}
```

### Building the `files` array

Include every file under `templates/{id}/` **except**:

- `meta.json`
- `preview.png` (handled via `hasPreview`)

Use relative paths for subfolders, e.g. `figures/logo.pdf`.

### `hasPreview`

```text
hasPreview = (meta.preview === true) AND (preview file exists)
```

### Fields to omit (unless you have a real source)

Do **not** add fabricated data:

- `identifier`
- `details`
- `tags`
- `size` (compute later or omit)

### Update catalog date

Set top-level `"updated": "YYYY-MM-DD"` in `registry.json`.

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
- [ ] meta.json validated
- [ ] Compiles with: tectonic / pdflatex / xelatex
- [ ] License confirmed: <license>
- [ ] registry.json entry added
- [ ] `files` list matches folder contents
- [ ] `hasPreview` matches preview file

## Maintainer notes
<any fixes applied>
```

### Review checklist (second maintainer)

- [ ] `templates/{id}/` matches issue submission
- [ ] `meta.json.id` equals folder name
- [ ] `registry.json` entry is correct
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
| 6 | Update `registry.json` | Catalog entry added |
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
| Edit `registry.json` | **No** | **Yes** |
| Set `baseUrl` / `sourceUrl` | **No** | **Yes** |
| Build `files` list | **No** | **Yes** |
| Appears in LATIUM | **No** | After merge to `main` |

---

## Processing many issues (batch tips)

1. **Triage all issues first** — sort into ready / needs-info / duplicate / reject.
2. **Prefer contributor PRs** — skip external downloads when possible.
3. **Merge in batches** — 5–10 templates per week for review quality.
4. **Automate registry** — use `scripts/build_registry.py` when available.
5. **Never publish from issues alone** — always land on `main`.

---

## Related links

- [latex-templates repository](https://github.com/Ogro-Projukti/latex-templates)
- Issue template: `.github/ISSUE_TEMPLATE/submit_template.md`
- Live registry: `https://raw.githubusercontent.com/Ogro-Projukti/latex-templates/main/registry.json`
