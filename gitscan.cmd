@echo off
setlocal EnableExtensions EnableDelayedExpansion

echo Scanning for Git repositories...
echo.

for /f "delims=" %%G in ('
    dir /s /b /ad .git 2^>nul ^
    ^| findstr /I /V "\\node_modules\\ \\.venv\\ \\.next\\ \\dist\\ \\build\\ \\target\\ \\coverage\\"
') do (

    set "repo=%%~dpG"
    set "repo=!repo:~0,-1!"

    set "hasChanges="

    for /f "delims=" %%S in ('
        git -C "!repo!" status --porcelain 2^>nul
    ') do (

        if not defined hasChanges (
            echo ==================================================
            echo REPO: !repo!
            echo ==================================================
            set "hasChanges=1"
        )

        echo %%S
    )

    if defined hasChanges echo.
)

echo No uncommitted repos found.