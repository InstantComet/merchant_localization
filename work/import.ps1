# 编辑完成后，将修改后的内容更新回原始JSON
$updatedJson = Get-Content -Raw "E:\merchant_localization\work\translations.json" | ConvertFrom-Json
$json = Get-Content -Raw "E:\merchant_localization\work\items.json" | ConvertFrom-Json

for($i=0; $i -lt $json.Length; $i++) {
    $json[$i].localizedName = $updatedJson[$i].translation
}

$json | ConvertTo-Json -Depth 100 | Set-Content -Path "simplified_chinese/items.json" -Encoding UTF8