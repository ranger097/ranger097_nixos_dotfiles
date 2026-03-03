{ config, pkgs, ... }:

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
     size = 48;
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

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
