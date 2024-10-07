@echo off
REM Set the path to the virtual environment
set "VENV_PATH=C:\global_env"
set "VENV_ACTIVATE=%VENV_PATH%\Scripts\activate.bat"

REM Check if the activation script exists
if exist "%VENV_ACTIVATE%" (
    echo Listing installed packages in the virtual environment...

    REM Open a new Command Prompt window, activate the virtual environment, and list installed packages
    start cmd /k "call %VENV_ACTIVATE% && pip list"
) else (
    echo Virtual environment not found. Please ensure it is created in C:\global_env.
)

pause