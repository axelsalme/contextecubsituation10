#----------------------------------------
#NAME : exerciceAUDIT.ps1
#AUTHOR : SALME Axel
#DATE : 12/03/2025
#----------------------------------------

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form = New-Object System.Windows.Forms.Form
$Form.ClientSize = '500,500'
$Form.Text = "Mon UI en PS ep. II"
$Form.FormBorderStyle = 'Fixed3D'
$Form.MaximizeBox = $False


$Menu = New-Object System.Windows.Forms.MenuStrip
$Menu.Location = New-Object System.Drawing.Point(0,0)
$Menu.ShowItemToolTips = $True

$Form.Controls.Add($Menu)

$MenuFile = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuFile.Text = "&Fichier"
$MenuAudit = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuAudit.Text = "&Menu audit"
$MenuAbout = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuAbout.Text = "&A propos"
$MenuFileQuit = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuFileQuit.Text = "&Quitter"

$MenuFile.DropDownItems.Add($MenuFileQuit)$Menu.Items.AddRange(@($MenuFile,$MenuAudit,$MenuAbout))

$MenuFileQuit.Add_Click({
$Form.Close()
})


$LabelService = New-Object System.Windows.Forms.Label
$LabelService.Location = New-Object System.Drawing.Point(40,70)
$LabelService.AutoSize = $true

$LabelDHCP = New-Object System.Windows.Forms.Label
$LabelDHCP.Location = New-Object System.Drawing.Point(300,70)
$LabelDHCP.AutoSize = $true

$LabelDNS = New-Object System.Windows.Forms.Label
$LabelDNS.Location = New-Object System.Drawing.Point(300,70)
$LabelDNS.AutoSize = $true

$LabelAD = New-Object System.Windows.Forms.Label
$LabelAD.Location = New-Object System.Drawing.Point(300,70)
$LabelAD.AutoSize = $true

$Form.controls.AddRange(@($LabelService,$LabelDHCP,$LabelDNS,$LabelAD))


$BoutonService = New-Object System.Windows.Forms.Button
$BoutonService.Location = New-Object System.Drawing.Point(45,125)
$BoutonService.Width = 125
$BoutonService.Text = "Cliquez-moi !"

$BoutonDHCP = New-Object System.Windows.Forms.Button
$BoutonDHCP.Location = New-Object System.Drawing.Point(280,125)
$BoutonDHCP.Width = 125
$BoutonDHCP.Text = "Cliquez-moi !"

$BoutonDNS = New-Object System.Windows.Forms.Button
$BoutonDNS.Location = New-Object System.Drawing.Point(45,360)
$BoutonDNS.Width = 125
$BoutonDNS.Text = "Cliquez-moi !"

$BoutonAD = New-Object System.Windows.Forms.Button
$BoutonAD.Location = New-Object System.Drawing.Point(280,360)
$BoutonAD.Width = 125
$BoutonAD.Text = "Cliquez-moi !"

$Form.controls.AddRange(@($BoutonService,$BoutonDHCP,$BoutonDNS,$BoutonAD))


$GroupBoxService = New-Object System.Windows.Forms.GroupBox
$GroupBoxService.Location = New-Object System.Drawing.Point(20,35)
$GroupBoxService.Width = 180
$GroupBoxService.Height = 220
$GroupBoxService.Text = "Audit Services"

$GroupBoxDHCP = New-Object System.Windows.Forms.GroupBox
$GroupBoxDHCP.Location = New-Object System.Drawing.Point(250,35)
$GroupBoxDHCP.Width = 180
$GroupBoxDHCP.Height = 220
$GroupBoxDHCP.Text = "Audit DHCP"

$GroupBoxDNS = New-Object System.Windows.Forms.GroupBox
$GroupBoxDNS.Location = New-Object System.Drawing.Point(20,265)
$GroupBoxDNS.Width = 180
$GroupBoxDNS.Height = 220
$GroupBoxDNS.Text = "Audit DNS"

$GroupBoxAD = New-Object System.Windows.Forms.GroupBox
$GroupBoxAD.Location = New-Object System.Drawing.Point(250,265)
$GroupBoxAD.Width = 180
$GroupBoxAD.Height = 220
$GroupBoxAD.Text = "Audit AD"

$Form.controls.AddRange(@($GroupBoxService,$GroupBoxDHCP,$GroupBoxDNS,$GroupBoxAD))


$BoutonService.Add_Click({
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"C:\contextecubsituation10\exerciceAUDIT1services.ps1`"" -WindowStyle Hidden
})

$BoutonDHCP.Add_Click({
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"C:\contextecubsituation10\exerciceAUDIT2dhcp.ps1`"" -WindowStyle Hidden
})

$BoutonDNS.Add_Click({
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"C:\contextecubsituation10\exerciceAUDIT3dns.ps1`"" -WindowStyle Hidden
})

$BoutonAD.Add_Click({
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"C:\contextecubsituation10\exerciceAUDIT4ad.ps1`"" -WindowStyle Hidden
})


$Form.ShowDialog()



