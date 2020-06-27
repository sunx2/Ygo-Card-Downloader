Write-Host "Omega Uninstaller" -ForegroundColor Blue
$drive = Read-Host "Enter Drive Letter of Omega Installation ( C , D , E , F)"
$drive += ":\"
Write-Host "Searching Omega in $drive" -ForegroundColor  Green
$Omega = Get-ChildItem  -Path $drive -Include *EXE -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.name -eq "YGO Omega.exe" }
Write-Host "Found Omega in $($Omega.Length) places."   -ForegroundColor DarkGreen
$n = 1
$Omega.Directory | ForEach-Object {Write-Host $n $_.FullName -ForegroundColor Cyan ; $n++}
$b = Read-Host "Enter The Number of the folder you want to uninstall omega from (1-$($Omega.Directory.length)) :"
$un = $Omega[[Int]$b-1].FullName
Write-Host "Uninstalling Started: location: $un" -ForegroundColor Red
Start-Process -FilePath $un  -ArgumentList "--uninstall"
Write-Host "Done! Thanks for using me :)" -ForegroundColor Green

