 %~d1
  CD "%~p1"

for %%a in ("*.CR2") do if not exist %%~na.jpg (
    magick %%a -resize 1200x1200 %%~na.jpg
)

msg "%username%" Proxy JPG files have been created for RAW files in "%~p1"
