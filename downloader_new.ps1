#Created for ygopro card update
#by Sun http://direct.smugneko.live/git
#discord Mordred#2005

[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")
$form = New-Object Windows.Forms.Form
$list = New-Object Collections.Generic.List[Int]
$client = New-Object System.Net.Webclient
$server = "https://storage.googleapis.com/ygoprodeck.com/pics"
$form.text = "Ygo Card Downloader"
$label = New-Object Windows.Forms.Label
$label.Location = New-Object Drawing.Point 50,30
$label.Size = New-Object Drawing.Point 200,15
$label.text = "Enter Ygo Install location"
$textfield = New-Object Windows.Forms.TextBox
$textfield.Location = New-Object Drawing.Point 50,60
$textfield.Size = New-Object Drawing.Point 200,30
$label2 = New-Object Windows.Forms.Label
$label2.Location = New-Object Drawing.Point 50,90
$label2.Size = New-Object Drawing.Point 200,15
$label2.text = "Enter Sqlite dll location"
$label3 = New-Object Windows.Forms.Label
$label3.Location = New-Object Drawing.Point 50,180
$label3.Size = New-Object Drawing.Point 200,15
$label3.text = ""
$label4 = New-Object Windows.Forms.Label
$label4.Location = New-Object Drawing.Point 50,210
$label4.Size = New-Object Drawing.Point 200,15
$label4.text = ""
$textfield2 = New-Object Windows.Forms.TextBox
$textfield2.Location = New-Object Drawing.Point 50,120
$textfield2.Size = New-Object Drawing.Point 200,60
$combobox = New-Object Windows.Forms.ComboBox
$comboBox.DropDownStyle =[System.Windows.Forms.ComboBoxStyle]::DropDown
$comboBox.Sorted = $true
$comboBox.AutoCompleteCustomSource.Add("System.Windows.Forms")
$comboBox.AutoCompleteCustomSource.AddRange(("System.Data", "Microsoft"))
$combobox.Items.Add("Server: Nexus")
$combobox.Items.Add("Server: Ygoprodeck")
$comboBox.AutoCompleteMode =[System.Windows.Forms.AutoCompleteMode]::SuggestAppend
$comboBox.AutoCompleteSource =[System.Windows.Forms.AutoCompleteSource]::CustomSource
$combobox.TabIndex = 1
$combobox.SelectedIndex = 1
$combobox_changed = {
    if ($combobox.Text -eq "Server: Nexus"){
        $server = "https://cdn.jsdelivr.net/gh/ElvinaOlacaryn/TheOlacarynWorld@187adfc"
        Write-Host "selected Nexus"
    }
    if ($combobox.Text -eq "Server: Ygoprodeck"){
        $server = "https://storage.googleapis.com/ygoprodeck.com/pics"
        Write-Host "selected Ygoprodeck"
    }
}


$comboBox.add_SelectedIndexChanged($combobox_changed)
$button = New-Object Windows.Forms.Button
$button.text = "Search "
$button.Location = New-Object Drawing.Point 100,150
$button2 = New-Object Windows.Forms.Button
$button2.text = "Download"
$button2.Location = New-Object Drawing.Point 100,240


$button.add_click({
    try {
        #Add-Type -Path "E:\important_apps\sqlite3\System.Data.SQLite.dll"
        Add-Type -Path $textfield2.Text
        $con = New-Object -TypeName System.Data.SQLite.SQLiteConnection
        Write-Host "Connection Successful"
    }
    catch {
        Write-Host "Sql not found"
        exit
    }
    $label3.text = "Searching.."
    $con.ConnectionString = "Data Source=$($textfield.Text)\cdb\cards.cdb"
    $con.Open()
    $sql = $con.CreateCommand()
    $sql.CommandText = "select id from datas"
    $adapter = New-Object -TypeName System.Data.SQLite.SQLiteDataAdapter $sql
    $data = New-Object System.Data.DataSet
    [void]$adapter.Fill($data)
    $sql.Dispose()
    $con.Close()
    $imgfolder = "$($textfield.Text)\picture\card"
    $cardnum = 0
    foreach ( $rowdata in $data.Tables.rows)
    {
        if ( -Not (Test-Path "$($imgfolder)\$($rowdata[0]).jpg"))
        {
            $list.Add(($rowdata[0]))
        }
        else{
            $cardnum++
        }
    }
    $label3.text = "Missing: $($list.Count), Found: $cardnum "
    $button2.add_click({
        foreach ($id in $list){
            try{
                if ($combobox.Text -eq "Server: Ygoprodeck"){
                    $client.DownloadFile("$($server)/$($id).jpg","$($textfield.Text)\picture\card\$($id).png")
                    Write-Host "Downloaded $($id).png"
                }
                else{
                    $client.DownloadFile("$($server)/$($id).jpg","$($textfield.Text)\picture\card\$($id).jpg")
                    Write-Host "Downloaded $($id).jpg"
                }
                      
            }
            catch {
                Write-Host "Unable to download : $($server)/$($id).jpg","$($imgfolder)\$($id).jpg , 404 not found"
            }
        }
        })
    $form.controls.add($button2)
    
})

# Add objects to form
$form.controls.add($button)
$form.controls.add($label)
$form.controls.add($textfield)
$form.controls.add($label2)
$form.controls.add($label3)
$form.controls.add($label4)
$form.controls.add($textfield2)
$form.controls.add($combobox)

$form.ShowDialog()
