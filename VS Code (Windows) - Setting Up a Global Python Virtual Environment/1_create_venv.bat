@echo off
REM Set the path for the global virtual environment
set "VENV_PATH=C:\global_env"

REM Check if the directory already exists
if not exist "%VENV_PATH%" (
    echo Creating directory at %VENV_PATH%...
    mkdir "%VENV_PATH%"
) else (
    echo Directory already exists: %VENV_PATH%
)

REM Create the virtual environment in the directory
echo Creating virtual environment...
python -m venv "%VENV_PATH%"

echo Virtual environment created successfully in %VENV_PATH%.
pause
