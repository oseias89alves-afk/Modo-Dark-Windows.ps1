# Modo-Dark-Windows.ps1
# Windows 11 - Modo Dark + Horário de Brasília
# Criado por Oséias TI

# Verifica se está executando como Administrador
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

# Define Horário de Brasília
Set-TimeZone -Id "E. South America Standard Time"

# Ativa modo escuro do Windows
Set-ItemProperty `
    -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" `
    -Name SystemUsesLightTheme `
    -Value 0

# Ativa modo escuro dos aplicativos
Set-ItemProperty `
    -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" `
    -Name AppsUseLightTheme `
    -Value 0

# Reinicia o Explorer para aplicar o modo escuro
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host " CONFIGURACAO CONCLUIDA" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "Modo Dark: ATIVADO"
Write-Host "Horario: Brasilia (UTC-3)"
Write-Host "Criado por: Oseias TI"
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
