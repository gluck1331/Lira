$packageName = 'BulkRenameUtility'
$installerType = 'exe'
$url = 'https://dl.dropboxusercontent.com/u/9319413/soft/x32/BRU-3.0.0.1.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes
