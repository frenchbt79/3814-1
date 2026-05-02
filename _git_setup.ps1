# ============================================================
# _git_setup.ps1 — One-click local git setup for the deck repo
# ============================================================
# What this does:
#  1. Cleans up any broken .git folder from a prior attempt
#  2. Initializes a fresh git repo on the main branch
#  3. Configures user.name + user.email
#  4. Stages all files and creates the first commit
#  5. Prints the next steps (creating the GitHub remote)
#
# Safe to re-run. If a clean git repo already exists, it skips
# init and just does an "amend the first commit" pass.
# ============================================================

$ErrorActionPreference = "Stop"
$AppRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Setting up git in $AppRoot" -ForegroundColor Cyan

# ------------------------------------------------------------
# Verify git is installed
# ------------------------------------------------------------
try {
    $gitVersion = git --version
    Write-Host "  $gitVersion" -ForegroundColor DarkGray
} catch {
    Write-Host "ERROR: git is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Install git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "Then re-run this script." -ForegroundColor Yellow
    exit 1
}

Set-Location $AppRoot

# ------------------------------------------------------------
# 1. Clean up any broken .git folder from a prior failed init
# ------------------------------------------------------------
if (Test-Path ".git") {
    $needsCleanup = $false
    if (Test-Path ".git\config.lock") { $needsCleanup = $true }
    $configContent = if (Test-Path ".git\config") { (Get-Content ".git\config" -Raw -ErrorAction SilentlyContinue) } else { "" }
    if (-not $configContent -or $configContent.Trim().Length -lt 10) { $needsCleanup = $true }

    if ($needsCleanup) {
        Write-Host "  Removing broken .git folder from prior attempt..." -ForegroundColor Yellow
        Remove-Item -Path ".git" -Recurse -Force
    } else {
        Write-Host "  Existing .git folder looks healthy — skipping init" -ForegroundColor Green
    }
}

# ------------------------------------------------------------
# 2. git init + main branch
# ------------------------------------------------------------
if (-not (Test-Path ".git")) {
    git init -q
    git branch -M main
    Write-Host "  Initialized fresh repo on 'main'" -ForegroundColor Green
}

# ------------------------------------------------------------
# 3. Configure identity
# ------------------------------------------------------------
git config user.email "bfrench1979@gmail.com"
git config user.name  "Bradley French"
Write-Host "  Configured user: Bradley French <bfrench1979@gmail.com>" -ForegroundColor Green

# ------------------------------------------------------------
# 4. Stage + commit
# ------------------------------------------------------------
git add .

# Only commit if there are staged changes
$staged = git diff --cached --name-only
if ($staged) {
    git commit -q -m "Initial commit — v34 (2026-05-01) baseline"
    Write-Host "  First commit created." -ForegroundColor Green
} else {
    Write-Host "  Nothing to commit (already committed)." -ForegroundColor DarkGray
}

# ------------------------------------------------------------
# 5. Final report
# ------------------------------------------------------------
$head = git rev-parse --short HEAD
$count = (git rev-list --count HEAD)
Write-Host ""
Write-Host "Git setup complete." -ForegroundColor Cyan
Write-Host "  HEAD:    $head"
Write-Host "  Commits: $count"
Write-Host "  Branch:  $(git branch --show-current)"
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Create a new GitHub repo at https://github.com/new"
Write-Host "     - Suggested name: 3814-bodega-deck"
Write-Host "     - Do NOT initialize with README (we already have one)"
Write-Host "  2. Then run (replace <username>):"
Write-Host "       git remote add origin https://github.com/<username>/3814-bodega-deck.git"
Write-Host "       git push -u origin main"
Write-Host "  3. Repo Settings -> Pages -> Source: 'Deploy from branch' -> main / root -> Save"
Write-Host "  4. Wait ~1 min then open the Pages URL on iPhone Safari"
