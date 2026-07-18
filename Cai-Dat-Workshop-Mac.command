#!/bin/bash
# ============================================================
# Vibe Code Workshop Kit - Wrapper macOS (Nhap dup de chay)
# ============================================================

# Tu cap quyen thuc thi neu bi mat khi gui qua Zalo/email
if [ ! -x "$0" ]; then
    chmod +x "$0"
    exec "$0" "$@"
fi

clear
echo ""
echo "  ================================================"
echo "   VIBE CODE WORKSHOP - DANG KHOI DONG..."
echo "  ================================================"
echo ""
echo "  Dang kiem tra ket noi mang..."

if ! curl -fsSL --connect-timeout 5 -o /dev/null https://github.com 2>/dev/null; then
    echo ""
    echo "  [LOI] Khong the ket noi den may chu."
    echo "  Vui long kiem tra ket noi mang va thu lai."
    echo ""
    echo "  Nhan Enter de dong..."
    read -r
    exit 1
fi

echo "  Ket noi OK. Bat dau cai dat..."
echo ""

curl -fsSL https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-workshop-mac.sh | bash
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
    echo ""
    echo "  ================================================"
    echo "  [LOI] Cai dat gap su co."
    echo "  ================================================"
    echo ""
    echo "  Thu copy lenh nay vao Terminal va chay:"
    echo "  curl -fsSL https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-workshop-mac.sh | bash"
    echo ""
    echo "  Hoac lien he giang vien de duoc ho tro."
    echo ""
fi

echo "  Nhan Enter de dong cua so nay..."
read -r
