# Perspective Finder

A Claude Code workspace for identifying individuals who hold specific viewpoints within policy debates and topic areas. Surfaces voices that are difficult to discover through simple keyword searches by leveraging LLM knowledge of public figures, commentators, researchers, and activists.

## Use Cases

- **Policy research** — Find experts and commentators representing specific stances within a policy domain (e.g., Iranian expatriate voices in non-proliferation vs. Israel-centric NGO perspectives)
- **Debate mapping** — Identify the key individuals on each side of a contentious issue to understand the full landscape of opinion
- **Media monitoring** — Build curated follow-lists on X (Twitter), YouTube, and other platforms organised by perspective rather than by topic alone
- **Stakeholder analysis** — Discover who the active, influential voices are within a niche that keyword search alone cannot surface

## Getting Started

1. Open this folder in Claude Code
2. Run `/setup-typst` to set up the PDF report toolchain (one-time)
3. Use the slash commands below

## Slash Commands

### Core — Finding Voices

| Command | Description |
|---------|-------------|
| `/find` | Find voices for a single user-described perspective. Provide the topic, stance, and any qualifiers. |
| `/bulk` | Process all `.md` files in `input/` and generate reports in `output/`. |
| `/refine` | Refine, expand, or update an existing report from `output/`. |

### Analysis & Visualization

| Command | Description |
|---------|-------------|
| `/map-debate` | Map an entire debate — classify positions into broad camps, identify key voices and organisations per camp, and surface the main axes of disagreement. |
| `/visualize` | Generate a quadrant-style chart plotting actors along the debate's key fault lines. Outputs PNG, SVG, and a JSON data file. |

### Full Pipeline

| Command | Description |
|---------|-------------|
| `/full-report` | Run the entire pipeline end-to-end: perspective reports, debate map, quadrant visualization, and a compiled PDF report via Typst. |
| `/setup-typst` | Install Typst, create the report template, and verify PDF compilation works. |

### Typical Workflow

```
/setup-typst              # One-time setup
/find                     # Find voices for a specific perspective
/map-debate               # Map the broader debate landscape
/visualize                # Plot actors on a quadrant chart
/full-report              # Or skip the above and run everything at once → PDF
```

## Workspace Structure

```
input/              # Drop perspective request files here (for /bulk)
output/             # Generated reports, debate maps, visualizations, PDFs
context/            # Background material, reference lists, prior research
templates/          # Typst report template and helpers
.claude/commands/   # Slash command definitions
CLAUDE.md           # Workspace instructions for Claude Code
```

## Input Format

For `/bulk` processing, place `.md` files in `input/` with this structure:

```markdown
# Iranian Expatriate Voices in Anti-Proliferation Policy

Looking for Iranian-born or Iranian-heritage researchers, commentators, and policy
advocates who are active in nuclear non-proliferation discourse. These should be
voices distinct from Israel-centric NGOs that approach the topic from a different
geopolitical perspective. Preference for those active on X/Twitter and with published
policy work.
```

Each `#` heading in a file is treated as a separate perspective and generates its own report.

## Output Formats

| Output | Format | Description |
|--------|--------|-------------|
| Perspective reports | Markdown | Individual profiles with bios, social handles, and notable work |
| Debate maps | Markdown | Taxonomy of positions, camps, key actors, fault lines |
| Quadrant charts | PNG + SVG | Visual plot of actors along two axes of disagreement |
| Quadrant data | JSON | Machine-readable actor positions for downstream use |
| Full report | PDF (Typst) | Compiled document combining all of the above |

## Dependencies

- **Python + matplotlib** — for quadrant visualizations (`uv pip install matplotlib`)
- **Typst** — for PDF report compilation ([install](https://github.com/typst/typst/releases) or `cargo install typst-cli`)

## Accuracy

The workspace instructs Claude to flag uncertain social media handles as "Unverified" and to prefer shorter, accurate lists over fabricated ones. Always independently verify handles and affiliations before relying on them for research.
