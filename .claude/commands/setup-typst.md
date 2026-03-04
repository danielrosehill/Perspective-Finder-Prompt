# Setup Typst

Set up the Typst environment for PDF report generation.

## Instructions

### Step 1: Check Typst Installation

```bash
which typst && typst --version
```

If Typst is not installed:
- Try `cargo install typst-cli` (if cargo is available)
- Otherwise, advise the user to install from https://github.com/typst/typst/releases
- Do NOT proceed with template creation until Typst is confirmed working

### Step 2: Create Report Template

Create `templates/report-template.typ` with the standard Perspective Finder report layout:

- A4 paper, 2.5cm margins
- Professional serif font with fallbacks
- Numbered headings
- Title page with report name, date, and scope
- Table of contents
- Helper functions for embedding profile tables and images

### Step 3: Create Quadrant Figure Template

Create `templates/figure-embed.typ` — a small helper for embedding the quadrant visualization:

- Accepts an image path and caption
- Centres the image at 80% page width
- Adds a figure caption and label

### Step 4: Verify Setup

Run a test compilation:

```bash
echo '#import "templates/report-template.typ": report
#show: report.with(title: "Test", date: "2024-01-01", scope: "Test")
= Hello
This is a test.' > /tmp/typst-test.typ

typst compile /tmp/typst-test.typ /tmp/typst-test.pdf
```

If successful, confirm setup is complete. If not, report the error.

### Step 5: Summary

Display:
- Typst version installed
- Template files created
- Confirmation that test compilation succeeded
