{ config, pkgs, ... }:{

programs.bash = {
   enable = true;
   shellAliases = {
      update = "sudo nixos-rebuild switch"; 
      nii = "cd /etc/nixos";
      bii = "sudo nano /etc/nixos/bash.nix";
      gii = "sudo nano ~/.config/ghostty/config";
      hii = "sudo nano ~/.config/hypr/hyprland.conf";
      wii = "cd ~/.config/waybar";
      ls = "lsd";
      };
   interactiveShellInit = ''
   hello(){
   
   echo "Hello, World!"

   }




   eval -- "$(/run/current-system/sw/bin/starship init bash --print-full-init)"
   '';
   };
}
