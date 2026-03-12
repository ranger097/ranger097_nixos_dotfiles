{ config, pkgs, ... }:{

programs.bash = {
enable = true;
shellAliases = {
bye = "shutdown -h now";
nii = "cd ~/ranger097_nixos_dotfiles";
bii = "sudo nano ~/ranger097_nixos_dotfiles/bash.nix";
gii = "sudo nano ~/ranger097_nixos_dotfiles/ghostty/config";
hii = "sudo nano ~/ranger097_nixos_dotfiles/home.nix";
wii = "cd ~/ranger097_nixos_dotfiles/waybar";
cii = "cd ~/.config";
ls = "lsd -a";
change_theme = "python /home/ranger/ranger097_nixos_dotfiles/Python/theme_switcher/themes.py";
ytdownload = "yt-dlp -x --audio-format mp3 --audio-quality 0 --cookies-from-browser firefox --embed-metadata --embed-thumbnail --add-metadata";
};
   
interactiveShellInit = ''
dgit() {
echo " Entering dotfiles  on main."
cd ~/ranger097_nixos_dotfiles
wait
echo " Adding files to dotfiles  on main"
git add . &> /dev/null
wait
echo " Saving changes to dotfiles  on main"
git commit -m "updated configs" &> /dev/null
wait
echo " Pushing changes now."
git push origin main &> /dev/null
wait
echo " Github changes complete."
wait
echo " Building system flake..."
sudo nixos-rebuild switch --flake .#deoxy
wait
echo " Updated dotfiles and system flake."
echo "󰑓 Reloading configs."
hyprctl reload
pkill waybar
nohup waybar -c ~/.config/waybar/top.jsonc -s ~/.config/waybar/top.css > /dev/null 2>&1 &
nohup waybar -c ~/.config/waybar/bottom.jsonc -s ~/.config/waybar/bottom.css > /dev/null 2>&1 &
disallow &> /dev/null
echo " Done"
}

jgit() {
echo " Entering dotfiles  on main."
cd ~/ranger097_nixos_dotfiles
wait
echo " Adding files to dotfiles  on main"
git add . &> /dev/null
wait
echo " Saving changes to dotfiles  on main"
git commit -m "updated configs" &> /dev/null
wait
echo " Pushing changes now."
git push origin main &> /dev/null
wait
echo " Github changes complete."
wait
echo " Building system flake..."
sudo nixos-rebuild switch --flake .#jirachi
wait
echo " Updated dotfiles and system flake."
echo "󰑓 Reloading configs."
hyprctl reload
pkill waybar
nohup waybar -c ~/.config/waybar/top.jsonc -s ~/.config/waybar/top.css > /dev/null 2>&1 & 
nohup waybar -c ~/.config/waybar/bottom.jsonc -s ~/.config/waybar/bottom.css > /dev/null 2>&1 &
disallow &> /dev/null
echo " Done"
}

upgrade() {
cd ~/ranger097_nixos_dotfiles
echo " Upgrading Nixos System"
nix flake update
}


(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
#fastfetch   
pokeget random --hide-name
eval "$(direnv hook bash)"
eval "$(starship init bash)"
'';
};
}
