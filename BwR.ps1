## Version 0.8
## Created by: Ankith Mankunnu
## Backup Files to external drive using Robocopy
## Usage: Call the script from PS console or IDE.

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
        [string]$log = $destination + "\robocopylog" + $date + ".log"
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