# Lista todas as portas abertas no momento.

netstat -an | Select-String "LISTENING"