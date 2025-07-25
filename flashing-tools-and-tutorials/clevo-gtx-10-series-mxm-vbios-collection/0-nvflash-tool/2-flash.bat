@ECHO OFF&TITLE Flash BIOS

>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\GetAdmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\GetAdmin.vbs"
    "%TEMP%\GetAdmin.vbs"
    DEL /f /q "%TEMP%\GetAdmin.vbs" 2>NUL
    Exit /b
)
CD /d %~dp0
nvflash.exe --index=0 -6 -s -A vbios.rom
nvflash.exe --index=1 -6 -s -A vbios.rom
echo Program execution is complete, please check the output, no problem please close this window
pause>nul