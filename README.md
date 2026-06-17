# lat-mini Template Library

GitHub-hosted LaTeX templates for [lat-mini](https://github.com/lat-mini/lat-mini-private). The app fetches `registry.json` and individual template files via a backend proxy.

## Structure

```
registry.json
templates/
  article-starter/
    meta.json
    main.tex
    references.bib
    preview.png   (optional, 300×400)
  ...
```

## Publishing

1. Push this folder to the public repository [Ogro-Projukti/latex-templates](https://github.com/Ogro-Projukti/latex-templates).
2. Verify raw URLs work:
   ```bash
   curl -s "https://raw.githubusercontent.com/Ogro-Projukti/latex-templates/main/registry.json"
   curl -s "https://raw.githubusercontent.com/Ogro-Projukti/latex-templates/main/templates/article-starter/main.tex"
   ```
3. Configure lat-mini (env vars or `lat_mini/settings.py`):
   - `TEMPLATE_REGISTRY_URL`
   - `TEMPLATE_RAW_URL_PREFIXES`

## Regenerating from lat-mini source

From the main lat-mini repo:

```bash
python backend/latex/templates/generate_registry.py --remote lat-mini-templates --github-repo YOUR_ORG/lat-mini-templates
```

Then copy or push the `lat-mini-templates/` folder to your public repo.

## Contributing

Use **Submit a Template** in GitHub Issues or open a PR that adds a folder under `templates/` and an entry in `registry.json`.

### registry.json entry fields

| Field | Description |
|-------|-------------|
| `files` | Array of filenames relative to `baseUrl` |
| `baseUrl` | Raw GitHub URL to the template directory |
| `hasPreview` | `true` if `preview.png` exists at `baseUrl` |
| `details` | Bullet points shown in the template detail panel |

## Preview images

Add `preview.png` (≈300×400) to each template directory and set `"hasPreview": true` in `registry.json`. Until then, the app shows a placeholder graphic.
