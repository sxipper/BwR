## Version 0.9
## Created by: Ankith Mankunnu
## Backup Files to external drive using Robocopy or other options.
## Usage: Call the script from PS console or IDE.

Write-Host = "Select your operation"
Write-Host = "1. Robocopy"
Write-Host = "2. AzCopy"
Write-Host = "0. Clear/Exit"
[Int16]$choice = Read-Host -Prompt "Please enter your choice. `n" 

switch ($choice) 
{
    1
    {
        $date = $null
        $date = Get-Date -f ddMMyyyyTHHmmss
        $source = Read-Host -Prompt 'Source location'
        $destination = Read-Host -Prompt 'Destination location'
            if ([string]::IsNullOrEmpty($source) -or [string]::IsNullOrEmpty($destination) -or [string]::IsNullOrWhiteSpace($source) -or [string]::IsNullOrWhiteSpace($destination))
            {
                Write-Host "Source or Destination is empty" -ForegroundColor Red
                Start-Sleep -Seconds 3
                Clear-Host
            }
            else
            {
                [string]$log = $destination + "\robocopylog" + $date + ".log"
                New-Item $log -ItemType File -Force -Verbose | Out-Null
                robocopy $source $destination /E /XO /LOG:$log /TEE
                Write-Host "Copy completed, Check $log for any issue." -ForegroundColor Green
            }
    }
    2
    {Write-Host = "Coming soon"}
    0
    {Clear-Host}
    Default 
    {Write-Host = "Wrong Operation"}
}
