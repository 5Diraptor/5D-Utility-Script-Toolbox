
 %~d1
  CD "%~p1"
  MD jpg

for %%a in ("*.JPG") do if not exist jpg\%%~na.jpg (
    magick %%a[0] jpg\%%~na.jpg
)



msg "%username%" all JPG files have been extracted to folder "%~p1"\jpg
