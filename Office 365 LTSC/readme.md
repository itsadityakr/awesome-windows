# Office 365 LTSC Installation and Activation Guide

This guide will walk you through the process of installing and activating Office 365 from the `office2024.zip` file. Follow the steps below carefully.

## Prerequisites
- Ensure you have the `office2024.zip` file downloaded.
- You must have administrative privileges on your computer.
- Ensure your system meets the hardware and software requirements for Office 365.

## Step 1: Unzip the Office 365 Installation Package

1. **Locate the `office2024.zip` file**:
   - The file should be in your Downloads folder or wherever you saved it.

2. **Unzip the file**:
   - Right-click on the `office2024.zip` file.
   - Select `Extract All...`.
   - In the extraction wizard, set the destination to `C:\`.
   - Click `Extract`.

   The contents will be extracted to `C:\office2024`.

## Step 2: Run Command Prompt as Administrator

1. **Open Command Prompt**:
   - Press `Windows + S` to open the search bar.
   - Type `cmd`.
   - Right-click on `Command Prompt` and select `Run as administrator`.

   You will now have an elevated command prompt with administrative privileges.

## Step 3: Install Office 365

1. **Navigate to the office2024 directory**:
   - In the command prompt, type the following commands one by one and press `Enter` after each:

     ```cmd
     cd /
     cd office2024
     ```

2. **Run the Setup**:
   - In the command prompt, type the following command and press `Enter`:

     ```cmd
     setup.exe /configure configuration.xml
     ```

   This command will start the installation process based on the configuration file.

3. **Wait for Installation**:
   - The installation process may take several minutes. Wait until it completes.

## Step 4: Activate Office 365

### Option 1: If You Have a Product Key Associated with Your Microsoft Account

- Simply sign in with your Microsoft account during the setup process. Office will automatically activate.

### Option 2: If You Do Not Have a Product Key Associated with Your Account

1. **Open an Office 365 Application**:
   - Open any Office 365 application, such as Word, Excel, or PowerPoint.

2. **Go to Account Settings**:
   - Click on `File` in the top menu.
   - Select `Account`.

3. **Change Product Key**:
   - Under `Product Information`, select `Change Product Key`.
   - Enter the following product key:

     ```
     Y63J7-9RNDJ-GD3BV-BDKBP-HH966
     ```

   - Click `Install`.

4. **Close the Application**:
   - Once the key is accepted, close the Office application.

5. **Reopen the Office Application**:
   - Reopen the same Office application.

6. **Activate Office 365**:
   - A window titled `Microsoft Office Preview Activation Wizard` will pop up.
   - Select `I want to activate the software over the internet (recommended)`.
   - Follow the on-screen instructions to complete the activation.

## Troubleshooting

- **Installation Issues**: Ensure you are running the Command Prompt as an administrator and that there is sufficient disk space.
- **Activation Issues**: Make sure you have a stable internet connection during the activation process.

---

By following these steps, you should have successfully installed and activated Office 365 on your system. If you encounter any issues, refer to the troubleshooting section or seek help from the community.

--- 

- by Aditya Kumar