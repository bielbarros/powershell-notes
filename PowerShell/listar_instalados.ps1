# Exibe nome dos aplicativos instalados
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Select-Object DisplayName | Sort-Object DisplayName
    
# Exibe nome dos aplicativos instalados (32 bits)
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Select-Object DisplayName | Sort-Object DisplayName