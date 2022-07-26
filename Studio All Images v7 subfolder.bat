 %~d1
  CD "%~p1"


  MD "Studio High Res JPG"
  MD "Studio High Res PNG"
  MD "Studio Low Res JPG"
  MD "Studio Low Res PNG"
  MD "Studio Web JPG"
  MD "Studio Web PNG"

FOR %%A in (*.*) DO (

  magick "%%A" ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 4600x4600 ^
       -write "Studio High Res JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -resize 4600x4600 ^
       -write "Studio High Res PNG\%%~nA.png" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 1600x1600 ^
       -write "Studio Low Res JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -resize 1600x1600 ^
       -write "Studio Low Res PNG\%%~nA.png" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 500x500 -gravity Center -extent 500x500 ^
       -write "Studio Web JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -resize 500x500 -gravity Center -background transparent -extent 500x500 ^
       -write "Studio Web PNG\%%~nA.png" ^
       +delete ^
    ^) ^
    NULL:
)


msg "%username%" Studio images all exported in source directory "%~p1"