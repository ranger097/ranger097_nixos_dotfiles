import os
import subprocess

toggle_file = "/home/ranger/ranger097_nixos_dotfiles/Python/theme_switcher/toggle.txt"
wallpaper_directory = os.listdir("/home/ranger/ranger097_nixos_dotfiles/wallpapers/wallpapers")
num_of_wallpapers = len(wallpaper_directory)

with open(toggle_file, 'r') as f:
    x = int(f.readline().strip())
    
with open(toggle_file, 'w') as f:
    y = (x + 1) % (num_of_wallpapers + 1)
    full_file = f.write(str(y))

cat_string_file = "/home/ranger/ranger097_nixos_dotfiles/wallpapers/wallpapers/" + wallpaper_directory[x]
subprocess.run(["wal", "-i", cat_string_file])
subprocess.run([
    "swww", "img", cat_string_file,
    "--transition-step", "90", 
    "--transition-type", "wave",
    "--transition-fps", "30"
])

