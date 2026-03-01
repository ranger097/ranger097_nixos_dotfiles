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
  
# Bootloader & Kernel
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelPackages = pkgs.linuxPackages_latest;
boot.initrd.luks.devices."luks-1997167d-6340-4911-b856-b88bdd43c13d".device = "/dev/disk/by-uuid/1997167d-6340-4911-b856-b88bdd43c13d";

# Force NVIDIA drivers to load at the earliest possible stage (fixes Hyprland/Wayland issues)
boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

boot.loader.timeout = 0;
boot.blacklistedKernelModules = [ "nouveau" "uvcvideo" "ucsi_acpi" ];

boot.kernelParams = [
  "nvidia_drm.modeset=1"      # Mandatory for Wayland
  "nvidia_drm.fbdev=1"        # Smoother transition from boot to desktop
  "i915.enable_psr=0"         # Fixes flickering on many Intel panels
  "modprobe.blacklist=ucsi_acpi"
  "ucsi_acpi.disable_notifications=1"
];


# Add this anywhere in configuration.nix
systemd.user.extraConfig = ''
  DefaultEnvironment="QT_QPA_PLATFORM=wayland" "QT_PLUGIN_PATH=${pkgs.qt6.qtwayland}/lib/qt-6/plugins"
'';



#CAMERA
services.udev.extraRules = ''
# Disable Microdia Integrated_Webcam_HD (0c45:6732)
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0c45", ATTR{idProduct}=="6732", ATTR{authorized}="0"
'';


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
Experimental = false;
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


environment.sessionVariables = {
  LIBVA_DRIVER_NAME = "nvidia";
  GBM_BACKEND = "nvidia-drm";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  NIXOS_OZONE_WL = "1";
  # For Hyprland/COSMIC stability
  WLR_NO_HARDWARE_CURSORS = "1"; 
};




# Load nvidia driver for Xorg and Wayland
services.xserver.videoDrivers = ["nvidia"];

hardware.nvidia = {
  # Modesetting is required.
  modesetting.enable = true;

  # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
  powerManagement.enable = false;
  # Fine-grained power management. Turns off GPU when not in use.
  powerManagement.finegrained = true;

  # Use the NVidia open source kernel module (not to be confused with nouveau)
  # Support is limited to Turing and newer GPUs (your RTX 3050 is supported).
  open = true;

  # Enable the Nvidia settings menu, accessible via `nvidia-settings`.
  nvidiaSettings = true;

  # Special configuration for Hybrid Graphics (Optimus)
  prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    # Bus IDs found via `lspci` in your log:
    # Intel: 00:02.0 -> PCI:0:2:0
    # NVIDIA: 01:00.0 -> PCI:1:0:0
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
};



hardware.graphics = {
  enable = true;
  enable32Bit = true;
};



# Keep your existing Pipewire/Wireplumber settings, they are mostly fine.



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


xdg.portal = {
  enable = true;
  extraPortals = [ 
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk 
  ];
};





  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
