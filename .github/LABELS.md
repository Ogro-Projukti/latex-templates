# GitHub labels — template library maintainers

Labels used when triaging [Submit a Template](https://github.com/Ogro-Projukti/latex-templates/issues/new?template=submit_template.md) issues.

## Workflow labels

| Label | When to apply | Next step |
|-------|---------------|-----------|
| [`template-submission`](https://github.com/Ogro-Projukti/latex-templates/labels/template-submission) | Auto-applied on new issues from the form | Start triage |
| [`triage:needs-info`](https://github.com/Ogro-Projukti/latex-templates/labels/triage%3Aneeds-info) | Missing folder link, `meta.json`, license, or other blockers | Wait for contributor; remove when resolved |
| [`triage:in-review`](https://github.com/Ogro-Projukti/latex-templates/labels/triage%3Ain-review) | Maintainer actively reviewing | Download, validate, compile |
| [`triage:compile-failed`](https://github.com/Ogro-Projukti/latex-templates/labels/triage%3Acompile-failed) | Template fails to build | Ask contributor to fix; re-test |
| [`triage:accepted`](https://github.com/Ogro-Projukti/latex-templates/labels/triage%3Aaccepted) | Passes review; ready to land | Open PR, run `build_registry.py`, merge |
| [`triage:rejected`](https://github.com/Ogro-Projukti/latex-templates/labels/triage%3Arejected) | Duplicate, license block, spam, or unusable | Close with explanation |
| [`published`](https://github.com/Ogro-Projukti/latex-templates/labels/published) | Merged to `main` and live in LATIUM | Close issue |

## Typical flow

```text
template-submission
  → triage:in-review
      → triage:needs-info (loop until fixed)
      → triage:compile-failed (loop until fixed)
      → triage:accepted
      → published (after merge)
```

Or: `triage:rejected` → close.

## Recreate labels (maintainers)

If labels are missing on a fork, run from a machine with `gh` CLI:

```bash
repo=Ogro-Projukti/latex-templates

gh label create "template-submission" --repo "$repo" --color "6f42c1" \
  --description "New LaTeX template submitted via the issue form"

gh label create "triage:needs-info" --repo "$repo" --color "fbca04" \
  --description "Waiting on contributor (missing files, meta.json, or license)"

gh label create "triage:in-review" --repo "$repo" --color "1d76db" \
  --description "Maintainer is reviewing this submission"

gh label create "triage:compile-failed" --repo "$repo" --color "d73a4a" \
  --description "Template does not compile with listed compilers"

gh label create "triage:accepted" --repo "$repo" --color "0e8a16" \
  --description "Validated and ready to land on main"

gh label create "triage:rejected" --repo "$repo" --color "666666" \
  --description "Will not be published to the template library"

gh label create "published" --repo "$repo" --color "2da44e" \
  --description "Template is live on main and in LATIUM"
```

See also [MAINTAINER.md](../MAINTAINER.md).
