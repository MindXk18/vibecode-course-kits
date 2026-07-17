# Data Schema

> Optional. Copy when your product reads from `data/` (JSON, CSV, Excel).

## Source files

| File | Description |
|------|-------------|
| `[e.g. data/items.json]` | `[What it contains]` |
| `[e.g. data/orders.xlsx]` | `[Sheet names if Excel]` |

**Rule for AI:** Use only fields and records documented below. Do not invent rows.

---

## Entity 1: `[Name]`

**File:** `data/[filename]`

| Field | Type | Example | Notes |
|-------|------|---------|-------|
| `[field_a]` | text | | |
| `[field_b]` | number | | |
| `[field_c]` | date | | |

---

## Entity 2: `[Name]` (optional)

| Field | Type | Example |
|-------|------|---------|
| | | |

---

## Chatbot mapping (optional)

| Intent | Example user question | Data source |
|--------|----------------------|-------------|
| `[intent]` | `[example]` | `[file + filter]` |
