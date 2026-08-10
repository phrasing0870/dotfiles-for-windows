# dotfiles-for-windows

Personal Windows configuration files and setup resources.

## Contents

* `powershell/` - PowerShell profile
* `terminal/` - Windows Terminal settings
* `git/` - Global Git configuration
* `winget/` - Curated Winget package list
* `vscode/` - VS Code settings and extensions

## Restore packages

```powershell
winget import -i ".\winget\packages.json" --ignore-unavailable
```

## PowerShell profile

The PowerShell profile in this repository is intended to be linked to:

```text
C:\Users\<username>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

## VS Code extensions

Restore extensions with:

```powershell
Get-Content ".\vscode\extensions.txt" | ForEach-Object {
    code --install-extension $_
}
```
