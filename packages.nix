{ config, pkgs, inputs, ... }:{
nixpkgs.config.allowUnfree = true;
programs.steam.enable = true;
programs.direnv = {
enable = true;
silent = true;
nix-direnv.enable = true; };
#nixpkgs.config.android_sdk.accept_license = true;

nixpkgs.config.permittedInsecurePackages = [
                "pnpm-10.29.2"
              ];

environment.systemPackages = with pkgs; [
sbctl
ani-cli
steam
kdePackages.dolphin
kdePackages.kdenlive
kdePackages.qtstyleplugin-kvantum
waybar
walker
networkmanager
networkmanagerapplet
home-manager
libsForQt5.qt5ct
libsForQt5.qtstyleplugin-kvantum
kdePackages.kio-extras
kdePackages.qt6ct
brightnessctl
vesktop
libreoffice-fresh
wlogout
playerctl
pavucontrol
gimp
kdePackages.qtsvg
kdePackages.ffmpegthumbs
usbutils
yt-dlp
qmmp
mpvpaper
mpv
wget
git
lsd
dtrx
blender
qt5.qtwayland
qt6.qtwayland
pokeget-rs
nmap
pywal16
#android-studio-tools
#android-studio-full
elephant
timg
xdg-desktop-portal-gtk
hyprpolkitagent
gh
jq
yq
xq
gomatrix
sioyek
gnumake
gcc
ripgrep     
fd          
unzip   
fzf      
nix-direnv
viu
chafa
ueberzugpp
tree-sitter
bc
fontpreview
tor
tor-browser
sqlitebrowser
btop
htop
ghostty
bettercap
zig
exercism
awww
kitty
firefox
sqlmap
hping
maven
gradle
live-server
vite
nodejs_latest
maven
spring-boot-cli
openjdk
jdk17
mariadb
peaclock
cmatrix
postgresql
flutter
dart
electron
fuzzel
alacritty
python3
xwayland-satellite
kdePackages.filelight
qutebrowser
xwayland-satellite
];

fonts.packages = with pkgs;[
maple-mono.NF-CN-unhinted
nerd-fonts.victor-mono
nerd-fonts.jetbrains-mono
nerd-fonts.zed-mono
nerd-fonts.iosevka
nerd-fonts.geist-mono
nerd-fonts.martian-mono
nerd-fonts.adwaita-mono
nerd-fonts.caskaydia-cove
nerd-fonts.bigblue-terminal
];

fonts.fontconfig = {
enable = true;
antialias = true;
hinting.enable = false;
subpixel.rgba = "rgb";
defaultFonts.monospace = [
"Maple Mono NF CN"
];
};

hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = true;
hardware.enableAllFirmware = true;
security.rtkit.enable = true;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
wireplumber.enable = true; 
};

hardware.bluetooth.settings = {
  General = {
    Enable = "Source,Sink,Media,Socket";
    Experimental = true;
  };
};

services.blueman.enable = true;
services.gnome.gnome-keyring.enable = true;
services.gvfs.enable = true;
}
