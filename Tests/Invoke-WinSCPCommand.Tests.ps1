#requires -Modules Pester,PSScriptAnalyzer

Set-Location -Path "$env:USERPROFILE\Documents\GitHub\WinSCP"
Import-Module -Name .\WinSCP\WinSCP.psd1 -Force

Get-Process | Where-Object { $_.Name -eq 'WinSCP' } | Stop-Process -Force

Describe 'Invoke-WinSCPCommand' {
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Functions\Invoke-WinSCPCommand.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\WinSCP\Public\Invoke-WinSCPCommand.ps1

        It 'Invoke-ScriptAnalyzer of Invoke-WinSCPCommand results count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}

Remove-Module -Name WinSCP -Force