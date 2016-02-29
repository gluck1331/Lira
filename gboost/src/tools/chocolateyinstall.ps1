$packageName = 'gboost' # arbitrary name for the package, used in messages
$installerType = 'exe'
$url = 'https://dl.dropboxusercontent.com/u/9319413/soft/x32/gboost-1.0.3.0.zip' # download url
$pclocation = $env:ProgramFiles+"\smalltools\"+$packageName
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

Install-ChocolateyZipPackage $packageName $url $pclocation $silentArgs

$exeFilePath = get-childitem $pclocation -recurse -include *.$installerType | select -First 1
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$exeFilePath"

new-item "$env:USERPROFILE\AppData\Local\LiveGBoost" -type directory

Copy-Item $pclocation\DownloadList.boost -Destination $env:USERPROFILE\AppData\Local\LiveGBoost