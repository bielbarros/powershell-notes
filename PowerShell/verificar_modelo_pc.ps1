# Mostra o modelo e fabricante do computador.
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object Manufacturer, Model
