 %~d1
  CD "%~p1"
  MD "Proxy"
    for %%a in ("*.MOV") do ffmpeg -i "%%a" -q:v 20 -q:a 0 "Proxy\%%~na.mp4"
    PAUSE
    for %%a in ("Proxy\*.mp4") do ffmpeg -i "%%a" -i proxy.png -filter_complex "overlay=0:0" "Proxy\%%~na.mp4"
  PAUSE