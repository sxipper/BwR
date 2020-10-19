## Version 0.1
## Backup Files to external drive using Robocopy
## ChangeLog: 1. Added to GIT HUB.
##            2. Testing Write_progress.
##            3. Removed hardcoded source and destination.
$date=$null
$date = Get-Date -f ddMMyyyyTHHmmss
robocopy 'Source' 'Destination' /E /XO > G:\Ankith\Work\Logs\robocopylog"$date".txt
Write-Progress -Activity "Robocopy"

$date = $null
$date = Get-Date -f ddMMyyyyTHHmmss
robocopy 'Source' 'Destination' /E /XO > G:\Ankith\Work\Logs\robocopylog"$date".txt
Write-Progress -Activity "Robocopy"