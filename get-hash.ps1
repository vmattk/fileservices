## Build a hash table to compare files.  Useful to validate data migrations.  Compare via script, Notepad++, Excel, etc.

Get-ChildItem -Path .\ -File -Recurse |  Select-Object -Property LastWriteTime, Length, Name, @{Name = 'FileHash'; Expression = {Get-FileHash -Path $_.FullName  -Algorithm MD5 | Select-Object -ExpandProperty Hash }} | Export-Csv .\source.csv -NoTypeInformation -Encoding UTF8