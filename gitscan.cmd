@echo off
setlocal EnableExtensions EnableDelayedExpansion

echo Scanning for Git repositories...
echo.

set found=0

if exist ".git" (

    set "repo=%CD%"
    set "hasChanges="

    for /f "delims=" %%S in ('
        git -C "%CD%" status --porcelain 2^>nul
    ') do (

        if not defined hasChanges (
            set found=1
            echo =================================================
            echo REPO: %CD%
            echo =================================================
            set "hasChanges=1"
        )

        echo %%S
    )

    if defined hasChanges echo.
)

for /f "delims=" %%G in ('
    dir /s /b /ad .git 2^>nul ^
    ^| findstr /I /V "\\node_modules\\ \\.venv\\ \\.next\\ \\dist\\ \\build\\ \\target\\ \\coverage\\"
') do (

    set "repo=%%~dpG"
    set "repo=!repo:~0,-1!"

    if /I not "!repo!"=="%CD%" (

        set "hasChanges="

        for /f "delims=" %%S in ('
            git -C "!repo!" status --porcelain 2^>nul
        ') do (

            if not defined hasChanges (
                set found=1
                echo ==================================================
                echo REPO: !repo!
                echo ==================================================
                set "hasChanges=1"
            )

            echo %%S
        )

        if defined hasChanges echo.
    )
)

if !found! equ 0 (
    echo No uncommitted repos found.
) else (
    echo Done.
)

endlocal