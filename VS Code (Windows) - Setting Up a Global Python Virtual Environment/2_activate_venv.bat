@echo off
REM Set the path to the virtual environment's activation script
set "VENV_PATH=C:\global_env"
set "VENV_ACTIVATE=%VENV_PATH%\Scripts\activate.bat"

REM Check if the activation script exists
if exist "%VENV_ACTIVATE%" (
    echo Activating the virtual environment in a new terminal...

    REM Open a new Command Prompt window and activate the virtual environment
    start cmd /k "%VENV_PATH%\Scripts\activate.bat"
) else (
    echo Virtual environment not found. Please ensure it is created in C:\global_env.
)

pause
