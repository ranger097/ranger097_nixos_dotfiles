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

   }





   
   update() {
   cd ~/ranger097_nixos_dotfiles
   echo " Updating Nixos System"
   sudo nixos-rebuild switch --flake .#pokemon --impure
   }
   
   upgrade() {
   cd ~/ranger097_nixos_dotfiles
   echo " Upgrading Nixos System"
   nix flake update
   }


   #fastfetch   
   pokeget random --hide-name
   eval "$(direnv hook bash)"
   eval -- "$(/run/current-system/sw/bin/starship init bash --print-full-init)"
   '';
   };
}
