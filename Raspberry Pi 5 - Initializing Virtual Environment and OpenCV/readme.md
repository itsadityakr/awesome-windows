# 🌟 Setting Up Virtual Environment and OpenCV on Raspberry Pi 5 🌟  

This guide walks you through installing OpenCV on a Raspberry Pi 5, creating a virtual environment, and running Python files. It also explains how to deactivate the virtual environment when done.

---

## 📋 Prerequisites

- ✅ **Raspberry Pi 5**  
- ✅ **Raspberry Pi OS (64-bit)**  
- ✅ **Internet connection**

---

## Step 1: 🔄 Update Your System  

Before installing anything, ensure your system is up to date!  

```bash
sudo apt-get update && sudo apt-get upgrade
```

- 🔹 `sudo apt-get update` updates the list of available packages.  
- 🔹 `sudo apt-get upgrade` upgrades the installed packages to their latest versions.  

---

## Step 2: 🐍 Install Python Virtual Environment  

Creating a virtual environment keeps your project dependencies isolated.

### 2.1 🛠️ Install the `venv` Package  

Run the following to ensure you have the `venv` module installed:  

```bash
sudo apt-get install python3-venv
```

### 2.2 🗂️ Create a Directory for the Virtual Environment  

Navigate to your **Desktop** and create a project folder named `pyEnv`:  

```bash
cd ~/Desktop
mkdir pyEnv
cd pyEnv
```

### 2.3 🌐 Create the Virtual Environment  

Inside the `pyEnv` folder, create a virtual environment named `venv`:  

```bash
python3 -m venv venv
```

### 2.4 ✅ Activate the Virtual Environment  

Activate your virtual environment with:  

```bash
source ~/Desktop/pyEnv/venv/bin/activate
```

- ✅ Once activated, your terminal prompt will show `(venv)` indicating the virtual environment is active.

---

## Step 3: 📦 Install Required Python Packages  

While inside the virtual environment (with `(venv)` displayed in your terminal):  

### 3.1 ➕ Install NumPy  

```bash
pip install numpy
```

### 3.2 ➕ Install OpenCV  

```bash
pip install opencv-python
```

---

## Step 4: 🚀 Running Python Files  

You can now execute Python scripts inside the virtual environment.

### 4.1 📝 Running a Script in the Current Directory  

If your script is in the same directory as the terminal:  

```bash
python script_name.py
```

### 4.2 📂 Running a Script in Another Directory  

If the script is in a different location, provide the full path:  

```bash
python /path/to/your/script_name.py
```

---

## Step 5: 🚪 Deactivating the Virtual Environment  

When you’re finished, deactivate the virtual environment by running:  

```bash
deactivate
```

- 🚫 This exits the virtual environment, returning you to the global Python environment.  

---

## Step 6: 🔍 Verify OpenCV Installation  

Check if OpenCV is installed successfully by running a test script.  

### 6.1 🖊️ Create a Script  

Save the following code in a file named `check_opencv.py`:  

```python
import cv2
print(cv2.__version__)
```

### 6.2 ✅ Run the Script  

Execute the script to check the OpenCV version:  

```bash
python check_opencv.py
```

- 🎉 If you see the version printed, OpenCV was installed successfully!  

---

## 📌 Additional Notes  

- 🛠️ If you need advanced features or encounter issues, consider building OpenCV from source.  
- 📖 Refer to the [official OpenCV documentation](https://docs.opencv.org/) for more advanced usage.  

---

To install all the specified Python packages in your virtual environment, follow these steps:

---

### 🎯 **Steps to Install All Packages**

1. **Activate the Virtual Environment**  
   Ensure you’re inside your virtual environment before installing the packages:  

   ```bash
   source ~/Desktop/pyEnv/venv/bin/activate
   ```

2. **Install All Required Packages**  

   You can install all the packages at once using `pip`. Run this command:

   ```bash
   pip install absl-py==2.1.0 astunparse==1.6.3 attrs==24.2.0 cbor2==5.6.4 certifi==2024.8.30 cffi==1.17.1 charset-normalizer==3.4.0 click==8.1.7 colorzero==2.0 contourpy==1.3.0 cycler==0.12.1 evdev==1.7.1 flatbuffers==20181003210633 fonttools==4.53.1 gast==0.6.0 google-pasta==0.2.0 gpiod==2.2.1 gpiozero==2.0.1 grpcio==1.67.0 h5py==3.12.1 idna==3.10 jax==0.4.31 jaxlib==0.4.31 joblib==1.4.2 keras==3.6.0 keyboard==0.13.5 kiwisolver==1.4.7 lgpio==0.2.2.0 libclang==18.1.1 luma.core==2.4.2 luma.led-matrix==1.7.1 machine==0.0.1 Markdown==3.7 markdown-it-py==3.0.0 MarkupSafe==3.0.2 matplotlib==3.9.2 mdurl==0.1.2 mediapipe==0.10.15 ml-dtypes==0.4.0 namex==0.0.8 nltk==3.9.1 numpy==1.26.4 opencv-contrib-python==4.10.0.84 opencv-python==4.10.0.84 opt-einsum==3.3.0 optree==0.13.0 packaging==24.1 pandas==2.2.3 pillow==10.4.0 pip==23.0.1 protobuf==4.25.4 pycparser==2.22 pycrypto==2.6.1 pyftdi==0.55.4 Pygments==2.18.0 pynput==1.7.7 pyparsing==3.1.4 pyserial==3.5 python-dateutil==2.9.0.post0 python-xlib==0.33 pytz==2024.2 pyusb==1.2.1 regex==2024.9.11 requests==2.32.3 rich==13.9.2 RPi.GPIO==0.7.1 scikit-learn==1.5.2 scipy==1.14.1 seaborn==0.13.2 setuptools==66.1.1 six==1.16.0 smbus2==0.4.3 sounddevice==0.5.0 spidev==3.6 tensorboard==2.17.1 tensorboard-data-server==0.7.2 tensorflow==2.17.0 tensorflow-io-gcs-filesystem==0.37.1 termcolor==2.5.0 threadpoolctl==3.5.0 tqdm==4.66.5 typing_extensions==4.12.2 tzdata==2024.2 urllib3==2.2.3 Werkzeug==3.0.4 wheel==0.44.0 wrapt==1.16.0
   ```

3. **Verify Installation**  
   Check if the packages were installed successfully:  

   ```bash
   pip freeze
   ```

   This will display all installed packages along with their versions.

---

### 📌 **Tips for Managing Dependencies**

1. **Save the List of Packages**  
   Once the installation is complete, you can save the list of packages to a `requirements.txt` file:  

   ```bash
   pip freeze > requirements.txt
   ```

2. **Install From `requirements.txt`**  
   In the future, you can quickly recreate the environment by running:  

   ```bash
   pip install -r requirements.txt
   ```

3. **Deactivating the Virtual Environment**  
   Once you're done, deactivate the environment:  

   ```bash
   deactivate
   ```

---

Now all the specified packages will be installed in your virtual environment! 🚀

---

- by Aditya Kumar