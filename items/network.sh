# Añadir ítem de red combinado
sketchybar --add item network right \
           --set network icon="" \
                         label.font="SF Pro:Semibold:10.0" \
                         update_freq=5 \
                         script="$PLUGIN_DIR/network.sh"
