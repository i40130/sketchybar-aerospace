#!/bin/bash

# Eliminar todos los espacios existentes para evitar duplicados
sketchybar --remove '/space\..*/'

# Obtener los workspaces activos para cada monitor
MONITOR_1_WORKSPACES=$(aerospace list-workspaces --monitor 1 --json | jq -r '.[].workspace')
MONITOR_2_WORKSPACES=$(aerospace list-workspaces --monitor 2 --json | jq -r '.[].workspace')

# Función para añadir workspaces activos a SketchyBar
add_workspace() {
  local sid=$1
  sketchybar --add item space."$sid" left \
             --subscribe space."$sid" aerospace_workspace_change \
             --set space."$sid" \
               label="$sid" \
               label.font="sketchybar-app-font:Regular:16.0" \
               label.padding_right=20 \
               label.y_offset=-1 \
               background.drawing=on \
               click_script="aerospace workspace $sid" \
               script="$PLUGIN_DIR/space_windows.sh $sid"
}

# Añadir workspaces activos para el monitor 1
for sid in $MONITOR_1_WORKSPACES; do
  add_workspace "$sid"
done

# Añadir workspaces activos para el monitor 2
for sid in $MONITOR_2_WORKSPACES; do
  add_workspace "$sid"
done

# Añadir separador de espacios
sketchybar --add item space_separator left \
           --set space_separator icon="􀆊" \
                                 icon.color=$ACCENT_COLOR \
                                 icon.padding_left=4 \
                                 label.drawing=off \
                                 background.drawing=off \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change
