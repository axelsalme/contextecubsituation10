#----------------------------------------
#NAME : exerciceAUDIT3services.ps1
#AUTHOR : SALME Axel
#DATE : 05/03/2025
#----------------------------------------


$logPath = "C:\contextecubsituation10\auditDNS.txt"
if (Test-Path $logPath) {
    Remove-Item $logPath
}
New-Item -Path $logPath -ItemType File -Force

$dateAudit = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Add-Content -Path $logPath -Value "Audit DNS - $dateAudit"
Add-Content -Path $logPath -Value "------------------------------------"

# Lister les enregistrements DNS de type A
$dnsRecords =  Get-DnsServerResourceRecord -ZoneName "local.californie.cub.sioplc.fr" -RRType A -ErrorAction SilentlyContinue

# Si des enregistrements sont trouvés
if ($dnsRecords) {
    foreach ($record in $dnsRecords) {
        # Écrire chaque nom d'hôte et adresse IP dans le fichier
        Add-Content -Path $logPath -Value "Nom d'hôte : $($record.HostName) - Adresse IP : $($record.RecordData.IPv4Address)"
    }
} else {
    Add-Content -Path $logPath -Value "Aucun enregistrement de type A trouvé."
}
Get-Content -Path $logPath
