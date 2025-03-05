#----------------------------------------
#NAME : exerciceAUDIT4services.ps1
#AUTHOR : SALME Axel
#DATE : 05/03/2025
#----------------------------------------


# Récupérer la date et l'heure actuelles
$auditDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Nom du fichier de sortie
$outputFile = "C:\contextecubsituation10\auditAD.txt"

# Ouvrir le fichier pour écrire
$header = "Audit des comptes utilisateurs - $auditDate"
$divider = "=" * 50
$columns = "{0,-20}{1,-10}{2,-10}{3,-30}{4,-20}" -f "Username", "UID", "GID", "Home Directory", "Shell"

# Écrire l'en-tête dans le fichier
$header | Out-File -FilePath $outputFile
$divider | Out-File -FilePath $outputFile -Append
$columns | Out-File -FilePath $outputFile -Append
$divider | Out-File -FilePath $outputFile -Append

# Récupérer les informations des utilisateurs et les enregistrer dans le fichier
Get-LocalUser | ForEach-Object {
    $username = $_.Name
    $uid = $_.SID.Value
    $gid = $_.SID.AccountDomainSid.Value
    $homeDir = $_.HomeDirectory
    $shell = "N/A"  # PowerShell ne fournit pas directement le shell, donc on laisse "N/A" ici.

    $userInfo = "{0,-20}{1,-10}{2,-10}{3,-30}{4,-20}" -f $username, $uid, $gid, $homeDir, $shell
    $userInfo | Out-File -FilePath $outputFile -Append
}

# Confirmation
Write-Host "L'audit a été enregistré dans le fichier '$outputFile'."
