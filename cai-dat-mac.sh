#!/bin/bash
# ============================================================
# Vibe Code Kits - Script cai dat tu dong (macOS / Linux)
# Repository: https://github.com/MindXk18/vibecode-course-kits
# ============================================================

SCRIPT_VERSION="1.1.0"
SKILL_NAME="vibecode-course-kits"
GITHUB_REPO="https://github.com/MindXk18/vibecode-course-kits.git"
ZIP_URL="https://github.com/MindXk18/vibecode-course-kits/archive/refs/heads/main.zip"
SKILL_DIR="$HOME/.gemini/config/skills"
TARGET_DIR="$SKILL_DIR/$SKILL_NAME"
TEMP_DIR="/tmp/vibecode-course-kits-tmp"

# --- ANSI Colors ---
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
RED='\033[0;31m'
NC='\033[0m'

# --- Danh sach file/thu muc khong can thiet cho Skill ---
FILES_TO_CLEAN=(
    "cai-dat-windows.ps1"
    "cai-dat-mac.sh"
    "Cai-Dat-VibeCode-Windows.bat"
    "Cai-Dat-VibeCode-Mac.command"
    ".git"
    ".gitignore"
    ".gitattributes"
    ".github"
)

# --- Trap: Don dep khi bi huy giua chung (Ctrl+C) ---
cleanup_on_exit() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}
trap cleanup_on_exit EXIT

# --- Cac ham hien thi ---
show_banner() {
    clear
    echo ""
    echo -e "${CYAN}  ================================================${NC}"
    echo -e "${YELLOW}    VIBE CODE KITS - HE THONG CAI DAT TU DONG${NC}"
    echo -e "${GRAY}    Phien ban: v${SCRIPT_VERSION}${NC}"
    echo -e "${CYAN}  ================================================${NC}"
    echo ""
}

show_success() {
    echo ""
    echo -e "${CYAN}  ================================================${NC}"
    echo -e "${GREEN}  CAI DAT HOAN TAT THANH CONG!${NC}"
    echo -e "${CYAN}  ================================================${NC}"
    echo ""
    echo -e "${WHITE}  Thu muc cai dat:${NC}"
    echo -e "${YELLOW}  $TARGET_DIR${NC}"
    echo ""
    echo -e "${GRAY}  Ban co the dong cua so nay.${NC}"
    echo -e "${WHITE}  Mo IDE len va bat dau hanh trinh Vibe Code!${NC}"
    echo ""
}

show_error() {
    local message="$1"
    echo ""
    echo -e "${RED}  ================================================${NC}"
    echo -e "${RED}  DA XAY RA LOI!${NC}"
    echo -e "${RED}  ================================================${NC}"
    echo ""
    echo -e "${YELLOW}  Chi tiet: ${message}${NC}"
    echo ""
    echo -e "${WHITE}  Huong dan xu ly:${NC}"
    echo -e "${GRAY}  1. Kiem tra ket noi mang cua ban.${NC}"
    echo -e "${GRAY}  2. Thu chay lai script nay.${NC}"
    echo -e "${GRAY}  3. Lien he giang vien de duoc ho tro.${NC}"
    echo ""
}

remove_installer_files() {
    local dir="$1"
    for item in "${FILES_TO_CLEAN[@]}"; do
        if [ -e "$dir/$item" ]; then
            rm -rf "$dir/$item"
        fi
    done
}

# ==================== BAT DAU ====================
show_banner

# --- Buoc 1: Kiem tra he thong ---
echo -e "${WHITE}  [1/5] Dang kiem tra he thong Antigravity...${NC}"
if [ ! -d "$SKILL_DIR" ]; then
    mkdir -p "$SKILL_DIR"
    echo -e "${GRAY}        Da tao cau truc thu muc he thong.${NC}"
else
    echo -e "${GRAY}        He thong Antigravity da san sang.${NC}"
fi

# --- Buoc 2: Xu ly phien ban cu ---
echo -e "${WHITE}  [2/5] Dang kiem tra phien ban hien tai...${NC}"
if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}        Phat hien phien ban cu. Dang go bo de cap nhat...${NC}"
    rm -rf "$TARGET_DIR"
    echo -e "${GRAY}        Da go bo phien ban cu.${NC}"
else
    echo -e "${GRAY}        Chua co phien ban nao. Tien hanh cai dat moi.${NC}"
fi

# --- Don dep thu muc tam ---
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# --- Buoc 3: Tai du lieu ---
echo -e "${WHITE}  [3/5] Dang tai du lieu tu may chu...${NC}"

DOWNLOAD_SUCCESS=false

# Uu tien git clone
if command -v git &> /dev/null; then
    echo -e "${GRAY}        Phat hien Git. Dang clone repository...${NC}"
    if git clone -q "$GITHUB_REPO" "$TARGET_DIR" 2>/dev/null; then
        echo -e "${GREEN}        Clone thanh cong!${NC}"
        DOWNLOAD_SUCCESS=true
    else
        echo -e "${YELLOW}        Git clone khong thanh cong, chuyen sang che do tai ZIP...${NC}"
        # Don dep neu git tao thu muc khong hoan chinh
        if [ -d "$TARGET_DIR" ]; then
            rm -rf "$TARGET_DIR"
        fi
    fi
fi

# Fallback: Tai ZIP
if [ "$DOWNLOAD_SUCCESS" = false ]; then
    echo -e "${GRAY}        Su dung che do tai ZIP truc tiep...${NC}"
    ZIP_PATH="$TEMP_DIR/main.zip"

    if ! curl -fsSL -o "$ZIP_PATH" "$ZIP_URL"; then
        show_error "Khong the tai du lieu tu may chu. Vui long kiem tra ket noi mang."
        exit 1
    fi

    echo -e "${WHITE}  [4/5] Dang giai nen du lieu...${NC}"

    if ! unzip -q "$ZIP_PATH" -d "$TEMP_DIR"; then
        show_error "Khong the giai nen du lieu. File tai ve co the bi loi."
        exit 1
    fi

    EXTRACTED_DIR="$TEMP_DIR/vibecode-course-kits-main"
    if [ ! -d "$EXTRACTED_DIR" ]; then
        show_error "Khong tim thay thu muc sau khi giai nen. File tai ve co the bi loi."
        exit 1
    fi

    mv "$EXTRACTED_DIR" "$TARGET_DIR"
    DOWNLOAD_SUCCESS=true
    echo -e "${GREEN}        Giai nen thanh cong!${NC}"
else
    echo -e "${WHITE}  [4/5] Bo qua giai nen (Da dung Git).${NC}"
fi

# --- Buoc 5: Don dep ---
echo -e "${WHITE}  [5/5] Dang don dep va hoan tat...${NC}"

# Xoa cac file installer khong can thiet trong thu muc Skill
remove_installer_files "$TARGET_DIR"

# Xoa thu muc tam (trap se lam nhung lam o day cho chac)
rm -rf "$TEMP_DIR"
echo -e "${GRAY}        Don dep hoan tat.${NC}"

# --- Ket qua ---
if [ "$DOWNLOAD_SUCCESS" = true ]; then
    show_success
else
    show_error "Qua trinh cai dat khong hoan tat. Vui long thu lai."
    exit 1
fi
