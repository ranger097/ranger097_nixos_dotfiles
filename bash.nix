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
      ls = "lsd -a";
      };
   interactiveShellInit = ''
   hello(){
   
   echo "Hello, World!"

   }



   eval "$(direnv hook bash)"
   eval -- "$(/run/current-system/sw/bin/starship init bash --print-full-init)"
   '';
   };
}
