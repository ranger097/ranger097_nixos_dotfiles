{ config, pkgs, lib, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./cosmic.nix
    ./hyprland.nix
    ./packages.nix
    ./bash.nix
  ];

  # Bootloader & Kernel
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 5; 
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # UPDATED LUKS UUID for your new install
  boot.initrd.luks.devices."luks-e2e2b2b3-d4e8-4ee7-9e85-329dee72f576".device = "/dev/disk/by-uuid/e2e2b2b3-d4e8-4ee7-9e85-329dee72f576";

  # Hardware Drivers & Kernel Params
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  boot.kernelParams = [ "nvidia_drm.modeset=1" "nvidia_drm.fbdev=1" ];

  # Networking
  networking.hostName = "pokemon";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  # NVIDIA Setup
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open = true; 
    nvidiaSettings = true;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Wayland / Hyprland fixes
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1"; 
  };

  users.users.ranger = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Versioning - Set to Unstable/Next Release
  system.stateVersion = "25.11"; 
}
