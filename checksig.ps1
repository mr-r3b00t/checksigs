Get-ChildItem -Path C:\Windows\system32 -File -Recurse | try(Get-AuthenticodeSignature $_)catch{write-host "Not Signed" -ForegroundColor Red}

$signcheck = Get-ChildItem -Path C:\Windows\system32\ -Include ('*.exe','*.dll','*.ps1') -File -Recurse -ErrorAction SilentlyContinue | Get-AuthenticodeSignature
foreach ($check in $signcheck)
{
if($check.Status -ne "Valid"){$check}
}
