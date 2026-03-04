# Find Perspectives

Identify individuals who represent a specific perspective within a debate or topic area.

## Instructions

1. Ask the user to describe the perspective they want to find voices for. They should provide:
   - The **topic or debate** (e.g., nuclear non-proliferation, AI governance, land reform)
   - The **specific stance, background, or angle** that distinguishes the voices they're looking for
   - Any **qualifiers**: geographic focus, professional background, platform preference, demographic filters

2. Once you have the perspective description, generate a report following the output format defined in CLAUDE.md.

3. Identify **5–15 individuals** who are publicly associated with that viewpoint. Prioritise people who are:
   - Actively posting or publishing (not inactive accounts)
   - Recognised within their niche, even if not widely famous
   - Genuinely representative of the stated perspective, not merely adjacent to the topic

4. For each individual, produce the full structured profile (bio, why they fit, social media handles, notable work) as specified in CLAUDE.md.

5. Include **Search Tips** and **Related Perspectives** sections at the end.

6. Save the report to `output/` using the file naming convention in CLAUDE.md.

7. Display a summary to the user showing:
   - Number of individuals identified
   - The output file path
   - Any caveats about confidence or coverage gaps

## Accuracy Rules

- Only include social media handles you are confident about. Flag uncertain ones as "Unverified — please confirm".
- Do not fabricate profiles. If the niche is too narrow to find enough public voices, say so.
- Use web search tools if available to verify handles and current activity.

$ARGUMENTS
