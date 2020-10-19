## Version 0.1
## Created by: Ankith Mankunnu
## Backup Files to external drive using Robocopy
## Usage: robocopy 'C:\_Work\' 'G:\Backup\' /E /XO > G:\Backup\robocopylog"$date".txt
## ChangeLog: 1. Added to GIT HUB.
##            2. Testing Write_progress.
##            3. Removed hardcoded source and destination.
$date=$null
$date = Get-Date -f ddMMyyyyTHHmmss
robocopy 'Source' 'Destination' /E /XO > LogfileLocation"$date".txt
Write-Progress -Activity "Robocopy"

$date = $null
$date = Get-Date -f ddMMyyyyTHHmmss
robocopy 'Source' 'Destination' /E /XO > LogfileLocation"$date".txt
Write-Progress -Activity "Robocopy"