$packageName = 'mkcert'
$url = 'https://github.com/FiloSottile/mkcert/releases/download/v1.2.0/mkcert-v1.2.0-windows-amd64.exe'
$url64 = $url
$checksum = 'd4e8cdd9327fb0532d1afe465b982ab763b742af9fca31220d4e884069cec269'
$checksum64 = $checksum
$checksumType = 'sha256'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\mkcert.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile `
  -PackageName    $packageName `
  -FileFullPath   $file `
  -Url            $url `
  -Url64bit       $url64 `
  -Checksum       $checksum `
  -Checksum64     $checksum64 `
  -ChecksumType   $checksumType `
  -ChecksumType64 $checksumType64
