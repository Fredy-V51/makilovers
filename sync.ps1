# sync.ps1 - Auditoría y Construcción de Ecosistema
$origen = "C:\via51_ecosistema\via51-makilovers\desarrollo"
$destino = "C:\via51_ecosistema\via51-makilovers\produccion"

# 1. Autoconstrucción del destino si no existe
if (!(Test-Path $destino)) {
    Write-Host "Destino no encontrado. Construyendo infraestructura en $destino..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $destino | Out-Null
}

# 2. Auditoría y replicación inteligente
Get-ChildItem -Path $origen -Recurse | ForEach-Object {
    # Calcular la ruta espejo relativa
    $rutaRelativa = $_.FullName.Substring($origen.Length)
    $destinoFinal = $destino + $rutaRelativa
    
    if ($_.PSIsContainer) {
        # Si es una carpeta, asegurar que exista en el destino
        if (!(Test-Path $destinoFinal)) { 
            New-Item -ItemType Directory -Path $destinoFinal | Out-Null
            Write-Host "Creando carpeta: $rutaRelativa" -ForegroundColor Cyan
        }
    } else {
        # Si es un archivo, auditar si necesita actualización
        if (!(Test-Path $destinoFinal) -or ($_.LastWriteTime -gt (Get-Item $destinoFinal).LastWriteTime)) {
            Copy-Item -Path $_.FullName -Destination $destinoFinal -Force
            Write-Host "Sincronizando archivo: $rutaRelativa" -ForegroundColor Green
        }
    }
}
Write-Host "--- Auditoría Finalizada: Espejo perfecto ---" -ForegroundColor Green