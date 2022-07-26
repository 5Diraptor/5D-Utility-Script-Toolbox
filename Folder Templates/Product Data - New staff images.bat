 %~d1
  CD "%~f1"

set /p pdat="Enter photoshoot date "

  MD "%pdat%\1 - All images"
  MD "%pdat%\2 - Chosen"
  MD "%pdat%\3 - Working
  MD "%pdat%\4 - Export"

msg "%username%" All templated staff photo folders have been created in source directory "%~f1"