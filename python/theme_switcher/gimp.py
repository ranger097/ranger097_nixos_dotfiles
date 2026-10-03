import os
import subprocess

dotfiles_dir = "/home/ranger/ranger097_nixos_dotfiles"
wallpaper_directory = f"{dotfiles_dir}/wallpapers/wallpapers"
blur_wallpaper_directory = f"{dotfiles_dir}/wallpapers/blur"

wallpaper_photos = os.listdir(wallpaper_directory)
blur_wallpaper_photos = os.listdir(blur_wallpaper_directory)

wallpapers = [
os.path.join(wallpaper_directory, photo)
for photo in wallpaper_photos
if photo not in blur_wallpaper_photos
]

subprocess.run(["gimp", *wallpapers])


