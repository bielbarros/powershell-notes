# Pega o IP do computador
Get-NetIPAddress

# Verifica se o host responde ao ping
Test-Connection -ComputerName google.com -Count 2

# Verifica se uma porta está aberta
Test-NetConnection -ComputerName google.com -Port 443
