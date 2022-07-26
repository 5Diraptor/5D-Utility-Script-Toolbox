 %~d1
  CD "%~p1"
  MD "LR JPG exp"
     magick mogrify -format jpg -path "LR JPG exp" -resize 1000x1000 -background white -alpha remove -alpha off  *.*[0]

msg "%username%" Quick convert images ahave been created in source directory "%~p1"\LR JPG exp
