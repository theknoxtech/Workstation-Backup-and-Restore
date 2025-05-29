$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.TabControl]$TabControl1 = $null
[System.Windows.Forms.TabPage]$TabPage1 = $null
[System.Windows.Forms.TabPage]$TabPage2 = $null
function InitializeComponent
{
$TabControl1 = (New-Object -TypeName System.Windows.Forms.TabControl)
$TabPage1 = (New-Object -TypeName System.Windows.Forms.TabPage)
$TabPage2 = (New-Object -TypeName System.Windows.Forms.TabPage)
$TabControl1.SuspendLayout()
$Form1.SuspendLayout()
#
#TabControl1
#
$TabControl1.Controls.Add($TabPage1)
$TabControl1.Controls.Add($TabPage2)
$TabControl1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
$TabControl1.Name = [System.String]'TabControl1'
$TabControl1.SelectedIndex = [System.Int32]0
$TabControl1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]433,[System.Int32]87))
$TabControl1.TabIndex = [System.Int32]0
#
#TabPage1
#
$TabPage1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]4,[System.Int32]22))
$TabPage1.Name = [System.String]'TabPage1'
$TabPage1.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]3))
$TabPage1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]425,[System.Int32]61))
$TabPage1.TabIndex = [System.Int32]0
$TabPage1.Text = [System.String]'Backup'
$TabPage1.UseVisualStyleBackColor = $true
#
#TabPage2
#
$TabPage2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]4,[System.Int32]22))
$TabPage2.Name = [System.String]'TabPage2'
$TabPage2.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]3))
$TabPage2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]425,[System.Int32]61))
$TabPage2.TabIndex = [System.Int32]1
$TabPage2.Text = [System.String]'Restore'
$TabPage2.UseVisualStyleBackColor = $true
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]457,[System.Int32]421))
$Form1.Controls.Add($TabControl1)
$Form1.Text = [System.String]'Form1'
$TabControl1.ResumeLayout($false)
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name TabControl1 -Value $TabControl1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TabPage1 -Value $TabPage1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TabPage2 -Value $TabPage2 -MemberType NoteProperty
}
. InitializeComponent
