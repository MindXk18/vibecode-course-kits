# Vibecode Course Kits (Progressive)

> [!IMPORTANT]
> Bộ công cụ lập trình với AI dành tặng học viên MindX cho khóa học Vibecode for Everyone. Bạn quan tâm vui lòng liên hệ mindx.edu.vn để nhận bộ tài liệu đầy đủ.

**Goal:** Students never get the full kit on day one. Each session unlocks more skills.

```
Session 1 kit  ⊂  Session 2 kit  ⊂  Session 3 kit  ⊂  Session 4 kit
Session 5      =  Demo Day (no new kit — keep Session 4)
```

## Distribute to students

| When | Zip / folder | Size (approx) |
|------|----------------|---------------|
| Start of Buổi 1 | `sessions/session-01/` | ~2.1MB |
| Start of Buổi 2 | `sessions/session-02/` | ~2.2MB |
| Start of Buổi 3 | `sessions/session-03/` | ~2.6MB |
| Start of Buổi 4 | `sessions/session-04/` | ~2.7MB |
| Buổi 5 | — | Demo only |

**Upgrade rule:** At the start of each new session, install the new kit (overwrite `.agents/`). Keep student `docs/` and source code.

```bash
cd student-project
../vibecode-course-kits/sessions/session-0N/install-into-project.sh \
  ../vibecode-course-kits/sessions/session-0N .
```

## Unlock map

| Session | New skills | Can do |
|---------|------------|--------|
| **1** | `vibe-build`, `frontend-design`, `ui-ux-pro-max`, `design`, `copywriting` | Landing page UI |
| **2** | `+ vibe-interact`, `fix`, `web-design-guidelines` | Popup, form, validation, debug |
| **3** | `+ databases`, `chatbot-widget` | Firebase/Supabase + chatbot |
| **4** | `+ deploy`, `docs` | Vercel live URL + README handover |
| **5** | — | Present product |

Details: [PROGRESSION.md](./PROGRESSION.md)

## Repo layout

```
vibecode-course-kits/
├── README.md                 ← this file
├── PROGRESSION.md
├── modules/                  ← source of truth (edit here)
│   ├── skills/
│   ├── rules/workshop-session-0N.md
│   ├── docs-templates/
│   └── cheatsheets/
├── scripts/build-kits.sh     ← rebuild sessions from modules
└── sessions/                 ← hand out these folders
    ├── session-01/
    ├── session-02/
    ├── session-03/
    └── session-04/
```

## Rebuild after editing modules

```bash
./scripts/build-kits.sh
```

## Workshop vs Course

| | `vibecode-workshop-kit/` | `vibecode-course-kits/` |
|--|-------------------------|------------------------|
| Use | 40-minute workshop demo | 5-session course |
| Style | One flat kit | Progressive 01→04 |
| Session 5 | n/a | No kit |

Instructor demo data (boarding house) stays in `workshop-demo-boarding-house/` — optional for course if you reuse that exercise.
