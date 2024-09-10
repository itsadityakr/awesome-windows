# Raspberry Pi 5 Setup on Windows (Headless via WiFi)

This guide walks you through setting up Raspberry Pi OS on a Raspberry Pi 5 using Raspberry Pi Imager, Angry IP Scanner, PuTTY, and VNC Viewer. This method allows configuration without the need for a monitor, keyboard, or mouse.

## Prerequisites

### Hardware:
- Raspberry Pi 5
- MicroSD card (16GB or larger)
- MicroSD card reader
- Power supply for Raspberry Pi 5
- WiFi-enabled network

### Software:
1. [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
2. [Angry IP Scanner](https://angryip.org/)
3. [PuTTY](https://www.putty.org/)
4. [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)

---

## Step 1: Install Raspberry Pi OS on the MicroSD Card

1. **Download and Install Raspberry Pi Imager:**
   - Go to [Raspberry Pi Imager](https://www.raspberrypi.com/software/) and download the appropriate version for your OS.
   - Install the Raspberry Pi Imager.

2. **Write the Raspberry Pi OS Image:**
   - Open Raspberry Pi Imager.
   - Click on **Choose OS** and select **Raspberry Pi OS (32-bit)** or any other preferred version.
   - Click on **Choose Storage** and select your microSD card.

3. **Configure Advanced Settings:**
   - Click on the settings (gear icon) in the Raspberry Pi Imager (located at the bottom).
   - In **General Settings**:
     - **Set Hostname**: Use a memorable name like `raspberrypi5.local`.
     - **Set Username and Password**: Keep it simple (e.g., `pi` as the username, and a password you can easily remember).
   - **Configure Wireless LAN**:
     - Enter your WiFi SSID (network name) and password.
   - **Local Settings**:
     - Select your region, timezone, and keyboard layout.
   - **Enable SSH**:
     - Check the box to enable SSH, and use the same password as the username for convenience.
   - Click **Save** to apply the settings.
   
4. **Write the Image**:
   - Click **Write** to install the OS on the microSD card.
   - Once the process completes, safely remove the microSD card from your computer.

---

## Step 2: Boot the Raspberry Pi

1. Insert the microSD card into the Raspberry Pi 5.
2. Connect the Raspberry Pi to the power supply.
3. Wait for the Raspberry Pi to boot (around 4-5 minutes for the first boot).

---

## Step 3: Find the Raspberry Pi's IP Address

1. **Download Angry IP Scanner:**
   - Go to [Angry IP Scanner](https://angryip.org/) and download the **Standalone executable** version.

2. **Check IP Address Range:**
   - Open a command prompt (CMD) and type `ipconfig`.
   - Look for the **IPv4 Address** of your computer (e.g., `192.168.1.x`), which is your local network address.

3. **Run Angry IP Scanner:**
   - Open Angry IP Scanner.
   - Set the IP range to scan your local network (e.g., `192.168.1.0` to `192.168.1.255`).
   - Click **Start** and wait for the scan to finish.
   - Look for the hostname you set (e.g., `raspberrypi5.local`).
   - Note down the IP address (e.g., `192.168.1.50`).

---

## Step 4: SSH into the Raspberry Pi Using PuTTY

1. **Download PuTTY:**
   - Go to [PuTTY](https://www.putty.org/) and download the **Windows Installer (64-bit)**.

2. **Open PuTTY**:
   - In **Hostname (or IP address)**, enter the IP address of your Raspberry Pi (found via Angry IP Scanner).
   - Ensure **Connection type** is set to **SSH**.
   - Click **Open**.

3. **Login via SSH**:
   - A security alert may appear, click **Accept**.
   - When prompted, enter your username (e.g., `pi`) and password (as configured during OS installation).
   - You are now logged into your Raspberry Pi via the command line.

---

## Step 5: Configure Raspberry Pi via SSH

1. **Open Raspberry Pi Configuration Tool**:
   - Run the following command in the terminal:
     ```bash
     sudo raspi-config
     ```

2. **Enable X11 Forwarding**:
   - Go to **Advanced Options** -> **A6 Wayland** -> Enable **X11 Forwarding**.

3. **Enable VNC**:
   - Go to **Interface Options** -> **VNC** -> Enable VNC.
   - Wait until you see the message **VNC server is enabled**.

4. **Reboot the Raspberry Pi**:
   - Exit the configuration tool by clicking **Finish**, then run:
     ```bash
     sudo reboot
     ```
   - After rebooting, the PuTTY terminal will disconnect. It is no longer needed.

---

## Step 6: Access the Raspberry Pi with VNC Viewer

1. **Download VNC Viewer**:
   - Go to [RealVNC Viewer](https://www.realvnc.com/en/connect/download/viewer/) and download the **Standalone x64** version.

2. **Run Angry IP Scanner Again**:
   - Wait a few minutes for the Raspberry Pi to fully reboot (2-3 minutes for subsequent boots).
   - Scan your network again using Angry IP Scanner.
   - Find your Raspberry Pi's IP address (it should have a blue icon next to it).
   
3. **Connect to Raspberry Pi via VNC Viewer**:
   - Open VNC Viewer.
   - Enter the IP address of your Raspberry Pi (from Angry IP Scanner) and press **Enter**.
   - When prompted, enter your Raspberry Pi's username and password.
   - You will now have full access to the Raspberry Pi desktop environment.

---

## Troubleshooting

- **Cannot Find Raspberry Pi in Angry IP Scanner**:
  - Ensure your Raspberry Pi is properly powered and connected to the network.
  - Give it 4-5 minutes for the first boot and 2-3 minutes for subsequent boots.
  - Try rebooting your router or the Raspberry Pi if needed.
  
- **VNC Connection Fails**:
  - Ensure VNC is enabled in the Raspberry Pi configuration settings.
  - Check that the IP address from Angry IP Scanner is correct.
  - Verify that your Raspberry Pi and computer are on the same WiFi network.

---

## Conclusion

You have successfully set up a Raspberry Pi 5 on Windows using WiFi, SSH, and VNC without a monitor. You can now use VNC Viewer for remote desktop access and PuTTY for command-line management.

---

- by Aditya Kumar

