# Vibe Code Workshop Kit — MindX

**Bộ công cụ AI dành cho học viên Workshop Vibe Code của MindX.**
Cài một lần, dùng ngay trong buổi học.

---

## 1. Đây là gì?

Bộ kit này cài thêm các **kỹ năng (skills) chuyên biệt** vào AI coding agent của bạn, giúp bạn xây dựng Landing Page nhanh hơn trong buổi Workshop.

Skills được cài đặt:
- `vibe-build` — Khung sườn xây dựng sản phẩm
- `frontend-design` — Thiết kế giao diện
- `ui-ux-pro-max` — UX nâng cao
- `design` — Hệ thống thiết kế
- `copywriting` — Viết nội dung

> **Bạn cần cài AI agent trước khi cài kit này.**
> Chưa biết dùng agent nào? → Cài **Antigravity** (mặc định, khuyến nghị).
> Nếu đã có Codex hoặc Claude Code, xem hướng dẫn tương ứng ở mục 2.

---

## 2. Cài đặt

### 🪟 Windows

**Cách 1 — Tải file, nhấp đúp (đơn giản nhất):**

1. Tải file [`Cai-Dat-Workshop-Windows.bat`](./Cai-Dat-Workshop-Windows.bat)
2. Nhấp đúp vào file vừa tải → cửa sổ đen tự chạy → đợi thông báo "HOÀN TẤT"

**Cách 2 — Lệnh PowerShell (nếu Cách 1 bị chặn):**

Mở **PowerShell** → dán lệnh sau → Enter:

```powershell
irm https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-workshop-windows.ps1 | iex
```

---

### 🍏 macOS

**Cách 1 — Tải file, nhấp đúp (đơn giản nhất):**

1. Tải file [`Cai-Dat-Workshop-Mac.command`](./Cai-Dat-Workshop-Mac.command)
2. Nhấp đúp vào file → Terminal tự mở → đợi thông báo "HOÀN TẤT"

> Nếu macOS báo *"không thể mở vì không xác định được nhà phát triển"*:
> Chuột phải vào file → **Open** → **Open** (xác nhận lần 2).

**Cách 2 — Lệnh Terminal (nếu Cách 1 bị chặn):**

Mở **Terminal** → dán lệnh sau → Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-workshop-mac.sh | bash
```

---

### 🤖 Codex / Claude Code (thủ công)

Nếu bạn dùng **Codex** hoặc **Claude Code** thay vì Antigravity:

1. Tải file [`vibecode-workshop-kit.zip`](https://github.com/MindXk18/vibecode-course-kits/archive/refs/heads/main.zip)
2. Giải nén → tìm thư mục `vibecode-course-kits/sessions/session-01/.agents/`
3. Copy toàn bộ nội dung thư mục `.agents/` vào **thư mục gốc dự án** của bạn

Cấu trúc sau khi copy:
```
your-project/
└── .agents/
    ├── skills/
    └── rules/
```
