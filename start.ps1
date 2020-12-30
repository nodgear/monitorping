$FileContent = Get-IniContent "config.ini"
$pingIP = $FileContent["HOST"]["ip"]
$pingTime = $FileContent["CONFIG"]["time"]
$path = $FileContent["CONFIG"]["path"]

$stopWatch = New-Object -TypeName System.Diagnostics.Stopwatch
$stopWatch.Start()


Write-Output "Checando permissoes de uso:";

function checkAdmin
{
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if (checkAdmin) {
    Write-Output "Administrador";
} else {
    Write-Output "Rode este script como administrador";
    pause
    return
};

do
{
    Write-Output "Rodando script $pingIP"
    &"$($path)monitorping.ps1" -WindowStyle Hidden
    Start-Sleep -Seconds $pingTime
}
until ((-not $stopWatch))