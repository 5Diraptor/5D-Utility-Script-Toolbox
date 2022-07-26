 %~d1
  CD "%~f1"

For /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%b-%%a)
echo %mydate%
set /p var_ref="Enter product code "
set /p var_des="Enter folder description "

  MD "%var_ref% - %mydate% - %var_des%"
  MD "%var_ref% - %mydate% - %var_des%\1. All RAW"
  MD "%var_ref% - %mydate% - %var_des%\2. Chosen RAW"
  MD "%var_ref% - %mydate% - %var_des%\3. Editing Images"
  MD "%var_ref% - %mydate% - %var_des%\4. Marketing Images"

  MD "%var_ref% - %mydate% - %var_des%\3. Editing Images\Archive"
  MD "%var_ref% - %mydate% - %var_des%\4. Marketing Images\In-Situ High Res JPG"
  MD "%var_ref% - %mydate% - %var_des%\4. Marketing Images\In-Situ Low Res JPG"

  PAUSE