#!/bin/bash

# Recorre los workspaces para todos los monitores y actualiza cada uno con sus aplicaciones activas.

# Obtener los monitores activos
MONITORS=$(aerospace list-monitors | awk '{print $1}')

for monitor in $MONITORS; do
  # Obtener todos los workspaces del monitor actual
  WORKSPACES=$(aerospace list-workspaces --monitor "$monitor" --json | jq -r '.[].workspace')
  
  for workspace in $WORKSPACES; do
    # Obtener las aplicaciones en el workspace actual
    WINDOWS_JSON=$(aerospace list-windows --monitor "$monitor" --workspace "$workspace" --json)
    echo "Debug: Workspace $workspace, Raw JSON = $WINDOWS_JSON" >> /tmp/space_windows_debug.log

    # Extraer nombres de las aplicaciones
    WINDOWS=$(echo "$WINDOWS_JSON" | jq -r '.[] | .["app-name"]')
    echo "Debug: Workspace $workspace, Parsed Windows = $WINDOWS" >> /tmp/space_windows_debug.log

    # Construir la tira de iconos o nombres de aplicaciones
    icon_strip=""
    for app in $WINDOWS; do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done

    # Si no hay aplicaciones, usa un guion o espacio vacío
    if [ -z "$icon_strip" ]; then
      icon_strip=" —"
    fi

    echo "Debug: Workspace $workspace, Final Icon Strip = $icon_strip" >> /tmp/space_windows_debug.log

    # Actualizar SketchyBar con el workspace y sus aplicaciones
    sketchybar --set space."$workspace" label="$workspace$icon_strip"
  done
done
