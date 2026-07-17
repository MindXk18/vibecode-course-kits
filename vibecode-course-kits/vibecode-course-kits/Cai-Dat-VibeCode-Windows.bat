@echo off
chcp 65001 > nul
echo Dang bat dau cai dat Vibe Code Kits... Vui long doi trong giay lat...
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/MindXk18/vibecode-course-kits/main/cai-dat-windows.ps1 | iex"
pause
