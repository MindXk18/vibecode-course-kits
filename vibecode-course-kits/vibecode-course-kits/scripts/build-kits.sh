#!/usr/bin/env bash
# Build progressive session kits: 01 ⊂ 02 ⊂ 03 ⊂ 04
# Session 5 = Demo Day (no kit)
# Usage: ./scripts/build-kits.sh

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MOD="$ROOT/modules"
OUT="$ROOT/sessions"

S1="vibe-build frontend-design ui-ux-pro-max design copywriting"
S2="vibe-interact fix web-design-guidelines"
S3="databases chatbot-widget"
S4="deploy docs"

D1="project-overview-pdr.md design-guidelines.md"
D2="progress.md"
D3="data-schema.md"
D4="handover-checklist.md"

skills_for() {
  case "$1" in
    1) echo "$S1" ;;
    2) echo "$S1 $S2" ;;
    3) echo "$S1 $S2 $S3" ;;
    4) echo "$S1 $S2 $S3 $S4" ;;
  esac
}

docs_for() {
  case "$1" in
    1) echo "$D1" ;;
    2) echo "$D1 $D2" ;;
    3) echo "$D1 $D2 $D3" ;;
    4) echo "$D1 $D2 $D3 $D4" ;;
  esac
}

# Shared install script
cat > "$ROOT/scripts/install-into-project.sh" <<'INSTALL'
#!/usr/bin/env bash
# Usage: ./install-into-project.sh [KIT_DIR] [TARGET_DIR]
set -euo pipefail
KIT_DIR="${1:-.}"
TARGET_DIR="${2:-.}"
mkdir -p "$TARGET_DIR/docs/templates" "$TARGET_DIR/data"
cp -R "$KIT_DIR/.agents" "$TARGET_DIR/"
cp -R "$KIT_DIR/docs/templates/." "$TARGET_DIR/docs/templates/"
cp "$KIT_DIR/docs/README.md" "$TARGET_DIR/docs/" 2>/dev/null || true
cp "$KIT_DIR/CHEATSHEET.md" "$TARGET_DIR/" 2>/dev/null || true
cp "$KIT_DIR/README.md" "$TARGET_DIR/KIT-README.md" 2>/dev/null || true
echo "Installed into: $(cd "$TARGET_DIR" && pwd)"
echo "Next: cp docs/templates/*.md docs/  then fill templates and open Cursor."
INSTALL
chmod +x "$ROOT/scripts/install-into-project.sh"

rm -rf "$OUT"
mkdir -p "$OUT"

build_one() {
  local n="$1"
  local title="$2"
  local unlocks="$3"
  local id
  id="$(printf '%02d' "$n")"
  local dir="$OUT/session-$id"
  local next=$((n < 4 ? n + 1 : 4))

  echo "→ Session $n → $dir"
  mkdir -p "$dir/.agents/skills" "$dir/.agents/rules" "$dir/docs/templates"

  for skill in $(skills_for "$n"); do
    if [[ ! -d "$MOD/skills/$skill" ]]; then
      echo "ERROR: missing skill module: $skill" >&2
      exit 1
    fi
    cp -R "$MOD/skills/$skill" "$dir/.agents/skills/"
  done

  cp "$MOD/rules/development-rules.md" "$dir/.agents/rules/"
  cp "$MOD/rules/primary-workflow.md" "$dir/.agents/rules/"
  cp "$MOD/rules/workshop-session-$id.md" "$dir/.agents/rules/workshop.md"

  for f in $(docs_for "$n"); do
    cp "$MOD/docs-templates/$f" "$dir/docs/templates/"
  done

  {
    echo "# Docs — Session $n"
    echo ""
    echo "> [!IMPORTANT]"
    echo "> Bộ công cụ lập trình với AI dành tặng học viên MindX cho khóa học Vibecode for Everyone. Bạn quan tâm vui lòng liên hệ mindx.edu.vn để nhận bộ tài liệu đầy đủ."
    echo ""
    echo "cp docs/templates/*.md docs/"
    echo ""
    echo "Templates this session:"
    for f in $(docs_for "$n"); do echo "- $f"; done
  } > "$dir/docs/README.md"

  {
    echo "# Vibecode Course Kit — Session $n"
    echo ""
    echo "> [!IMPORTANT]"
    echo "> Bộ công cụ lập trình với AI dành tặng học viên MindX cho khóa học Vibecode for Everyone. Bạn quan tâm vui lòng liên hệ mindx.edu.vn để nhận bộ tài liệu đầy đủ."
    echo ""
    echo "**$title**"
    echo ""
    if [[ "$n" -gt 1 ]]; then
      echo "Includes Sessions 1-$((n - 1)) plus new unlocks below."
      echo ""
    fi
    echo "## Unlocks this session"
    echo ""
    echo "$unlocks"
    echo ""
    echo "## Session 5?"
    echo ""
    echo "Demo Day — no new kit. Keep using Session 4."
    echo ""
    echo "## Install"
    echo ""
    echo "./install-into-project.sh . /path/to/your-project"
    echo ""
    echo "## Skills"
    echo ""
    for skill in $(skills_for "$n"); do echo "- $skill"; done
    echo ""
    echo "## Not unlocked yet"
    echo ""
    [[ "$n" -lt 2 ]] && echo "- Forms / validation / fix (Session 2)"
    [[ "$n" -lt 3 ]] && echo "- Cloud database + chatbot (Session 3)"
    [[ "$n" -lt 4 ]] && echo "- Deploy + handover docs (Session 4)"
    echo ""
    echo "## Upgrade"
    echo ""
    echo "Next class: install Session ${next} kit (overwrite .agents/). Keep your docs/ and code."
  } > "$dir/README.md"

  cp "$MOD/cheatsheets/session-$id.md" "$dir/CHEATSHEET.md"
  cp "$ROOT/scripts/install-into-project.sh" "$dir/"
  chmod +x "$dir/install-into-project.sh"

  {
    echo "session: $n"
    echo "skills:"
    for skill in $(skills_for "$n"); do echo "  - $skill"; done
  } > "$dir/MANIFEST.txt"

  du -sh "$dir"
}

# Ensure cheatsheets exist
mkdir -p "$MOD/cheatsheets"

build_one 1 "Landing Page & First Interface" \
  "Responsive landing page with vibe-build + UI/design skills."

build_one 2 "Interactions — Buttons, Forms & Validation" \
  "vibe-interact, fix, web-design-guidelines — popups, forms, validation, debug."

build_one 3 "Cloud Data & Smart Feedback" \
  "databases + chatbot-widget — cloud form save and data-driven Q&A."

build_one 4 "Deploy & Handover" \
  "deploy + docs — live URL and professional README."

echo ""
echo "Done. Session 5 = Demo Day (no kit)."
ls "$OUT"
