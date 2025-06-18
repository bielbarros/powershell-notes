# Mostra o espaço disponível no disco C.
(Get-PSDrive C).Free / 1GB -as [int]
