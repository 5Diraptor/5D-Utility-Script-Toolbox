 REM drag .psd files onto this file to process
 
 REM get file details
 %~d1
  CD "%~p1"

REM create these folders in the source folder
  MD "PNG Export"

REM use ImageMagick to process the PSD files
  FOR %%a in (*.svg) DO (
    magick mogrify -format png -path "PNG Export" -resize 200X200 *.svg[0]
    PAUSE
  )
  PAUSE