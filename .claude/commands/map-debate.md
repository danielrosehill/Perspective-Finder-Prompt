# Map Debate

Produce a structured map of an entire debate landscape — classifying the major positions, factions, and key voices within a given issue.

## Instructions

1. Ask the user to describe the **debate or policy issue** they want mapped. They should provide:
   - The **topic** (e.g., "nuclear non-proliferation in the Middle East", "EU AI regulation", "US immigration reform")
   - Optionally, a **segment or sub-issue** to focus on (e.g., "specifically the enrichment question" or "focusing on border enforcement vs. pathway to citizenship")
   - Any **scope constraints** (geographic, temporal, institutional)

2. **Analyse the debate landscape** and produce a structured map with the following sections:

### Output Structure

```markdown
# Debate Map: [Topic]

**Date Generated:** [date]
**Scope:** [any constraints noted]

## Overview

[2–3 paragraph summary of the debate: what is at stake, why it matters, key fault lines]

## Taxonomy of Positions

[Classify the debate into 3–6 broad categories/camps. For each:]

### [Category Name] (e.g., "Hawkish Interventionists", "Civil Liberties Advocates", "Industry Self-Regulation Proponents")

**Core Position:** [1–2 sentences summarising what this camp believes]

**Key Arguments:**
- [argument 1]
- [argument 2]
- [argument 3]

**Key Organisations:**
- [org name] — [1-line description]

**Key Individuals:**
| Name | Role / Affiliation | X Handle | Why They Represent This Camp |
|------|-------------------|----------|------------------------------|
| ...  | ...               | ...      | ...                          |

**Relationship to Other Camps:** [Brief note on alliances, oppositions, and where this camp overlaps or clashes with others]

---

## Fault Lines & Tensions

[Identify 2–4 key axes of disagreement that cut across the camps. For example:]
- **Axis 1:** [e.g., "Unilateral vs. multilateral approaches"]
- **Axis 2:** [e.g., "Security-first vs. rights-first framing"]

These axes will be used by the `/visualize` command to plot actors on a quadrant.

## Key Flashpoints

[List 3–5 specific events, publications, or policy moments that crystallised the debate]

## Sources & Further Reading

[Suggested publications, reports, or media outlets that cover this debate well]
```

3. Save the report to `output/debate-map-{slugified-topic}.md`.

4. Display a summary to the user showing:
   - Number of camps/categories identified
   - Total individuals and organisations listed
   - The key fault lines identified
   - The output file path

## Accuracy Rules

- Only include social media handles you are confident about. Flag uncertain ones as "Unverified".
- Do not fabricate organisations or individuals.
- If a camp is underrepresented in public discourse, note this rather than padding the list.
- Maintain strict neutrality — describe each camp's position as its adherents would describe it.

$ARGUMENTS
