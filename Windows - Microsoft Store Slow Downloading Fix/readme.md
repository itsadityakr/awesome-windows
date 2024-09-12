# Microsoft Store Slow Downloading or Pending Issues on Windows 11

## Overview
This guide provides troubleshooting steps to resolve issues related to slow downloading or pending updates in the Microsoft Store on Windows 11.

## Methods

### Method 1: Adjust Network and Store Settings

1. **End Unnecessary Processes**
   - Press `Ctrl + Shift + Esc` to open Task Manager.
   - Go to the `Network` tab.
   - Identify processes using significant network bandwidth.
   - Right-click on unnecessary processes and select `End Task`.

2. **Disable Metered Connections**
   - Open `Settings` by pressing `Win + I`.
   - Navigate to `Network & Internet`.
   - Select your network type (e.g., Ethernet or Wi-Fi).
   - Toggle off `Set as metered connection`.

3. **Adjust Delivery Optimization Settings**
   - Open `Settings` and go to `Update & Security`.
   - Click on `Advanced options`.
   - Select `Delivery Optimization`.
   - Click `Advanced options`.
   - Change `Absolute bandwidth` to `Percentage of bandwidth`.
   - Set the bandwidth limit for background and foreground downloads to `100%`.

4. **Reset Microsoft Store**
   - Search for `Microsoft Store` in the Start menu.
   - Right-click and select `App settings`.
   - Ensure `Let this app run in the background` is set to `Always`.
   - Click `Terminate`, then click `Repair` and `Reset`.

5. **Run Commands in Command Prompt**
   - Open Command Prompt as an administrator.
   - Run the following commands:
     ```shell
     ipconfig /flushdns
     netsh winsock reset
     wsreset
     ```

### Method 2: Change DNS Settings

1. **Open Network Adapter Settings**
   - Press `Win + R`, type `ncpa.cpl`, and press Enter.
   - Right-click on your active network connection and select `Properties`.

2. **Update DNS Settings**
   - Double-click `Internet Protocol Version 4 (TCP/IPv4)` and select `Properties`.
   - Choose `Use the following DNS server addresses`.
   - Set `Preferred DNS server` to `8.8.8.8` (Google DNS) and `Alternate DNS server` to `1.0.0.1` (Cloudflare DNS).
   - Click `OK` to save changes.

3. **Test DNS Response Time**
   - Open Command Prompt and type:
     ```shell
     ping 8.8.8.8
     ping 1.1.1.1
     ```
   - Use the DNS server with the lowest ping time for better performance.

### Method 3: Re-register Microsoft Store

1. **Re-register Microsoft Store via PowerShell**
   - Open PowerShell as an administrator.
   - Run the following command:
     ```shell
     Get-AppxPackage -AllUsers Microsoft.WindowsStore* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
     ```

2. **Restart Your PC**
   - After running the command, restart your computer to apply the changes.

## Additional Tips
- Ensure your Windows 11 is up-to-date by checking for updates in `Settings` > `Update & Security`.
- If issues persist, consider reinstalling the Microsoft Store or contacting Microsoft support.

---

- by Aditya Kumar