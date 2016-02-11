$packageName = 'spacesniffer' # arbitrary name for the package, used in messages
$url = 'https://dl.dropboxusercontent.com/u/9319413/soft/x32/spacesniffer-1.3.0.0.zip' # download url
$pclocation = $env:ProgramFiles+"\smalltools\"+$packageName

Install-ChocolateyZipPackage $packageName $url $pclocation
