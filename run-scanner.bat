@echo off
:: run-scanner.bat - Ejecuta port-scanner.ps1 con entrada del usuario

echo ===============================
echo   PowerShell Port Scanner
echo ===============================
echo.

:: Solicitar la IP al usuario
set /p IP="Introduce la IP a escanear: "

:: Solicitar los puertos al usuario
set /p PORTS="Introduce los puertos separados por comas (ej: 22,80,443): "

echo.
echo Ejecutando escaneo en %IP% con puertos %PORTS%...
echo.

:: Ejecutar el script en PowerShell sin restricciones
powershell -ExecutionPolicy Bypass -File port-scanner_v2.ps1 -ip "%IP%" -ports "%PORTS%"

echo.
pause
