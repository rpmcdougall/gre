
##Pester Tests##

Import-Module .\psfileutils.psm1

#Basic test for expected behavior
Describe 'Get-FileListJSON' {
    #Default behavior
    It "Given no parameters, should run against current directory..." {
        $test = Get-FileListJSON
        $test | Should -Be $true
    }

    #Making sure cleanup of PSDrive is occuring properly
    It "When Completed no PSDrive named tempInspect should be present" {
        Get-FileListJSON
        $test = Get-PSDrive * | Select Name | Where {$_.Name -eq "tempInspect"}
        $test | Should -Be $null
    }

    #Making sure script is terminating properly and throwing error with invalid input
    It "Given a invalid argument should terminate the script and throw error" {
        {Get-FileListJSON -mountpoint ThisArgumentIsInvalid } | Should -Throw
    }

    #Verifying valid input in the form of directory path results no errors. Platform agnostic test.
    It "Given valid input, no errors should be thrown" {
        $pwd = pwd
        {Get-FileListJSON -mountpoint $pwd} | Should -Not -Throw
    }

}
