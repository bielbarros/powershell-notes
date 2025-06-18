# Exibe o nome da rede Wi-Fi atual
(netsh wlan show interfaces) -match '^\s*SSID\s*:\s*(.+)$' | ForEach-Object {
    "Conectado a rede: $($_ -replace '^\s*SSID\s*:\s*','')"
}
