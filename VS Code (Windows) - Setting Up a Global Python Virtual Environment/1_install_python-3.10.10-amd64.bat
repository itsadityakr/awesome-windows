@echo off
REM Set the download URL for Python 3.10.10 (amd64)
set "PYTHON_VERSION=3.10.10"
set "PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-amd64.exe"
set "INSTALL_PATH=C:\Python\Python-%PYTHON_VERSION%"

REM Download Python installer
echo Downloading Python %PYTHON_VERSION%...
curl -o python_installer.exe %PYTHON_URL%

REM Install Python
echo Installing Python %PYTHON_VERSION%...
python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 TargetDir="%INSTALL_PATH%"

REM Clean up
del python_installer.exe
echo Python %PYTHON_VERSION% installed successfully.
pause
