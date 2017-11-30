
##Pester Tests##

Import-Module .\psfileutils.psm1

Describe 'Get-FileListJSON' {
    It "Given no parameters, should run against current directory..." {
        $test = Get-FileListJSON
        $test | Should -Be $true
    }

    It "When Completed no PSDrive named tempInspect should be present" {
        Get-FileListJSON
        $test = Get-PSDrive * | Select Name | Where {$_.Name -eq "tempInspect"}
        $test | Should -Be $null
    }

    It "Given a invalid argument should terminate the script and throw error" {
        {Get-FileListJSON -mountpoint ThisArgumentIsInvalid } | Should -Throw
    }

}
