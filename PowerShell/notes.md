# 📘 Estudos PowerShell – Comandos Úteis e Estrutura de Scripts

Organizei os principais comandos de PowerShell em arquivos separados para testes e prática no VSCode. Abaixo está o resumo dos comandos, com explicações sobre cada grupo e palavras-chave importantes para dominar o **PowerShell no dia a dia**.

---

## ⚙️ Ativando a Área Restrita

1. **Ative a área restrita** no ambiente.
2. No Azure Cloud Shell, clique em **"Alternar para o PowerShell"** e confirme.

---

## 📌 Verificando a versão do PowerShell

### Comando:

```powershell
$PSVersionTable
```

### Saída esperada:

```plaintext
Name                           Value
----                           -----
PSVersion                      7.3.6
PSEdition                      Core
GitCommitId                    7.3.6
OS                             Linux ...
Platform                       Unix
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```

> 🎯 Essa saída informa a versão, edição e plataforma do PowerShell.

### Para exibir apenas a versão:

```powershell
$PSVersionTable.PSVersion
```

### Saída:

```plaintext
Major  Minor  Patch
-----  -----  -----
7      3      6
```

> `PSVersionTable` é um **objeto**, e por isso podemos acessar propriedades específicas com `.`

---

# 🔍 Localizar Comandos

---

## 🧾 O que é um Cmdlet?

- Um **cmdlet** (pronuncia-se *command-let*) é um comando compilado em .NET ou .NET Core.
- Segue o padrão de nomenclatura **Verbo-Substantivo**, como `Get-Help`.

### 📚 Exemplo de verbos aprovados:

```powershell
Get-Verb
```

### Saída:

```plaintext
Verb        AliasPrefix Group    Description
----        ----------- -----    -----------
Add         a           Common   Adds a resource to a container...
Clear       cl          Common   Removes all the resources...
```

---

## 🔍 Principais Cmdlets para descoberta

| Cmdlet        | Descrição |
|---------------|-----------|
| `Get-Command` | Lista todos os comandos disponíveis |
| `Get-Help`    | Fornece ajuda e documentação sobre cmdlets |
| `Get-Member`  | Exibe propriedades e métodos de objetos |

---

## 🎯 Usando `Get-Command`

Comando simples para listar todos os comandos disponíveis:

```powershell
Get-Command
```

Como há milhares, use **filtros** com `-Verb` e `-Noun`.

### 🎯 Filtrar por Substantivo (Noun)

```powershell
Get-Command -Noun alias*
```

Filtra todos os cmdlets cujo **substantivo** começa com “alias”.

### 🎯 Filtrar por Verbo e Substantivo

```powershell
Get-Command -Verb Get -Noun alias*
```

Filtra os cmdlets onde:
- Verbo é `Get`
- Substantivo começa com `alias`

---

## 🗂️ Exemplo prático: Trabalhando com arquivos

### Passo 1: Buscar cmdlets relacionados a "File"

```powershell
Get-Command -Noun File*
```

### Saída esperada:

```plaintext
Cmdlet          Get-FileHash
Cmdlet          Out-File
Cmdlet          Unblock-File
```

### Passo 2: Filtrar ainda mais

```powershell
Get-Command -Verb Get -Noun File*
```

### Saída esperada:

```plaintext
Cmdlet          Get-FileHash
```

> ✅ Resultado mais preciso, ideal para quando você sabe o que deseja fazer (ex: “Get” arquivos)

---



## 📁 `verificar_versao.ps1`

```powershell
$PSVersionTable
$PSVersionTable.PSVersion
```

### 🔍 Explicação:
- `$PSVersionTable` → Retorna um objeto com diversas informações sobre a instalação do PowerShell.
- `.PSVersion` → Acessa somente a versão atual (Major, Minor e Patch).

---

## 📁 `listar_processos.ps1`

```powershell
Get-Process
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5
```

### 🔍 Explicação:
- `Get-Process` → Lista os processos em execução.
- `Sort-Object` → Ordena por uso de memória (`WorkingSet`).
- `Select-Object -First 5` → Mostra os 5 maiores consumidores.

---

## 📁 `servicos_windows.ps1`

```powershell
Get-Service
Get-Service -Name Spooler
Start-Service -Name Spooler
Stop-Service -Name Spooler
```

### 🔍 Explicação:
- `Get-Service` → Lista os serviços do Windows.
- `Start-Service` / `Stop-Service` → Controla o status de um serviço.

---

## 📁 `arquivos_e_pastas.ps1`

```powershell
Get-ChildItem -Path "C:\Users\Gabri\Documents"
Get-ChildItem -Path "C:\Users\Gabri\Documents" -Recurse
New-Item -ItemType Directory -Path "C:\Users\Gabri\Desktop\PastaNova"
New-Item -ItemType File -Path "C:\Users\Gabri\Desktop\arquivo.txt"
Remove-Item -Path "C:\Users\Gabri\Desktop\arquivo.txt"
```

### 🔍 Explicação:
- `Get-ChildItem` → Lista arquivos e pastas.
- `-Recurse` → Lista também subpastas.
- `New-Item` → Cria arquivos ou pastas.
- `Remove-Item` → Apaga arquivos ou pastas.

---

## 📁 `rede_comandos.ps1`

```powershell
Get-NetIPAddress
Test-Connection -ComputerName google.com -Count 2
Test-NetConnection -ComputerName google.com -Port 443
```

### 🔍 Explicação:
- `Get-NetIPAddress` → Mostra os IPs da máquina.
- `Test-Connection` → Testa conectividade (como ping).
- `Test-NetConnection` → Verifica portas específicas.

---

## 📁 `usuarios_e_permissoes.ps1`

```powershell
whoami
New-LocalUser -Name "usuarioTeste" -Password (ConvertTo-SecureString "Senha123" -AsPlainText -Force)
Add-LocalGroupMember -Group "Administrators" -Member "usuarioTeste"
```

### 🔍 Explicação:
- `whoami` → Mostra o usuário atual.
- `New-LocalUser` → Cria um novo usuário local.
- `Add-LocalGroupMember` → Adiciona o usuário ao grupo de administradores.

> ⚠️ Esses comandos exigem execução como **Administrador**.

---

## 📁 `sistema_geral.ps1`

```powershell
Restart-Computer -Confirm
Stop-Computer -Confirm
(Get-CimInstance Win32_OperatingSystem).LastBootUpTime
```

### 🔍 Explicação:
- `Restart-Computer` e `Stop-Computer` → Reinicia ou desliga a máquina.
- `Get-CimInstance` → Usado para obter dados do sistema como o tempo desde o último boot.

---

## 📁 `agendador_tarefas.ps1`

```powershell
Get-ScheduledTask

$Action = New-ScheduledTaskAction -Execute "notepad.exe"
$Trigger = New-ScheduledTaskTrigger -At 9am -Daily
Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "AbrirNotepad"
```

### 🔍 Explicação:
- Cria tarefas agendadas com ações e gatilhos.
- Exemplo: abrir o Bloco de Notas todos os dias às 9h.

---

## 📁 `funcoes_utilitarias.ps1`

```powershell
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
```

### 🔍 Explicação:
- Cria uma **função personalizada** para fazer backup automático com nome baseado em data/hora.
- Usa comandos como `Split-Path`, `Get-Date`, `Copy-Item` e `Write-Warning`.

---

## 🧠 Palavras-chave importantes no PowerShell

| Palavra-chave       | Descrição |
|---------------------|-----------|
| `Get-`              | Buscar (ex: `Get-Process`, `Get-Service`) |
| `Set-`              | Definir algo (ex: `Set-ExecutionPolicy`) |
| `New-`              | Criar (ex: `New-Item`, `New-LocalUser`) |
| `Remove-`           | Apagar (ex: `Remove-Item`) |
| `Test-`             | Testar algo (ex: `Test-Connection`) |
| `Start-` / `Stop-`  | Iniciar / Parar processos ou serviços |
| `Select-Object`     | Filtrar e selecionar colunas da saída |
| `Sort-Object`       | Ordenar informações |
| `ForEach-Object`    | Laço para iterar sobre uma coleção |
| `Out-File`          | Redirecionar a saída para um arquivo |

---

## ✅ Conclusão

Com esses scripts separados por tema, posso testar cada comando diretamente no VSCode, entender como funcionam e montar soluções automatizadas para o dia a dia. 

Esse estudo está sendo salvo como parte do meu projeto pessoal de domínio da **linha de comando e automação com PowerShell**. 💻⚡


