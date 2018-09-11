$packageName = 'mkcert'
$url = 'https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-windows-amd64.exe'
$url64 = $url
$checksum = '21fa7e25b1a7a6138584107c37a16048cc31e2b1932b78e2d6bf82ccc342bc91'
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
