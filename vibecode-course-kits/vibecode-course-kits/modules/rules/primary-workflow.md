# Primary Workflow (Workshop)

Use this workflow for any build task beyond a simple question.

## 1. Understand

- Read the user request and all files in `docs/`
- If `docs/project-overview-pdr.md` is empty or placeholder, ask 2–3 questions to clarify goals, users, and scope before building
- Do not invent product requirements

## 2. Implement

- Invoke `vibe-build` for new pages, sections, or features
- Invoke `frontend-design` or `ui-ux-pro-max` when visual polish matters
- Invoke `chatbot-widget` only after data shape is defined in `docs/data-schema.md` and files exist in `data/`
- Keep changes small and incremental

## 3. Verify

- Open the page in a browser
- Resize to mobile width
- Confirm behavior matches acceptance criteria in the PRD

## 4. Fix and iterate

- On errors: `fix --quick` with the console message
- On UI feedback: describe the desired change in natural language; do not edit code manually unless asked

## Out of workshop scope (unless instructor says otherwise)

- Firebase, Supabase, production deploy
- Payment gateways, OAuth, multi-tenant auth
- CI/CD, automated test suites
