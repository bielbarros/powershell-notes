# Desativa portas USB (apenas leitura de armazenamento).
# ⚠️ Execute como administrador
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" -Value 4
Write-Output "🔒 Portas USB desativadas (armazenamento)."

# Para reativar, use:
# Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" -Value 3


# Para verificar o status atual, use:
# Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" | Select-Object Start
# Exibe o status atual das portas USB
