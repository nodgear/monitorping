function checkAdmin
{
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

Write-Output "MonitorPing - Instalacao";

Write-Output "Checando permissoes de uso:";
if (checkAdmin) {
    Write-Output "Administrador";
} else {
    Write-Output "Rode este script como administrador";
    pause
    return
};

Write-Output "Buscando local de execucao do script.";
$installerPath = $MyInvocation.MyCommand.Path
$installerPath = $installerPath.Replace("install.ps1", "")
Write-Output "Local de execucao : $installerPath";

Write-Output "";
Write-Output "Buscando por pasta de modulos do PowerShell.";

$modulesPaths = $Env:PSModulePath
$nirPath = "$($installerPath)nircmd.exe"

if ((Test-Path "C:\monitorping\nircmd.exe")) {
    Write-Host "Modulo de controle ja instalando"
}
else {
    Write-Host "Modulo de controle nao encontrando"
    Write-Host "Instalando..."
    New-Item -ItemType directory -Path "C:\monitorping"
    Move-Item -Path $nirPath -Destination "C:\monitorping\nircmd.exe"
}

# TODO: CHECK IF NIRCMD IS ON C:/


Write-Output "";
if (Get-Module -ListAvailable -Name PsIni) {
    Write-Host "Modulo ini ja instalando"
    Write-Host "Importando..."
    Import-Module -Name PsIni
}
else {
    Write-Host "Modulo ini nao instalado"
    Write-Host "Instalando..."
    Install-Module PsIni
}

Write-Output "";
Write-Host "Criando arquivo de configurações..."
Write-Output "";
Write-Output "";
$ip = Read-Host "Insira o IP a ser verificado"
Write-Output "";
Write-Output "";
$time = Read-Host "Insira o tempo entre cada checagem (segundos)"
Write-Output "";
Write-Output "";
$timeOut = Read-Host "Insira Timeout (segundos)"


$hostCat = @{"ip"=$ip;"timeout"=$timeOut}
$configCat = @{"path"=$installerPath;"time"=$time}

$NewINIContent = @{"HOST"=$hostCat;"CONFIG"=$configCat}
Out-IniFile -InputObject $NewINIContent -FilePath "$($installerPath)config.ini"
Write-Output "";
Write-Output "";
Write-Output "Escrito em: $($installerPath)config.ini"
Write-Output "";
Write-Output "";