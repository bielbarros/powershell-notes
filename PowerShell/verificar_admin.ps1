# Verifica se o script está sendo executado como administrador.

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Output "Nao esta em modo Administrador."
} else {
    Write-Output "Esta em modo Administrador."
}
