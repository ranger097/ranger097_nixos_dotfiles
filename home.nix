{ config, pkgs, osConfig, inputs, lib, ... }:

let
  myCursor = pkgs.runCommand "local-cursor" {} ''
    mkdir -p $out/share/icons/Pokemon
    cp -r ${./icons/Pokemon}/* $out/share/icons/Pokemon/ 
  '';
in

{

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Home Profile Parameters
  home.username = "ranger";
  home.homeDirectory = "/home/ranger";
  home.stateVersion = "26.05"; 

  # Cursor Config
  home.pointerCursor = {
    enable = true;
    package = myCursor;
    name = "Pokemon";
    size = 48;
    gtk.enable = true;
    x11.enable = true;
  };
 
  home.file = {
    ".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;
    ".config/hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
    ".config/hypr/hyprsunset.conf".source = ./hypr/hyprsunset.conf;
    ".config/waybar".source = ./waybar; 
    ".config/alacritty".source = ./alacritty;
    ".config/walker".source = ./walker; 
    ".config/wlogout".source = ./wlogout;
    ".config/ghostty/config".source = ./ghostty/config;
    ".config/niri/config.kdl".source = ./niri/config.kdl;
    ".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
    ".config/qutebrowser/config.py".source = ./qutebrowser/config.py;
  };

programs.freetube = {
   enable = true;
   settings = {
   allowDashAv1Formats = true;
   checkForUpdates     = false;
   defaultQuality      = "2160";
   baseTheme           = "black";
   hideHeaderLogo = true;
   hideLabelsSideBar = true;
   mainColor = "CatppuccinFrappeFlamingo";
    secColor = "CatppuccinFrappeBlue";
   };
};

programs.ghostty.enable = true;
programs.ghostty.settings = {};

wayland.windowManager.hyprland = {
enable = false;
configType = "hyprlang";
systemd.enable = false;
extraConfig = ''
monitor = ${ if osConfig.networking.hostName == "jirachi"
	     then "eDP-1, 3840x2400@59.99400, 0x0, 3"
             else "eDP-1, 1920x1080@60.054, 0x0, 1"}
'';  
};

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
