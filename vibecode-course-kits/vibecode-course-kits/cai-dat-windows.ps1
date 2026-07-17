$ErrorActionPreference = "Stop"
$Host.UI.RawUI.WindowTitle = "Vibe Code Kits Installer"
Clear-Host

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "    🚀 VIBE CODE KITS - CÀI ĐẶT NHANH     " -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$skillName = "vibecode-course-kits"
$githubRepo = "https://github.com/MindXk18/vibecode-course-kits.git"
$zipUrl = "https://github.com/MindXk18/vibecode-course-kits/archive/refs/heads/main.zip"
$skillDir = Join-Path $HOME ".gemini\config\skills"
$targetDir = Join-Path $skillDir $skillName
$tempDir = Join-Path $env:TEMP "vibecode-course-kits-tmp"

Write-Host "[1/4] 🔍 Đang kiểm tra hệ thống Antigravity..." -ForegroundColor White
if (-Not (Test-Path $skillDir)) {
    New-Item -ItemType Directory -Force -Path $skillDir | Out-Null
    Write-Host "      Đã tạo cấu trúc thư mục hệ thống." -ForegroundColor Gray
} else {
    Write-Host "      Hệ thống Antigravity đã sẵn sàng." -ForegroundColor Gray
}

if (Test-Path $targetDir) {
    Write-Host "      ⚠️ Đã tồn tại phiên bản cũ của Kit, đang tiến hành dọn dẹp..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $targetDir
}

if (Test-Path $tempDir) {
    Remove-Item -Recurse -Force $tempDir
}
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

Write-Host "[2/4] ☁️ Đang lấy dữ liệu từ máy chủ Vibe Code..." -ForegroundColor White
$hasGit = $false
try {
    $null = Get-Command git -ErrorAction Stop
    $hasGit = $true
} catch {}

if ($hasGit) {
    Write-Host "      Phát hiện công cụ Git! Đang clone repository (ưu tiên)..." -ForegroundColor Gray
    git clone -q $githubRepo $targetDir
    if ($LASTEXITCODE -ne 0) {
        Write-Host "      Lỗi khi dùng Git, chuyển sang chế độ tải trực tiếp..." -ForegroundColor Red
        $hasGit = $false
    } else {
        Write-Host "      Clone thành công!" -ForegroundColor Green
    }
}

if (-Not $hasGit) {
    Write-Host "      Sử dụng chế độ tải ZIP an toàn..." -ForegroundColor Gray
    $zipPath = Join-Path $tempDir "main.zip"
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
    
    Write-Host "[3/4] 🪄 Đang giải nén dữ liệu phép thuật..." -ForegroundColor White
    Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force
    
    # Github ZIP extracts to a folder named repo-branch, which is vibecode-course-kits-main
    $extractedDir = Join-Path $tempDir "vibecode-course-kits-main"
    Move-Item -Path $extractedDir -Destination $targetDir -Force
} else {
    Write-Host "[3/4] 🪄 Bỏ qua bước giải nén (Đã dùng Git)..." -ForegroundColor White
}

Write-Host "[4/4] 🧹 Đang dọn dẹp các tệp tin tạm thời..." -ForegroundColor White
if (Test-Path $tempDir) {
    Remove-Item -Recurse -Force $tempDir
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "✅ THÀNH CÔNG RỰC RỠ!" -ForegroundColor Green
Write-Host "Bộ công cụ Vibe Code Kits đã được cài đặt an toàn vào máy bạn." -ForegroundColor White
Write-Host "Bạn có thể đóng cửa sổ này, mở IDE lên và bắt đầu hành trình nhé!" -ForegroundColor White
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Start-Sleep -Seconds 3
