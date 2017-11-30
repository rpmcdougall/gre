# PSFileUtils Powershell Module

This Powershell Module is designed to contain commonly used functions to inspect a local Windows system or remote SMB share.

Currently it contains the Get-FileListJSON function. This function takes input of a specified mountpoint and recursively gets the directory contents and outputs the name of the files and the size of the files in bytes. The output is presented in JSON format.

##Installation
-Create a module folder in the default powershell modules directory
```
From Administrator Powershell session...
mkdir $PSHome\Modules\PSFileUtils
```

-Import the module

```
Import-Module PSFileUtils
```


##Using Get-FileListJSON

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
