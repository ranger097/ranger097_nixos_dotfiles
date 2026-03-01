{ config, pkgs, ... }:

{
  home.username = "ranger";
  home.homeDirectory = "/home/ranger";
  home.stateVersion = "25.11"; 

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
