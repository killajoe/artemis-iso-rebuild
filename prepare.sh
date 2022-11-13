#!/usr/bin/env bash

# Get mirrorlist for offline installs
wget -qN --show-progress -P "airootfs/etc/pacman.d/" "https://raw.githubusercontent.com/endeavouros-team/EndeavourOS-ISO/main/mirrorlist"

# Get default mkinitcpio.conf
wget -qN --show-progress -P "airootfs/root/" "https://raw.githubusercontent.com/archlinux/mkinitcpio/master/mkinitcpio.conf"

# Get wallpaper for installed system
wget -qN --show-progress -P "airootfs/root/" "https://raw.githubusercontent.com/endeavouros-team/endeavouros-theming/master/backgrounds/endeavouros-wallpaper.png"

# Make sure build scripts are executable
chmod +x "./"{"mkarchiso","prepare.sh","run_before_squashfs.sh"}

get_pkg() {
    sudo pacman -Syw "$1" --noconfirm --cachedir "airootfs/root/packages" \
    && sudo chown $USER:$USER "airootfs/root/packages/"*".pkg.tar"*
}

get_pkg "endeavouros-skel-xfce4"


# current downgrade mesa for calamares lag in vms:
wget https://archive.archlinux.org/packages/m/mesa/mesa-22.1.7-1-x86_64.pkg.tar.zst
mv mesa-22.1.7-1-x86_64.pkg.tar.zst "airootfs/root/packages/"

# test downgrade mkinitcpio-archiso package:
#wget https://archive.archlinux.org/packages/m/mkinitcpio-archiso/mkinitcpio-archiso-64-1-any.pkg.tar.zst
#mv mkinitcpio-archiso-64-1-any.pkg.tar.zst "airootfs/root/packages/"

# Build liveuser skel
cd "airootfs/root/endeavouros-skel-liveuser"
makepkg -f
