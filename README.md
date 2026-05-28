# Markdown to Jira

Convert Markdown to Jira wiki markup. Paste your Markdown into a browser-based editor and get correctly formatted Jira text you can copy straight into issue comments.

**Live site:** <https://ratijas.me/md2jira>

## Features

- Headings (`# H1` → `h1. H1`)
- **Bold**, *italic*, ~~strikethrough~~
- Inline code and fenced code blocks (with language and theme support)
- Ordered and unordered lists
- Links, images, blockquotes, horizontal rules, tables
- Live HTML preview with syntax highlighting (highlight.js)
- Code blocks longer than 20 lines are automatically collapsed
- Hide / show each panel — layout preference persisted in localStorage

## Supported Code Languages

`actionscript3`, `applescript`, `bash`, `c`, `coldfusion`, `cpp`, `csharp`, `css`, `delphi`, `diff`, `erlang`, `groovy`, `html/xml`, `java`, `javafx`, `javascript`, `json`, `kotlin`, `lua`, `none`, `nyan`, `objc`, `pascal`, `perl`, `php`, `plaintext`, `powershell`, `python`, `r`, `ruby`, `rust`, `sass`, `scala`, `sql`, `swift`, `typescript`, `vb`, `xml`, `yaml`

**Aliases:** `sh`/`shell`/`zsh` → bash, `js`/`jsx`/`mjs` → javascript, `ts`/`tsx` → typescript, `py` → python, `rb` → ruby, `rs` → rust, `cs`/`c#` → csharp, `c++` → cpp, `objective-c`/`objectivec` → objc, `yml` → yaml, `html`/`htm`/`xhtml` → html/xml, `kt` → kotlin, `ps1` → powershell, `pl` → perl, `scss` → sass, `vbnet` → vb, `patch` → diff, `text`/`txt` → plaintext

## Project Structure

```
markdown-to-jira/
├── public/
│   ├── manifest.json         # PWA web app manifest
│   ├── icon-192.svg          # PWA icon (192×192)
│   └── icon-512.svg          # PWA icon (512×512)
├── src/
│   ├── convert.ts            # Core converter: JiraRenderer + HTML renderer
│   ├── index.ts              # Browser entry point (wires up textarea I/O)
│   └── style.css             # Dark-theme three-column layout
├── build.ts                  # Production build script (Bun.build → dist/)
├── index.html                # Single-page app shell
├── tsconfig.json
└── package.json
```

## Getting Started

```bash
# Install dependencies
pnpm install
```

## Building for Production

```bash
pnpm run build
```

Outputs minified HTML + JS with source maps to `dist/`.

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

- **Markdown Parser:** [marked](https://github.com/markedjs/marked) v17.0.5
- **Syntax Highlighting:** [highlight.js](https://highlightjs.org/) v11
- **Language:** TypeScript (strict mode)

## License

[MIT](LICENSE) — Joel Löf
