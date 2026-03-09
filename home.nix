{ config, pkgs, osConfig, ... }:

let
 myCursor = pkgs.runCommand "local-cursor" {} ''
 mkdir -p $out/share/icons/Pokemon
 cp -r ${./icons/Pokemon}/* $out/share/icons/Pokemon/ 
 '';

in
{
  home.username = "ranger";
  home.homeDirectory = "/home/ranger";
  home.stateVersion = "25.11"; 

  home.pointerCursor = {
     package = myCursor;
     name = "Pokemon";
     size = 32;
     gtk.enable = true;
     x11.enable = true;
  };

  home.file = {
    ".config/hypr".source = ./hypr; 
    ".config/waybar".source = ./waybar; 
    ".config/ghostty".source = ./ghostty;
    ".config/starship.toml".source = ./starship/starship.toml;
    ".config/rofi".source = ./rofi; 
    ".config/wlogout".source = ./wlogout;
  };

wayland.windowManager.hyprland = {
  enable = true;
  
  settings = {
    monitor = if osConfig.networking.hostName == "jirachi" 
      then [ "eDP-1, 3840x2400@59.99400, 0x0, 3" ]
      else if osConfig.networking.hostName == "deoxy"
      then [ "eDP-1, 1920x1080@60.054, 0x0, 1.5" ]
      else [ ",preferred,auto,1" ];
  };

 # extraConfig = ''
 # source = ~/.config/hypr/hyprland.conf
 # '';

};




  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
