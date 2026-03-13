## Welcome to my dotfiles repo!!
Made for developers who like very secure systems featuring [Lanzaboote](https://youtu.be/sbG1ENGWoIg?si=BcS0beGMHFDTaBlZ), [LUKS + TPM](https://av.tib.eu/media/61546), heavily *"[riced](https://www.reddit.com/r/unixporn/)"* systems, isolated and reproducible developer environments (via direnv), and fun scripts ive made to automate basic system task. As I learn more about Linux, Nixos, Hyprland, Automation, Systems Development and Programming as a whole, I will update this repo periodically.<br/>

## Quick notes:
* I make frequent changes to this repo and all changes (*Mostly small UI changes or security tweaks*) might not yet be reflected in screenshots or have instructions wriiten for the changes. The end result will have multiple themes and multiple waybar layouts that users can pick from. Once i have enough progress done for an official "version 1.0.0". I will branch this repo and main will be stable. Until then main is very *"unstable"* in terms of UI changes, but its very cool and very usable.
* The colors in this flake might seem off. This is because I use hyprsunset and you can easily disable it in hyprland.conf

## Instructions:
This flake is hardware "agnostic(*for lack of a better word*)" (*because nixos is really [Goated](https://pbs.twimg.com/media/HA4fYrxXkAE0Rt3.jpg) like that*), but there are a few steps you need to take in order to successfully use this flake. If you dont have [luks](https://youtu.be/iRtVfqBXNVE?si=AU-ZzNTCsll_NwXP) encryption, you should start with that first. Second, secure boot is not optional with this flake you would be better off just cloning the repo or forking it and just copying what you want. This system flake is designed to be secure (*and cool*).

## 1. Secure Boot (*aka lanzaboote*).
The first step you must take is going to your bios settings and turning on secure boot. __IMPORTANT!__: You must make sure it is in "__SETUP_MODE__" OR "__AUDITED__" mode and __NOT__ in __"DEPLOYED"__ mode. (QUICK SIDE NOTE: Normally you would NOT use AUDITED mode but my laptop lacks setup mode and AUDITED mode worked for me and *Might* work for you.)<br/>

### 1.1 Secure Boot keys.
When you are in the bios settings, make sure if you have secure boot keys (*just do this step anyway*) to clear them, reset them, delete them, etc.<br/>
(*Wouldnt be a bad idea to set a very strong bios password as well.*)

## 2. __Resetting the keys is crucial__. 
Step 2 is to make sure you did step 1 (*Actually*). 

## 3. Fork my flake.
Click fork button above and make a fork of the flake (star this repo too since we already clicking).
Now we will clone that fork.
*If you are on a fresh install you need to install git first*
```
git clone THE-LINK-TO-YOUR-FORK.
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
You should have 3 sub-directories deoxy, jirachi, and the directory named after your host (*or pokemon*).
Use this command to paste the "hardware-configuration.nix" from your system to your host directory. (*Change "yourHostNameHere" to your actual hostname.*)
```
sudo cp /etc/nixos/hardware-configuration.nix yourHostNameHere/
```

## 4.2 Double Check
Now "cd" and "ls" into your host directory and make sure you have a hardware-configuration.nix.
If so lets proceed. 

## 4.3 hardware-configuration.nix
Lets open your hardware-configuration.nix.
```
sudo nano hardware-configuration.nix
```
Paste this in your hardware-configuration.nix if it doesnt already exist.
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

<img width="3840" height="2400" alt="2026-03-12-064052_hyprshot" src="https://github.com/user-attachments/assets/c72c863b-f292-4f03-9169-66f6c787c838" />

In another terminal or tab lets run a few commands.
```
sudo blkid -t TYPE=crypto_LUKS
```
and or 
```
lsblk -f
```
My ID is "__luks-7c42da92-5364-41d0-900d-68c9410d94e3__"<br/>
Delete "PASTE THE UUID YOU GET WHEN RUNNING THE COMMAND HERE." and replace it with "YOUR ID" (*aka UUID when you run the command above*) (*Hint: use the highlighted locations displayed in the screenshot if you need help with the formating*)
*__IMPORTANT__: Notice i have __2__ luks devices. Big chance you have __1__. If so great. If not, add one.

<img width="3840" height="2400" alt="2026-03-12-064913_hyprshot" src="https://github.com/user-attachments/assets/713713ef-07ac-4a4e-85dc-351ac94b5473" />

The screenshot above is how i have added my second device if you needed too as well.
Save the file and exit back to the terminal.

## 5. Flake.nix
First run this command to go back to the ranger097_nixos_dotfiles repo.
```
cd ~/ranger097_nixos_dotfiles
```
Inside the ranger097_nixos_dotfiles repo lets enter the flake.nix.
```
sudo nano flake.nix
```
Okay look at the screenshot below.

<img width="3840" height="2400" alt="2026-03-12-065338_hyprshot" src="https://github.com/user-attachments/assets/4c34841e-2b48-4da6-b8c8-70cb80df95c8" />

Notice how "deoxy" is written 3 times in the flake. Remove the name "deoxy" and write in your hostname in all 3 locations in the highlighted area in the screenshot.

## 5.2 Keys
Save the flake.nix and exit the file back to the terminal. 
We are finally at the point were you can setup secure boot keys
```
sudo sbctl create-keys
```
```
sudo sbctl enroll-keys --microsoft
```

## 5.2 Git.
Make sure you are still in the ~/ranger097_nixos_dotfiles directory.
We have made alot of changes and now its time to save those changes to your Github branch.
```
git add .
```
```
git commit -m "added hardware config"
```
```
git push origin main
```
```
sudo nixos-rebuild switch --flake .#yourHostNameHere
```

## 6. Congrats!!
Youre system flake will be built with:
```
sudo nixos-rebuild switch --flake .#yourHostNameHere
```
Your remote flake will follow the path:
``` 
sudo nixos-rebuild switch --flake github:GITHUB_USER_NAME/GITHUB_REPO_NAME#HOST_NAME
```
Look at examples of my flake below:
``` 
sudo nixos-rebuild switch --flake github:ranger097/ranger097_nixos_dotfiles#jirachi
```
``` 
sudo nixos-rebuild switch --flake github:ranger097/ranger097_nixos_dotfiles#deoxy
```

## Features and Ricing.
__[Rofi](https://github.com/davatorium/rofi)__
<img width="3840" height="2400" alt="2026-03-12-051820_hyprshot" src="https://github.com/user-attachments/assets/7a4508bd-df4e-4e7a-ab92-89aa7bd40e0d" />
<img width="3840" height="2400" alt="2026-03-12-051909_hyprshot" src="https://github.com/user-attachments/assets/2ef24415-4866-4b09-8f32-e2e29c6b69ef" />
<img width="3840" height="2400" alt="2026-03-12-051952_hyprshot" src="https://github.com/user-attachments/assets/06e83ae5-2994-4b85-8302-ed15f80db6cb" />

__[Vscode](https://code.visualstudio.com/)__
<img width="3840" height="2400" alt="2026-03-12-032539_hyprshot" src="https://github.com/user-attachments/assets/0fdd9655-607f-4143-91ed-3a45d4e32271" />
<img width="3840" height="2400" alt="2026-03-12-032615_hyprshot" src="https://github.com/user-attachments/assets/eb08784c-e507-48d8-bfbd-a14fba4b66dd" />
<img width="3840" height="2400" alt="2026-03-12-032800_hyprshot" src="https://github.com/user-attachments/assets/89a2f12d-a0a8-4edf-b7c6-5320453080ab" />
[Vscode Theme](https://marketplace.visualstudio.com/items?itemName=HeavenAldrico.aldrico-s-gruvbox)

__[Pokeget](https://github.com/talwat/pokeget-rs)__
<img width="3840" height="2400" alt="2026-03-12-031155_hyprshot" src="https://github.com/user-attachments/assets/75ca49db-574c-4fa4-8e62-db1d11fc187c" />
<img width="3840" height="2400" alt="2026-03-12-031617_hyprshot" src="https://github.com/user-attachments/assets/fac83c12-5a08-4e97-a8ec-2aaf4ffe3136" />
<img width="3840" height="2400" alt="2026-03-12-031836_hyprshot" src="https://github.com/user-attachments/assets/584554af-32e5-4bc4-b458-7e5f1afd8bb6" />

__[Qmmp](https://qmmp.ylsoftware.com/downloads.php)__, __[Waybar](https://github.com/Alexays/Waybar)__, and waybar module __[Mpris](https://github.com/natsukagami/mpd-mpris)__.
<img width="3840" height="2400" alt="2026-03-12-052249_hyprshot" src="https://github.com/user-attachments/assets/5f297987-dc8b-4de8-b76a-897f6d4db93d" />
<img width="3840" height="2400" alt="2026-03-12-052432_hyprshot" src="https://github.com/user-attachments/assets/e3c768bf-acdf-4be3-9447-d7eeaa0d368a" />
<img width="3840" height="2400" alt="2026-03-12-052351_hyprshot" src="https://github.com/user-attachments/assets/2d37cf65-1259-4752-94b6-c09f055bfc93" />

__[Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/)__
<img width="3840" height="2400" alt="2026-03-12-052958_hyprshot" src="https://github.com/user-attachments/assets/9c9f41bf-9bca-48ad-9b2c-8a819a45c343" />
<img width="3840" height="2400" alt="2026-03-12-053256_hyprshot" src="https://github.com/user-attachments/assets/ceab4f08-30fc-4375-92c6-066387060f5e" />
<img width="3840" height="2400" alt="2026-03-12-053157_hyprshot" src="https://github.com/user-attachments/assets/bce975ee-8e32-4d07-98a9-8f84fff689bf" />
Here you will see that youtube has grey text and thumbnails unless hovered over(then its full of color). This is because im a night owl and im trying to limit brightness and bluelight. All played videos are normal with no added effects so its a minimal change in functionality beside saving your eyes (*I thought the pixel peepers would apreciate this*). That being said this is disabled by default. If you want to achieve this, simply download the userstylus extension in firefox and copy the css i provided in the flake in the "youtube" directory. paste it into the userstylus and Boom!, youre done. Easy.


## Themes:
There is probably 30 or 40 themes included in this flake.
Thanks to SWWW, Pywal, and Python, you can easily switch themes as easy as pressing the "theme button" on the bottom left corner. (*Quick Note: Waybar is being managed by home-manager and will require you to update the flake in order to reload the waybar theme. If you are using my built-in bash scripts from bash.nix you can just run "jgit" or whatever you decide to change it too*). Here are some examples below.

<img width="3840" height="2400" alt="2026-03-12-065730_hyprshot" src="https://github.com/user-attachments/assets/a5e50137-e0fa-459a-b569-0fa3ddd38b63" />
<img width="3840" height="2400" alt="2026-03-12-065913_hyprshot" src="https://github.com/user-attachments/assets/05c52a05-7082-489c-ad35-71649db85d72" />
<img width="3840" height="2400" alt="2026-03-12-065955_hyprshot" src="https://github.com/user-attachments/assets/30231278-64b2-4315-bd05-40728f759ec8" />
<img width="3840" height="2400" alt="2026-03-12-070030_hyprshot" src="https://github.com/user-attachments/assets/10926a34-6a6a-483a-8296-e1363dff12be" />
<img width="3840" height="2400" alt="2026-03-12-070221_hyprshot" src="https://github.com/user-attachments/assets/77369a1a-a104-4451-8e88-2c3020210f87" />

## Fonts:
[Maple Mono NF](https://github.com/subframe7536/maple-font) is the only font I use. You can easily add more but its so beautiful i use it system wide.
Im a sucker for font ligatures and italics(*I need all my fancy programming symbols and fancy cursive functions*).<br/>
If you are like me and enjoy a good __[nerd font](https://www.nerdfonts.com/font-downloads)__ you might wanna check these out. 

* [Victor Mono NF](https://github.com/rubjo/victor-mono)
* [JetBrains Mono NF](https://github.com/JetBrains/JetBrainsMono)
* [Caskaydia Cove NF](https://github.com/eliheuer/caskaydia-cove)

## Featured Applications:
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

## Cursors:
The cursor depicted in the screenshots above is a __[Pokemon Cursor](https://store.kde.org/p/1701595)__ (*you might be noticing a theme here.*) from the __[KDE Store](https://store.kde.org/browse/)__.

## New Features:
* Theme switcher 

## Coming Soon:
* A website.    
* Hyprland settings app.
* More Security features.
* Anime Wallpapers.

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Maple+mono&weight=600&duration=4&pause=1000&color=74B9FF&vCenter=true&multiline=true&repeat=false&width=596&height=110&lines=Thank+you+so+much+for+the+Support.;I+really+hope+you+enjoy+this+Flake.;Please+leave+a+Star+and+Share+this;Flake+with+friends+and+colleagues.)](https://git.io/typing-svg)
