$ports = @(23, 80, 443, 444)
$ip = "192.168.1.1"

foreach ($port in $ports) {
    try {
        $socket = New-Object System.Net.Sockets.TcpClient($ip, $port)
    } catch {
        $socket = $null
    }

    if ($socket -eq $null) {
        Write-Output "$ip:$port - Closed"
    } else {
        Write-Output "$ip:$port - Open"
        $socket.Close()
    }
}
