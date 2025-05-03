@echo off
setlocal

REM Get current Git version (e.g., "git version 2.44.0.windows.1")
FOR /F "tokens=3" %%G IN ('git --version 2^>nul') DO SET CURRENT=%%G

IF NOT DEFINED CURRENT (
    echo Git is NOT installed.
    echo Opening the Git website for download...
    start https://git-scm.com
    goto :eof
)

echo Your installed Git version is: %CURRENT%

REM Optional: Set threshold version you consider "outdated"
set "LATEST_VERSION=2.49.0"

REM Compare version strings (simple starts-with match)
echo Checking if you have the latest known version (%LATEST_VERSION%)...

echo %CURRENT% | findstr /B /C:"%LATEST_VERSION%" >nul
IF %ERRORLEVEL% NEQ 0 (
    echo You do NOT have the latest known version.
    echo Opening Git website to download the latest...
    start https://git-scm.com
) ELSE (
    echo Git is up to date.
)

endlocal
pause
