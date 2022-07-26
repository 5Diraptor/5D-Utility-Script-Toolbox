 %~d1
  CD "%~p1"
  MD "temp"
  attrib +h temp /s /d
    for %%a in ("*.MOV") do ffmpeg -i "%%a" -q:v 20 -q:a 0 "temp\%%~na.mp4"
  MD "Proxy"
    for %%a in ("temp\*.mp4") do ffmpeg -i "%%a" -i proxy.png -filter_complex "overlay=0:0" "Proxy/%%~na.mp4"
  @RD /S /Q "temp"
PAUSE