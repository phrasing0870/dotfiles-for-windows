$Repo = $PSScriptRoot

Write-Host "Installing Winget packages..."

winget import `
    -i "$Repo\winget\packages.json" `
    --ignore-unavailable `
    --accept-package-agreements `
    --accept-source-agreements


Write-Host "Restoring VS Code extensions..."

Get-Content "$Repo\vscode\extensions.txt" | ForEach-Object {
    code --install-extension $_
}


Write-Host "Linking PowerShell profile..."

$ProfileTarget = "$Repo\powershell\Microsoft.PowerShell_profile.ps1"

New-Item `
    -ItemType Directory `
    -Path (Split-Path $PROFILE) `
    -Force | Out-Null

if (Test-Path $PROFILE) {
    Copy-Item $PROFILE "$PROFILE.backup" -Force
    Remove-Item $PROFILE -Force
}

New-Item `
    -ItemType SymbolicLink `
    -Path $PROFILE `
    -Target $ProfileTarget


Write-Host "Restoring Git config..."

Copy-Item `
    "$Repo\git\.gitconfig" `
    "$HOME\.gitconfig" `
    -Force


Write-Host "Restoring Windows Terminal settings..."

$TerminalSettings = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

New-Item `
    -ItemType Directory `
    -Path (Split-Path $TerminalSettings) `
    -Force | Out-Null

Copy-Item `
    "$Repo\terminal\settings.json" `
    $TerminalSettings `
    -Force


Write-Host "Restoring VS Code settings..."

$VSCodeSettings = "$env:APPDATA\Code\User\settings.json"

New-Item `
    -ItemType Directory `
    -Path (Split-Path $VSCodeSettings) `
    -Force | Out-Null

Copy-Item `
    "$Repo\vscode\settings.json" `
    $VSCodeSettings `
    -Force


Write-Host "Applying Windows preferences..."

& "$Repo\windows\explorer.ps1"


    Write-Host "Setup complete."