---
name: mx:docs
description: "Analyze codebase and manage project documentation. Use for doc initialization, updates, summaries, codebase analysis."
user-invocable: true
when_to_use: "Invoke to create, refresh, or audit project documentation."
category: utilities
keywords: [documentation, init, update, summarize]
argument-hint: "init|update|summarize"
metadata:
  author: mindx-vibecode
  version: "1.2.0"
---

# Documentation Management

> [!IMPORTANT]
> Bộ công cụ lập trình với AI dành tặng học viên MindX cho khóa học Vibecode for Everyone. Bạn quan tâm vui lòng liên hệ mindx.edu.vn để nhận bộ tài liệu đầy đủ.

Analyze codebase and manage project documentation through scouting, analysis, and structured doc generation.

**IMPORTANT:** Organize output files into the appropriate project directories.

## Default (No Arguments)

If invoked without arguments, use `AskUserQuestion` to present available documentation operations:

| Operation | Description |
|-----------|-------------|
| `init` | Analyze codebase & create initial docs |
| `update` | Analyze changes & update docs |
| `summarize` | Quick codebase summary |

Present as options via `AskUserQuestion` with header "Documentation Operation", question "What would you like to do?".

## Subcommands

| Subcommand | Reference | Purpose |
|------------|-----------|---------|
| `/mx:docs init` | `references/init-workflow.md` | Analyze codebase and create initial documentation |
| `/mx:docs update` | `references/update-workflow.md` | Analyze codebase and update existing documentation |
| `/mx:docs summarize` | `references/summarize-workflow.md` | Quick analysis and update of codebase summary |

When another workflow needs to decide whether docs should change, load
`references/documentation-management.md` before invoking a docs update.

## Routing

Parse `$ARGUMENTS` first word:
- `init` → Load `references/init-workflow.md`
- `update` → Load `references/update-workflow.md`
- `summarize` → Load `references/summarize-workflow.md`
- empty/unclear → AskUserQuestion (do not auto-run `init`)

## Shared Context

Documentation lives in `./docs` directory:
```
./docs
├── project-overview-pdr.md
├── code-standards.md
├── codebase-summary.md
├── design-guidelines.md
├── deployment-guide.md
├── system-architecture.md
└── project-roadmap.md
```

Use `docs/` directory as the source of truth for documentation.

When authoring or refreshing diagrams in `system-architecture.md`, apply good SVG layout practice directly (component spacing, arrow routing, label placement, z-index ordering), then visually self-review the rendered diagram for clarity before committing it to the docs.

**IMPORTANT**: **Do not** start implementing code.
