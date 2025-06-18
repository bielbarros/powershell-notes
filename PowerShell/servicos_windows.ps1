# Lista todos os serviços
Get-Service

# Verifica se o serviço 'Spooler' (impressão) está ativo
Get-Service -Name Spooler

# Inicia o serviço de spooler
Start-Service -Name Spooler

# Para o serviço de spooler
Stop-Service -Name Spooler
