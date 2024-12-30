@echo off
REM Set the path for the Python executable and the virtual environment
set "PYTHON_PATH=C:\Python\Python-3.10.10\python.exe"
set "VENV_PATH=C:\global_env"

REM Check if Python exists
if not exist "%PYTHON_PATH%" (
    echo Python not found at %PYTHON_PATH%. Please install Python 3.10.10 first.
    pause
    exit /b
)

REM Check if the virtual environment already exists
if not exist "%VENV_PATH%" (
    echo Creating directory at %VENV_PATH%...
    mkdir "%VENV_PATH%"
) else (
    echo Directory already exists: %VENV_PATH%
)

REM Create the virtual environment in the directory
echo Creating virtual environment...
"%PYTHON_PATH%" -m venv "%VENV_PATH%"

echo Virtual environment created successfully in %VENV_PATH%.
pause
