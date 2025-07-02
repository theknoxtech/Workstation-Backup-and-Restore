param(
    [switch]$Backup,
    [switch]$Restore
    
)




function Get-RequiredTools {

    winget install --id Microsoft.Powershell --accept-source-agreements
    Install-Module -Name Microsoft.PowerShell.ConsoleGuiTools -Force
    Import-Module Microsoft.PowerShell.ConsoleGuiTools
}

function Get-UserAppConfigs {


    $Paths = @{
        "Logitech GHub" = "C:\Users\$env:Username\AppData\Local\LGHUB\"
        "Windows Terminal" = "C:\Users\$env:Username\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"
        "Windows Terminal State" = "C:\Users\$env:Username\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"
        "Sublime Text 4 Default Save Location" = "C:\Program Files\Sublime Text\"
        "Sublime Text 4 User Preferences" = "C:\Users\$env:Username\AppData\Roaming\Sublime Text\Packages\User\"
        "Sublime Text 4 Syntax Specific Preferences" = "C:\Users\$env:Username\AppData\Roaming\Sublime Text\Packages\User\"
        "VSCode Settings" = "%APPDATA%\Code\User\"
        "Notepad++ Config" = "C:\Users\$env:Username\AppData\Roaming\Notepad++\"
        "All Users Startup" = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
        "Current User Startup" = "C:\Users\$env:Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
    }

   $AppConfigs = $Paths | Out-ConsoleGridView -Title "Which apps would you like to backup?" -OutputMode Multiple

   return $AppConfigs
}

function Get-UserAppInstalls {
    # For UWP app install locations
    # ^_\d+\.\d+\.\d+\.\d+_(x64|x86|arm64)__\w+$

    $Apps = @{
        "AutoHotKey" = "AutoHotkey.AutoHotkey"
        "Sublime Text 3" = "SublimeHQ.SublimeText.3"
        "Sublime Text 4" = "SublimeHQ.SublimeText.4 "
        "Visual Studio Code" = "Microsoft.VisualStudioCode"
        "Obsidain" = "Obsidian.Obsidian"
        "7Zip" = "7zip.7zip"
        "Advanced IP Scanner" = "Famatech.AdvancedIPScanner"
        "Brave Browser" = "Brave.Brave"
        "Grammarly" = "Grammarly.Grammarly"
        "Greenshot" = "Greenshot.Greenshot"
        "GitHub Desktop" = "GitHub.GitHubDesktop"
        "Python" = "Python.Python.3.12"
        "Logitech GHUB" = "Logitech.GHUB"
        "Spotify" = "Spotify.Spotify"
        "VSCode" = "Microsoft.VisualStudioCode"
        "WinDbg" = "Microsoft.WinDbg"
        "SysInternals" = "Microsoft.SysInternals"
        "Discord" = "Discord.Discord"
        "Steam" = "Valve.Steam"
        "EpicGames Launcher" = "EpicGames.EpicGamesLauncher"
        "Blizzard Battle.net" = "Blizzard.BattleNet"
        "Ubisoft" = "Ubisoft.Connect"
        "Revo Uninstaller" = "RevoUninstaller.RevoUninstaller"
        "Wiztree" = "AntibodySoftware.WizTree"
        "Notepad++" = "Notepad++.Notepad++"
        "Mozilla Firefox" = "Mozilla.Firefox"
        "Google Chrome" = "Google.Chrome.EXE"
        "Rufus" = "Rufus.Rufus"


    }

    $InstallApps = $Apps | Out-ConsoleGridView -Title "Which apps would you link to install?" -OutputMode Multiple

    return $InstallApps

}

function IsWorkstationBackup {

}

function IsWorkstationRestore {

}



# Install Microsoft ConsoleGUITools

Get-RequiredTools


# Get Configs to Backup
foreach ($Config in Get-UserAppConfigs){

    if (Test-Path($Config.value)) {

        Write-Host "$($Config.key) is being backed up" -ForegroundColor Yellow

        Copy-Item -Path $Config.value -Destination "D:\Backup Configs\" -Recurse

        Write-Host "$($Config.key) has been backed up" -ForegroundColor Green

    }elseif(!(Test-Path($Config.value))){

        Write-Host "$($Config.key) at $($Config.value) was not found" -ForegroundColor Red
    }
}


# Get Apps to Install
foreach ($app in Get-UserAppInstalls){

    if ($app.key) {

        Write-Host "$($app.key) is being installed" -ForegroundColor Yellow
        Set-Location -Path C:
        
        winget install -h --id $app.Value --accept-source-agreements

        
        Write-Host "$($app.key) has been installed" -ForegroundColor Green

    }elseif(!($app.value)){

        Write-Host "$($app.key) was not installed" -ForegroundColor Red
    }
}
