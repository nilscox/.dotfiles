## required packages

```
base linux linux-firmware dosfstools efibootmgr syslinux dhcpcd wpa_supplicant vim sudo git
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
- create bookmarks in gtk file dialog
- create and fill ~/.wallpapers

## firefox

- login
- create ~/.mozilla/firefox/<profile>/chrome/userChrome.css
- set toolkit.legacyUserProfileCustomizations.stylesheets to true in firefox about:config
- set apz.gtk.kinetic_scroll.enabled to false

## chrome

- enable chrome://flags/#allow-insecure-localhost
- set /tmp/downloads as download destination

## flatpak

- edit /var/lib/flatpak/exports/share/applications/com.slack.Slack.desktop
- set `Exec=... --command=slack --socket=wayland ...`
