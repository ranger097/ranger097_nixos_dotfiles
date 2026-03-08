[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&color=81A7F7&vCenter=true&width=435&height=20&lines=Hello%2C+Welcome+to+my+dotfiles+repo!!)](https://git.io/typing-svg)

Made for developers who like very secure (secureboot via lanzaboote, luks + TPM2, ) or *"[riced](https://www.reddit.com/r/unixporn/)"* systems, isolated and reproducible developer environments (via direnv), and fun scripts ive made to automate basic system task. As I learn more about Linux, Nixos, Hyprland, Automation, Systems Development and Programming as a whole, I will update this repo periodically.<br/>
(*Quick note, the colors in this flake might seem off. This is because I use hyprsunset and you can easily disable it in hyprland.conf*)

## Instructions:
This flake is hardware "agnostic(*for lack of a better word*)" (*because nixos is [Goated](https://pbs.twimg.com/media/HA4fYrxXkAE0Rt3.jpg) like that*), but there are a few steps you need to take in order to successfully use this flake. If you dont have [luks](https://youtu.be/iRtVfqBXNVE?si=AU-ZzNTCsll_NwXP) encryption, you should start with that first. Second, secure boot is not optional with this flake you would be better off just cloning the repo or forking it and just copying what you want. This system is flake designed to be secure (*and cool*).

## 1. Secure Boot (*aka lanazaboote*).
The first step you must take is going to your bios settings and turning on secure boot. __IMPORTANT!__: You must make sure it is in "__AUDITED__" mode and __NOT__ in __"DEPLOYED"__ mode. <br/>

### 1.1 Secure Boot keys.
When you are in the bios settings, make sure if you have secure boot keys (*just do this step anyway*) to clear them, reset them, delete them, etc.<br/>

## 2. __Resetting the keys is crucial__. 
Step 2 is to make sure you did step 1 (*Actually*). 

## 3. Clone my flake to your home-directory.
*If you are on a fresh install you need to install git first*
```
git clone https://github.com/ranger097/ranger097_nixos_dotfiles.git
```

## 3.1 Hardware-configuration.nix.
Before you run the flake you need to set a host.<br/>
Firstly you need to make a branch for this flake.<br/>
(*Replace the "yourHostNameHere" with the actual host name of your system. If you are a real one you will name it after a pokemon, but not everyone is a nerd like me.*)
```
git checkout -b yourHostNameHere
```

## 4. Hosts.
(*cd into the dotfiles directory and list the subdirectories*)
```
cd ranger097_nixos_dotfiles/hosts/ && ls
```

You should see 2 host, "deoxy" and "jirachi".<br/>
Lets make a new directory.<br/> 
(*Call it your host name.*)<br/>
```
mkdir yourHostNameHere
```

## 4.1 Making a new host.
Now you should be inside of the "ranger097_nixos_dotfiles/hosts/" directory.
You should a have 3 subdirectories deoxy, jirachi, and the directory named after your host (*or pokemon*).
Use this command to paste the "hardware-configuration.nix" from deoxy to your host directory. (*Change "yourHostNameHere" to your actual hostname.*)
```
cp etc/nixos/hardware-configuration.nix yourHostNameHere
```

## 4.2 Double Check
Now cd into your host directory and make sure you have a hardware-configuration.nix.
If so lets proceed. 


## 4.2 hardware-configuration.nix
Lets open your hardware-configuration.nix.
```
sudo nano hardware-configuration.nix
```
Paste this in your hardware-configuration.nix
```
 boot.initrd.luks.devices."PASTE THE UUID YOU GET WHEN RUNNING THE COMMAND HERE." = {
     device = "/dev/disk/by-uuid/PASTE THE UUID YOU GET WHEN RUNNING THE COMMAND HERE.";
     crypttabExtraOpts = [ "tpm2-device=auto" ];
  };
```
Look closely in the hardware-configuration.nix where it says:<br/> 
"boot.initrd.luks.devices"<br/>
and on the line below that<br/>
"device ="
<img width="3840" height="2400" alt="2026-03-08-010125_hyprshot" src="https://github.com/user-attachments/assets/60697550-fa27-4741-8c0f-6ae7119a704f" />
In another terminal or tab lets run a few commands.
```
sudo blkid -t TYPE=crypto_LUKS
```
My ID is "luks-7c42da92-5364-41d0-900d-68c9410d94e3"<br/>
Delete my "luks ID" (*aka UUID when you run the command above*) and paste yours into the hardware-configuration.nix file in the highlighted locations displayed in the screenshot.
*__IMPORTANT__: Notice i have __2__ luks devices. Big chance you have __1__. If so great. If not, add one.
<img width="3840" height="2400" alt="2026-03-08-012218_hyprshot" src="https://github.com/user-attachments/assets/0b63ea00-f57c-49ba-bae5-f2438049bc52" />
The screenshot above is how i have configured my second device if you needed too as well.



[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&color=F72D59&vCenter=true&width=435&height=20&lines=Flake%3A)](https://git.io/typing-svg)
``` 
sudo nixos-rebuild switch --flake github:ranger097/ranger097_nixos_dotfiles#jirachi
```
<br/>

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&pause=1000&color=81A7F7&vCenter=true&width=435&height=20&lines=Screenshots%3A)](https://git.io/typing-svg)

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
