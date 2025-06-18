# Lista todos os processos em execução
Get-Process

# Lista apenas os 5 processos que mais consomem memória
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5
