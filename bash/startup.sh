#!/usr/bin/env
source /home/ranger/ranger097_nixos_dotfiles/bash/wifi/networks.sh

startup() {
sleep 3
wifi_switch
sleep 0.5
if pgrep awww >/dev/null; then
  echo "awww-daemon already running"
else
  echo "awww-daemon wasnt running"
  awww-daemon > /dev/null 2>&1 &
fi
sleep 0.5
for dir in theme_switcher bluelight_toggle waybar_switcher cache; do
cd /home/ranger/ranger097_nixos_dotfiles/python/$dir 
direnv allow "/home/ranger/ranger097_nixos_dotfiles/python/$dir" > /dev/null 2>&1 &
sleep 0.5
done

DIR="/home/ranger/ranger097_nixos_dotfiles/python/cache"
for file in theme_cache.py waybar_cache.py bluelight_toggle.py; do
direnv exec "$DIR" python3 "$DIR/$file" > /dev/null 2>&1 &
sleep 0.5
done

disown -a
}

apps() {
sleep 3 &
update &
protonvpn-app &
ghostty &
elephant &
qutebrowser &
awww-daemon &
xwayland-satellite &
awww-daemon --namespace backdrop &
DISPLAY=:0 steam &
}


apps
#startup
