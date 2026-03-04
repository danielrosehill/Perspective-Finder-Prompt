# Full Report

Orchestrate the complete Perspective Finder pipeline — perspective finding, debate mapping, visualization, and PDF compilation via Typst — in a single run.

## Instructions

This is a wrapper command that runs the full analysis pipeline. Walk the user through intake, then execute each stage.

### Stage 1: Intake

Ask the user to provide:

1. **Topic / Debate:** The issue to analyse (e.g., "EU AI regulation")
2. **Perspectives to find:** A list of 1–5 specific perspectives they want individual voice reports for (e.g., "civil liberties advocates", "industry self-regulation proponents")
3. **Scope constraints:** Geographic, temporal, or institutional limits
4. **Report title:** A title for the final PDF

### Stage 2: Run Perspective Reports

For each perspective the user listed:
- Generate a perspective report following the `/find` workflow and output format from CLAUDE.md
- Save each to `output/` with the standard naming convention

### Stage 3: Map the Debate

- Generate a full debate map following the `/map-debate` workflow
- Save to `output/debate-map-{slug}.md`

### Stage 4: Visualize

- Using the debate map's fault lines, generate a quadrant visualization following the `/visualize` workflow
- Save PNG, SVG, and JSON to `output/`

### Stage 5: Compile PDF with Typst

1. Check that Typst is set up — look for `templates/report-template.typ`. If it doesn't exist, run the setup:
   - Check if `typst` is installed (`which typst`). If not, install with `cargo install typst-cli` or advise the user.
   - Create the template (see template structure below).

2. Generate a Typst source file at `output/full-report-{slug}.typ` that:
   - Uses the report template
   - Includes a title page with the report title, date, and scope
   - Includes the debate overview from the debate map
   - Includes the taxonomy of positions
   - Embeds the quadrant visualization (PNG)
   - Includes each perspective report as a chapter
   - Includes the search tips and related perspectives as appendices

3. Compile the Typst file to PDF:
   ```bash
   typst compile output/full-report-{slug}.typ output/full-report-{slug}.pdf
   ```

4. Display a final summary:
   - Total individuals identified across all perspectives
   - Number of camps/categories in the debate map
   - Number of actors plotted in the visualization
   - List of all output files generated
   - Path to the final PDF

### Typst Template Structure

The template at `templates/report-template.typ` should define:

```typst
// templates/report-template.typ
#let report(title: "", date: "", scope: "", body) = {
  set document(title: title)
  set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm))
  set text(font: "Linux Libertine", size: 11pt)
  set heading(numbering: "1.1")
  set par(justify: true)

  // Title page
  align(center + horizon)[
    #text(size: 28pt, weight: "bold")[#title]
    #v(1em)
    #text(size: 14pt, fill: gray)[Perspective Finder Report]
    #v(0.5em)
    #text(size: 12pt)[#date]
    #v(0.5em)
    #text(size: 11pt, style: "italic")[#scope]
  ]
  pagebreak()

  // Table of contents
  outline(depth: 2)
  pagebreak()

  body
}
```

## Error Handling

- If any stage fails, save what has been completed so far and report which stages succeeded.
- If Typst is not installed and cannot be installed, generate the `.typ` source file anyway and tell the user how to compile it manually.
- If matplotlib is not available, skip the visualization stage and note this in the PDF.

## Notes

- This command produces many files. All outputs go to `output/`.
- The JSON data from the visualization is included alongside the PDF for downstream use.
- Each stage builds on the previous one, so they run sequentially.

$ARGUMENTS
