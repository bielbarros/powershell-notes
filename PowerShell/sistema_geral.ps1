# Reinicia o computador (com confirmação)
# Restart-Computer -Confirm

# Desliga o computador, certifique de salvar todos os projetos antes de descomentar o comando abaixo.
# Stop-Computer -Confirm

# Mostra o tempo ligado do sistema
(Get-CimInstance Win32_OperatingSystem).LastBootUpTime
