# How to build ISO

You need to use an installed EndeavourOS system or any archbased system with EndeavourOS [repository](https://github.com/endeavouros-team/mirrors) enabled.

As the installer packages and needed dependencies will get installed from EndeavourOS repository.

general information: https://endeavouros-team.github.io/EndeavourOS-Development/

### Install build dependencies

```
sudo pacman -S archiso mkinitcpio-archiso git squashfs-tools --needed
```

## Calamares Packages:
Copy the 3 packages you can download here:
https://github.com/killajoe/artemis-iso-rebuild/releases
to this directory on the ISO build filesystem
~~~
airootfs/root/packages
~~~

Packages will get installed and directory will be cleaned up after that.

### Build

##### 1. Prepare

```
git clone https://github.com/killajoe/artemis-iso-rebuild.git
cd "artemis-iso-rebuild"
./prepare.sh
```

##### 2. Build

~~~
sudo ./mkarchiso -v "." 2>&1 | tee "eosiso_$(date -u +'%Y.%m.%d-%H:%M').log"
~~~

##### 3. The .iso appears in `out` directory
