{ config, pkgs, ... }:{

programs.bash = {
   enable = true;
   shellAliases = {
      update = "sudo nixos-rebuild switch"; 
      nii = "cd ~/Github/dotfiles";
      bii = "sudo nano ~/Github/dotfiles/bash.nix";
      gii = "sudo nano ~/.config/ghostty/config";
      hii = "sudo nano ~/.config/hypr/hyprland.conf";
      wii = "cd ~/.config/waybar";
      cii = "cd ~/.config";
      ls = "lsd -a";
      };
   interactiveShellInit = ''
   cgit() {
   echo " Entering dotfiles  on main."
   cd ~/Github/dotfiles
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
   sleep 0.5
   echo " Building system flake..."
   sudo nixos-rebuild switch --flake .#pokemon
   wait
   echo "updated dotfiles repo and system flake."
   
   }
   



   eval "$(direnv hook bash)"
   eval -- "$(/run/current-system/sw/bin/starship init bash --print-full-init)"
   '';
   };
}
