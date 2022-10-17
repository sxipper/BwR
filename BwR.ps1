## Version 0.9.9
## Created by: Ankith Mankunnu
## Backup Files to external drive using Robocopy or other options.
## Usage: Call the script from PS console or IDE.
##        .\BwR.ps1
##        .\BwR.ps1 -Source <path> -Destination <path>

[CmdletBinding()]
Param (
    [Parameter( Mandatory = $true )]
    [ValidateNotNullOrEmpty()]
    [string]$Source,
    [Parameter( Mandatory = $true )]
    [ValidateNotNullOrEmpty()]
    [string]$Destination,
    [ValidateSet('Robocopy', 'AzCopy')]
    [string]$Operation = 'Robocopy'
)

switch ($Operation)
{
    'Robocopy'
    {
        $date = Get-Date -f ddMMyyHHmmss
        if (($source | Test-path -PathType Any) -or ($destination | Test-path -PathType Any))
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
    'AzCopy'
    {
        Clear-Host
        Write-Host "Coming soon!!" -ForegroundColor Yellow
    }
    Default 
    {
        Clear-Host
        Write-Host "Wrong Operation" -ForegroundColor Red
        Start-Sleep -Seconds 5
    }
}
