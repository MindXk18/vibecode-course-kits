---
name: vibe:build
description: "Build landing pages, dashboards, and web UI from natural-language prompts. For Vibecode Workshop — no coding background required."
user-invocable: true
when_to_use: "Invoke when creating or editing web UI based on docs/ and optional data/."
category: workshop
keywords: [landing-page, dashboard, build, zero-code, vibe-coding]
argument-hint: "[describe the UI feature or page]"
metadata:
  author: mindx-vibecode
  version: "2.0.0"
---

# Vibe Build — Web UI

> [!IMPORTANT]
> Bộ công cụ lập trình với AI dành tặng học viên MindX cho khóa học Vibecode for Everyone. Bạn quan tâm vui lòng liên hệ mindx.edu.vn để nhận bộ tài liệu đầy đủ.

Implements web interfaces from **product docs**, not from memory. For zero-tech builders using Cursor.

## Before writing code

Read (if present):

- `docs/project-overview-pdr.md` — what to build, for whom, acceptance criteria
- `docs/design-guidelines.md` — colors, typography, layout, tone
- `docs/data-schema.md` — tables/fields when the app uses structured data

If PRD is still a template, ask the user to define: product name, primary user, main pages, and 3 acceptance criteria.

## Principles

1. **Outcome over implementation** — user describes what they see, not CSS classes
2. **No fabricated data** — use `data/` and schema only; use obvious placeholders labeled "Sample" if data is missing
3. **Mobile-first** — responsive by default
4. **Simple stack** — HTML + Tailwind CSS (CDN) unless the project already uses another stack; do not switch stacks mid-session
5. **Incremental** — one section or feature per prompt when possible

## Companion skills

| Need | Skill |
|------|-------|
| Color, font, layout decisions | `ui-ux-pro-max` |
| Visual polish, anti–AI-slop UI | `frontend-design` |
| Headlines, CTAs, hero copy | `copywriting` |
| UX / a11y review | `web-design-guidelines` |
| Chat widget | `chatbot-widget` |
| Errors | `fix --quick` |

## Typical build sequence

### 1. Initialize

- `index.html`, optional admin/dashboard page, `assets/`, `data/` if needed
- Short project README

### 2. Landing page

Common sections (use only what PRD requires):

- Hero (headline, subhead, primary CTA)
- Value proposition / features
- Product or service showcase
- Social proof (optional)
- Contact or lead form
- Footer

### 3. Data layer (when applicable)

- Import CSV/Excel/JSON into `data/` per `docs/data-schema.md`
- Wire UI to read from those files
- Never add records not in source files

### 4. Dashboard or admin view (when applicable)

- Summary metrics/cards
- Sortable tables
- Status badges with semantic colors per design guidelines

### 5. Verify

- Browser preview, mobile width
- Check against PRD acceptance criteria

## Sample prompt

```
Follow .agents/skills/vibe-build/SKILL.md

Read @docs/project-overview-pdr.md and @docs/design-guidelines.md

Feature: [what you want built or changed]
```

## Workshop boundaries

Skip unless PRD or instructor explicitly requests: cloud database, deploy, auth systems, payment integration.
