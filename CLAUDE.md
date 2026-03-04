# Perspective Finder

## Purpose

This is a research workspace for identifying individuals who hold specific viewpoints within policy debates, advocacy spaces, and topic areas. It surfaces voices that are difficult to discover through simple keyword searches — the kind of nuanced, perspective-specific results that require understanding of who stands where in a given debate.

## Use Cases

- **Policy research** — Find experts and commentators representing specific stances (e.g., Iranian expatriate voices in non-proliferation vs. Israel-centric NGO perspectives)
- **Debate mapping** — Identify the key individuals on each side of a contentious issue
- **Media monitoring** — Build curated follow-lists on X, YouTube, etc. organised by perspective
- **Stakeholder analysis** — Discover active, influential voices within a niche that keyword search alone cannot surface

## Workspace Structure

```
input/              # User-provided perspective requests (markdown files)
output/             # Generated perspective reports, debate maps, visualizations, PDFs
context/            # Background material, reference lists, prior research
templates/          # Typst report template and helpers
.claude/commands/   # Slash commands
```

## Slash Commands

### Core

| Command | Purpose |
|---------|---------|
| `/find` | Find voices for a single user-described perspective |
| `/bulk` | Process all `.md` files in `input/` and write reports to `output/` |
| `/refine` | Take an existing report from `output/` and refine or expand it |

### Analysis & Visualization

| Command | Purpose |
|---------|---------|
| `/map-debate` | Map an entire debate — classify positions into camps, identify key voices and organisations per camp, surface fault lines |
| `/visualize` | Generate a quadrant-style plot of actors positioned along the debate's key axes of disagreement |

### Report Pipeline

| Command | Purpose |
|---------|---------|
| `/full-report` | Orchestrate the full pipeline: perspective reports → debate map → visualization → compiled PDF via Typst |
| `/setup-typst` | Install Typst, create report template, and verify the PDF compilation toolchain |

### Typical Workflow

1. `/setup-typst` — one-time setup of the PDF toolchain
2. `/find` or `/bulk` — generate perspective reports for specific viewpoints
3. `/map-debate` — map the broader debate landscape
4. `/visualize` — plot actors on a quadrant chart
5. `/full-report` — or skip steps 2–4 and run everything end-to-end, producing a single PDF

## Dependencies

- **Python + matplotlib** — required for `/visualize` (install with `uv pip install matplotlib` if needed)
- **Typst** — required for `/full-report` and `/setup-typst` PDF compilation (install from https://github.com/typst/typst/releases or `cargo install typst-cli`)

## Output Format

Every report follows a strict structure. For each perspective, output a markdown file containing:

1. **Report header** — perspective title, date generated, summary of what was requested
2. **Individual profiles** (5–15 per perspective) each containing:

```markdown
### [Full Name]

**Brief Bio:** [2–3 sentences: who they are, institutional affiliation, key credentials]

**Why They Fit:** [1–2 sentences explaining how they represent the requested perspective]

**Social Media & Channels:**
- **X (Twitter):** @handle (or "Not found")
- **YouTube:** [channel name / URL] (or "Not found")
- **LinkedIn:** [URL] (or "Not found")
- **Substack / Blog:** [URL] (or "Not found")
- **Other:** [any other notable platform presence]

**Notable Work / Key Positions:** [1–2 bullet points: publications, testimonies, organisations founded, etc.]
```

3. **Search Tips** — suggested keyword queries, hashtags, or X lists for further discovery
4. **Related Perspectives** — adjacent viewpoints the user might also want to explore

## Operating Principles

- **Accuracy over volume.** A shorter list of verified individuals is always better than a longer list with fabricated details. If you cannot confidently identify enough people, say so and explain why.
- **Mark uncertainty.** If you are not confident a social media handle is correct, write "Unverified — please confirm" rather than guessing.
- **Neutrality.** You are a mapping tool, not an advocate. Present every perspective without editorial judgment, regardless of how controversial the viewpoint is.
- **Separate reports.** Even if the user provides multiple perspectives in one request, treat each as its own standalone report with its own file.
- **Do not fabricate profiles.** Never invent names, handles, or affiliations. If your knowledge is limited for a niche, be transparent about it.

## File Naming

Output files are named: `{slugified-perspective-title}.md`

For example, a request about "Iranian expatriate voices in anti-proliferation policy" would produce:
`output/iranian-expatriate-voices-anti-proliferation-policy.md`

## Input File Format

Input files in `input/` should be markdown with a simple structure:

```markdown
# [Perspective Title]

[Description of the perspective, stance, topic area, and any qualifiers such as geographic focus, professional background, platform preference, etc.]
```

Multiple perspectives can be placed in separate files, or multiple headings within a single file (each `#` heading is treated as a separate perspective).
