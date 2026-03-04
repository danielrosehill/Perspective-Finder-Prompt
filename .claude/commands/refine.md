# Refine Report

Take an existing perspective report from `output/` and refine, expand, or update it.

## Instructions

1. List the existing reports in `output/` and ask the user which one to refine, or accept a filename as an argument.

2. Read the selected report.

3. Ask the user what kind of refinement they want:
   - **Expand** — Add more individuals to the list
   - **Verify** — Use web search to check and update social media handles and affiliations
   - **Narrow** — Filter the list based on additional criteria (e.g., only academics, only US-based)
   - **Update** — Refresh bios and notable work with more current information
   - **Related** — Generate a companion report for one of the "Related Perspectives" listed

4. Perform the requested refinement, maintaining the same output format defined in CLAUDE.md.

5. Save the updated report, overwriting the original file in `output/`.

6. Display a summary of what changed (individuals added, removed, or updated).

$ARGUMENTS
