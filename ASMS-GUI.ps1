Add-Type -AssemblyName System.Windows.Forms

# Créer la fenêtre principale
$form = New-Object System.Windows.Forms.Form
$form.Text = "Advanced System Maintenance Suite"
$form.Size = New-Object System.Drawing.Size(500, 600)
$form.StartPosition = "CenterScreen"

# Fonction utilitaire pour lancer un batch en admin
function Start-Batch {
    param($batch)
    $result = [System.Windows.Forms.MessageBox]::Show("Do you want to run: $batch?", "Confirm", 'YesNo', 'Question')
    if ($result -eq 'Yes') {
        try {
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $batch" -Verb RunAs
            $lblStatus.Text = "Launched: $batch"
        }
        catch {
            $lblStatus.Text = "Failed to launch: $batch"
        }
    }
    else {
        $lblStatus.Text = "Cancelled: $batch"
    }
}

# Boutons principaux
$btnCleanup = New-Object System.Windows.Forms.Button
$btnCleanup.Text = "Nettoyage Système"
$btnCleanup.Size = New-Object System.Drawing.Size(200, 40)
$btnCleanup.Location = New-Object System.Drawing.Point(150, 50)
$btnCleanup.Add_Click({ Start-Batch "advanced-tools\\quick-cleanup.bat" })

$btnOptim = New-Object System.Windows.Forms.Button
$btnOptim.Text = "Optimisation Performance"
$btnOptim.Size = New-Object System.Drawing.Size(200, 40)
$btnOptim.Location = New-Object System.Drawing.Point(150, 110)
$btnOptim.Add_Click({ Start-Batch "advanced-tools\\advanced-opt.bat" })

$btnSecurity = New-Object System.Windows.Forms.Button
$btnSecurity.Text = "Sécurité & Pare-feu"
$btnSecurity.Size = New-Object System.Drawing.Size(200, 40)
$btnSecurity.Location = New-Object System.Drawing.Point(150, 170)
$btnSecurity.Add_Click({ Start-Batch "advanced-tools\\firewall-config.bat" })

$btnInfo = New-Object System.Windows.Forms.Button
$btnInfo.Text = "Infos Système"
$btnInfo.Size = New-Object System.Drawing.Size(200, 40)
$btnInfo.Location = New-Object System.Drawing.Point(150, 230)
$btnInfo.Add_Click({ Start-Batch "advanced-tools\\system-overview.bat" })

$btnBackup = New-Object System.Windows.Forms.Button
$btnBackup.Text = "Backup Documents"
$btnBackup.Size = New-Object System.Drawing.Size(200, 40)
$btnBackup.Location = New-Object System.Drawing.Point(150, 290)
$btnBackup.Add_Click({ Start-Batch "advanced-tools\\file-backup.bat" })

$btnSystemInfo = New-Object System.Windows.Forms.Button
$btnSystemInfo.Text = "Export System Report"
$btnSystemInfo.Size = New-Object System.Drawing.Size(200, 40)
$btnSystemInfo.Location = New-Object System.Drawing.Point(150, 350)
$btnSystemInfo.Add_Click({ Start-Batch "advanced-tools\\export-system-report.bat" })

$btnFeature = New-Object System.Windows.Forms.Button
$btnFeature.Text = "Windows Features"
$btnFeature.Size = New-Object System.Drawing.Size(200, 40)
$btnFeature.Location = New-Object System.Drawing.Point(150, 410)
$btnFeature.Add_Click({ Start-Batch "advanced-tools\\feature-manager.bat" })

$btnExit = New-Object System.Windows.Forms.Button
$btnExit.Text = "Quitter"
$btnExit.Size = New-Object System.Drawing.Size(200, 40)
$btnExit.Location = New-Object System.Drawing.Point(150, 500)
$btnExit.Add_Click({ $form.Close() })

# Add a label for feedback
$lblStatus = New-Object System.Windows.Forms.Label
$lblStatus.Text = "Ready."
$lblStatus.Size = New-Object System.Drawing.Size(480, 30)
$lblStatus.Location = New-Object System.Drawing.Point(10, 550)
$lblStatus.ForeColor = 'DarkGreen'

# Ajout des boutons à la fenêtre
$form.Controls.AddRange(@(
        $btnCleanup, $btnOptim, $btnSecurity, $btnInfo, $btnBackup, $btnSystemInfo, $btnFeature, $btnExit, $lblStatus
    ))

# Afficher la fenêtre
[void]$form.ShowDialog()