# Obtém o nível da bateria
$bateria = Get-WmiObject Win32_Battery
"Nivel da bateria: $($bateria.EstimatedChargeRemaining)%"
