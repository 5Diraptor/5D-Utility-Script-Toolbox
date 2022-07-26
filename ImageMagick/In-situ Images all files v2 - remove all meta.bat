 %~d1
  CD "%~p1"
  MD "..\4. Marketing images\In-Situ High Res JPG"
  MD "..\4. Marketing images\In-Situ Low Res JPG"

  attrib +h "..\In-Situ High Res JPG" /s /d
  attrib +h "..\In-Situ Low Res JPG" /s /d

FOR %%A in (*.*) DO (

  magick "%%A" ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 4800x4800 -strip ^
       -write "..\4. Marketing images\In-Situ High Res JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 1600x1600 -strip ^
       -write "..\4. Marketing images\In-Situ Low Res JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    NULL:
)

  attrib -h "..\4. Marketing images\In-Situ High Res JPG" /s /d
  attrib -h "..\4. Marketing images\In-Situ Low Res JPG" /s /d

msg "%username%" In-Situ images all exported in source directory "%~p1"
