Add-Type -AssemblyName System.Windows.Forms

# Créer la fenêtre principale
$form = New-Object System.Windows.Forms.Form
$form.Text = "Advanced System Maintenance Suite"
$form.Size = New-Object System.Drawing.Size(500, 600)
$form.StartPosition = "CenterScreen"

# Add a label for feedback (must be defined before Start-Batch)
$lblStatus = New-Object System.Windows.Forms.Label
$lblStatus.Text = "Ready."
$lblStatus.Size = New-Object System.Drawing.Size(480, 30)
$lblStatus.Location = New-Object System.Drawing.Point(10, 560)
$lblStatus.ForeColor = 'DarkGreen'

# Fonction utilitaire pour lancer un batch en admin
function Start-Batch {
    param($batch)
    $result = [System.Windows.Forms.MessageBox]::Show("Do you want to run: $batch?", "Confirm", 'YesNo', 'Question')
    if ($result -eq 'Yes') {
        try {
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $batch" -Verb RunAs
            $lblStatus.Invoke([Action] { $lblStatus.Text = "Launched: $batch" })
        }
        catch {
            $lblStatus.Invoke([Action] { $lblStatus.Text = "Failed to launch: $batch" })
        }
    }
    else {
        $lblStatus.Invoke([Action] { $lblStatus.Text = "Cancelled: $batch" })
    }
}

# Boutons principaux
$btnCleanup = New-Object System.Windows.Forms.Button
$btnCleanup.Text = "Nettoyage Système"
$btnCleanup.Size = New-Object System.Drawing.Size(200, 40)
$btnCleanup.Location = New-Object System.Drawing.Point(150, 110)
$btnCleanup.Add_Click({ Start-Batch "advanced-tools\\quick-cleanup.bat" })

$btnOptim = New-Object System.Windows.Forms.Button
$btnOptim.Text = "Optimisation Performance"
$btnOptim.Size = New-Object System.Drawing.Size(200, 40)
$btnOptim.Location = New-Object System.Drawing.Point(150, 170)
$btnOptim.Add_Click({ Start-Batch "advanced-tools\\advanced-opt.bat" })

$btnSecurity = New-Object System.Windows.Forms.Button
$btnSecurity.Text = "Sécurité & Pare-feu"
$btnSecurity.Size = New-Object System.Drawing.Size(200, 40)
$btnSecurity.Location = New-Object System.Drawing.Point(150, 230)
$btnSecurity.Add_Click({ Start-Batch "advanced-tools\\firewall-config.bat" })

$btnInfo = New-Object System.Windows.Forms.Button
$btnInfo.Text = "Infos Système"
$btnInfo.Size = New-Object System.Drawing.Size(200, 40)
$btnInfo.Location = New-Object System.Drawing.Point(150, 290)
$btnInfo.Add_Click({ Start-Batch "advanced-tools\\system-overview.bat" })

$btnBackup = New-Object System.Windows.Forms.Button
$btnBackup.Text = "Backup Documents"
$btnBackup.Size = New-Object System.Drawing.Size(200, 40)
$btnBackup.Location = New-Object System.Drawing.Point(150, 350)
$btnBackup.Add_Click({ Start-Batch "advanced-tools\\file-backup.bat" })

$btnSystemInfo = New-Object System.Windows.Forms.Button
$btnSystemInfo.Text = "Export System Report"
$btnSystemInfo.Size = New-Object System.Drawing.Size(200, 40)
$btnSystemInfo.Location = New-Object System.Drawing.Point(150, 410)
$btnSystemInfo.Add_Click({ Start-Batch "advanced-tools\\export-system-report.bat" })

$btnFeature = New-Object System.Windows.Forms.Button
$btnFeature.Text = "Windows Features"
$btnFeature.Size = New-Object System.Drawing.Size(200, 40)
$btnFeature.Location = New-Object System.Drawing.Point(150, 470)
$btnFeature.Add_Click({ Start-Batch "advanced-tools\\feature-manager.bat" })

$btnExit = New-Object System.Windows.Forms.Button
$btnExit.Text = "Quitter"
$btnExit.Size = New-Object System.Drawing.Size(200, 40)
$btnExit.Location = New-Object System.Drawing.Point(150, 520)
$btnExit.Add_Click({ $form.Close() })

# Add an About button
$btnAbout = New-Object System.Windows.Forms.Button
$btnAbout.Text = "About"
$btnAbout.Size = New-Object System.Drawing.Size(90, 30)
$btnAbout.Location = New-Object System.Drawing.Point(10, 10)
$btnAbout.Add_Click({
        [System.Windows.Forms.MessageBox]::Show(@"
Abdelhakim Baalla
Full-stack web developer
Agadir, Morocco

Passionate about Clean Architecture, Performance Optimization, and User Experience.

GitHub: Abdelhakim-Baalla
Dev.to: abdelhakim_baalla

Notable projects:
- LkhadmaConnect
- Mahsoul
- Knowtribe
- HackGo

Education: YouCode Maroc, Simplon UM6P
"@, "About the Author", 'OK', 'Information')
    })

# Redesign: Add a title label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Advanced System Maintenance Suite"
$titleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 16, [System.Drawing.FontStyle]::Bold)
$titleLabel.Size = New-Object System.Drawing.Size(480, 40)
$titleLabel.Location = New-Object System.Drawing.Point(10, 50)
$titleLabel.TextAlign = 'MiddleCenter'

# Move all buttons down to make space for the title and About
$btnCleanup.Location = New-Object System.Drawing.Point(150, 110)
$btnOptim.Location = New-Object System.Drawing.Point(150, 170)
$btnSecurity.Location = New-Object System.Drawing.Point(150, 230)
$btnInfo.Location = New-Object System.Drawing.Point(150, 290)
$btnBackup.Location = New-Object System.Drawing.Point(150, 350)
$btnSystemInfo.Location = New-Object System.Drawing.Point(150, 410)
$btnFeature.Location = New-Object System.Drawing.Point(150, 470)
$btnExit.Location = New-Object System.Drawing.Point(150, 520)
$lblStatus.Location = New-Object System.Drawing.Point(10, 560)

# Change button texts to English
$btnCleanup.Text = "System Cleanup"
$btnOptim.Text = "Performance Optimization"
$btnSecurity.Text = "Security & Firewall"
$btnInfo.Text = "System Info"
$btnExit.Text = "Exit"

# Set background color and icon if available
$form.BackColor = [System.Drawing.Color]::FromArgb(245, 247, 250)
$iconPath = Join-Path $PSScriptRoot 'images\\icone.ico'
if (Test-Path $iconPath) {
    $form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($iconPath)
}

# Add all controls to the form
$form.Controls.Clear()
$form.Controls.AddRange(@(
        $btnAbout, $titleLabel, $btnCleanup, $btnOptim, $btnSecurity, $btnInfo, $btnBackup, $btnSystemInfo, $btnFeature, $btnExit, $lblStatus
    ))

# Afficher la fenêtre
[void]$form.ShowDialog()