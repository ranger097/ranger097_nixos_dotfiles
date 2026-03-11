import os
import subprocess

toggle_file = "toggle.txt"
wallpaper_directory = os.listdir("/home/ranger/ranger097_nixos_dotfiles/wallpapers/wallpapers")
num_of_wallpapers = len(wallpaper_directory)

with open(toggle_file, 'r') as f:
    x = int(f.readline().strip())
    print(x)

with open(toggle_file, 'w') as f:
    y = (x + 1) % (num_of_wallpapers + 1)
    full_file = f.write(str(y))

cat_string_file = "/home/ranger/ranger097_nixos_dotfiles/wallpapers/wallpapers/" + wallpaper_directory[x]
subprocess.run(["swww", "img", cat_string_file])
subprocess.run(["wal", "-i", cat_string_file])

print(cat_string_file)