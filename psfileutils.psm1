function Get-FileListJSON {
param(
   [string]$mountpoint
{
    #Fetch directory listing into variable use error checking if mount is unavailable or invalid

    #For each item in mount point, create custom psobjects containing properties
    #for the filepath and file size in bytes and accumulate them into array

    #Serialize and write out json

}