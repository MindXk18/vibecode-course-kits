# ============================================================
# Vibe Code Kits - Script cai dat tu dong (Windows / PowerShell)
# Repository: https://github.com/MindXk18/vibecode-course-kits
# ============================================================

$scriptVersion = "1.1.0"
$skillName = "vibecode-course-kits"
$githubRepo = "https://github.com/MindXk18/vibecode-course-kits.git"
$zipUrl = "https://github.com/MindXk18/vibecode-course-kits/archive/refs/heads/main.zip"
$skillDir = Join-Path $HOME ".gemini\config\skills"
$targetDir = Join-Path $skillDir $skillName
$tempDir = Join-Path $env:TEMP "vibecode-course-kits-tmp"

# --- Danh sach file/thu muc khong can thiet cho Skill (se bi xoa sau cai dat) ---
$filesToClean = @(
    "cai-dat-windows.ps1",
    "cai-dat-mac.sh",
    "Cai-Dat-VibeCode-Windows.bat",
    "Cai-Dat-VibeCode-Mac.command",
    ".git",
    ".gitignore",
    ".gitattributes",
    ".github"
)

function Show-Banner {
    Clear-Host
    $Host.UI.RawUI.WindowTitle = "Vibe Code Kits Installer v$scriptVersion"
    Write-Host ""
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host "    VIBE CODE KITS - HE THONG CAI DAT TU DONG" -ForegroundColor Yellow
    Write-Host "    Phien ban: v$scriptVersion" -ForegroundColor Gray
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host ""
}

function Show-Success {
    Write-Host ""
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host "  CAI DAT HOAN TAT THANH CONG!" -ForegroundColor Green
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Thu muc cai dat:" -ForegroundColor White
    Write-Host "  $targetDir" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Ban co the dong cua so nay." -ForegroundColor Gray
    Write-Host "  Mo IDE len va bat dau hanh trinh Vibe Code!" -ForegroundColor White
    Write-Host ""
}

function Show-Error {
    param([string]$Message)
    Write-Host ""
    Write-Host "  ================================================" -ForegroundColor Red
    Write-Host "  DA XAY RA LOI!" -ForegroundColor Red
    Write-Host "  ================================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "  Chi tiet: $Message" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Huong dan xu ly:" -ForegroundColor White
    Write-Host "  1. Kiem tra ket noi mang cua ban." -ForegroundColor Gray
    Write-Host "  2. Thu chay lai script nay." -ForegroundColor Gray
    Write-Host "  3. Lien he giang vien de duoc ho tro." -ForegroundColor Gray
    Write-Host ""
}

function Remove-InstallerFiles {
    param([string]$Dir)
    foreach ($item in $filesToClean) {
        $itemPath = Join-Path $Dir $item
        if (Test-Path $itemPath) {
            Remove-Item -Recurse -Force $itemPath -ErrorAction SilentlyContinue
        }
    }
}

# ==================== BAT DAU ====================
Show-Banner

try {
    # --- Buoc 1: Kiem tra he thong ---
    Write-Host "  [1/5] Dang kiem tra he thong Antigravity..." -ForegroundColor White
    if (-Not (Test-Path $skillDir)) {
        New-Item -ItemType Directory -Force -Path $skillDir | Out-Null
        Write-Host "        Da tao cau truc thu muc he thong." -ForegroundColor Gray
    } else {
        Write-Host "        He thong Antigravity da san sang." -ForegroundColor Gray
    }

    # --- Buoc 2: Xu ly phien ban cu ---
    Write-Host "  [2/5] Dang kiem tra phien ban hien tai..." -ForegroundColor White
    if (Test-Path $targetDir) {
        Write-Host "        Phat hien phien ban cu. Dang go bo de cap nhat..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $targetDir
        Write-Host "        Da go bo phien ban cu." -ForegroundColor Gray
    } else {
        Write-Host "        Chua co phien ban nao. Tien hanh cai dat moi." -ForegroundColor Gray
    }

    # --- Don dep thu muc tam ---
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir
    }
    New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

    # --- Buoc 3: Tai du lieu ---
    Write-Host "  [3/5] Dang tai du lieu tu may chu..." -ForegroundColor White

    $downloadSuccess = $false

    # Uu tien git clone
    $hasGit = $null -ne (Get-Command git -ErrorAction SilentlyContinue)
    if ($hasGit) {
        Write-Host "        Phat hien Git. Dang clone repository..." -ForegroundColor Gray
        
        # Tam thoi cho phep git loi ma khong crash script
        $prevPref = $ErrorActionPreference
        $ErrorActionPreference = "Continue"
        git clone -q $githubRepo $targetDir 2>$null
        $cloneResult = $LASTEXITCODE
        $ErrorActionPreference = $prevPref

        if ($cloneResult -eq 0) {
            Write-Host "        Clone thanh cong!" -ForegroundColor Green
            $downloadSuccess = $true
        } else {
            Write-Host "        Git clone khong thanh cong, chuyen sang che do tai ZIP..." -ForegroundColor Yellow
            # Don dep neu git tao thu muc khong hoan chinh
            if (Test-Path $targetDir) {
                Remove-Item -Recurse -Force $targetDir
            }
        }
    }

    # Fallback: Tai ZIP
    if (-Not $downloadSuccess) {
        Write-Host "        Su dung che do tai ZIP truc tiep..." -ForegroundColor Gray
        $zipPath = Join-Path $tempDir "main.zip"
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing

        Write-Host "  [4/5] Dang giai nen du lieu..." -ForegroundColor White
        Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

        $extractedDir = Join-Path $tempDir "vibecode-course-kits-main"
        if (-Not (Test-Path $extractedDir)) {
            throw "Khong tim thay thu muc sau khi giai nen. File tai ve co the bi loi."
        }
        Move-Item -Path $extractedDir -Destination $targetDir -Force
        $downloadSuccess = $true
        Write-Host "        Giai nen thanh cong!" -ForegroundColor Green
    } else {
        Write-Host "  [4/5] Bo qua giai nen (Da dung Git)." -ForegroundColor White
    }

    # --- Buoc 5: Don dep ---
    Write-Host "  [5/5] Dang don dep va hoan tat..." -ForegroundColor White
    
    # Xoa cac file installer khong can thiet trong thu muc Skill
    Remove-InstallerFiles -Dir $targetDir

    # Xoa thu muc tam
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
    }
    Write-Host "        Don dep hoan tat." -ForegroundColor Gray

    # --- Ket qua ---
    if ($downloadSuccess) {
        Show-Success
    }

} catch {
    # Xoa thu muc tam neu co loi
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
    }
    Show-Error -Message $_.Exception.Message
}
