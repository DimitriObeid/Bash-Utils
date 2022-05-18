Add-Type -assembly System.Windows.Forms


Function Get-FixedDisk {
    [CmdletBinding()]
    # This param() block indicates the start of parameters declaration
    param (
        <#
            This parameter accepts the name of the target computer.
            It is also set to mandatory so that the function does not execute without specifying the value.
        #>
        [Parameter(Mandatory)]
        [string]$Computer
    )
    <#
        WMI query command which gets the list of all logical disks and saves the results to a variable named $DiskInfo
    #>
    $DiskInfo = Get-WmiObject Win32_LogicalDisk -ComputerName $Computer -Filter 'DriveType=3'
   $DiskInfo
}

Function Get-Folder($initialDirectory="%USERPROFILE%")
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