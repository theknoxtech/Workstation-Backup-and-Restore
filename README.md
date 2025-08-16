# Workstation-Restore.ps1 PowerShell Script

**Author:** Jon Witherspoon **Version:** 0.5.0 (Work in Progress) **Date:** 2025-08-16

## 📜 Overview

This script is designed to streamline the process of backing up and restoring a user's workstation. It provides an interactive console GUI to select specific application configuration files for backup and to choose from a list of common applications to install using the Windows Package Manager (`winget`). This is ideal for setting up a new machine or recovering an existing one quickly.

## ⚙️ Prerequisites

- **Operating System:** Windows 10 (version 1809 or later) or Windows 11.
    
- **Windows Package Manager (`winget`):** The script relies on `winget` to install applications. This is included by default in modern versions of Windows.
    
- **PowerShell:** The script will attempt to install PowerShell 7 and the `Microsoft.PowerShell.ConsoleGuiTools` module automatically.
    
- **Permissions:** The script **must be run with administrative privileges** to install applications and access certain file system locations.
    
- **Internet Connection:** Required for downloading applications via `winget` and installing PowerShell modules.
    

## 🚀 Installation & Setup

1. **Download:** Place the `Workstation-Restore.ps1` script in a directory on your local machine.
    
2. **Unblock File (Optional):** If you downloaded the script from the internet, you may need to unblock it first. Open a PowerShell terminal and run:
    
    ```powershell
    Unblock-File -Path ".\Workstation-Restore.ps1"
    ```
    

## 💡 Usage

To execute the script, open an elevated PowerShell terminal (Run as Administrator), navigate to the script's directory, and run the command with one of the operational switches.

### Parameters

|Parameter|Type|Required|Description|
|---|---|---|---|
|`-Backup`|`Switch`|Yes|_(Functionality in progress)_ Initiates the backup process, allowing you to select application configurations to save.|
|`-Restore`|`Switch`|Yes|_(Functionality in progress)_ Initiates the restore process, allowing you to select applications to install and configurations to restore.|

When run, the script will present one or more interactive grid-view windows. Use your mouse to select the items you wish to process:

- **Single Selection:** Click an item and press "OK".
    
- **Multiple Selections:** Hold `Ctrl` while clicking multiple items, then press "OK".
    

## ✨ Examples

### Example 1: Backing Up Application Settings

This command starts the script in backup mode. A window will appear listing various application settings. Select the ones you want to save.

```powershell
.\Workstation-Restore.ps1 -Backup
```

The selected configuration files and folders will be copied to `D:\Backup Configs\`.

### Example 2: Restoring a Workstation by Installing Apps

This command starts the script in restore mode. A window will appear listing common applications. Select the ones you want to install.

```powershell
.\Workstation-Restore.ps1 -Restore
```

The script will then use `winget` to install each of your selected applications.

## 🔧 Code Breakdown

The script's functionality is divided into several key parts:

- **`Get-RequiredTools`:** This function ensures that the necessary dependencies, specifically PowerShell 7 and the `Microsoft.PowerShell.ConsoleGuiTools` module, are installed before the main logic runs.
    
- **`Get-UserAppConfigs`:** This function contains a hashtable of common application names and their corresponding configuration file paths. It uses `Out-ConsoleGridView` to display these options in a user-friendly, selectable GUI for the backup process.
    
- **`Get-UserAppInstalls`:** Similar to the function above, this holds a hashtable of common application names and their `winget` package identifiers. It also uses `Out-ConsoleGridView` to allow the user to select which applications they want to install.
    
- **Main Logic:** The main part of the script calls these functions to get the user's choices and then iterates through the selections.
    
    - For backups, it uses `Copy-Item` to save the selected folders.
        
    - For installs, it uses `winget install` to download and set up the chosen applications.
        

## ⚠️ Troubleshooting

|Issue|Cause|Resolution|
|---|---|---|
|`winget` is not recognized as a command.|The Windows Package Manager is not installed or not in the system's PATH. This is rare on modern systems.|Ensure your Windows installation is up to date. You can get the latest version of `winget` by updating the "App Installer" package in the Microsoft Store.|
|`Out-ConsoleGridView` is not recognized.|The `Microsoft.PowerShell.ConsoleGuiTools` module failed to install or import.|Check your internet connection. Try running `Install-Module -Name Microsoft.PowerShell.ConsoleGuiTools -Force` manually in an administrative PowerShell window.|
|Access Denied when backing up a config file.|The script does not have sufficient permissions to read the file or write to the `D:\Backup Configs\` directory.|Ensure you are running the script as an Administrator. Check that the `D:\` drive exists and is writable.|
|An application fails to install via `winget`.|The package identifier may have changed, the `winget` source may be down, or the installer may have failed for a specific reason.|Run `winget install --id <Package.Identifier>` manually for the failed app and check the output for specific error messages.|

## 🤝 Contributing
 Contributions, issues, and feature requests are welcome! Feel free to check the [issues page]([https://github.com/theknoxtech/Workstation-Backup-and-Restore/issues]) for this project to see how you can help.

## 📄 License

This project is unlicensed and free to use.