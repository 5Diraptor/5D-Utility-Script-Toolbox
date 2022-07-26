
:: load target directory
%~d1
CD "%~p1"

::magick mogrify -format jpg -resize 1000x1000 *.*[0]  ::this is an old command
for %%a in ("*.*") do if not exist "%%~na.jpg" magick "%%a[0]" -format jpg -resize 1000x1000 -background white -alpha remove -alpha off "%%~na.jpg"

msg "%username%" Quick convert images have been created in source directory "%~p1"


