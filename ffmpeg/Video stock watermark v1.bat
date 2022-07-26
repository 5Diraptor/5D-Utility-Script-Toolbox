 %~d1
  CD "%~p1"
  MD "Stock"
  attrib +h Stock /s /d
    for %%a in ("*.*") do if not exist "Stock/%%~na.mp4" ffmpeg -i "%%a" -i "M:\Box Sync\Batch Processing\ffmpeg\stock.png" -filter_complex "overlay=0:0" -q:v 0 -q:a 0  "Stock/%%~na.mp4"
  attrib -h Stock /s /d
PAUSE