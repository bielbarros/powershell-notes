# Função para criar backup de um arquivo
function Backup-Arquivo {
    param (
        [string]$arquivoOriginal,
        [string]$pastaBackup
    )

    if (Test-Path $arquivoOriginal) {
        $nomeArquivo = Split-Path $arquivoOriginal -Leaf
        $data = Get-Date -Format "yyyyMMdd_HHmmss"
        $novoNome = "$($pastaBackup)\BACKUP_$data`_$nomeArquivo"
        Copy-Item $arquivoOriginal -Destination $novoNome
        Write-Output "Backup feito para: $novoNome"
    } else {
        Write-Warning "Arquivo não encontrado: $arquivoOriginal"
    }
}

# Exemplo de uso:
# Backup-Arquivo -arquivoOriginal "C:\arquivo.txt" -pastaBackup "C:\Backups"
