[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&repeat=false&width=548&lines=Hello%2C+Welcome+to+my+Nixos+dotfiles+repo.)](https://git.io/typing-svg)<br/>
Made for developers who like preconfigured or *"[riced](https://www.reddit.com/r/unixporn/)"* systems, isolated and reproducible developer environments (via direnv), and fun scripts ive made to automate basic system task. As I learn more about Linux, Nixos, Hyprland, Automation, Systems Development and Programming as a whole, I will update this repo periodically.
(*Quick note, the colors in this flake might seem off because I use hyprsunset, you can easily disable it in hyprland.conf*)


This flake has an "__--impure__" flag because it is hardware agnostic.<br/>
(*aka it will pull your /etc/nixos/hardware-configuration.nix automatically because nixos is [Goated](https://pbs.twimg.com/media/HA4fYrxXkAE0Rt3.jpg) like that*)
[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&color=F72D59&width=435&lines=Flake%3A)](https://git.io/typing-svg)
```
sudo nixos-rebuild switch --flake github:ranger097/ranger097_nixos_dotfiles#pokemon --impure
```

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&repeat=false&width=548&lines=Screenshots%3A)](https://git.io/typing-svg)<br/>
This photo is an example of my __[Rofi](https://github.com/davatorium/rofi)__ config.
<img width="3840" height="2400" alt="2026-03-04-025925_hyprshot" src="https://github.com/user-attachments/assets/bdbeca52-1adf-485a-ab1c-9d1000484f7d" />

This photo is an example of my minimal __[Vscode](https://code.visualstudio.com/)__ config (free of clutter and only contains the tools i actually need).
<img width="3840" height="2400" alt="2026-03-05-062615_hyprshot" src="https://github.com/user-attachments/assets/e8367040-2edf-415e-90e5-16480d8ea276" />


This photo is an example of __[Pokeget](https://github.com/talwat/pokeget-rs)__ (very easily disabled, but why would you), it spawns random pokemon pixel art whenever i open a terminal.
<img width="3840" height="2400" alt="2026-03-05-225808_hyprshot" src="https://github.com/user-attachments/assets/c66d3df3-c73a-4f90-b026-38926aeff882" />


This is an example of __[Qmmp](https://qmmp.ylsoftware.com/downloads.php)__ and the __[Waybar](https://github.com/Alexays/Waybar)__ module __[Mpris](https://github.com/natsukagami/mpd-mpris)__.
<img width="3840" height="2400" alt="2026-03-04-024628_hyprshot" src="https://github.com/user-attachments/assets/2b02bd34-a52d-4b8e-953e-13d0f77f7b0b" />

This is an example of my __[Stylus]()__ config. The css is included in the flake.
<img width="3840" height="2400" alt="2026-03-05-223258_hyprshot" src="https://github.com/user-attachments/assets/ce8903c0-baa8-4cc6-ab2b-e7ffc4e60dfb" />
<img width="3840" height="2400" alt="2026-03-05-230645_hyprshot" src="https://github.com/user-attachments/assets/46d2cb68-abb2-4232-a9db-fad15a81e292" />
Here you will see that youtube has grey text and thumbnails unless hovered over(then its full of color). This is because im a night owl and im trying to limit brightness and bluelight. All played videos are normal with no added effects so its a minimal change in functionality beside saving your eyes (*I thought the pixel peepers would apreciate this*). That being said this is disabled by defualt. If you want to achieve this, simply download the userstylus extension in firefox and copy the css i provided in the flake in the "youtube" directory. paste it into the userstylus and Boom!, youre done. Easy.



[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&repeat=false&width=548&lines=Fonts%3A)](https://git.io/typing-svg)<br/>
[Maple Mono NF](https://github.com/subframe7536/maple-font) is the only font I use. You can easily add more but its so beautiful i use it system wide.
Im a sucker for font ligatures and italics(*I need all my fancy programming symbols and fancy cursive functions*).<br/>
If you are like me and enjoy a good __[nerd font](https://www.nerdfonts.com/font-downloads)__ you might wanna check these out. 

* [Victor Mono NF](https://github.com/rubjo/victor-mono)
* [JetBrains Mono NF](https://github.com/JetBrains/JetBrainsMono)
* [Caskaydia Cove NF](https://github.com/eliheuer/caskaydia-cove)

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&repeat=false&width=548&lines=Featured+applications+in+this+flake%3A)](https://git.io/typing-svg)<br/>
[Hyprland](https://github.com/hyprwm/Hyprland): Smooth, modern Wayland tiling compositor.<br/>
[Hyprlock](https://github.com/hyprwm/hyprlock): Fast, GPU-accelerated screen locker.<br/>
[Hypridle](https://github.com/hyprwm/hypridle): Automated idle management daemon.<br/>
[Hyprsunset](https://github.com/hyprwm/hyprsunset): Simple blue light filter utility.<br/>
[Rofi](https://github.com): Searchable application launcher and switcher.<br/>
[Waybar](https://github.com): Highly customizable status bar for Wayland.<br/>
[wlogout](https://github.com): Graphical power management menu.<br/>
[Starship](https://github.com): Fast, universal shell prompt for any shell.<br/>
[NixOS Home-Manager](https://github.com): Declarative user configuration management tool.<br/>
[Direnv](https://github.com): Automatic environment variable loader per directory.<br/>
[Qmmp](https://github.com): Audio player with a classic Winamp-style interface.<br/>
[MPRIS](https://github.com): Standard media control interface for Linux.<br/>
[Pokeget](https://github.com): Terminal tool to display Pokémon sprites.<br/>
[VS Code](https://github.com): Extensible source-code editor for developers.<br/>
[Steam](https://github.com): Digital gaming storefront and launcher.<br/>
[Firefox](https://github.com): Privacy-focused, open-source web browser.<br/>

Complete list of [packages](https://github.com/ranger097/ranger097_nixos_dotfiles/blob/main/packages.nix) contained in this flake.

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&repeat=false&width=548&lines=Cursors%3A)](https://git.io/typing-svg)<br/>
The cursor depicted in the screenshots above is a __[Pokemon Cursor](https://store.kde.org/p/1701595)__ (*you might be noticing a theme here.*) from the __[KDE Store](https://store.kde.org/browse/)__.


[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&repeat=false&width=548&lines=Coming+soon%3A)](https://git.io/typing-svg)<br/>
* Documentation
* More 4k Anime Wallpapers.
* Minimal Vscode config.
* A website (*written in closurescript*).    
* Full theme switcher (*written in golang*).
* Hyprland settings app (*written in rust*).
* Waybar toggle script (*written in python*).

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&color=F79B1F&multiline=true&repeat=false&width=435&height=121&lines=I+really+hope+you+enjoy+this+Flake.;Please+leave+a+Star+and+share+with+;your+friends+or+colleagues.)](https://git.io/typing-svg)
