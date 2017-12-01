function Get-FileListJSON {
param(
   [string]$mountpoint
)
    #Set error handling preference to Stop on thrown error.
    $ErrorActionPreference = "Stop"
   
    
     #Connect mount point as PSDrive to work with local and network mounts (SMB)
    Try{
        $psDrive = New-PSDrive -Name tempInspect -PSProvider FileSystem -Root $mountPoint -Description "Temporary mounting path for PSFileUtils Get-FileListJSON"
    }
    Catch{
        Write-Host "Failed to add mountpoint as temporary PSDrive. Mount point is invalid or unavailable. Terminating"
    }
    
    #Fetch directory listing into variable use error checking if mount is unavailable or invalid
    #Get-Childitem defaults to bytes
    $fileList = Get-ChildItem tempInspect: -recurse 
    
    
    $fileObjects = @()

    #For each item in mount point, create custom psobjects containing properties
    foreach($file in $fileList) {
        #Check to see if current item is a file or directory as Get-ChildItem -recurse includes directories
        if($file.PSIsContainer -eq $false){
            $currentFile = New-Object PSObject
            $currentFile | Add-Member -MemberType NoteProperty -Name FileName -Value $file.FullName
            $currentFile | Add-Member -MemberType NoteProperty -Name SizeBytes -Value $file.Length

            #Accumulate into array
            $fileObjects += $currentFile
        }
    }

    #Serialize and write out json
    $fileObjects | ConvertTo-JSON
    
    #Cleanup temp PSDrive
    Try {
        Remove-PSDrive $psDrive
    }
    Catch {
        Write-Host "Failed to remove PSDrive."
    }
}

