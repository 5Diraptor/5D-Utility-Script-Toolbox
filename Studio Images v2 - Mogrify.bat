 REM drag .psd files onto this file to process
 
 REM get file details
 %~d1
  CD "%~p1"

REM create these folders in the source folder
  MD "Studio High Res JPG"
  MD "Studio High Res PNG"
  MD "Studio Low Res JPG"
  MD "Studio Low Res PNG"
  MD "Studio Web JPG"
  MD "Studio Web PNG"

REM use ImageMagick to process the PSD files
  FOR %%a in (*.psd) DO (
    magick mogrify -format jpg -path "Studio High Res JPG" -background white -alpha remove -alpha off -resize 4600X4600 *.psd[0]
    magick mogrify -format png -path "Studio High Res PNG" -resize 1600X1600 *.psd[0]
    magick mogrify -format jpg -path "Studio Low Res JPG" -background white -alpha remove -alpha off -resize 1600X1600 *.psd[0]
    magick mogrify -format png -path "Studio Low Res PNG" -resize 1600X1600 *.psd[0]
    magick mogrify -format jpg -path "Studio Web JPG" -background white -alpha remove -alpha off -resize 500X500 -gravity Center -extent 500X500 *.psd[0]
    magick mogrify -format png -path "Studio Web PNG" -resize 500X500 -gravity Center -background transparent -extent 500X500 *.psd[0]
    PAUSE
  )
  PAUSE
  
REM this script is inefficient.  It loops over the square of the .psd files in the directory.
