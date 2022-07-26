 %~d1
  CD "%~p1"
  MD "Data Sheet Export"
    magick mogrify -format png -path "Data Sheet Export" -resize 1500X1500 *.psd[0]
  PAUSE
