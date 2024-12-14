#!/bin/bash

# Obtener la presión de memoria
MEM_PRESSURE=$(memory_pressure | grep "System-wide memory free percentage" | awk '{print $NF}')

# Establecer el resultado en SketchyBar
sketchybar --set $NAME label="$MEM_PRESSURE"
