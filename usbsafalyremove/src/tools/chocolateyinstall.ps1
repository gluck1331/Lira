$packageName = 'USBSafelyRemove'
$installerType = 'exe'
$url = 'https://dl.dropboxusercontent.com/u/9319413/soft/x32/USBSafelyRemove-v5.2.4.1215.zip'
$silentArgs = '/S /RU'
$validExitCodes = @(0)

$chocTempDir = Join-Path $env:TEMP "chocolatey"
$tempDir = Join-Path $chocTempDir "$packageName"
$tempDir = Join-Path $tempDir "unzip"
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

Install-ChocolateyZipPackage "$packageName" "$url" "$tempDir"
$exeFilePath = get-childitem $tempDir -recurse -include *.$installerType | select -First 1
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$exeFilePath"

