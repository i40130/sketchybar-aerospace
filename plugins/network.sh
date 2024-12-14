#!/bin/bash

# Obtener los bytes iniciales de subida y bajada
read RX_PREV TX_PREV <<<$(netstat -ibn | awk '/en0/ && $7 ~ /[0-9]+/ {rx+=$7; tx+=$10} END {print rx, tx}')

# Dormir por el intervalo configurado en SketchyBar
sleep 2

# Obtener los bytes actuales de subida y bajada
read RX TX <<<$(netstat -ibn | awk '/en0/ && $7 ~ /[0-9]+/ {rx+=$7; tx+=$10} END {print rx, tx}')

# Calcular la diferencia y convertir a MB/s con dos decimales
RX_DIFF=$((RX - RX_PREV))
TX_DIFF=$((TX - TX_PREV))
RX_SPEED=$(awk "BEGIN {printf \"%.2f\", $RX_DIFF / 1024 / 1024 / 2}")
TX_SPEED=$(awk "BEGIN {printf \"%.2f\", $TX_DIFF / 1024 / 1024 / 2}")

# Establecer el resultado en SketchyBar en un único ítem con ancho fijo
sketchybar --set $NAME label="􀌗  ${RX_SPEED} MB/s 􀌕  ${TX_SPEED} MB/s"
