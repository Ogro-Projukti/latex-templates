---
name: Submit a Template
about: Propose a new LaTeX template for the latium template library
title: "Template: "
labels: template-submission
assignees: ""
---

## Template name

<!-- e.g. IEEE Conference Paper -->

## Category

<!-- Academic, Conference, Presentation, Resume, Thesis, Other -->

## Description

<!-- What is this template for? Who should use it? -->

## Template Folder Link (Required)

<!-- 
Attach a shareable folder link (Google Drive, Dropbox, OneDrive, GitHub repo, etc.)
The folder MUST contain all files needed to compile the template.

Required contents:
- All LaTeX source files (.tex, .cls, .sty, .bib, etc.)
- Assets (images, fonts, figures)
- meta.json (required)
- Optional preview image
-->

Folder link:

## Files included

<!-- List filenames, e.g. main.tex, references.bib, figures/sample.pdf -->

## Packages used

<!-- e.g. geometry, amsmath, graphicx -->

## License

<!-- MIT, LPPL, proprietary with redistribution permission, etc. -->

## Required meta.json

Your submitted folder MUST include a `meta.json` file in the root directory.

Example:

```json
{
  "id": "thesis-chaptered",
  "version": "1.0.0",
  "preview": true,
  "previewImagePath": "preview.png",
  "lastUpdated": "Built in",
  "author": {
    "name": "Overleaf community",
    "github": "lat-mini"
  },
  "description": "Long-form thesis structure with chapters, front matter, and bibliography.",
  "compatibleWith": [
    "tectonic",
    "pdflatex",
    "xelatex"
  ],
  "packages": [
    "geometry",
    "graphicx",
    "biblatex"
  ]
}
```

### meta.json field rules

* `id` → unique kebab-case template identifier
* `version` → semantic version (e.g. 1.0.0)
* `preview` → whether preview image exists
* `previewImagePath` → relative path to preview image (required if preview=true)
* `lastUpdated` → last update info/version source
* `author.name` → template author or source
* `author.github` → GitHub username/org (optional but recommended)
* `description` → short template summary
* `compatibleWith` → supported compilers
* `packages` → all required LaTeX packages

## Checklist

* [ ] Shareable folder public link provided
* [ ] Folder contains all required source files
* [ ] Folder contains meta.json
* [ ] Template compiles with Tectonic / pdfLaTeX / XeLaTeX
* [ ] Files follow the folder structure in the README
* [ ] Optional: preview image added (300×400 recommended)
* [ ] registry.json entry prepared (or included in PR)

## Additional notes

<!-- Anything else reviewers should know -->
