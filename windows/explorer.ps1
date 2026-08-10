Write-Host "Applying Explorer settings..."

$ExplorerAdvanced = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

# Show file extensions
Set-ItemProperty `
    -Path $ExplorerAdvanced `
    -Name HideFileExt `
    -Value 0

# Show hidden files
Set-ItemProperty `
    -Path $ExplorerAdvanced `
    -Name Hidden `
    -Value 1

# Show protected operating system files
Set-ItemProperty `
    -Path $ExplorerAdvanced `
    -Name ShowSuperHidden `
    -Value 1

Write-Host "Explorer settings applied."