$signcheck = Get-ChildItem -Path C:\Windows\system32\ -Include ('*.exe','*.dll','*.ps1') -File -Recurse -ErrorAction SilentlyContinue | Get-AuthenticodeSignature
foreach ($check in $signcheck)
{
if($check.Status -ne "Valid"){$check}
}
