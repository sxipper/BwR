## Version 0.1
## Backup Files to external drive using Robocopy
## ChangeLog:

$date=$null
$date = Get-Date -f ddMMyyyyTHHmmss
robocopy 'C:\Users\ankith.m\Downloads\' 'G:\Ankith\Work\Downloads\' /E /XO > G:\Ankith\Work\Logs\robocopylog"$date".txt

$date = $null
$date = Get-Date -f ddMMyyyyTHHmmss
robocopy 'C:\_D Drive\' 'G:\Ankith\Work\_D Drive\' /E /XO > G:\Ankith\Work\Logs\robocopylog"$date".txt