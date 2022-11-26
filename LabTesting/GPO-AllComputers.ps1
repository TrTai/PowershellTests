Start-Transcript -Path "C:\temp\gpresultlog.txt" 
$AllComputers= Get-adcomputer -filt *
#Want to Do inline cred for remote ps, works great while accessing via desktop
$cred= Get-Credential #insert Domain and U/N
$session= New-PSSession -cn  $AllComputers.name -cred $cred
icm -Session $session -ScriptBlock {gpresult /scope:computer /r}
Stop-Transcript
