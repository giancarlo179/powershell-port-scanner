param(
    [string]$ip = "127.0.0.1",
    [string]$ports = "80,443"
)

# Convertir el string de puertos en un array de enteros
$portList = $ports -split "," | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [int]$_ }

Write-Host "Escaneando IP $ip en puertos: $($portList -join ', ')`n"

foreach ($port in $portList) {
    try {
        $socket = New-Object System.Net.Sockets.TcpClient
        $socket.Connect($ip, $port)
        Write-Host "$ip:$port - Open" -ForegroundColor Green
        $socket.Close()
    } catch {
        Write-Host "$ip:$port - Closed" -ForegroundColor Red
    }
}
