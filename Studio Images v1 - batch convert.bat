 REM drag .psd files onto this file to process
 
 REM get file details
 %~d1
  CD "%~p1"

REM make these folders in the source folder
  MD "Studio High Res JPG"
  MD "Studio High Res PNG"
  MD "Studio Low Res JPG"
  MD "Studio Low Res PNG"
  MD "Studio Web JPG"
  MD "Studio Web PNG"

REM use ImageMagick to process the PSD files
  FOR %%a in (*.psd) DO (
    magick convert %%a[0] -background white -alpha remove -alpha off -resize 4600x4600 "Studio High Res JPG\%%a.jpg"
    magick convert %%a[0] -resize 4600x4600 "Studio High Res PNG\%%a.png"
    magick convert %%a[0] -background white -alpha remove -alpha off -resize 1600x1600 "Studio Low Res JPG"\%%a.jpg
    magick convert %%a[0] -resize 1600x1600 "Studio Low Res PNG"\%%a.png
    magick convert %%a[0] -background white -alpha remove -alpha off -resize 500x500 "Studio Web JPG"\%%a.jpg
    magick convert %%a[0] -resize 500x500 "Studio Web PNG"\%%a.png
  )
  PAUSE
  
  REM this script does result in filenames including the original extension however such as image_name.psd.jpg
