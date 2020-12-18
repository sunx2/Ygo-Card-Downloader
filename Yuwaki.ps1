$url = "https://db.ygoprodeck.com/api/v7/cardinfo.php"
$Response = Invoke-WebRequest -Uri $url -Method Post -UseBasicParsing
$data = $Response.Content | ConvertFrom-Json
$client = New-Object System.Net.Webclient
$childs = Get-ChildItem 
$childs = $childs -replace ".jpg",""
foreach ($item in $data.data.id) {
    if ($childs.contains($item)) {
        Write-Host "Image exists for $($item)"
        continue
    }
    try {
        $img = "https://storage.googleapis.com/ygoprodeck.com/pics/$($item).jpg"
        $client.DownloadFile($img,"$($item).jpg")
    }
    catch {
        Write-Host "$($item) Not Found"
    }
}

Write-Host "Download Complete"
