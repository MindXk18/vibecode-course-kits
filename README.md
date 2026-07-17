# 🎓 Vibecode Course Kits (Progressive)

> [!IMPORTANT]
> **Bộ công cụ lập trình với AI dành tặng học viên MindX cho khóa học Vibecode for Everyone.**
> Bạn quan tâm vui lòng liên hệ [mindx.edu.vn](https://mindx.edu.vn) để nhận bộ tài liệu đầy đủ.

---

## 🚀 Cài Đặt Nhanh (Chỉ 1 Click)

Dành cho học viên bắt đầu khóa học. Bạn chỉ cần chạy lệnh cài đặt một lần duy nhất, hệ thống sẽ tự động cấu hình **Global Skill** cho Antigravity IDE của bạn.

### 🪟 Windows (PowerShell)

Mở **PowerShell** và dán dòng lệnh sau, sau đó nhấn Enter:

```powershell
irm https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-windows.ps1 | iex
```

*(Hoặc học viên có thể tải file `Cai-Dat-VibeCode-Windows.bat` và nhấp đúp để cài đặt tự động).*

### 🍏 macOS / Linux (Terminal)

Mở **Terminal** và dán dòng lệnh sau, sau đó nhấn Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-mac.sh | bash
```

*(Hoặc học viên có thể tải file `Cai-Dat-VibeCode-Mac.command` và nhấp đúp để cài).*

---

## 🗺️ Lộ Trình Mở Khóa (Unlock Map)

**Mục tiêu:** Học viên sẽ không nhận toàn bộ công cụ ngay từ buổi đầu. Mỗi buổi học sẽ mở khóa thêm các kỹ năng (skills) mới để tránh bị quá tải.

```text
Buổi 1  ⊂  Buổi 2  ⊂  Buổi 3  ⊂  Buổi 4
Buổi 5  =  Demo Day (Sử dụng nguyên bộ công cụ của Buổi 4)
```

| Buổi học | Kỹ năng mới (Skills) | Khả năng đạt được | File dữ liệu |
|:---:|---|---|---|
| **Buổi 1** | `vibe-build`, `frontend-design`, `ui-ux-pro-max`, `design`, `copywriting` | Xây dựng UI Landing page | `sessions/session-01/` |
| **Buổi 2** | `+ vibe-interact`, `fix`, `web-design-guidelines` | Tương tác Popup, Form, Debug | `sessions/session-02/` |
| **Buổi 3** | `+ databases`, `chatbot-widget` | Tích hợp Firebase/Supabase, Chatbot | `sessions/session-03/` |
| **Buổi 4** | `+ deploy`, `docs` | Triển khai Vercel, bàn giao tài liệu | `sessions/session-04/` |
| **Buổi 5** | *(Không có)* | Thuyết trình & Báo cáo sản phẩm | — |

*Chi tiết mở khóa xem tại: [PROGRESSION.md](./PROGRESSION.md)*

---

## 👨‍🏫 Dành cho Giảng Viên & System Admin

### 1. Phân phối cho học viên dự phòng
Nếu học viên không cài đặt được bằng lệnh "1-Click" ở trên, giảng viên có thể copy trực tiếp các thư mục theo từng buổi:
- **Nguyên tắc nâng cấp:** Cài đè thư mục `.agents/` bằng bộ kit mới tương ứng mỗi buổi. Giữ nguyên thư mục `docs/` và source code cũ của học viên.

```bash
# Ví dụ cài đặt Session 0N vào project hiện tại của học viên
cd student-project
../vibecode-course-kits/sessions/session-0N/install-into-project.sh ../vibecode-course-kits/sessions/session-0N .
```

### 2. Cấu trúc Repository (Repo Layout)
```text
vibecode-course-kits/
├── 🚀 Cài đặt tự động
│   ├── cai-dat-windows.ps1         ← Script cài đặt Windows
│   ├── cai-dat-mac.sh              ← Script cài đặt macOS
│   ├── Cai-Dat-VibeCode-Windows.bat
│   └── Cai-Dat-VibeCode-Mac.command
├── 📚 Nội dung khóa học
│   ├── README.md                 ← File bạn đang đọc
│   ├── PROGRESSION.md            ← Lộ trình chi tiết
│   ├── modules/                  ← Source of truth (Chỉnh sửa nội dung ở đây)
│   │   ├── skills/
│   │   ├── rules/
│   │   ├── docs-templates/
│   │   └── cheatsheets/
│   ├── scripts/build-kits.sh     ← Script build lại bộ cài từ thư mục modules
│   └── sessions/                 ← Các phiên bản đóng gói cho mỗi buổi (Hand out)
```

### 3. Build lại dữ liệu (Rebuild)
Sau khi bạn chỉnh sửa bất kỳ thứ gì ở thư mục `modules/`, hãy chạy lệnh sau để đóng gói lại các sessions:
```bash
./scripts/build-kits.sh
```

### 4. Phân biệt Workshop và Course
| Tiêu chí | `vibecode-workshop-kit/` | `vibecode-course-kits/` |
|:---|:---|:---|
| **Mục đích** | Dành cho Workshop ngắn (40 phút) | Khóa học dài hạn (5 buổi) |
| **Phong cách** | Một bộ kit duy nhất (Flat kit) | Mở khóa dần dần (Progressive 01→04) |

*(Dữ liệu demo của giảng viên lưu tại `workshop-demo-boarding-house/` có thể được tái sử dụng làm bài tập thực hành nếu cần).*
