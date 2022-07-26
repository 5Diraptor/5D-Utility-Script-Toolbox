echo off

 %~d1

set filen=%~n1
set fext=%~x1
set fno=.SPLIT-%%03d
set fsize=%~z1

set /p filedur="Enter split video duration in format 00:00:00 " 



ffmpeg -i %filen%%fext% -crf 0 -c copy -map 0 -segment_time %filedur% -f segment -reset_timestamps 1 %filen%%fno%%fext%

)

PAUSE
