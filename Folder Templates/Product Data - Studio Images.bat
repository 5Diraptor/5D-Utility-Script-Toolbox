 %~d1
  CD "%~f1"

set /p var_code="Enter value "


  MD "Archive"
  MD "%var_code% - 1. All RAW Images"
  MD "%var_code% - 2. Chosen RAW"
  MD "%var_code% - 3. Corrected RAW"
  MD "%var_code% - 4. Full Res Upload"
  MD "%var_code% - 5. Download"
  MD "%var_code% - 6. Editing Images"
  MD "%var_code% - 7. Marketing Images"

  MD "%var_code% - 3. Corrected RAW\temp"

  MD "%var_code% - 7. Marketing Images\Studio High Res JPG"
  MD "%var_code% - 7. Marketing Images\Studio High Res PNG"
  MD "%var_code% - 7. Marketing Images\Studio Low Res JPG"
  MD "%var_code% - 7. Marketing Images\Studio Low Res PNG"
  MD "%var_code% - 7. Marketing Images\Studio Web JPG"
  MD "%var_code% - 7. Marketing Images\Studio Web PNG"

msg "%username%" All folders for studio images have been created in source directory "%~f1"