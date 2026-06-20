@echo off
setlocal

set "INSTALL_DIR=%USERPROFILE%\AppData\Local\GitScan"

echo Installing GitScan...

if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
)

copy "%~dp0gitscan.cmd" "%INSTALL_DIR%\gitscan.cmd" /Y >nul

echo Configuring PATH...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$path=[Environment]::GetEnvironmentVariable('Path','User');" ^
"if($path -notlike '*%INSTALL_DIR%*'){" ^
"[Environment]::SetEnvironmentVariable('Path',$path+';%INSTALL_DIR%','User')" ^
"}"

echo.
echo GitScan installed successfully.
echo Restart your terminal and run:
echo.
echo     gitscan
echo.

pause