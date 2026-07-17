#!/bin/bash
# ============================================================
# Vibe Code Kits - Wrapper cai dat cho macOS (Nhap dup de chay)
# ============================================================

# Tu cap quyen thuc thi cho chinh no (phong truong hop bi mat quyen khi gui qua email/Zalo)
if [ ! -x "$0" ]; then
    chmod +x "$0"
    exec "$0" "$@"
fi

clear
echo ""
echo "  ================================================"
echo "    VIBE CODE KITS - DANG KHOI DONG..."
echo "  ================================================"
echo ""
echo "  Dang kiem tra ket noi mang..."

# Kiem tra ket noi mang
if ! curl -fsSL --connect-timeout 5 -o /dev/null https://github.com 2>/dev/null; then
    echo ""
    echo "  [LOI] Khong the ket noi den may chu GitHub."
    echo "  Vui long kiem tra ket noi mang cua ban va thu lai."
    echo ""
    echo "  Nhan phim Enter de dong cua so nay..."
    read -r
    exit 1
fi

echo "  Ket noi mang binh thuong. Bat dau qua trinh cai dat..."
echo ""

# Goi script chinh tu GitHub
curl -fsSL https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-mac.sh | bash
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
    echo ""
    echo "  ================================================"
    echo "  [LOI] Qua trinh cai dat gap su co."
    echo "  ================================================"
    echo ""
    echo "  Huong dan xu ly:"
    echo "  1. Thu chay lai file nay."
    echo "  2. Neu van loi, mo Terminal va chay lenh sau:"
    echo "     curl -fsSL https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-mac.sh | bash"
    echo "  3. Lien he giang vien de duoc ho tro."
    echo ""
fi

echo "  Nhan phim Enter de dong cua so nay..."
read -r
