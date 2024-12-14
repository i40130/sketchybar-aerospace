#!/bin/bash

sketchybar --add item pressure right \
           --set pressure  update_freq=10 \
                      icon="􁏍"\
                      script="$PLUGIN_DIR/pressure.sh"
