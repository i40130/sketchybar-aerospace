#!/bin/bash

NAME="ram" #Definir el nombre dle item en SketchyBar

# Obtener la memoria total y libre en megabytes
MEM_TOTAL=$(sysctl -n hw.memsize)                   # Memoria total en bytes
MEM_TOTAL_MB=$((MEM_TOTAL / 1024 / 1024))           # Convertir a MB
MEM_FREE_MB=$(vm_stat | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
MEM_INACTIVE_MB=$(vm_stat | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')
PAGE_SIZE=$(vm_stat | grep "page size of" | awk '{print $8}')
MEM_FREE_ACTUAL_MB=$(( (MEM_FREE_MB + MEM_INACTIVE_MB) * PAGE_SIZE / 1024 / 1024 ))

# Calcular la memoria usada
MEM_USED_MB=$((MEM_TOTAL_MB - MEM_FREE_ACTUAL_MB))

# Calcular el porcentaje de memoria usada
MEM_PERCENT=$(awk "BEGIN {printf \"%.0f\", ($MEM_USED_MB / $MEM_TOTAL_MB) * 100}")

# Establecer el resultado en SketchyBar
sketchybar --set $NAME label="$MEM_PERCENT%"
