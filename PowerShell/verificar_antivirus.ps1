# Verifica o status do Windows Defender (ativado ou não).
Get-MpComputerStatus | Select-Object AMServiceEnabled, AntivirusEnabled
