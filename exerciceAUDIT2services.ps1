#----------------------------------------
#NAME : exerciceAUDIT2services.ps1
#AUTHOR : SALME Axel
#DATE : 05/03/2025
#----------------------------------------


$dateAudit = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Récupérer les plages DHCP à partir du serveur DHCP
$dhcpScopes = Get-DhcpServerv4Scope 

$logPath = "C:\contextecubsituation10\auditDHCP.txt"
if (Test-Path $logPath) {
    Remove-Item $logPath
}
New-Item -Path $logPath -ItemType File -Force

# Créer le fichier et y ajouter la date de l'audit
Add-Content -Path $logPath -Value "Audit DHCP effectué le: $dateAudit`r`n"
Add-Content -Path $logPath -Value "------------------------------------`r`n"


foreach ($scope in $dhcpScopes) {
    $scopeName = $scope.Name
    $scopeState = $scope.State

    # Préparer le résultat à afficher et à enregistrer
    $output = "$scopeName - $scopeState"
    Add-Content -Path $logPath -Value $output

    # Afficher sur l'écran
    if ($scopeState -eq 'Inactive') {
        Write-Host $output -ForegroundColor Red
    } else {
        Write-Host $output
    }
}
Write-Host "`nAudit terminé."
