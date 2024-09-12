# Windows 11 LTSC Installation Guide for Low-Specs PC

This guide will walk you through installing Windows 11 LTSC (Long-Term Servicing Channel) on a low-specs PC. It includes steps from downloading the ISO to creating a bootable USB with Rufus and installing the OS. This guide is beginner-friendly.

## Table of Contents
- [Minimum Hardware Requirements](#minimum-hardware-requirements)
- [Download Windows 11 LTSC ISO](#download-windows-11-ltsc-iso)
- [Download and Install Rufus](#download-and-install-rufus)
- [Create a Bootable USB Drive with Rufus](#create-a-bootable-usb-drive-with-rufus)
- [Install Windows 11 LTSC on Your Low-Specs PC](#install-windows-11-ltsc-on-your-low-specs-pc)
- [Post-Installation Steps](#post-installation-steps)
- [Conclusion](#conclusion)

---

## Minimum Hardware Requirements

Ensure your PC meets the following minimum requirements:

- **Processor**: 1 GHz or faster with 2 or more cores on a 64-bit processor or System on a Chip (SoC).
- **RAM**: 4 GB or more.
- **Storage**: 64 GB or larger storage device.
- **System Firmware**: UEFI, Secure Boot capable.
- **TPM**: Trusted Platform Module (TPM) version 2.0.
- **Graphics Card**: DirectX 12 compatible graphics / WDDM 2.x.
- **Display**: >9” with HD Resolution (720p).
- **Internet Connection**: Required for updates and some features.

**Note**: Workarounds exist for PCs that don't meet TPM or Secure Boot requirements, but they are not covered in this guide.

---

## Download Windows 11 LTSC ISO

1. **Visit the Official Microsoft Download Page**:
   - Navigate to the [Microsoft Windows 11 LTSC download page](https://www.microsoft.com).

2. **Select Your Language**:
   - Choose your preferred language.

3. **Download the ISO File**:
   - Save the Windows 11 LTSC ISO file to your PC.

---

## Download and Install Rufus

1. **Visit the Rufus Official Website**:
   - Go to the [Rufus official website](https://rufus.ie).

2. **Download Rufus**:
   - Download the latest version of Rufus.

3. **Install Rufus**:
   - Run the installer and follow the on-screen instructions.

---

## Create a Bootable USB Drive with Rufus

1. **Insert a USB Drive**:
   - Use a USB drive with at least 8 GB of storage.

2. **Launch Rufus**:
   - Open Rufus from your desktop or Start menu.

3. **Select the USB Drive**:
   - Choose the inserted USB drive from the “Device” dropdown.

4. **Select the ISO File**:
   - Click “SELECT” and choose the downloaded Windows 11 LTSC ISO file.

5. **Configure Rufus Settings**:
   - **Partition Scheme**: Choose "GPT" (for UEFI) or "MBR" (for BIOS or UEFI-CSM).
   - **File System**: Ensure "NTFS" is selected.
   - **Volume Label**: Optionally, name it “Windows 11 LTSC”.

6. **Start the Process**:
   - Click “START” to create the bootable USB. This will format the USB drive.

7. **Eject the USB Drive**:
   - Once complete, safely eject the USB drive.

---

## Install Windows 11 LTSC on Your Low-Specs PC

1. **Insert the Bootable USB Drive**:
   - Insert the USB drive into the target PC.

2. **Access the Boot Menu**:
   - Restart your PC and enter the Boot Menu (typically F12, F2, ESC, or DEL).

3. **Boot from USB**:
   - Select the USB drive to boot from it.

4. **Start the Windows Installation**:
   - Follow these steps:
     - **Select Language, Time, and Keyboard**: Choose settings and click “Next”.
     - **Install Now**: Click “Install Now”.
     - **Enter Product Key**: Enter your product key or skip to activate later.
     - **Select Installation Type**: Choose “Custom: Install Windows only (advanced)”.
     - **Partition the Drive**: Select the drive to install Windows, or delete existing partitions for a clean install.

5. **Complete the Installation**:
   - Windows will install and restart multiple times. Follow the on-screen prompts.

6. **Set Up Windows**:
   - Set up your region, language, network, and create a user account.

7. **Activate Windows**:
   - Go to **Settings > Update & Security > Activation** to activate Windows.

---

## Post-Installation Steps

1. **Update Windows**:
   - Check for updates in **Settings > Update & Security > Windows Update**.

2. **Install Drivers**:
   - Download and install drivers from your PC manufacturer's website.

3. **Install Essential Software**:
   - Install necessary applications like a web browser and antivirus software.

---

## Conclusion

Congratulations! You have successfully installed Windows 11 LTSC on your low-specs PC. Enjoy the streamlined and long-term support features that LTSC offers.

---

- by Aditya Kumar

