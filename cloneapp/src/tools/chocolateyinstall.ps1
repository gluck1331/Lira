$packageName = 'cloneapp' # arbitrary name for the package, used in messages
$url = 'https://dl.dropboxusercontent.com/u/9319413/soft/x32/cloneapp-1.12.642.zip' # download url
$pclocation = $env:ProgramFiles+"\smalltools\"+$packageName

Install-ChocolateyZipPackage $packageName $url $pclocation
