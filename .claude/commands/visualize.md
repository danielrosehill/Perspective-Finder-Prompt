# Visualize Debate

Generate a quadrant-style data visualization plotting actors and groups by their positions along the key fault lines of a debate.

## Instructions

1. Check if a debate map exists in `output/` (a file matching `debate-map-*.md`). If one exists, ask the user which one to visualize. If none exists, tell the user to run `/map-debate` first, or ask them to describe the debate and axes directly.

2. From the debate map (or user input), identify **two primary axes of disagreement** to use as the X and Y axes of the quadrant. For example:
   - X-axis: "Unilateral ← → Multilateral"
   - Y-axis: "Security-first ← → Rights-first"

   Ask the user to confirm or adjust the axes before proceeding.

3. **Plot each actor** (individuals and organisations from the debate map) on the quadrant by assigning approximate coordinates:
   - Scale: -10 to +10 on each axis
   - Place actors based on their stated positions and advocacy history

4. **Generate the visualization** as a Python script using matplotlib:

```python
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

fig, ax = plt.subplots(1, 1, figsize=(14, 14))

# Draw quadrant lines
ax.axhline(y=0, color='#cccccc', linewidth=1)
ax.axvline(x=0, color='#cccccc', linewidth=1)

# Set axis labels
ax.set_xlabel('[Left Label] ← → [Right Label]', fontsize=12)
ax.set_ylabel('[Bottom Label] ← → [Top Label]', fontsize=12)
ax.set_title('Debate Map: [Topic]', fontsize=16, fontweight='bold')

# Set limits
ax.set_xlim(-12, 12)
ax.set_ylim(-12, 12)

# Plot actors — colour-coded by camp
# ax.scatter(x, y, c=colour, s=100, zorder=5)
# ax.annotate('Name', (x, y), textcoords="offset points", xytext=(5, 5), fontsize=8)

# Legend for camps
# patches = [mpatches.Patch(color=c, label=l) for c, l in camp_colours.items()]
# ax.legend(handles=patches, loc='upper left', fontsize=9)

ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig('output/debate-quadrant-{slug}.png', dpi=150, bbox_inches='tight')
plt.savefig('output/debate-quadrant-{slug}.svg', bbox_inches='tight')
print("Saved to output/")
```

5. **Run the script** to generate the visualization. Save outputs as both PNG and SVG in `output/`.

6. Also generate a **data file** at `output/debate-quadrant-{slug}-data.json` containing:

```json
{
  "topic": "...",
  "x_axis": { "label": "...", "left": "...", "right": "..." },
  "y_axis": { "label": "...", "bottom": "...", "top": "..." },
  "actors": [
    {
      "name": "...",
      "type": "individual|organisation",
      "camp": "...",
      "x": 0.0,
      "y": 0.0,
      "note": "..."
    }
  ]
}
```

7. Display a summary showing:
   - The axes chosen
   - Number of actors plotted
   - Output file paths (PNG, SVG, JSON)

## Notes

- Use distinct colours for each camp/category from the debate map.
- Avoid overlapping labels — offset them if positions are close.
- If matplotlib is not available, install it with `uv pip install matplotlib`.
- The JSON data file allows the visualization to be regenerated or imported into other tools.

$ARGUMENTS
