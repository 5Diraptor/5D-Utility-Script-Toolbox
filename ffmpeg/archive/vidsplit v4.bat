 %~d1

for %%a in (*.MOV) do (

if %%~za GTR 2000000000 (

REM usage %%a <filename>
set "_filename=%~n1"
set "_tally=.SPLIT-%03d"
set "_extension=%~x1"

set "_outputname=%_filename%%_tally%%_extension%"


    ffmpeg -i "%%a" ^
        -crf 0 -c copy -map 0 -segment_time 00:00:30 -f segment -reset_timestamps 1 ^
        %_outputname%
)
)
pause