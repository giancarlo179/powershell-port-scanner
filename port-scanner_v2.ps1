param(
    [string]$ip = "127.0.0.1",
    [string]$ports = "80,443",
    [int]$timeout = 1000  # en milisegundos
)

$portList = $ports -split "," | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [int]$_ }

Write-Host "Escaneando IP $ip en puertos: $($portList -join ', ') (timeout: $timeout ms)`n"

foreach ($port in $portList) {
    try {
        $client = New-Object System.Net.Sockets.TcpClient
        $result = $client.BeginConnect($ip, $port, $null, $null)
        $wait = $result.AsyncWaitHandle.WaitOne($timeout, $false)

        if ($wait -and $client.Connected) {
            $client.EndConnect($result)
            Write-Host "$($ip):$($port) - Open" -ForegroundColor Green
        } else {
            Write-Host "$($ip):$($port) - Closed or Timed Out" -ForegroundColor Red
        }

        $client.Close()
    } catch {
        Write-Host "$($ip):$($port) - Error: $_" -ForegroundColor Yellow
    }
}
