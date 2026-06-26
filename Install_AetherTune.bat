@echo off
setlocal
title AetherTune Setup Engine
color 0A

:: Define internal tool path
set ADB=resources\adb.exe

:: 0. CHECKS (Prevents broken zip extractions)
:: ---------------------------------------------------------

if not exist "%ADB%" (
    color 0C
    echo [FATAL ERROR] Missing 'resources\adb.exe'!
    echo Please make sure you have extracted the entire ZIP folder.
    pause
    exit /b
)

if not exist "AetherTune.apk" (
    color 0C
    echo [FATAL ERROR] Missing 'AetherTune.apk' in this folder!
    pause
    exit /b
)

:START
cls
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo             AetherTune Installer           
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo Please ensure your phone is plugged in via USB and
echo "USB Debugging" is enabled in Developer Options.
echo.
pause

:CHECK_CONNECTION
cls
echo [1/3] Interrogating USB Connection...

%ADB% start-server >nul 2>&1

%ADB% devices | findstr /e "device" >nul
if %errorlevel%==0 (
    echo [+] Device connected and authorized!
    goto INSTALL_APK
)

color 0E
echo.
echo [!]    CONNECTION BLOCKED OR MISSING
echo ===================================================

:: Check if ADB specifically sees it as unauthorized or offline
%ADB% devices | findstr /i "unauthorized offline" >nul
if %errorlevel%==0 (
    echo A prompt asking "Allow USB Debugging?" has appeared on your phone.
    echo.
    echo 1. Please click "Always allow from this computer" on your phone.
    echo 2. Tap "ALLOW"
) else (
    echo Your phone was not detected by the PC.
    echo 1. Unplug and re-plug your USB cable.
    echo 2. Make sure USB Debugging is toggled ON in Developer options.
)

echo ===================================================
echo Press any key once you have tapped Allow on the phone...
pause >nul
color 0A
goto CHECK_CONNECTION


:INSTALL_APK
echo.
echo [2/3] Installing AetherTune APK...
%ADB% install --bypass-low-target-sdk-block AetherTune.apk

if %errorlevel% neq 0 (
    goto FAIL_INSTALL
)


:GRANT_PERMISSIONS
echo.
echo [3/3] Applying Hardware-Level Permissions...
%ADB% shell pm grant com.radshark.aethertune android.permission.WRITE_SECURE_SETTINGS

cls
color 0A
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo                 SETUP COMPLETE!              
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo Permissions successfully applied to the app.
echo You can now unplug your phone and open AetherTune apk!
echo.
pause
exit /b


:FAIL_INSTALL
color 0C
echo.
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo            APK INSTALLATION Failed!
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo Possible fixes:
echo 1. Check your phone screen for a "Google Play Protect"
echo    warning. Tap "More Details" -> "Install Anyway".
echo 2. If on Samsung OneUI 6+, turn off "Auto Blocker" 
echo    in your phone settings temporarily.
echo.
pause
exit /b