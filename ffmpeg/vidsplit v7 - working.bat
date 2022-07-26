@echo off
setlocal EnableExtensions DisableDelayedExpansion
::SETLOCAL ENABLEDELAYEDEXPANSION

:: ## set directory

 %~d1

:: ## Set variables

set filen=%~n1
set fext=%~x1
set fno=.SPLIT-%%03d
set fsize=%~z1
set flln=%~nx1
set "fsize=%~z1"

:: set the split size of output files in MB
set /A split=2000
set /A splitgb=%split%/1000

echo Attempting to split %flln% into %splitgb%GB segments for uploading.

:: ## Check if file size is too big or too small to deal with.
set "fsize=%~z1"
if "%fsize:~9,1%" == "" echo File is smaller than 4 GB.& goto EndBatch
if not "%fsize:~10,1%" == "" echo File is larger than 4 GB.& goto RunProc
if "%fsize%" LSS "4294967296" echo File is smaller than 4 GB.& goto EndBatch
echo File is equal or larger than 4 GB.


:RunProc

:: get the duration of the file
for /f "usebackq tokens=*" %%a in (`  "ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %flln%"  `) do (set ftime=%%a )
:: ## echo %fdur%

:: ## divide the duration into split chunks

set /a ftime=ftime+1
set "fsize2=%fsize:~0,-6%"

:: the A command will make variable a whole integer rounding down   Plus 1 is required to get the correct amount of segments
set /A var1=(%fsize2% / %split%)+1
set /A fsec=(%ftime% / %var1%)+1
set /A fseg=(%fsize2% / %var1%)

echo video is %ftime% seconds long
echo video is %fsize2% MB in size 
echo we will split the video into %var1% segments
echo each segment will be %fsec% seconds long and %fseg% MB big

pause


:: ## Check if file needs to be split into hours mins secs

:: if seconds length is greater then 3600 seconds, divide by 3600 to get hours otherwise equal 00
if %fsec% GTR 3599 (set /A fhours=%fsec% / 3600) else (set fhours=00)

:: if hours is not equal to 00 then multiply hours * 3600 and remove that amount from the seconds length
if %fhours% EQU 00 (goto EndHours) else set /A fsec=%fsec% - (%fhours * 3600)

:: Check if the hours length is more then 2 characters long and go to endbatch if so
if %fhours% GTR 99 (echo File duration is too long & goto EndBatch)

:: check if the hours length is less then 2 characters long and add a leading 0 if so
if %fhours% LSS 10 (set fhours=0%fhours%) 


:EndHours

:: if seconds length is greater then 60 seconds divide by 60 to get minutes otherwise equal 00
if %fsec% GTR 60 (set /A fmin=%fsec% / 60) else (set fmin=00)

:: if minutes is not equal to 00 then multiply minutes * 60 and remove that amount from the seconds length
if %fmin% EQU 00 (goto EndMinutes) else set /A fsec=%fsec% - (%fmin% * 60)

:: Check if the minutes are less then 2 characters long and add a leading 0 if so
if %fmin% LSS 10 (set fmin=0%fmin%)

:EndMinutes

:: ## if file meets requirements, split it with ffmpeg

:: msg "%username%" Attempting to split video "%filen%" into segments this long: %fhours%:%fmin%:%fsec%

ffmpeg -i %filen%%fext% -crf 0 -c copy -map 0 -segment_time %fhours%:%fmin%:%fsec% -f segment -reset_timestamps 1 %filen%%fno%%fext%

:EndBatch

echo This script will now exit and close


PAUSE
