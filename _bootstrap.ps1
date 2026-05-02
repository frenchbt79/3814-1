# ============================================================
# _bootstrap.ps1 — 3814 Repositioning App
# ============================================================
# Per Bradley's global Windows 11 app bootstrap convention:
# Ensures local working folders exist + creates a desktop shortcut
# pointing at index.html. Safe to re-run (idempotent).
# ============================================================

$ErrorActionPreference = "Stop"

# Resolve the app root (folder this script lives in)
$AppRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$AppName = "3814 Repositioning App"

Write-Host "Bootstrapping $AppName at $AppRoot" -ForegroundColor Cyan

# ------------------------------------------------------------
# 1. Create required subfolders (per Bradley's convention)
# ------------------------------------------------------------
$Folders = @("downloads", "logs", "cache", "tmp")
foreach ($f in $Folders) {
    $path = Join-Path $AppRoot $f
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
        Write-Host "  Created: $path" -ForegroundColor Green
    } else {
        Write-Host "  Exists:  $path" -ForegroundColor DarkGray
    }
}

# ------------------------------------------------------------
# 2. Settings file (persistent app state per convention)
# ------------------------------------------------------------
$SettingsPath = Join-Path $AppRoot "settings.json"
if (-not (Test-Path $SettingsPath)) {
    $defaults = @{
        appName     = $AppName
        appRoot     = $AppRoot
        latestFile  = "index.html"
        archiveDir  = "archives"
        docsDir     = "docs"
        bootstrapped = (Get-Date -Format "yyyy-MM-ddTHH:mm:ss")
    } | ConvertTo-Json -Depth 4

    Set-Content -Path $SettingsPath -Value $defaults -Encoding UTF8
    Write-Host "  Created: settings.json" -ForegroundColor Green
} else {
    Write-Host "  Exists:  settings.json" -ForegroundColor DarkGray
}

# ------------------------------------------------------------
# 3. Desktop shortcut → opens index.html in default browser
# ------------------------------------------------------------
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$ShortcutPath = Join-Path $DesktopPath "$AppName.lnk"
$TargetPath = Join-Path $AppRoot "index.html"

if (Test-Path $TargetPath) {
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($ShortcutPath)
    $Shortcut.TargetPath = $TargetPath
    $Shortcut.WorkingDirectory = $AppRoot
    $Shortcut.IconLocation = "$env:SystemRoot\System32\SHELL32.dll,13"  # globe icon
    $Shortcut.Description = "Open $AppName deck in browser"
    $Shortcut.Save()
    Write-Host "  Shortcut: $ShortcutPath" -ForegroundColor Green
} else {
    Write-Host "  WARNING: index.html not found at $TargetPath — shortcut skipped" -ForegroundColor Yellow
}

# ------------------------------------------------------------
# 4. Final report
# ------------------------------------------------------------
Write-Host ""
Write-Host "Bootstrap complete." -ForegroundColor Cyan
Write-Host "  App root: $AppRoot"
Write-Host "  Live deck: $TargetPath"
Write-Host "  Desktop shortcut: $ShortcutPath"
Write-Host ""
Write-Host "To open the deck:"
Write-Host "  - Double-click '$AppName' on Desktop, or"
Write-Host "  - Open $TargetPath directly"
