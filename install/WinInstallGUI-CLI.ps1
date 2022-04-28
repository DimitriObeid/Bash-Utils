Add-Type -assembly System.Windows.Forms

Function Get-Folder($initialDirectory="")

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'Bash Utils : CLI and GUI installer for Windows'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true
$main_form.ShowDialog()

$browser = New-Object System.Windows.Forms.FolderBrowserDialog
$a = Get-Folder