# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cosmic.nix
      ./hyprland.nix
      ./packages.nix
      ./bash.nix
    ];

  
# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.lib.mkForce pkgs.linuxPackages;
  boot.initrd.luks.devices."luks-1997167d-6340-4911-b856-b88bdd43c13d".device = "/dev/disk/by-uuid/1997167d-6340-4911-b856-b88bdd43c13d";
  security.polkit.enable = true;
  boot.loader.timeout = 0;

#CAMERA
services.udev.extraRules = ''
# Disable Microdia Integrated_Webcam_HD (0c45:6732)
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0c45", ATTR{idProduct}=="6732", ATTR{authorized}="0"
'';

boot.blacklistedKernelModules = [ 
"uvcvideo" 
];

services.pipewire.wireplumber.extraConfig."10-disable-mic" = {
  "monitor.alsa.rules" = [
    {
      matches = [
        {
          # This matches all internal ALSA input sources (microphones)
          "node.name" = "~alsa_input.*"; 
        }
      ];
      actions = {
        update-props = {
          "node.disabled" = true;
        };
      };
    }
  ];
};

  networking.hostName = "pokemon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;


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


environment.variables.QT_QPA_PLATFORMTHEME = "qt6ct";
environment.sessionVariables = {
QT_QPA_PLATFORM = "wayland";
QT_QPA_PLATFORMTHEME="qt6ct";
NIXOS_OZONE_WL = "1";
GSK_RENDERER = "ngl"; 
GDK_BACKEND = "wayland";

XDG_DATA_DIRS = lib.mkForce [
      "$HOME/.icons"
      "/run/current-system/sw/share"
      "/usr/share"
    ];


};

hardware.graphics.enable = true;
services.xserver.videoDrivers = [ "nvidia" ];
boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
hardware.nvidia = {
powerManagement.enable = true;
open = false;
modesetting.enable = true;
nvidiaSettings = true;
package = config.boot.kernelPackages.nvidiaPackages.production;
};



  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ranger = {
    isNormalUser = true;
    description = "ranger";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };


nix.settings.experimental-features = [ "nix-command" "flakes" ];

services.logind.settings.Login = {
lidSwitch = "ignore";
lidSwitchDocked = "ignore";
lidSwitchExternalPower = "ignore";
};

networking = {
firewall.enable = true;
nftables.enable = true;
firewall.allowPing = false;
firewall.checkReversePath = "loose"; # or "strict";
#firewall.allowedTCPPorts = [ ... ];
#firewall.allowedUDPPorts = [ ... ];
};

services = {
openssh.enable = false;
jellyfin.openFirewall = true;

};


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
