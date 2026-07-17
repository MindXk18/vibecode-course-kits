---
name: vibe:chatbot
description: "Add a website chatbot widget that answers from local JSON/structured data or FAQ. Rule-based by default; optional LLM in advanced courses."
user-invocable: true
when_to_use: "Invoke when adding a Q&A chat widget to a landing page or dashboard."
category: workshop
keywords: [chatbot, widget, faq, data-driven, ai-assistant]
argument-hint: "[intents and data sources]"
metadata:
  author: mindx-vibecode
  version: "2.0.0"
---

# Chatbot Widget

> [!IMPORTANT]
> Bộ công cụ lập trình với AI dành tặng học viên MindX cho khóa học Vibecode for Everyone. Bạn quan tâm vui lòng liên hệ mindx.edu.vn để nhận bộ tài liệu đầy đủ.

Build a **bottom-right chat widget** grounded in project data — never invent answers.

## Read first

- `docs/project-overview-pdr.md` — whether chatbot is in scope, tone, fallback message
- `docs/data-schema.md` — entities and fields the bot may reference
- Files in `data/` — actual records

If no data exists yet, use a small `data/faq.json` defined in the PRD, or ask the user for 5–10 Q&A pairs before building.

## UI requirements

- Fixed position: bottom-right; must not cover primary CTA
- Chat bubbles, clear send button
- Placeholder text from PRD or product domain
- Collapse / expand
- Optional short typing indicator

## Answer logic (workshop default: rule-based)

1. Load structured data from `data/*.json`
2. Map user message to **intents** defined in PRD (e.g. pricing, availability, hours, contact)
3. Pattern match on keywords (support the UI language from PRD)
4. Return formatted answers from real records
5. **Fallback** for unknown queries: polite handoff to human contact (phone, email, form) per PRD

Do **not** call external LLM APIs unless the instructor provides keys and PRD requests it.

## Implementation sketch

- `js/chatbot.js` (or equivalent module)
- `loadData()` — fetch JSON
- `matchIntent(message)` — normalize text → intent
- `formatAnswer(intent, data)` — build reply from records
- Keep intents and sample phrases documented in a short comment block or `data/faq.json`

## Optional upgrade (full course)

- LLM with system prompt + injected JSON context
- `localStorage` chat history

## Sample prompt

```
Follow .agents/skills/chatbot-widget/SKILL.md

Read @docs/project-overview-pdr.md, @docs/data-schema.md, and data/

Add a chatbot widget to [page name].
Intents: [list from PRD]. Fallback: [contact method]. Do not fabricate data.
```

## Checklist

- [ ] Answers for defined intents use real data
- [ ] Unknown questions get fallback, not hallucination
- [ ] Widget usable on mobile; does not block main CTA
