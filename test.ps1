
"Running tests"
$ErrorActionPreference = "Stop"

if ($env:APPVEYOR_BUILD_VERSION) {
  # run in CI
  $version = $env:APPVEYOR_BUILD_VERSION -replace('\.[^.\\/]+$')
} else {
  # run manually
  [xml]$spec = Get-Content mkcert.nuspec
  $version = $spec.package.metadata.version
}

"TEST: Version $version in mkcert.nuspec file should match"
[xml]$spec = Get-Content mkcert.nuspec
if ($spec.package.metadata.version.CompareTo($version)) {
  Write-Error "FAIL: Wrong version in nuspec file!"
}

"TEST: Package should contain only install script"
Add-Type -assembly "system.io.compression.filesystem"
$zip = [IO.Compression.ZipFile]::OpenRead("$pwd\mkcert.$version.nupkg")
# Write-Host $zip.Entries.FullName
Write-Host $zip.Entries.Count
if ($zip.Entries.Count -ne 5) {
  Write-Error "FAIL: Wrong count in nupkg!"
}
$zip.Dispose()

"TEST: Installation of package should work"
. choco install -y mkcert $options -source . -version $version

"TEST: Creating certs for example.org should work"
$v = $(mkcert example.org)
$v
if (-Not (Test-Path example.org.pem)) {
  Write-Error "FAIL: Certificate example.org.pem is missing!"  
}
if (-Not (Test-Path example.org-key.pem)) {
  Write-Error "FAIL: Certificate example.org-key.pem is missing!"  
}

"TEST: Uninstall show remove the binary"
. choco uninstall mkcert
try {
  . mkcert
  Write-Error "FAIL: mkcert binary still found"
} catch {
  Write-Host "PASS: mkcert not found"
}

"TEST: Finished"
