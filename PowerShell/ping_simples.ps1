# Faz ping em um site e exibe se está online ou não.
if (Test-Connection -ComputerName "google.com" -Count 1 -Quiet) {
    Write-Output "Internet OK!"
} else {
    Write-Output "Sem conexão."
}
