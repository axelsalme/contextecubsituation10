#----------------------------------------
#NAME : exerciceAUDIT1services.ps1
#AUTHOR : SALME Axel
#DATE : 05/03/2025
#----------------------------------------


$logPath = "C:\contextecubsituation10\auditServices.txt"

# Création ou réinitialisation du fichier de log
if (Test-Path $logPath) {
    Remove-Item $logPath
}
New-Item -Path $logPath -ItemType File -Force

# Écrire la date et l'heure de lancement du script
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content -Path $logPath -Value "$dateTime - Lancement du script"

# Vérification de l'activité du DHCP
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$dhcpStatus = Get-Service -Name "DHCP" -ErrorAction SilentlyContinue
if ($dhcpStatus.Status -eq 'Running') {
    Add-Content -Path $logPath -Value "$dateTime - DHCP est en cours d'exécution."
    Add-Content -Path $logPath -Value $dhcpStatus.Status
} else {
    Add-Content -Path $logPath -Value "$dateTime - DHCP n'est pas en cours d'exécution."
    Add-Content -Path $logPath -Value $dhcpStatus.Status
}

# Vérification de l'activité du DNS
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$dnsStatus = Get-Service -Name "DNS" -ErrorAction SilentlyContinue
if ($dnsStatus.Status -eq 'Running') {
    Add-Content -Path $logPath -Value "$dateTime - DNS est en cours d'exécution."
    Add-Content -Path $logPath -Value $dnsStatus.Status
} else {
    Add-Content -Path $logPath -Value "$dateTime - DNS n'est pas en cours d'exécution."
    Add-Content -Path $logPath -Value $dnsStatus.Status
}

# Vérification de l'activité de l'Active Directory
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$adStatus = Get-Service -Name "NTDS" -ErrorAction SilentlyContinue
if ($adStatus.Status -eq 'Running') {
    Add-Content -Path $logPath -Value "$dateTime - Active Directory (NTDS) est en cours d'exécution."
    Add-Content -Path $logPath -Value $adStatus.Status
} else {
    Add-Content -Path $logPath -Value "$dateTime - Active Directory (NTDS) n'est pas en cours d'exécution."
    Add-Content -Path $logPath -Value $adStatus.Status
}

# Affichage du message final dans la console
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content -Path $logPath -Value "$dateTime - Audit terminé."

# Optionnel: afficher le contenu du fichier log dans la console pour vérification
Get-Content -Path $logPath

