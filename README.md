# Hello, Welcome to my [Nixos](https://github.com/NixOS/nixpkgs) dotfiles repo. <br/>
Made for developers who like preconfigured or *"[riced](https://www.reddit.com/r/unixporn/)"* systems, isolated and reproducible developer environments (via direnv), and fun scripts ive made to automated basic system task. As I learn more about Linux, Nixos, Hyprland, Automation, Systems Development and Programming as a whole, I will update this repo periodically.

# Flakes make life easy.
This flake is labeled as "__--impure__" because it is hardware agnostic.<br/>
(*aka it will pull your /etc/nixos/hardware-configuration.nix automatically*)

```
sudo nixos-rebuild switch --flake github:ranger097/ranger097_nixos_dotfiles#pokemon --impure
```

Screenshots:
<img width="3840" height="2400" alt="2026-03-04-025925_hyprshot" src="https://github.com/user-attachments/assets/bdbeca52-1adf-485a-ab1c-9d1000484f7d" />
<img width="3840" height="2400" alt="2026-03-04-025933_hyprshot" src="https://github.com/user-attachments/assets/3a1a3488-1611-4d58-89e4-1c82a1955452" />
<img width="3840" height="2400" alt="2026-03-04-024600_hyprshot" src="https://github.com/user-attachments/assets/e325f2a0-f22d-4015-8458-7731257f27e7" />
<img width="3840" height="2400" alt="2026-03-04-024628_hyprshot" src="https://github.com/user-attachments/assets/2b02bd34-a52d-4b8e-953e-13d0f77f7b0b" />

Features/Applications included in this flake.

* [Hyprland](https://github.com/hyprwm/Hyprland): Smooth, modern Wayland tiling compositor.
* [Hyprlock](https://github.com/hyprwm/hyprlock): Fast, GPU-accelerated screen locker.
* [Hypridle](https://github.com/hyprwm/hypridle): Automated idle management daemon.
* [Hyprsunset](https://github.com/hyprwm/hyprsunset): Simple blue light filter utility.
* [Rofi](https://github.com): Searchable application launcher and switcher.
* [Waybar](https://github.com): Highly customizable status bar for Wayland.
* [wlogout](https://github.com): Graphical power management menu.
* [Starship](https://github.com): Fast, universal shell prompt for any shell.
* [NixOS Home-Manager](https://github.com): Declarative user configuration management tool.
* [Direnv](https://github.com): Automatic environment variable loader per directory.
* [Qmmp](https://github.com): Audio player with a classic Winamp-style interface.
* [MPRIS](https://github.com): Standard media control interface for Linux.
* [Pokeget](https://github.com): Terminal tool to display Pokémon sprites.
* [VS Code](https://github.com): Extensible source-code editor for developers.
* [Steam](https://github.com): Digital gaming storefront and launcher.
* [Firefox](https://github.com): Privacy-focused, open-source web browser.

Complete list of [packages](https://github.com/ranger097/ranger097_nixos_dotfiles/blob/main/packages.nix) contained in this flake.

ENJOY HOWEVER YOU WANT:<br/>
FORK  <br/>
SHARE  <br/>
LEAVE A STAR  <br/>
