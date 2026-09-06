{ config, pkgs, ... }:{
programs.bash = {
enable = true;
shellAliases = {
bye = "shutdown -h now";
bii = "nvim /home/ranger/ranger097_nixos_dotfiles/bash/";
nii = "cd /home/ranger/ranger097_nixos_dotfiles";
gii = "bash /home/ranger/ranger097_nixos_dotfiles/bash/github.sh";
hii = "nvim /home/ranger/ranger097_nixos_dotfiles/home.nix";
wii = "nvim /home/ranger/ranger097_nixos_dotfiles/waybar";
cii = "cd /home/.config/";
pii = "nvim /home/ranger/ranger097_nixos_dotfiles/python";
usii = "bash /home/ranger/ranger097_nixos_dotfiles/bash/user.sh";
exii = "cd /home/ranger/Projects/Exercism/";
excii = "bash /home/ranger/ranger097_nixos_dotfiles/bash/exer.sh";
mii = "cd /home/ranger/Music/";
nvii = "nvim /home/ranger/ranger097_nixos_dotfiles/development/nixvim.nix";
sii = "bash /home/ranger/ranger097_nixos_dotfiles/bash/ssh.sh";
webii="bash /home/ranger/ranger097_nixos_dotfiles/bash/web.sh";
prii="cd /home/ranger/Projects/";
glii="cd /home/ranger/Projects/TheGlazePopStudioWeb/ && ./webserver.sh";
rii = "bash /home/ranger/ranger097_nixos_dotfiles/bash/rice.sh";
nirii = "nvim /home/ranger/ranger097_nixos_dotfiles/niri/config.kdl";
tii = "cd /home/ranger/Projects/TimFord/";
peaclock="peaclock --config-dir=/home/ranger/ranger097_nixos_dotfiles/peaclock";
};
   
interactiveShellInit = ''
#!/usr/bin/env
source /home/ranger/ranger097_nixos_dotfiles/bash/development.sh
source /home/ranger/ranger097_nixos_dotfiles/bash/system_info.sh
source /home/ranger/ranger097_nixos_dotfiles/bash/language_info.sh
source /home/ranger/ranger097_nixos_dotfiles/bash/update.sh
source /home/ranger/ranger097_nixos_dotfiles/bash/git.sh
source /home/ranger/ranger097_nixos_dotfiles/bash/wal.sh
source /home/ranger/ranger097_nixos_dotfiles/bash/music.sh
source /home/ranger/ranger097_nixos_dotfiles/bash/home.sh
export EDITOR=nvim
export VISUAL=nvim
'';

promptInit = ''
PS1='\n\[\e[0;35m\] \[\e[0;36m\]\h \[\e[0;34m\]󱕅 \[\e[0;36m ジラーチ\[\e[0;35m\]   \[\e[0;31m\] \[\e[0;36m\]$(get_dir_name)\[\e[0;36m\]$(parse_git_branch)\[\e[0;36m\]$(get_lang_info) \n\[\e[0;35m\] \[\e[0;36m\]\u \[\e[0;34m\] 󱕅 \[\e[0;36mエンジニア \[\e[0;35m\] \[\e[0;31m\] \[\e[0m\]'
'';
};
}

