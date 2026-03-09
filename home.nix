{ config, pkgs, osConfig, ... }:

let
 myCursor = pkgs.runCommand "local-cursor" {} ''
 mkdir -p $out/share/icons/Pokemon
 cp -r ${./icons/Pokemon}/* $out/share/icons/Pokemon/ 
 '';

in
{
  home.username = "ranger";
  home.homeDirectory = "/home/ranger";
  home.stateVersion = "25.11"; 

  home.pointerCursor = {
     package = myCursor;
     name = "Pokemon";
     size = 32;
     gtk.enable = true;
     x11.enable = true;
  };

  home.file = {
    ".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;
    ".config/hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
    ".config/hypr/hyprsunset.conf".source = ./hypr/hyprsunset.conf;
    ".config/waybar".source = ./waybar; 
    ".config/ghostty".source = ./ghostty;
    ".config/starship.toml".source = ./starship/starship.toml;
    ".config/rofi".source = ./rofi; 
    ".config/wlogout".source = ./wlogout;
  };

wayland.windowManager.hyprland = {
enable = true;
systemd.enable = false;
extraConfig = ''

#ranger097
monitor = ${ if osConfig.networking.hostName == "jirachi"
	     then "eDP-1, 3840x2400@59.99400, 0x0, 3"
             else "eDP-1, 1920x1080@60.054, 0x0, 1"}   

#INFORMATION
ecosystem:no_update_news = true

#AUTOSTART
exec-once = hyprlock
exec-once = swww-daemon
exec-once = /home/ranger/ranger097_nixos_dotfiles/wallpapers/Guweiz/1116508.jpg
#exec-once = LD_LIBRARY_PATH=/run/opengl-driver/lib mpvpaper -o "no-audio --loop-playlist --panscan=1.0 hwdec=auto" eDP-1 /home/ranger/Videos/wallpapers/guweiz.mp4
exec-once = waybar -c ~/.config/waybar/top.jsonc -s ~/.config/waybar/top.css
exec-once = waybar -c ~/.config/waybar/bottom.jsonc -s ~/.config/waybar/bottom.css
exec-once = protonvpn-app
exec-once = hypridle
exec-once = hyprsunset
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once = systemctl --user start hyprpolkitagent
exec-once = hyprctl setcursor Pokemon 32

#ENVIRONMENT
#env = HYPRCURSOR_THEME,Pokemon
#env = HYPRCURSOR_SIZE, 48
env = XCURSOR_THEME,Pokemon
env = XCURSOR_SIZE, 48
env = QT_QPA_PLATFORMTHEME,qt6ct
env = QT_QPA_PLATFORM,wayland
env = GDK_SCALE,1
env = GDK_DPI_SCALE,1
env = GODOT_PLATFORM,wayland
env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
cursor {
    no_hardware_cursors = true
    use_cpu_buffer = true
}

xwayland {
force_zero_scaling = true
use_nearest_neighbor = true
}

#PERMISSIONS
permission = /usr/(bin|local/bin)/hyprpm, plugin, allow

#SETTINGS_START
general {
#GAPS
gaps_in = 3
gaps_out = 30
border_size = 1

#BORDER
#col.active_border = rgba(249,238,195,1)
#col.inactive_border = rgba(249,238,195,1)
col.active_border = rgba(30,30,30,1)
col.inactive_border = rgba(30,30,30,1)

#BORDER_ANIMATION
#animations {
#bezier = linear, 0.0, 0.0, 0.0, 0.0
#animation = borderangle, 1, 200, linear, loop
#}

#ALTERNATIVE
resize_on_border = true
allow_tearing = false
layout = dwindle
}

#SETTINGS_END

#WINDOW_SETTINGS_START
decoration {
rounding = 15
rounding_power = 2
active_opacity = 1.0
inactive_opacity = 1.0

#SHADOW
shadow {
enabled = true
range = 5
render_power = 2
color = rgba(0,0,0,0.4)
offset = -3 4
sharp = false
scale = 0.99
}

#BLUR
blur {
enabled = true
size = 4
passes = 3
contrast = 1
vibrancy = -0.5
vibrancy_darkness = -0.5
brightness = 1.3
noise = 0.0
popups = true
}
}
#WINDOW_SETTINGS_END

#ANIMATION_SETTINGS_START
animations {
enabled = yes, please :)
bezier = easeOutQuint,0.23,1,0.32,1
bezier = easeInOutCubic,0.65,0.05,0.36,1
bezier = linear,0,0,1,1
bezier = almostLinear,0.5,0.5,0.75,1.0
bezier = quick,0.15,0,0.1,1
animation = global, 1, 10, default
animation = border, 1, 5.39, easeOutQuint
animation = windows, 1, 4.79, easeOutQuint
animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
animation = windowsOut, 1, 1.49, linear, popin 87%
animation = fadeIn, 1, 1.73, almostLinear
animation = fadeOut, 1, 1.46, almostLinear
animation = fade, 1, 3.03, quick
animation = layers, 1, 3.81, easeOutQuint
animation = layersIn, 1, 4, easeOutQuint, fade
animation = layersOut, 1, 1.5, linear, fade
animation = fadeLayersIn, 1, 1.79, almostLinear
animation = fadeLayersOut, 1, 1.39, almostLinear
animation = workspaces, 1, 1.94, almostLinear, fade
#animation = workspacesIn, 1, 1.21, almostLinear, fade
animation = workspacesOut, 1, 1.94, almostLinear, fade
animation = workspaces, 1, 2.5, almostLinear, slidefadevert
}
#ANIMATION_SETTINGS_END

#DWINDLE_SETTINGS_START
dwindle {
pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
preserve_split = true # You probably want this
}
#DWINDLE_SETTINGS_END

#MASTER_SETTINGS_START
master {
new_status = master
}
#MASTER_SETTINGS_END

#MISC_SETTINGS_START
misc {
force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
session_lock_xray = true
}

#MISC_SETTINGS_END

#INPUT_SETTINGS_START
input {
kb_layout = us
kb_variant =
kb_model =
kb_options =
kb_rules =
follow_mouse = 1
sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
touchpad {
natural_scroll = false
}
}
#INPUT_SETTINGS_END

#DEVICE_SETTINGS_START
device {
name = epic-mouse-v1
sensitivity = -0.5
}
#DEVICE_SETTINGS_END

#KEYBINDINGS_SETTINGS_START
bind = SUPER, Return, exec, /run/current-system/sw/bin/ghostty
bind = SUPER, Q, killactive,
bind = SUPER, Z, togglefloating,
bind = SUPER, A, exec, /run/current-system/sw/bin/rofi -show drun || pkill rofi
bind = SUPER, J, togglesplit, # dwindle
bind = SUPER, B, exec, librewolf
bind = SUPER, D, exec, dolphin
bind = SUPER, C, exec, code
bind = SUPER, F, fullscreenstate, 2
bind = SUPER, M, exec, waybar -c ~/ranger097_nixos_dotfiles/waybar/top.jsonc -s ~/ranger097_nixos_dotfiles/waybar/top.css
bind = SUPER, Space, exec,  waybar -c ~/ranger097_nixos_dotfiles/waybar/bottom.jsonc -s ~/ranger097_nixos_dotfiles/waybar/bottom.css
bind = SUPER, X, exec, pkill waybar
bind = SUPER, V, exec, freetube
bind = SUPER, H, exec, hyprshot -m output -m eDP-1
bind = SUPER, P, exec, systemctl --user restart pipewire
# Move focus with mainMod + arrow keys
bind = SUPER, left, movefocus, l
bind = SUPER, right, movefocus, r
bind = SUPER, up, movefocus, u
bind = SUPER, down, movefocus, d
bind = SUPER, L, exec, hyprlock

# Switch workspaces with mainMod + [0-9]
bind = SUPER, 1, workspace, 1
bind = SUPER, 2, workspace, 2
bind = SUPER, 3, workspace, 3
bind = SUPER, 4, workspace, 4
bind = SUPER, 5, workspace, 5
bind = SUPER, 6, workspace, 6
bind = SUPER, 7, workspace, 7
bind = SUPER, 8, workspace, 8
bind = SUPER, 9, workspace, 9
bind = SUPER, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = SUPER SHIFT, 1, movetoworkspace, 1
bind = SUPER SHIFT, 2, movetoworkspace, 2
bind = SUPER SHIFT, 3, movetoworkspace, 3
bind = SUPER SHIFT, 4, movetoworkspace, 4
bind = SUPER SHIFT, 5, movetoworkspace, 5
bind = SUPER SHIFT, 6, movetoworkspace, 6
bind = SUPER SHIFT, 7, movetoworkspace, 7
bind = SUPER SHIFT, 8, movetoworkspace, 8
bind = SUPER SHIFT, 9, movetoworkspace, 9
bind = SUPER SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = SUPER, S, togglespecialworkspace, magic
bind = SUPER SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = SUPER, mouse_down, workspace, e+1
bind = SUPER, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = SUPER, mouse:272, movewindow
bindm = SUPER, mouse:273, resizewindow

#hyprlock
bindl =, switch:on:Lid Switch, exec, hyprlock & systemctl suspend

# Laptop multimedia keys for volume and LCD brightness
bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

# Requires playerctl
bindl = , XF86AudioNext, exec, playerctl next
bindl = , XF86AudioPause, exec, playerctl play-pause
bindl = , XF86AudioPlay, exec, playerctl play-pause
bindl = , XF86AudioPrev, exec, playerctl previous
#KEYBINDING_SETTINGS_END

#WINDOW_RULE_SETTINGS_START
windowrule = match:class code, opacity 0.7
windowrule = match:class firefox, opacity 1.0
windowrule = match:class discord, opacity 1.0
windowrule = match:fullscreen opacity 1.0 override
windowrule = match:class libreoffice-writer, opacity 1.0
windowrule = match:class org.pulseaudio.pavucontrol, opacity 0.7
windowrule = match:class .blueman-manager-wrapped, opacity 0.7
#WINDOW_RULE_SETTINGS_END

#LAYER_RULE_SETTINGS_START
layerrule = blur on, match:namespace rofi
layerrule = match:namespace rofi, ignore_alpha 0.0
layerrule = match:namespace waybar, ignore_alpha 0.1
layerrule = blur on, match:namespace waybar
layerrule = blur on, match:namespace wlogout
#LAYER_RULE_SETTINGS_END

 '';  

  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
