#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

TOPPROC=$(ps axo "%cpu,ucomm" | sort -nr | tail +1 | head -n1 | awk '{printf "%.0f%% %s\n", $1, $2}' | sed -e 's/com.apple.//g')
CPUP=$(echo $TOPPROC | sed -nr 's/([^\%]+).*/\1/p')

CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

COLOR=0xff58d68d  # Verde claro
case "$CPU_PERCENT" in
  [1-2][0-9]) COLOR=0xfff1c40f
  ;;
  [3-6][0-9]) COLOR=0xffe67e22
  ;;
  [7-9][0-9]|100) COLOR=0xffd75f5f 
  ;;
esac

sketchybar --set  cpu.percent label=$CPU_PERCENT% \
                             label.color=$COLOR  \
           --set  cpu.top     label="$TOPPROC"    \
           --push cpu.sys     $CPU_SYS            \
           --push cpu.user    $CPU_USER
