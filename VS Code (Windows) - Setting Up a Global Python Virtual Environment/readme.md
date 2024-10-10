# 🌐 **Setting Up a Global Python Virtual Environment in Windows**

This guide will help you create and manage a global Python virtual environment in your `C:\` directory using batch files for easy activation and package management.

---

## 🔧 **Prerequisites**

Before you begin, ensure you have the following installed:

1. **Python**:  
   - Download from the [official Python website](https://www.python.org/downloads/).  
   - During installation, make sure to check **"Add Python to PATH."**

2. **Visual Studio Code (VS Code)**:  
   - Download from the [VS Code website](https://code.visualstudio.com/).  
   - Install and open the editor.

3. **Python Extension for VS Code**:  
   - Open VS Code and navigate to the Extensions view (`Ctrl + Shift + X`).
   - Search for "Python" and install the official extension.

---

## 📜 **Creating Batch Files**

### **1. Create Directory and Virtual Environment**

Create a batch file named `create_env.bat` with the following code:

```batch
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
```

### **2. Activate Virtual Environment**

Create another batch file named `activate_env.bat` with the following code:

```batch
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
```

### **3. List Installed Packages**

Create another batch file named `list_packages.bat` with the following code:

```batch
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
```

---

## 📝 **Usage Instructions**

### **Step 1: Create the Virtual Environment**

1. **Run `create_env.bat`**:
   - This will create the directory and set up the virtual environment in `C:\global_env`.

### **Step 2: Activate the Virtual Environment**

1. **Run `activate_env.bat`**:
   - This will open a new Command Prompt window with the virtual environment activated.

### **Step 3: List Installed Packages**

1. **Run `list_packages.bat`**:
   - This will open a new Command Prompt window with the virtual environment activated and display all installed packages.

---

## 💻 **Selecting the Python Interpreter in VS Code**

After creating the virtual environment, you need to tell VS Code to use the correct Python interpreter for your environment. Follow these steps:

1. Open VS Code.
2. Press `Ctrl + Shift + P` to open the **Command Palette**.
3. Type `Python: Select Interpreter` and press **Enter**.
4. You will see a list of available Python interpreters. Choose the interpreter from `C:\global_env\Scripts\python.exe` to set your global environment as the default interpreter.
5. Once selected, the interpreter will be activated for the current workspace.

You can now run Python code in VS Code using your global virtual environment.

---

## 📚 **Additional Resources**

- [Python Virtual Environments Documentation](https://docs.python.org/3/tutorial/venv.html)  
   Learn more about virtual environments in Python.

- [VS Code Python Documentation](https://code.visualstudio.com/docs/python/python-tutorial)  
   Explore the official guide to using Python in Visual Studio Code.

---

## 🎯 **Final Note**

Following this guide, you will have successfully set up a **global Python virtual environment** in your `C:\` directory and automated the activation and package listing process. This setup will help you manage dependencies easily and maintain clean project environments.

You can download all three batch files from the repository.

---

- by Aditya Kumar