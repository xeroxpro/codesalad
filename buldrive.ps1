$net = $(New-Object -comobject WScript.Network)

$output = foreach($driveLetter in Get-WMIObject -query "Select * From Win32_LogicalDisk")
{
  $drivem = $driveLetter.ProviderName 
  $file = "C:\Users\Public\Ortak Movie\deneme.exe"
      & $file $drivem  
      
} 

$output > "C:\test.txt"