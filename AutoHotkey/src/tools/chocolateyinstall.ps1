$packageName = 'AutoHotkey'
$installerType = 'exe'
$url = 'https://dl.dropboxusercontent.com/u/9319413/soft/x32/AutoHotkey-1.1.23.01.exe'
$silentArgs = ''
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes
