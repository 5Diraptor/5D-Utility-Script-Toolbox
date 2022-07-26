 %~d1
  CD "%~p1"

set /p var_code="Enter folder prefix up to the number "
set var_suf=. Marketing Images
set "var_pre=%var_code%%var_suf%"

  MD "..\%var_pre%\Studio High Res JPG"
  MD "..\%var_pre%\Studio High Res PNG"
  MD "..\%var_pre%\Studio Low Res JPG"
  MD "..\%var_pre%\Studio Low Res PNG"
  MD "..\%var_pre%\Studio Web JPG"
  MD "..\%var_pre%\Studio Web PNG"

FOR %%A in (*.psd) DO (

  magick %%A ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 4600x4600 -strip ^
       -write "..\%var_pre%\Studio High Res JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -resize 4600x4600 -strip ^
       -write "..\%var_pre%\Studio High Res PNG\%%~nA.png" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 1600x1600 -strip ^
       -write "..\%var_pre%\Studio Low Res JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -resize 1600x1600 -strip ^
       -write "..\%var_pre%\Studio Low Res PNG\%%~nA.png" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -background white -alpha remove -alpha off -resize 500x500 -gravity Center -extent 500x500 -strip ^
       -write "..\%var_pre%\Studio Web JPG\%%~nA.jpg" ^
       +delete ^
    ^) ^
    ^( -clone 0 ^
       -resize 500x500 -gravity Center -background transparent -extent 500x500 -strip ^
       -write "..\%var_pre%\Studio Web PNG\%%~nA.png" ^
       +delete ^
    ^) ^
    NULL:
)


msg "%username%" Studio (PSD only) images all exported in source directory "%~p1"