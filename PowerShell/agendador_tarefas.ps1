# Lista tarefas agendadas
Get-ScheduledTask

# Cria tarefa agendada (exemplo simples com bloco de notas)
# $Action = New-ScheduledTaskAction -Execute "notepad.exe"
# $Trigger = New-ScheduledTaskTrigger -At 9am -Daily
# Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "AbrirNotepad" -Description "Abrir bloco de notas diariamente às 9h"
