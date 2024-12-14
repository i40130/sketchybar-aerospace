#!/usr/bin/env bash

# Obtener la lista de monitores activos
MONITORS=$(aerospace list-monitors | awk '{print $1}')

# Iterar sobre cada monitor
for monitor in $MONITORS; do
  echo "Monitor $monitor:"
  
  # Obtener workspaces del monitor actual en formato JSON
  WORKSPACES=$(aerospace list-workspaces --monitor "$monitor" --json | jq -r '.[].workspace')

  # Iterar sobre cada workspace del monitor
  for workspace in $WORKSPACES; do
    # Obtener ventanas abiertas en el workspace actual en formato JSON
    WINDOWS=$(aerospace list-windows --monitor "$monitor" --workspace "$workspace" --json)

    # Comprobar si hay ventanas en el workspace
    if [[ "$WINDOWS" != "[]" ]]; then
      echo "  Workspace $workspace:"
      echo "$WINDOWS" | jq -r '.[] | "    \(.["app-name"])"'
    else
      echo "  Workspace $workspace: No hay aplicaciones abiertas"
    fi
  done
done
