function Approve-lang {
<#
.SYNOPSIS
Approve-lang.psm1
This script is part of the BStarkIT PowerShell module collection.
It is designed to check for non-ASCII characters in PowerShell scripts within the current directory.
.DESCRIPTION
A Script to check for non-ASCII characters in PowerShell scripts.
.NOTES
Script written by: Brian Stark
Date: 17/12/2024
Modified by:
Date:
Version: 1.0
.COMPONENT
PowerShell Version 5
.PARAMETER None
.INPUTS
This script does not take any input parameters.
.OUTPUTS
The script outputs a message indicating whether each PowerShell script in the current directory contains non-ASCII characters or not.
.EXAMPLE
Approve-lang
This command will check all PowerShell scripts in the current directory for non-ASCII characters and output the results.
.LINK
Scripts can be found at: https://github.com/BStarkIT
#>

    $filelist = Get-ChildItem -path $pwd -Filter *.ps1
    foreach ($file in $filelist) {
        $Bad = Get-Content $file  | Where-Object { $_ -cmatch '\P{IsBasicLatin}' } # | Select-String
        if ($bad.Length -gt 0) {
            Write-Host "$file Has $Bad"
        }
        else {
            Write-host "$file OK"
        }
    }
}