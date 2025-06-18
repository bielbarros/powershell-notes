# Lista arquivos de uma pasta
Get-ChildItem -Path "C:\Users\Gabri\Documents"

# Lista arquivos de forma recursiva
Get-ChildItem -Path "C:\Users\Gabri\Documents" -Recurse

# Cria uma nova pasta
New-Item -ItemType Directory -Path "C:\Users\Gabri\Desktop\PastaNova"

# Cria um novo arquivo de texto
New-Item -ItemType File -Path "C:\Users\Gabri\Desktop\arquivo.txt"

# Remove um arquivo
Remove-Item -Path "C:\Users\Gabri\Desktop\arquivo.txt"
