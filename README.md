# PSFileUtils Powershell Module

This Powershell Module is designed to contain commonly used functions to inspect a local Windows system or remote SMB share.

Currently it contains the Get-FileListJSON function. This function takes input of a specified mountpoint and recursively gets the directory contents and outputs the name of the files and the size of the files in bytes. The output is presented in JSON format.

## Installation

For a more permanent installation...
- Create a module folder in the default powershell modules directory
```
From Administrator Powershell session...
mkdir $PSHome\Modules\PSFileUtils
```

- Import the module

```
Import-Module PSFileUtils
```
For testing
- Import the module from any local location
```
Import-Module <Path to Module>/psfileutils.psm1

ex. Import-Module F:/MyModules/psfileutils.psm1
```

## Using Get-FileListJSON

```
Get-FileListJSON -mountpoint <valid local windows path or SMB share>

Example output...
Get-FileListJSON -mountpoint C:\go
[
    {
        "FileName":  "C:\\Go\\AUTHORS",
        "SizeBytes":  41258
    },
    {
        "FileName":  "C:\\Go\\CONTRIBUTING.md",
        "SizeBytes":  1576
    },
    {
        "FileName":  "C:\\Go\\CONTRIBUTORS",
        "SizeBytes":  55577
    },
    {
        "FileName":  "C:\\Go\\favicon.ico",
        "SizeBytes":  5686
    },
   .
   .
   .
]
```


# Unit Testing

Pester is installed by default on Windows 10. Other installation methods can be found here: https://github.com/pester/Pester
Supported on Windows, MacOS, Linux

To perform unit tests when developing on this project run the following assuming psfileutils.Tests.ps1 is located in the same directory as psfileutils.psm1

- Update Pester (from admin powershell session)
```
 Install-Module -Name Pester -Force -SkipPublisherCheck
```
- To run tests from Tests file location

```
Invoke-Pester
```

Example Test Output

```
Executing all tests in 'c:\Users\rpmcd\Documents\dev\gre\psfileutils.Tests.ps1' matching test name Get-FileListJSON

Executing script c:\Users\rpmcd\Documents\dev\gre\psfileutils.Tests.ps1

  Describing Get-FileListJSON
    [+] Given no parameters, should run against current directory... 920ms
    [+] When Completed no PSDrive named tempInspect should be present 140ms
Failed to add mountpoint as temporary PSDrive. Mount point is invalid or unavailable. Terminating
    [+] Given a invalid argument should terminate the script and throw error 80ms
    [+] Given valid input, no errors should be thrown 26ms
Tests completed in 1.17s
Tests Passed: 4, Failed: 0, Skipped: 0, Pending: 0, Inconclusive: 0
```

