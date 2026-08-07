# Which PDF rendering toolchain survives a stranger's laptop?

Type: research
Status: resolved
Blocked by: —

## Answer

Full findings: [research/rendering-toolchain.md](../research/rendering-toolchain.md).

**Recommendation: Typst, and the margin is not close.**

| | Install | Compile | Text layer |
|---|---|---|---|
| **Typst 0.15.1** | **43 MB single binary**, no network at render time | **0.37 s** | ✅ 14/14 clean |
| pdfLaTeX / LuaLaTeX | multi-GB TeX Live (`du` couldn't finish traversing it in 3 min) | seconds | ✅ 14/14 clean |
| XeLaTeX | same distribution | seconds | ❌ 0/14 — **disqualified** |
| Tectonic | 19 MB binary, but **hung >3 min on first run** fetching packages | — | ❌ XeTeX-based — **disqualified** |

Typst also wins on **agent-drivability**, which is underweighted elsewhere and matters here: the skill's agent generates source and must recover from compile failures. Typst has regular syntax and clear errors; LaTeX is famously cryptic.

**Bootstrap policy: detect, then offer — never install silently.** Naming the command and the 43 MB cost and letting the user approve is the least-astonishing behaviour. If declined, emit source and say plainly no PDF was produced rather than faking it.

**Cost to the user:** their existing LaTeX template would need porting. That trade-off depends on *Hand over the LaTeX template* — if the template turns out to be XeLaTeX-based it must change regardless, which makes porting to Typst far more attractive than porting to LuaLaTeX.

⚠️ Untested: HTML→PDF (headless Chrome, WeasyPrint), DOCX output, Windows/Linux, and Typst's CV template ecosystem maturity.

## Question

The skill must produce a PDF on a machine we don't control. A full TeX distribution is a ~5GB install — an unacceptable first-run experience for someone who just installed a skill. Survey the realistic options and report hard numbers.

For each candidate, establish: **install size and method**, whether it can self-bootstrap without sudo, platform coverage (macOS/Linux/Windows), typographic quality, **quality of the extracted text layer** (cross-reference *Does the ATS actually read what we think it reads?*), and how hard the templating is to drive from an agent.

Candidates:

- **TeX Live / MacTeX** — the baseline. Confirm actual install sizes for full vs `basic`/`small` schemes.
- **Tectonic** — single self-contained binary that fetches packages on demand. Confirm binary size, offline behaviour after first run, and which LaTeX packages fail under it.
- **Typst** — modern LaTeX alternative, single binary, far simpler syntax. Assess CV template ecosystem maturity and PDF text-layer quality. This may be the strongest candidate; evaluate it seriously rather than as an afterthought.
- **HTML → PDF** — headless Chrome/Puppeteer, WeasyPrint, Paged.js. Note that a browser is already on nearly every machine. Assess print-CSS fidelity and text-layer quality.
- **Direct PDF libraries** — ReportLab, `pdf-lib`, etc. Probably too low-level, but confirm.
- **Word/DOCX output** — some ATS explicitly prefer it. Is that still true, and is it worth supporting as a second output?

Also answer: **can a Claude Code skill reasonably install a binary on the user's machine at all**, or does that cross a line most users would object to? What's the least-astonishing bootstrap?

## Output

`.scratch/topcv-skill/research/rendering-toolchain.md`, with a comparison table and a clear recommendation — including the honest runner-up and what would change the call.
