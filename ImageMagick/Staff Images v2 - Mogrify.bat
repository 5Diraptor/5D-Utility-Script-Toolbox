 %~d1
  CD "%~p1"
  MD Export
  FOR %%a in (*.psd) DO (
    magick convert "%%a" -background white -alpha remove -alpha off -resize 1600x1600 "Export\0-%%a.jpg"
)
