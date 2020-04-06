Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationFramework
#Function 
$Button_Click = 
{
            $x = $TextBox1.Text
            $TextBox2.Text = choco install $x
            [System.Windows.MessageBox]::Show('Package installed: ' +$x)
}
$Button_Click2 = 
{
            $TextBox2.Text = choco upgrade all
            [System.Windows.MessageBox]::Show('All packages have been updated')
}



[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Install Package"
$Button1.width                   = 68
$Button1.height                  = 40
$Button1.location                = New-Object System.Drawing.Point(166,49)
$Button1.Font                    = 'Microsoft Sans Serif,10'
$Button1.Add_Click($Button_Click)

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Upgrade all"
$Button1.width                   = 68
$Button1.height                  = 40
$Button2.location                = New-Object System.Drawing.Point(175,302)
$Button2.Font                    = 'Microsoft Sans Serif,10'
$Button2.Add_Click($Button_Click2)

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 100
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(149,95)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'


$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $true
$TextBox2.width                  = 216
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(94,160)
$TextBox2.Font                   = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($Button1,$Button2,$TextBox1,$TextBox2))


$result = $form.ShowDialog()
