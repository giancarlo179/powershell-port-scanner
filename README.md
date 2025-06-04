# powershell-port-scanner
Un escáner de puertos simple escrito en PowerShell. Este script intenta conectarse a una lista de puertos en una IP específica y reporta si están abiertos o cerrados.


# PowerShell Port Scanner

A simple port scanner script written in PowerShell. It scans specified ports on a target IP and reports their status (open or closed).

## Usage

```powershell
# Ejecución directa en consola PowerShell de la Version 1
.\port-scanner.ps1


# Ejecución directa en consola PowerShell de la Version 2
powershell -ExecutionPolicy Bypass -File .\port-scanner.ps1 -ip "192.168.1.1" -ports "22,80,443,8080"

powershell -ExecutionPolicy Bypass -File .\port-scanner.ps1 -ip "192.168.1.1" -ports "21,22,23"

OR

# Ejecucion directa desde el ejecutable .bat

![image](https://github.com/user-attachments/assets/0d2dfaf9-75c6-4ae4-80c9-c786ade8df8b)




