# Markdown to Jira

Convert Markdown to Jira wiki markup. Paste your Markdown into a browser-based editor and get correctly formatted Jira text you can copy straight into issue comments.

**Live site:** <https://jadujoel.github.io/markdown-to-jira/>

## Features

- Headings (`# H1` → `h1. H1`)
- **Bold**, *italic*, ~~strikethrough~~
- Inline code and fenced code blocks (with language and theme support)
- Ordered and unordered lists
- Links, images, blockquotes, horizontal rules, tables
- Live HTML preview with syntax highlighting (highlight.js)
- Code blocks longer than 20 lines are automatically collapsed
- Hide / show each panel — layout preference persisted in localStorage
- Installable as a PWA (Add to Home Screen / desktop app)
- Offline support via service worker

## Supported Code Languages

`actionscript3`, `applescript`, `bash`, `c`, `coldfusion`, `cpp`, `csharp`, `css`, `delphi`, `diff`, `erlang`, `groovy`, `html/xml`, `java`, `javafx`, `javascript`, `json`, `kotlin`, `lua`, `none`, `nyan`, `objc`, `pascal`, `perl`, `php`, `plaintext`, `powershell`, `python`, `r`, `ruby`, `rust`, `sass`, `scala`, `sql`, `swift`, `typescript`, `vb`, `xml`, `yaml`

**Aliases:** `sh`/`shell`/`zsh` → bash, `js`/`jsx`/`mjs` → javascript, `ts`/`tsx` → typescript, `py` → python, `rb` → ruby, `rs` → rust, `cs`/`c#` → csharp, `c++` → cpp, `objective-c`/`objectivec` → objc, `yml` → yaml, `html`/`htm`/`xhtml` → html/xml, `kt` → kotlin, `ps1` → powershell, `pl` → perl, `scss` → sass, `vbnet` → vb, `patch` → diff, `text`/`txt` → plaintext

## Project Structure

```
markdown-to-jira/
├── src/
│   ├── convert.ts            # Core converter: JiraRenderer + HTML renderer
│   ├── index.ts              # Browser entry point (wires up textarea I/O)
│   ├── index.html            # Single-page app shell
│   ├── style.css             # Dark-theme three-column layout
│   ├── manifest.json         # PWA web app manifest
│   ├── icon-192.svg          # PWA icon (192×192)
│   └── icon-512.svg          # PWA icon (512×512)
├── build.ts                  # Production build script (Bun.build → dist/)
├── tsconfig.json
└── package.json
```

## Prerequisites

- [Bun](https://bun.sh/) v1.2 or later

## Getting Started

```bash
# Install dependencies
bun install

# Start the local dev server
bun serve.ts
```

Open the URL printed in the terminal (default `http://localhost:3000`). The app shows three columns: Markdown input, HTML preview, and Jira markup output.

## Building for Production

```bash
bun build.ts
```

Outputs minified HTML + JS with source maps to `dist/`. The build also compiles the service worker and copies PWA assets (manifest, icons).

## API

The converter can be used programmatically:

```ts
import { convert } from "./src/convert.ts"

const jira = convert("**bold** and _italic_")
// → "*bold* and _italic_"
```

### Exports

| Export | Description |
|---|---|
| `convert(markdown: string): string` | Convert Markdown to Jira wiki markup |
| `html(markdown: string): string` | Convert Markdown to syntax-highlighted HTML |
| `JiraRenderer` | Custom `marked` renderer that emits Jira markup |
| `verbose()` | Enable debug logging for the renderer |
| `LANGS` | Map of recognized code-block languages |
| `MAX_CODE_LINE` | Threshold (20) above which code blocks collapse |

## Tech Stack

- **Runtime / Toolchain:** [Bun](https://bun.sh/)
- **Markdown Parser:** [marked](https://github.com/markedjs/marked) v17.0.5
- **Syntax Highlighting:** [highlight.js](https://highlightjs.org/) v11
- **Language:** TypeScript (strict mode)

## License

[MIT](LICENSE) — Joel Löf
