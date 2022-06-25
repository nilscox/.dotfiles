## required packages

```
sudo dhcpcd wpa_supplicant netctl syslinux git openssh
```

## syslinux install

```
mkdir /boot/efi
mv /boot/syslinux /boot/efi
cp -r /usr/lib/syslinux/efi64 /boot/efi/syslinux
nano /boot/efi/syslinux.cfi # set prompt, vmlinuz, disk
efibootmgr
```

# manual steps

## env

- create ~/.zshrc.local
- copy ssh keys
- edit xorg configuration files
- create bookmarks in gtk file dialog
- enable netctl-auto
- create and fill ~/.wallpapers
- login in pcloudcc

## firefox

- login
- create ~/.mozilla/firefox/<profile>/chrome/userChrome.css
- set /tmp/downloads as download destination
- set toolkit.legacyUserProfileCustomizations.stylesheets to true in firefox about:config
- set apz.gtk.kinetic_scroll.enabled to false
- configure extensions (tree style tab, vimium, tab suspender)

## chrome

- enable chrome://flags/#allow-insecure-localhost
- set /tmp/downloads as download destination
- create sessions
