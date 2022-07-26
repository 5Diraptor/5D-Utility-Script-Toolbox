@echo off

 %~d1

for %%a in (*.MOV) do (

    ffmpeg -i "%%a" ^
        -f segment -segment_time 10:00 -segment_list tmp.csv -reset_timestamps 1 ^
        -b:v 1500k -vcodec msmpeg4 -acodec wmav2 converted\tmp%%03d.wmv

    setlocal enableDelayedExpansion
    for /f "delims=, tokens=1-3" %%b in (tmp.csv) do (
        set sec=%%c & set sec=!sec:.*=!
        set /a hour="sec / 3600"
        set /a mins1="sec / 60 %% 60" & set mins1=0!mins1!
        set sec=%%d & set sec=!sec:.*=!
        set /a mins2="sec / 60 %% 60" & set mins2=0!mins2!

        ren "converted\%%b" "%%~na-!hour!-!mins1:~-2!-!mins2:~-2!.*"
    )
    endlocal
    del tmp.csv
)
pause