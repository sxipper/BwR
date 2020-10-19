## Version 0.8
## Created by: Ankith Mankunnu
## Backup Files to external drive using Robocopy
## Usage: 1. Change this line robocopy 'C:\_Work\' 'G:\Backup\' /E /XO > G:\Backup\robocopylog"$date".txt
##        2. Navigate to script location via ps or cmd using cd and do .\BackupFilesandFolders.ps1
## ChangeLog: 1. Added to GIT HUB.
##            2. Testing Write_progress.
##            3. Removed hardcoded source and destination.
##            4. Add user input for Source/Destination location.
##            5. More dynamic now.
##            6. Switch added for multiple operations.
Write-Host = "Select your operation"
Write-Host = "1. Robocopy"
Write-Host = "2. AzCopy"
[Int16]$choice = Read-Host -Prompt "Please enter your choice. `n" 

switch ($choice) 
{
    1
    {
        $date = $null
        $date = Get-Date -f ddMMyyyyTHHmmss
        [string]$source = Read-Host -Prompt 'Source location'
        [string]$destination = Read-Host -Prompt 'Destination location'
        [string]$log = $destination + "\robocopylog" + $date + ".txt"
        robocopy $source $destination /E /XO > $log
        Write-Host "Copy completed, Check logs at $log for any issue."
    }
    2
    {
        Write-Host = "Coming soon"
    }
    Default 
    {
        Write-Host = "Choice is 1 or 2"
    }
}