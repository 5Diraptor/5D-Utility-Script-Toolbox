 %~d1
  CD "%~p1"
  MD export

for %%a in ("*.CR2") do if not exist export\%%~na.jpg (
    magick %%a -resize 3840x3840 export\%%~na.jpg
)

msg "%username%" Proxy JPG files have been created for RAW files in "%~p1"\export
