{ config, pkgs, lib, ... }:

{
  imports = [ 
    ./cosmic.nix
    ./hyprland.nix
    ./packages.nix
    ./bash.nix
    ./wifi.nix
  ];

  # Bootloader & Kernel
  boot.loader.systemd-boot.enable = false;
  boot.lanzaboote.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0; 
  boot.kernelPackages = pkgs.linuxPackages_latest;


  # Hardware Drivers & Kernel Params
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  boot.kernelParams = [ "nvidia_drm.modeset=1" "nvidia_drm.fbdev=1" ];

  # Networking
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  networking.networkmanager.wifi.scanRandMacAddress = true;  

  # NVIDIA Setup
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open = true; 
    nvidiaSettings = true;
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
