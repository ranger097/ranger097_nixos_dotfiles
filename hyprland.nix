{ config, pkgs, ... }:{

programs.hyprland.enable = true;
services.xserver.enable = true;
services.displayManager = {
sddm.enable = true;
sddm.wayland.enable = true;
autoLogin = {
enable = true;
user = "ranger";
  };
};

environment.systemPackages = with pkgs; [
hyprlock
hyprpolkitagent
hyprcursor
hyprpicker
hyprshot
hypridle
hyprkeys
hyprsunset
hyprnotify

];


}
