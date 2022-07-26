@echo on

%~d1
set fln=%~nx1


for /f "usebackq tokens=*" %%a in (`  "ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %fln%"  `) do (set pop=%%a)
echo %pop%

pause



