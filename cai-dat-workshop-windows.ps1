# ============================================================
# Vibe Code Workshop Kit - Script cai dat Windows
# Repository: https://github.com/MindXk18/vibecode-course-kits
# ============================================================

$scriptVersion = "1.0.0"
$skillName = "vibecode-workshop-kit"
# Tai nhanh toan bo repo roi chi lay session-01
$zipUrl = "https://github.com/MindXk18/vibecode-course-kits/archive/refs/heads/main.zip"
$githubRepo = "https://github.com/MindXk18/vibecode-course-kits.git"
$skillDir = Join-Path $HOME ".gemini\config\skills"
$targetDir = Join-Path $skillDir $skillName
$tempDir = Join-Path $env:TEMP "vibecode-workshop-tmp"

# --- File/thu muc khong can thiet trong Skill ---
$filesToClean = @(
    "cai-dat-windows.ps1",
    "cai-dat-mac.sh",
    "cai-dat-workshop-windows.ps1",
    "cai-dat-workshop-mac.sh",
    "Cai-Dat-VibeCode-Windows.bat",
    "Cai-Dat-VibeCode-Mac.command",
    "Cai-Dat-Workshop-Windows.bat",
    "Cai-Dat-Workshop-Mac.command",
    ".git",
    ".gitignore",
    ".gitattributes",
    ".github",
    "README.md",
    "modules",
    "scripts",
    "sessions"
)

function Show-Banner {
    Clear-Host
    $Host.UI.RawUI.WindowTitle = "Vibe Code Workshop Installer v$scriptVersion"
    Write-Host ""
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host "   VIBE CODE WORKSHOP - CAI DAT KIT TU DONG" -ForegroundColor Yellow
    Write-Host "   MindX x Antigravity | v$scriptVersion" -ForegroundColor Gray
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Luuu y: File cai dat nay hoan toan sach." -ForegroundColor Green
    Write-Host "  Chi chua bo kit Vibe Code dung trong Workshop." -ForegroundColor Green
    Write-Host "  Ban co the hoan toan yen tam!" -ForegroundColor Green
    Write-Host ""
}

function Show-Success {
    Write-Host ""
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host "  HOAN TAT! KIT DA SAN SANG!" -ForegroundColor Green
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Da cai dat vao:" -ForegroundColor White
    Write-Host "  $targetDir" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Mo Antigravity IDE va bat dau Workshop!" -ForegroundColor White
    Write-Host ""
}

function Show-Error {
    param([string]$Message)
    Write-Host ""
    Write-Host "  ================================================" -ForegroundColor Red
    Write-Host "  LOI! QUA TRINH CAI DAT KHONG HOAN TAT." -ForegroundColor Red
    Write-Host "  ================================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "  Chi tiet: $Message" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Hay lien he giang vien de duoc ho tro." -ForegroundColor White
    Write-Host ""
}

# ==================== BAT DAU ====================
Show-Banner

try {
    # --- Buoc 1: Kiem tra he thong Antigravity ---
    Write-Host "  [1/5] Kiem tra he thong Antigravity..." -ForegroundColor White
    if (-Not (Test-Path $skillDir)) {
        New-Item -ItemType Directory -Force -Path $skillDir | Out-Null
        Write-Host "        Da tao thu muc Skills." -ForegroundColor Gray
    } else {
        Write-Host "        He thong san sang." -ForegroundColor Gray
    }

    # --- Buoc 2: Xu ly phien ban cu ---
    Write-Host "  [2/5] Kiem tra phien ban hien tai..." -ForegroundColor White
    if (Test-Path $targetDir) {
        Write-Host "        Cap nhat phien ban moi..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $targetDir
    } else {
        Write-Host "        Cai dat lan dau." -ForegroundColor Gray
    }

    # Don dep thu muc tam
    if (Test-Path $tempDir) { Remove-Item -Recurse -Force $tempDir }
    New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

    # --- Buoc 3: Tai du lieu ---
    Write-Host "  [3/5] Dang tai du lieu tu may chu..." -ForegroundColor White

    $downloadSuccess = $false

    # Uu tien git clone
    $hasGit = $null -ne (Get-Command git -ErrorAction SilentlyContinue)
    if ($hasGit) {
        Write-Host "        Phat hien Git. Dang clone..." -ForegroundColor Gray
        $repoDir = Join-Path $tempDir "repo"
        $prevPref = $ErrorActionPreference
        $ErrorActionPreference = "Continue"
        git clone -q $githubRepo $repoDir 2>$null
        $cloneResult = $LASTEXITCODE
        $ErrorActionPreference = $prevPref

        if ($cloneResult -eq 0) {
            Write-Host "        Clone thanh cong!" -ForegroundColor Green
            # Tim session-01 bat ke vi tri trong repo (xu ly cau truc long nhau)
            $session01Item = Get-ChildItem -Path $repoDir -Recurse -Directory -Filter "session-01" | Select-Object -First 1
            if ($session01Item) {
                # Tao thu muc dich truoc, sau do copy NOI DUNG vao trong
                New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
                Get-ChildItem -Path $session01Item.FullName | ForEach-Object {
                    Copy-Item -Recurse -Force $_.FullName $targetDir
                }
                $downloadSuccess = $true
            } else {
                Write-Host "        Khong tim thay session-01, chuyen sang ZIP..." -ForegroundColor Yellow
            }
        } else {
            Write-Host "        Clone khong thanh cong, chuyen sang ZIP..." -ForegroundColor Yellow
        }
    }

    # Fallback: Tai ZIP
    if (-Not $downloadSuccess) {
        Write-Host "        Tai bang ZIP..." -ForegroundColor Gray
        $zipPath = Join-Path $tempDir "main.zip"
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing

        Write-Host "  [4/5] Giai nen du lieu..." -ForegroundColor White
        Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

        # Tim session-01 bat ke vi tri trong ZIP da giai nen (xu ly cau truc long nhau)
        $session01Item = Get-ChildItem -Path $tempDir -Recurse -Directory -Filter "session-01" | Select-Object -First 1

        if (-Not $session01Item) {
            throw "Khong tim thay thu muc session-01 sau khi giai nen."
        }

        # Tao thu muc dich truoc, sau do copy NOI DUNG vao trong
        New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
        Get-ChildItem -Path $session01Item.FullName | ForEach-Object {
            Copy-Item -Recurse -Force $_.FullName $targetDir
        }
        $downloadSuccess = $true
        Write-Host "        Giai nen thanh cong!" -ForegroundColor Green
    } else {
        Write-Host "  [4/5] Bo qua giai nen (Da dung Git)." -ForegroundColor White
    }

    # --- Buoc 5: Don dep ---
    Write-Host "  [5/5] Don dep..." -ForegroundColor White
    foreach ($item in $filesToClean) {
        $itemPath = Join-Path $targetDir $item
        if (Test-Path $itemPath) {
            Remove-Item -Recurse -Force $itemPath -ErrorAction SilentlyContinue
        }
    }
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
    }

    if ($downloadSuccess) {
        Show-Success
    }

} catch {
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
    }
    Show-Error -Message $_.Exception.Message
}
