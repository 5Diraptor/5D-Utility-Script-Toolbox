 %~d1
  CD "%~p1"
  MD "Proxy"
  attrib +h Proxy /s /d
    for %%a in ("*.*") do if not exist "Proxy/%%~na.mp4" ffmpeg -i "%%a" -i "M:\Batch Processing\ffmpeg\proxy.png" -filter_complex "overlay=0:0" -q:v 20 -q:a 0  "Proxy/%%~na.mp4"
  attrib -h Proxy /s /d
PAUSE