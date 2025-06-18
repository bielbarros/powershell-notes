# Mostra há quanto tempo o sistema está ligado (resumido).
$boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$uptime = (Get-Date) - $boot
"Ligado ha: $($uptime.Hours)h $($uptime.Minutes)m"
