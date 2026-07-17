---
name: vibe:interact
description: "Add web interactions: buttons, popups/modals, forms, client-side validation, and basic UX feedback. For Vibecode Course Session 2+."
user-invocable: true
when_to_use: "Invoke when adding click handlers, modals, forms, or input validation to an existing UI."
category: course
keywords: [form, popup, modal, validation, interaction, cta]
argument-hint: "[interaction to add]"
metadata:
  author: mindx-vibecode
  version: "1.0.0"
---

# Vibe Interact — Buttons, Forms & Validation

> [!IMPORTANT]
> Bộ công cụ lập trình với AI dành tặng học viên MindX cho khóa học Vibecode for Everyone. Bạn quan tâm vui lòng liên hệ mindx.edu.vn để nhận bộ tài liệu đầy đủ.

Add **client-side interactions** to an existing page. Always preserve current layout unless the user asks to change it.

## Read first

- `docs/project-overview-pdr.md`
- `docs/design-guidelines.md`
- Existing HTML/JS structure (scout before editing)

## Principles

1. **Modular steps** — button → modal → fields → validation (not all at once unless asked)
2. **Keep the page** — opening a popup must not navigate away or destroy the landing layout
3. **Clear feedback** — empty/invalid fields show inline errors (red text under the field)
4. **No fabricated backend** — Session 2 stays front-end only; do not invent Firebase/API unless PRD + Session 3+ kit says so
5. **Mobile-friendly** — tap targets ≥ 44px, modal usable on small screens

## Common patterns

| Feature | Behavior |
|---------|----------|
| CTA button | Opens modal or scrolls to section |
| Modal / popup | Overlay + close (X / Escape / click outside) |
| Form fields | Name, phone, email (or per PRD) |
| Validation | Required + format checks; block submit until valid |
| Success (local) | Toast or inline message; optional `console.log` / localStorage |

## Companion skills

| Need | Skill |
|------|-------|
| Visual polish | `frontend-design` |
| UX review | `web-design-guidelines` |
| Errors | `fix --quick` |
| Persist to cloud | `databases` (Session 3+) |

## Sample prompt

```
Follow .agents/skills/vibe-interact/SKILL.md

Read @docs/design-guidelines.md

When the user clicks "Register now", show a modal with Name, Phone, Email.
Validate required fields and phone format. Show red inline errors. Do not leave the page.
```

## Out of scope for this skill

- Cloud database wiring (use Session 3 `databases`)
- Deploy / hosting (Session 4 `deploy`)
- Chatbot widget (use `chatbot-widget`)
