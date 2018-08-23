$packageName = 'mkcert'
$url = 'https://github.com/FiloSottile/mkcert/releases/download/v1.1.1/mkcert-v1.1.1-windows-amd64.exe'
$url64 = $url
$checksum = 'edc274a5d8b0413699b4b4d5945ec2acd21e711edf30614825fe7f0f5e71f0e9'
$checksum64 = $checksum
$checksumType = 'sha256'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\mkcert.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile $packageName $file $url $url64 $checksum $checksum64 $checksumType $checksumType64
