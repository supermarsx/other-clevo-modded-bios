@ECHO OFF
CD /d %~dp0
if %PROCESSOR_ARCHITECTURE%==AMD64 (doskey FPT=FPTw64.EXE $*) else (doskey FPT=FPTw.EXE $*)
cmd /k