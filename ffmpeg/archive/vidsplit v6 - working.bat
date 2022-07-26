@echo off
setlocal EnableExtensions DisableDelayedExpansion

REM ## set directory

 %~d1

REM ## Set variables

set filen=%~n1
set fext=%~x1
set fno=.SPLIT-%%03d
set fsize=%~z1

REM ## Check if file size is too big or too small to deal with.

set "fsize=%~z1"
if "%fsize:~9,1%" == "" echo File is smaller than 4 GB.& goto EndBatch
if not "%fsize:~10,1%" == "" echo File is larger than 4 GB.& goto RunProc
if "%fsize%" LSS "4294967296" echo File is smaller than 4 GB.& goto EndBatch
echo File is equal or larger than 4 GB.

:RunProc

REM ## divide the duration into split chunks
set /p ftime="Enter video duration here in seconds "
set "fsize2=%fsize:~0,-6%"
set /A var1=%fsize2% / 2000
set /A fsec=%ftime% / %var1%

REM ## Check if file needs to be split into hours mins secs

REM if seconds length is greater then 3600 seconds, divide by 3600 to get hours otherwise equal 00
if %fsec% GTR 3599 (set /A fhours=%fsec% / 3600) else (set fhours=00)

REM if hours is not equal to 00 then multiply hours * 3600 and remove that amount from the seconds length
if %fhours% EQU 00 (goto EndHours) else set /A fsec=%fsec% - (%fhours * 3600)

REM Check if the hours length is more then 2 characters long and go to endbatch if so
if %fhours% GTR 99 (goto EndBatch)

REM check if the hours length is less then 2 characters long and add a leading 0 if so
if %fhours% LSS 10 (set fhours=0%fhours%) 

:EndHours

REM if seconds length is greater then 60 seconds divide by 60 to get minutes otherwise equal 00
if %fsec% GTR 60 (set /A fmin=%fsec% / 60) else (set fmin=00)

REM if minutes is not equal to 00 then multiply minutes * 60 and remove that amount from the seconds length
if %fmin% EQU 00 (goto EndMinutes) else set /A fsec=%fsec% - (%fmin% * 60)

REM Check if the minutes are less then 2 characters long and add a leading 0 if so
if %fmin% LSS 10 (set fmin=0%fmin%)

:EndMinutes

REM ## if file meets requirements, split it with ffmpeg

msg "%username%" Attempting to split video "%filen%" into segments this long: %fhours%:%fmin%:%fsec%

ffmpeg -i %filen%%fext% -crf 0 -c copy -map 0 -segment_time %fhours%:%fmin%:%fsec% -f segment -reset_timestamps 1 %filen%%fno%%fext%

:EndBatch



PAUSE
