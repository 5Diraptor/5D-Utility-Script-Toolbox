 %~d1
  CD "%~p1"
  MD "Export"
    for %%a in ("*.mp4") do ffmpeg -i "%%a" -i proxy.png -filter_complex "overlay=0:0" "Export/%%~na.mp4"
  PAUSE