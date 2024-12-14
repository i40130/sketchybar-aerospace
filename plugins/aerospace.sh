#!/usr/bin/env bash

ICON_PADDING=5
ICON_ACTIVE_PADDING=15

# Si el espacio es el actual, aplica el estilo activo
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" background.drawing=on \
                         label="$1" \
                         icon.padding_left="$ICON_ACTIVE_PADDING" \
                         icon.padding_right="$ICON_ACTIVE_PADDING"
else
  sketchybar --set "$NAME" background.drawing=off \
                         label="$1" \
                         icon.padding_left="$ICON_PADDING" \
                         icon.padding_right="$ICON_PADDING"
fi
