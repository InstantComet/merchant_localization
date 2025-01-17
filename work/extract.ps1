# 读取原始JSON
$json = Get-Content -Raw "simplified_chinese/items.json" | ConvertFrom-Json

# 转换为目标格式
$newFormat = $json | ForEach-Object {
    [PSCustomObject]@{
        key = $_.name
        original = $_.name
        translation = $_.localizedName
    }
}

# 导出为新格式的JSON
$newFormat | ConvertTo-Json -Depth 100 | Set-Content -Path "translations.json" -Encoding UTF8

