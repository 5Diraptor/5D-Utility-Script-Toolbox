 %~d1
  CD "%~p1"
  MD "Data Sheet Export"
    magick mogrify -format png -path "Data Sheet Export" -fuzz 0% -trim +repage -resize 1200X1200 -background transparent *.psd[0]
  PAUSE