bat=$(cat /sys/class/power_supply/BAT0/capacity);

if [ $bat -le 20 ]; then
  echo "#[bg=red,fg=white] $bat% #[bg=default,fg=default]";
elif [ $bat -le 40 ]; then
  echo "#[bg=blue,fg=white] $bat% #[bg=default,fg=default]";
else
  echo "#[bg=${bg},fg=${fg}] $bat% #[bg=default,fg=default]";
fi
