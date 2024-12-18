#!/bin/bash
val=$((RANDOM%100))
echo "$(date) Valor: $val" >> /tmp/sketchybar_test.log
sketchybar --set test "$val"
