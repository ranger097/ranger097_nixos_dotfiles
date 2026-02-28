{ config, pkgs, ... }:{
nixpkgs.config.allowUnfree = true;
programs.steam.enable = true;
programs.direnv.enable = true;
programs.firefox.enable = true;
environment.systemPackages = with pkgs; [
freetube
ani-cli
steam
blueman
kdePackages.dolphin
kdePackages.kdenlive
kdePackages.qtstyleplugin-kvantum
waybar
swww
rofi
networkmanager
home-manager
libsForQt5.qt5ct
libsForQt5.qtstyleplugin-kvantum
kdePackages.kio-extras
kdePackages.qt6ct
protonvpn-gui
brightnessctl
discord
libreoffice-fresh
wlogout
playerctl
pavucontrol
bluez
gimp
kdePackages.qtsvg
kdePackages.ffmpegthumbs
kdePackages.konsole
usbutils
yt-dlp
foliate
qmmp
mpvpaper
mpv
gnome-boxes
wget
ranger
ghostty
kitty
firefox
git
starship
lsd
dtrx
blender
vscode
nixd
];

fonts.packages = with pkgs;[
maple-mono.CN
maple-mono.NF
noto-fonts-cjk-sans
];

fonts.fontconfig = {
enable = true;
antialias = true;
hinting.enable = true;
subpixel.rgba = "rgb";
defaultFonts.monospace = [ "Maple Mono CN" "Maple Mono NF" "Noto Sans Mono CJK SC" ];

};

hardware.bluetooth.enable = true;
services.blueman.enable = true;
hardware.bluetooth.settings = {
General = {
Enable = "Source,Sink,Media,Socket";
Experimental = true;
  };
};

services.pipewire.wireplumber.extraConfig."10-bluez" = {
"monitor.bluez.properties" = {
"bluez5.enable-sbc-xq" = true;
"bluez5.enable-msbc" = true;
"bluez5.enable-hw-volume" = true;
"bluez5.roles" = [
"hsp_hs"
"hsp_ag"
"hfp_hf"
"hfp_ag"];};};

services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
#jack.enable = true;
#media-session.enable = true;
};






}
