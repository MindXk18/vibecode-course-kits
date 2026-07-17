#!/bin/bash
set -e

# ANSI Colors
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
RED='\033[0;31m'
NC='\033[0m' # No Color

clear
echo -e "${CYAN}==========================================${NC}"
echo -e "${YELLOW}    🚀 VIBE CODE KITS - CÀI ĐẶT NHANH     ${NC}"
echo -e "${CYAN}==========================================${NC}"
echo ""

SKILL_NAME="vibecode-course-kits"
GITHUB_REPO="https://github.com/MindXk18/vibecode-course-kits.git"
ZIP_URL="https://github.com/MindXk18/vibecode-course-kits/archive/refs/heads/main.zip"
SKILL_DIR="$HOME/.gemini/config/skills"
TARGET_DIR="$SKILL_DIR/$SKILL_NAME"
TEMP_DIR="/tmp/vibecode-course-kits-tmp"

echo -e "${WHITE}[1/4] 🔍 Đang kiểm tra hệ thống Antigravity...${NC}"
if [ ! -d "$SKILL_DIR" ]; then
    mkdir -p "$SKILL_DIR"
    echo -e "${GRAY}      Đã tạo cấu trúc thư mục hệ thống.${NC}"
else
    echo -e "${GRAY}      Hệ thống Antigravity đã sẵn sàng.${NC}"
fi

if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}      ⚠️ Đã tồn tại phiên bản cũ của Kit, đang tiến hành dọn dẹp...${NC}"
    rm -rf "$TARGET_DIR"
fi

rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

echo -e "${WHITE}[2/4] ☁️ Đang lấy dữ liệu từ máy chủ Vibe Code...${NC}"

HAS_GIT=false
if command -v git &> /dev/null; then
    echo -e "${GRAY}      Phát hiện công cụ Git! Đang clone repository (ưu tiên)...${NC}"
    if git clone -q "$GITHUB_REPO" "$TARGET_DIR"; then
        HAS_GIT=true
        echo -e "${GREEN}      Clone thành công!${NC}"
    else
        echo -e "${RED}      Lỗi khi dùng Git, chuyển sang chế độ tải trực tiếp...${NC}"
    fi
fi

if [ "$HAS_GIT" = false ]; then
    echo -e "${GRAY}      Sử dụng chế độ tải ZIP an toàn...${NC}"
    ZIP_PATH="$TEMP_DIR/main.zip"
    curl -fsSL -o "$ZIP_PATH" "$ZIP_URL"
    
    echo -e "${WHITE}[3/4] 🪄 Đang giải nén dữ liệu phép thuật...${NC}"
    unzip -q "$ZIP_PATH" -d "$TEMP_DIR"
    
    # Github ZIP extracts to a folder named repo-branch, which is vibecode-course-kits-main
    mv "$TEMP_DIR/vibecode-course-kits-main" "$TARGET_DIR"
else
    echo -e "${WHITE}[3/4] 🪄 Bỏ qua bước giải nén (Đã dùng Git)...${NC}"
fi

echo -e "${WHITE}[4/4] 🧹 Đang dọn dẹp các tệp tin tạm thời...${NC}"
rm -rf "$TEMP_DIR"

echo ""
echo -e "${CYAN}==========================================${NC}"
echo -e "${GREEN}✅ THÀNH CÔNG RỰC RỠ!${NC}"
echo -e "${WHITE}Bộ công cụ Vibe Code Kits đã được cài đặt an toàn vào máy bạn.${NC}"
echo -e "${WHITE}Bạn có thể đóng cửa sổ này, mở IDE lên và bắt đầu hành trình nhé!${NC}"
echo -e "${CYAN}==========================================${NC}"
echo ""
