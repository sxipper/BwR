## Version 0.9.9
## Created by: Ankith Mankunnu
## Backup Files to external drive using Robocopy or other options.
## Usage: Call the script from PS console or IDE.
##        .\BwR.ps1

Write-Host = "Select your operation"
Write-Host = "1. Robocopy"
Write-Host = "2. AzCopy"
Write-Host = "0. Clear/Exit"
$choice = Read-Host "Please enter your choice. `n" 
if ($choice -match '^[0-9]+$')
{
    switch ($choice) 
    {
        1
        {
            $date = Get-Date -f ddMMyyHHmmss
            $source = Read-Host 'Source location'
            $destination = Read-Host 'Destination location'
            if ([string]::IsNullOrEmpty($source) -or [string]::IsNullOrEmpty($destination) -or [string]::IsNullOrWhiteSpace($source) -or [string]::IsNullOrWhiteSpace($destination))
            {
                Clear-Host
                Write-Host "Source or Destination is empty" -ForegroundColor Red
                Start-Sleep -Seconds 5
            }
            elseif (($source | Test-path -PathType Any) -or ($destination | Test-path -PathType Any))
            {
                [string]$log = $destination + "\RobocopyLog" + $date + ".log"
                New-Item $log -ItemType File -Force | Out-Null
                robocopy $source $destination /E /XO /MT /LOG:$log /TEE
                Write-Host "Copy completed, Check $log for any issue." -ForegroundColor Green
            }
            else
            {
                Clear-Host
                Write-Host "Path entered could be wrong" -ForegroundColor Red
                Start-Sleep -Seconds 5
            }
        }
        2
        {
            Clear-Host
            Write-Host "Coming soon!!" -ForegroundColor Yellow
        }
        0
        {
            Clear-Host
            Write-Host "Clearing screen" -ForegroundColor Yellow
            Start-Sleep -Seconds 5
        }
        Default 
        {
            Clear-Host
            Write-Host "Wrong Operation" -ForegroundColor Red
            Start-Sleep -Seconds 5
        }
    }
}
else
{
    Clear-Host
    Write-Host "Invalid Choice!!" -ForegroundColor DarkRed
}