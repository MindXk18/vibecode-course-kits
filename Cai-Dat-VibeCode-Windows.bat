@echo off
chcp 65001 > nul
title Vibe Code Kits - Cai Dat Tu Dong

echo.
echo   ================================================
echo     VIBE CODE KITS - HE THONG CAI DAT TU DONG
echo   ================================================
echo.

echo   Dang kiem tra ket noi mang...
ping -n 1 -w 3000 github.com > nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo.
    echo   [LOI] Khong the ket noi den may chu GitHub.
    echo   Vui long kiem tra ket noi mang cua ban va thu lai.
    echo.
    pause
    exit /b 1
)
echo   Ket noi mang binh thuong. Bat dau qua trinh cai dat...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-windows.ps1 | iex"

if %ERRORLEVEL% neq 0 (
    echo.
    echo   ================================================
    echo   [LOI] Qua trinh cai dat gap su co.
    echo   ================================================
    echo.
    echo   Huong dan xu ly:
    echo   1. Thu chay lai file nay.
    echo   2. Neu van loi, mo PowerShell va chay lenh sau:
    echo      irm https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-windows.ps1 ^| iex
    echo   3. Lien he giang vien de duoc ho tro.
    echo.
) else (
    echo.
    echo   Nhan phim bat ky de dong cua so nay...
)

pause > nul
