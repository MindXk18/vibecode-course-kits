@echo off
chcp 65001 > nul
title Vibe Code Workshop - Cai Dat Tu Dong

echo.
echo   ================================================
echo    VIBE CODE WORKSHOP - DANG KHOI DONG...
echo   ================================================
echo.
echo   Luu y: File cai dat nay hoan toan sach.
echo   Chi chua bo kit Vibe Code dung trong Workshop.
echo   Ban co the hoan toan yen tam!
echo.

echo   Dang kiem tra ket noi mang...
ping -n 1 -w 3000 github.com > nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo.
    echo   [LOI] Khong the ket noi den may chu.
    echo   Vui long kiem tra ket noi mang va thu lai.
    echo.
    pause
    exit /b 1
)
echo   Ket noi OK. Bat dau cai dat...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-workshop-windows.ps1 | iex"

if %ERRORLEVEL% neq 0 (
    echo.
    echo   ================================================
    echo   [LOI] Cai dat gap su co.
    echo   ================================================
    echo.
    echo   Thu copy lenh nay vao PowerShell va chay:
    echo   irm https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-workshop-windows.ps1 ^| iex
    echo.
    echo   Hoac lien he giang vien de duoc ho tro.
    echo.
)

pause > nul
