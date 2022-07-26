 %~d1
  CD "%~p1"
  MD "Corporate High Res JPG"
  MD "Corporate Low Res JPG"

  attrib +h "Corporate High Res JPG" /s /d
  attrib +h "Corporate Low Res JPG" /s /d

FOR %%A in (*.*) DO (

  magick "%%A" ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 4800x4800 ^
       -write "Corporate High Res JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 1600x1600 ^
       -write "Corporate Low Res JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    NULL:
)

  attrib -h "Corporate High Res JPG" /s /d
  attrib -h "Corporate Low Res JPG" /s /d

msg "%username%" Corporate images all exported in source directory "%~p1"
