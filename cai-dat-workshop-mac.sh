#!/bin/bash
# ============================================================
# Vibe Code Workshop Kit - Script cai dat macOS
# Repository: https://github.com/MindXk18/vibecode-course-kits
# ============================================================

SCRIPT_VERSION="1.0.0"
SKILL_NAME="vibecode-workshop-kit"
GITHUB_REPO="https://github.com/MindXk18/vibecode-course-kits.git"
ZIP_URL="https://github.com/MindXk18/vibecode-course-kits/archive/refs/heads/main.zip"
SKILL_DIR="$HOME/.gemini/config/skills"
TARGET_DIR="$SKILL_DIR/$SKILL_NAME"
TEMP_DIR="/tmp/vibecode-workshop-tmp"

# --- ANSI Colors ---
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
RED='\033[0;31m'
NC='\033[0m'

# --- Trap: Don dep khi bi Ctrl+C ---
cleanup_on_exit() {
    rm -rf "$TEMP_DIR" 2>/dev/null
}
trap cleanup_on_exit EXIT

show_banner() {
    clear
    echo ""
    echo -e "${CYAN}  ================================================${NC}"
    echo -e "${YELLOW}   VIBE CODE WORKSHOP - CAI DAT KIT TU DONG${NC}"
    echo -e "${GRAY}   MindX x Antigravity | v${SCRIPT_VERSION}${NC}"
    echo -e "${CYAN}  ================================================${NC}"
    echo ""
    echo -e "${GREEN}  Luu y: File cai dat nay hoan toan sach.${NC}"
    echo -e "${GREEN}  Chi chua bo kit Vibe Code dung trong Workshop.${NC}"
    echo -e "${GREEN}  Ban co the hoan toan yen tam!${NC}"
    echo ""
}

show_success() {
    echo ""
    echo -e "${CYAN}  ================================================${NC}"
    echo -e "${GREEN}  HOAN TAT! KIT DA SAN SANG!${NC}"
    echo -e "${CYAN}  ================================================${NC}"
    echo ""
    echo -e "${WHITE}  Da cai dat vao:${NC}"
    echo -e "${YELLOW}  $TARGET_DIR${NC}"
    echo ""
    echo -e "${WHITE}  Mo Antigravity IDE va bat dau Workshop!${NC}"
    echo ""
}

show_error() {
    local message="$1"
    echo ""
    echo -e "${RED}  ================================================${NC}"
    echo -e "${RED}  LOI! QUA TRINH CAI DAT KHONG HOAN TAT.${NC}"
    echo -e "${RED}  ================================================${NC}"
    echo ""
    echo -e "${YELLOW}  Chi tiet: ${message}${NC}"
    echo ""
    echo -e "${WHITE}  Hay lien he giang vien de duoc ho tro.${NC}"
    echo ""
}

# Ham tim session-01 bat ke vi tri trong cay thu muc (xu ly cau truc long nhau)
find_session01() {
    local base="$1"
    find "$base" -type d -name "session-01" 2>/dev/null | head -1
}

# ==================== BAT DAU ====================
show_banner

# --- Buoc 1: Kiem tra he thong Antigravity ---
echo -e "${WHITE}  [1/5] Kiem tra he thong Antigravity...${NC}"
if [ ! -d "$SKILL_DIR" ]; then
    mkdir -p "$SKILL_DIR"
    echo -e "${GRAY}        Da tao thu muc Skills.${NC}"
else
    echo -e "${GRAY}        He thong san sang.${NC}"
fi

# --- Buoc 2: Xu ly phien ban cu ---
echo -e "${WHITE}  [2/5] Kiem tra phien ban hien tai...${NC}"
if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}        Cap nhat phien ban moi...${NC}"
    rm -rf "$TARGET_DIR"
else
    echo -e "${GRAY}        Cai dat lan dau.${NC}"
fi

rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# --- Buoc 3: Tai du lieu ---
echo -e "${WHITE}  [3/5] Dang tai du lieu tu may chu...${NC}"

DOWNLOAD_SUCCESS=false

# Uu tien git clone
if command -v git &> /dev/null; then
    echo -e "${GRAY}        Phat hien Git. Dang clone...${NC}"
    REPO_DIR="$TEMP_DIR/repo"
    if git clone -q "$GITHUB_REPO" "$REPO_DIR" 2>/dev/null; then
        echo -e "${GREEN}        Clone thanh cong!${NC}"
        SESSION01=$(find_session01 "$REPO_DIR")
        if [ -n "$SESSION01" ]; then
            # Tao thu muc dich truoc, sau do copy NOI DUNG vao trong
            mkdir -p "$TARGET_DIR"
            cp -r "$SESSION01"/. "$TARGET_DIR/"
            DOWNLOAD_SUCCESS=true
        else
            echo -e "${YELLOW}        Khong tim thay session-01, chuyen sang ZIP...${NC}"
        fi
    else
        echo -e "${YELLOW}        Clone khong thanh cong, chuyen sang ZIP...${NC}"
        rm -rf "$REPO_DIR" 2>/dev/null
    fi
fi

# Fallback: Tai ZIP
if [ "$DOWNLOAD_SUCCESS" = false ]; then
    echo -e "${GRAY}        Tai bang ZIP...${NC}"
    ZIP_PATH="$TEMP_DIR/main.zip"

    if ! curl -fsSL -o "$ZIP_PATH" "$ZIP_URL"; then
        show_error "Khong the tai du lieu. Vui long kiem tra ket noi mang."
        exit 1
    fi

    echo -e "${WHITE}  [4/5] Giai nen du lieu...${NC}"

    if ! unzip -q "$ZIP_PATH" -d "$TEMP_DIR"; then
        show_error "Khong the giai nen du lieu."
        exit 1
    fi

    # Tim session-01 bat ke vi tri trong ZIP da giai nen
    SESSION01=$(find_session01 "$TEMP_DIR")

    if [ -z "$SESSION01" ]; then
        show_error "Khong tim thay session-01 sau khi giai nen."
        exit 1
    fi

    # Tao thu muc dich truoc, sau do copy NOI DUNG vao trong
    mkdir -p "$TARGET_DIR"
    cp -r "$SESSION01"/. "$TARGET_DIR/"
    DOWNLOAD_SUCCESS=true
    echo -e "${GREEN}        Giai nen thanh cong!${NC}"
else
    echo -e "${WHITE}  [4/5] Bo qua giai nen (Da dung Git).${NC}"
fi

# --- Buoc 5: Don dep ---
echo -e "${WHITE}  [5/5] Don dep...${NC}"
rm -rf "$TEMP_DIR"

if [ "$DOWNLOAD_SUCCESS" = true ]; then
    show_success
else
    show_error "Qua trinh cai dat khong hoan tat. Vui long thu lai."
    exit 1
fi
