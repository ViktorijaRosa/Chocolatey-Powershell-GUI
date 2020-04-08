Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationFramework


[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Install Package"
$Button1.width                   = 68
$Button1.height                  = 40
$Button1.location                = New-Object System.Drawing.Point(200,95)
$Button1.Font                    = 'Microsoft Sans Serif,10'
$Button1.Add_Click({
            $x = $TextBox1.Text
            $TextBox2.Text = choco install $x
            [System.Windows.MessageBox]::Show('Package installed: ' +$x)
})

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Remove Package"
$Button3.width                   = 68
$Button3.height                  = 40
$Button3.location                = New-Object System.Drawing.Point(130,95)
$Button3.Font                    = 'Microsoft Sans Serif,10'
$Button3.Add_Click({
            $x = $TextBox1.Text
            $TextBox2.Text = choco uninstall $x
            [System.Windows.MessageBox]::Show('Package removed: ' +$x)
})


$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Upgrade all"
$Button1.width                   = 68
$Button1.height                  = 40
$Button2.location                = New-Object System.Drawing.Point(175,302)
$Button2.Font                    = 'Microsoft Sans Serif,10'
$Button2.Add_Click({
            $TextBox2.Text = choco upgrade all
            [System.Windows.MessageBox]::Show('All packages have been updated')
})

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 100
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(149,49)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'


$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $true
$TextBox2.width                  = 216
$TextBox2.height                 = 140
$TextBox2.location               = New-Object System.Drawing.Point(94,160)
$TextBox2.Font                   = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($Button1,$Button2,$TextBox1,$TextBox2,$Button3))


$result = $form.ShowDialog()
