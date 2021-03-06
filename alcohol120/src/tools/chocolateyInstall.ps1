﻿$packageName = 'alcohol120' # arbitrary name for the package, used in messages
$installerType = 'exe' #only one of these: exe, msi, msu
$url = 'https://dl.dropboxusercontent.com/u/9319413/soft/x32/alcohol120-2.0.2.5830.zip' # download url
$silentArgs = '/S /RU' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
	$chocTempDir = Join-Path $env:TEMP "chocolatey"
    $tempDir = Join-Path $chocTempDir "$packageName"
	$tempDir = Join-Path $tempDir "unzip"
    if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
    
	Install-ChocolateyZipPackage "$packageName" "$url" "$tempDir"
    $exeFilePath = get-childitem $tempDir -recurse -include *.$installerType | select -First 1
    Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$exeFilePath"
    
	Remove-Item "$tempDir" -Recurse
    
    Write-ChocolateySuccess "$packageName"
} catch {
    Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw
}