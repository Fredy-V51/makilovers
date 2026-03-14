# enviar.ps1 - Protocolo de Sincronización Remota
Write-Host "--- Iniciando Sincronización con GitHub ---" -ForegroundColor Cyan

# 1. Verificar si el origen remoto ya existe para evitar errores
$remoto = git remote get-url origin 2>$null
if ($null -eq $remoto) {
    Write-Host "Configurando origen remoto..." -ForegroundColor Yellow
    git remote add origin https://github.com/Fredy-V51/via51-soberania-digital.git
}

# 2. Asegurar que estamos en la rama correcta
git branch -M main

# 3. Registrar cambios pendientes (si los hubiera)
git add .
git commit -m "Actualización desde el Activador: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" 2>$null

# 4. Empujar al repositorio
Write-Host "Enviando archivos al guardián..." -ForegroundColor Green
git push -u origin main

Write-Host "--- Sincronización completada ---" -ForegroundColor Green