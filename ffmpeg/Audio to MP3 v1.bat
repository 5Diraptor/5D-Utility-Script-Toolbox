%~d1
  CD "%~p1"
  MD "Converted"
  attrib +h Converted /s /d
    for %%a in ("*.*") do if not exist "Converted\%%~na.mp3" ffmpeg -i "%%a" -vn -ar 44100 -ac 2 -b:a 128k "Converted\%%~na.mp3"
  attrib -h Converted /s /d
PAUSE