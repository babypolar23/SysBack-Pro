#!/bin/bash
# ==============================================================================
# Proyecto: SysBackup-Pro
# Descripción: Sistema automatizado de respaldos con funciones y argumentos.
# Uso: ./SysBackup-Pro.sh <carpeta_a_respaldar> <destino_del_respaldo>
# ==============================================================================

# Variables globales para el respaldo
CARPETA_ORIGEN="$1"
DESTINO_BACKUP="$2"
FECHA=$(date +%Y-%m-%d_%H-%M-%S)
NOMBRE_ARCH="backup_$FECHA.tar.gz"

# ------------------------------------------------------------------------------
# Función 1: Comprimir y empaquetar la carpeta
# ------------------------------------------------------------------------------
crear_respaldo() {
    echo "[INFO] Iniciando compresión de la carpeta: $CARPETA_ORIGEN"
    
    # Usamos el comando tar con gzip para comprimir (-czf)
    tar -czf "$DESTINO_BACKUP/$NOMBRE_ARCH" "$CARPETA_ORIGEN"
    
    echo "[INFO] Respaldo guardado en: $DESTINO_BACKUP/$NOMBRE_ARCH"
}

# ------------------------------------------------------------------------------
# Función 2: Verificar que el archivo realmente se creó
# ------------------------------------------------------------------------------
verificar_respaldo() {
    if [ -f "$DESTINO_BACKUP/$NOMBRE_ARCH" ]; then
        echo "[ÉXITO] El respaldo se creó correctamente, mi estimado."
    else
        echo "[ERROR] Algo falló y el archivo no existe."
    fi
}

# ==============================================================================
# BLOQUE PRINCIPAL (MAIN)
# ==============================================================================
echo "=================================================="
echo " INICIANDO SISTEMA SYSBACKUP-PRO"
echo "=================================================="

# Mandamos llamar a nuestras funciones en orden
crear_respaldo
verificar_respaldo

echo "=================================================="
echo " PROCESO FINALIZADO"
echo "=================================================="
