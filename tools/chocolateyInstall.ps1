$packageName = 'mkcert'
$url = 'https://github.com/FiloSottile/mkcert/releases/download/v1.1.0/mkcert-v1.1.0-windows-amd64.exe'
$url64 = $url
$checksum = 'd445822464cfccb3ce2cd3f3c52949ea142500ae4b9eca0b5f4c540c93370c84'
$checksum64 = $checksum
$checksumType = 'sha256'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\mkcert.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile $packageName $file $url $url64 $checksum $checksum64 $checksumType $checksumType64
