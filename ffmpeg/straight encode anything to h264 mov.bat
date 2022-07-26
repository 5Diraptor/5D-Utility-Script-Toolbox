 %~d1
  CD "%~p1"
  MD "re-encoded"
  attrib +h "re-encoded" /s /d

  for %%a in ("*.*") do if not exist "re-encoded/%%~na.mov" ffmpeg -i "%%a" -c:v libx264 -crf 4 -preset slow -c:a copy  "re-encoded/%%~na.mov"

  attrib -h "re-encoded" /s /d
PAUSE