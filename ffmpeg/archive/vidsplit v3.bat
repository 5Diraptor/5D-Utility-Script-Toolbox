 %~d1

for %%a in (*.MOV) do (

if %%~za GTR 2000000000 (

REM usage %%a <filename>
set _filename=%~n1
set _extension=%~x1

ffmpeg -i "%%a" -crf 0 -c copy -map 0 -segment_time 00:00:30 -f segment -reset_timestamps 1 (echo '^<%_filename%^>' + '.SPLIT-%03d' + '^<%_extension%^>')

)
)
pause