$Repo = $PSScriptRoot

Write-Host "Backing up PowerShell profile..."
Copy-Item `
    $PROFILE `
    "$Repo\powershell\Microsoft.PowerShell_profile.ps1" `
    -Force

Write-Host "Backing up Git config..."
Copy-Item `
    "$HOME\.gitconfig" `
    "$Repo\git\.gitconfig" `
    -Force

Write-Host "Backing up Windows Terminal settings..."
Copy-Item `
    "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" `
    "$Repo\terminal\settings.json" `
    -Force

Write-Host "Backing up VS Code settings..."
Copy-Item `
    "$env:APPDATA\Code\User\settings.json" `
    "$Repo\vscode\settings.json" `
    -Force

Write-Host "Backing up VS Code extensions..."
code --list-extensions > "$Repo\vscode\extensions.txt"

Write-Host "Backup complete."