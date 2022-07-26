

 %~d1
  CD "%~p1"
  MD export

for %%a in ("*.*") do if not exist "export\%%~na.jpg" (
    magick "%%a[0]"  -background white -alpha remove -alpha off  "export\%%~na.jpg"
)


msg "%username%" Full res JPG files have been created for all files in "%~p1"\export
