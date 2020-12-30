Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$FileContent = Get-IniContent "config.ini"


$pingIP = $FileContent["HOST"]["ip"]
$timeOut = $FileContent["HOST"]["timeout"]
$pingTime = $FileContent["CONFIG"]["time"]
$path = $FileContent["CONFIG"]["path"]

function checkPing
{
    if (Test-Connection $pingIP -Quiet -Count 1 -TimeToLive $timeOut ) {
        return $true
    } else {
        return $false
    }
}

if (!$pingIP -or !$pingTime) {
    Write-Output "Faltam argumentos"
    Write-Output "./monitorping.ps1 <ip> <tempo (segundos)>"
    pause
    return
}

$stopWatch = New-Object -TypeName System.Diagnostics.Stopwatch
$stopWatch.Start()


if (checkPing){
    Write-Host "Dispositivo presente -> Mantendo Monitores"
}else {
    Write-Host "Sem resposta -> Desligando monitores"
    &"C:/monitorping/nircmd.exe" monitor off
    Start-Sleep -Seconds 5
    Stop-Process -Name "NirCmd"
}
return
