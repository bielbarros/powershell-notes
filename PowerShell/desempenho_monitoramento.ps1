# Monitorar uso de CPU, RAM, disco, tempo de boot.
Get-Process | Sort-Object CPU -Descending
Get-CimInstance Win32_OperatingSystem | Select LastBootUpTime
