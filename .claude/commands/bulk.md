# Bulk Perspective Finder

Process all perspective requests in the `input/` folder and generate reports in `output/`.

## Instructions

1. Scan the `input/` directory for all `.md` files.

2. If no files are found, tell the user and explain the expected input format (see CLAUDE.md).

3. For each input file:
   - Read the file contents.
   - Each `#` heading in the file represents a **separate perspective**. Treat each as its own report.
   - For each perspective, generate a full report following the output format in CLAUDE.md (5–15 individuals with structured profiles, search tips, related perspectives).
   - Save each report as a separate file in `output/` using the naming convention in CLAUDE.md.

4. After processing all files, display a summary table:

```
| Input File | Perspectives Found | Reports Generated | Output Files |
|------------|-------------------|-------------------|--------------|
| ...        | ...               | ...               | ...          |
```

5. Note any perspectives where coverage was limited or confidence was low.

## Accuracy Rules

- Only include social media handles you are confident about. Flag uncertain ones as "Unverified — please confirm".
- Do not fabricate profiles. If a niche is too narrow, say so in the report.
- Use web search tools if available to verify handles and current activity.
