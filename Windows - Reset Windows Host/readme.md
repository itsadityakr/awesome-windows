# Resetting the Hosts File Using PowerShell

## Overview

The hosts file in Windows is a local text file that maps hostnames to IP addresses. It's commonly used for overriding DNS settings or for blocking websites. However, there may be situations where you need to reset this file to its default state, such as after troubleshooting network issues or removing custom entries. This guide explains how to reset the hosts file to its default state using PowerShell.

## Prerequisites

- **Administrator Access**: You must have administrator privileges to modify the hosts file.
- **Windows PowerShell**: The steps below assume that you are using PowerShell, which comes pre-installed on Windows.

## Steps to Reset the Hosts File

### 1. Open PowerShell as Administrator

To begin, you need to open PowerShell with administrative privileges:

1. Press `Win + X` on your keyboard.
2. From the menu that appears, select **Windows PowerShell (Admin)**.
3. If prompted by User Account Control (UAC), click **Yes** to allow the application to make changes to your device.

### 2. Run the Reset Command

Once PowerShell is open, you can reset the hosts file by running the following command:

```powershell
Set-Content -Path "$env:SystemRoot\System32\drivers\etc\hosts" -Value @"
# Copyright (c) 1993-2009 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host

# localhost name resolution is handled within DNS itself.
#   127.0.0.1       localhost
#   ::1             localhost
"@
```

### 3. Verify the Changes

After running the command, you can verify that the hosts file has been reset by opening it in a text editor:

1. Open **File Explorer** and navigate to the following path:
   ```
   C:\Windows\System32\drivers\etc\
   ```
2. Locate the `hosts` file and open it with **Notepad** or another text editor.
3. The content of the file should match the default content provided in the command above.

### 4. Final Steps

After verifying the changes, close the text editor. There is no need to restart your computer; the changes will take effect immediately.

## Important Considerations

- **Backup**: Before making any changes to the hosts file, it's a good idea to create a backup of the current file. You can do this by copying the `hosts` file to another location on your computer.
- **Customization**: If you have custom entries in your hosts file (e.g., for blocking websites or redirecting domains), they will be lost when you reset the file. You will need to re-add these entries manually after the reset.
- **Permissions**: If you encounter a permissions error, ensure that you are running PowerShell as an administrator. If the problem persists, check the file's properties to ensure it is not set to "Read-only."

## Troubleshooting

- **Command Errors**: If the command returns an error, double-check the syntax and ensure you are using PowerShell as an administrator.
- **File Access Issues**: If you cannot access the hosts file, make sure it is not open in another program and that you have sufficient permissions.

## Additional Resources

- [Microsoft Documentation on the Hosts File](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/hosts)
- [PowerShell Scripting Guide](https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.1)

---

- by Aditya Kumar