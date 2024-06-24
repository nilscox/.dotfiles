#!/usr/bin/env sh

set -eo pipefail

dot=$(dirname $(readlink -f "$0"))
config="${XDG_CONFIG_HOME:-$HOME/.config}"

# packages

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -S $(cat ./packages/packages.pacman)

tmp=$(mktemp -d)

(
  cd "$tmp"
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -is
)

rm -rf "$tmp"

yay -Syy
yay -S --noconfirm $(cat ./packages/packages.aur)

# alacritty

mkdir -p "$config/alacritty"
ln -s "$dot/alacritty/alacritty.toml" "$config/alacritty/alacritty.toml"

# electron

ln -s "$dot/electron/electron-flags.conf" "$config/electron-flags.conf"

# git

mkdir -p "$config/git"
ln -s "$dot/git/gitconfig.ini" "$config/git/config"

# kanshi

mkdir -p "$config/kanshi"
ln -s "$dot/kanshi/kanshi.config" "$config/kanshi/config"

# mako

mkdir -p "$config/mako"
ln -s "$dot/mako/mako.ini" "$config/mako/config"

# starship

mkdir -p "$config/starship"
ln -s "$dot/starship/starship.toml" "$config/starship/starship.toml"

# sway

mkdir -p "$config/sway"
ln -s "$dot/sway/config.d" "$config/sway/config.d"
ln -s "$dot/sway/scripts" "$config/sway/scripts"
ln -s "$dot/sway/config.sway" "$config/sway/config"

# systemd

mkdir -p "$config/systemd/user"

for unit in "$dot/systemd/*"; do
  ln -s "$unit" "$config/systemd/user"
done

# user-dirs

ln -s "$dot/user-dirs.dirs" "$config/user-dirs.dirs"

# vscode

mkdir -p "$config/VSCodium/User"
ln -s "$dot/vscode/settings.json" "$config/VSCodium/User/settings.json"
ln -s "$dot/vscode/keybindings.json" "$config/VSCodium/User/keybindings.json"
ln -s "$dot/vscode/snippets.json" "$config/VSCodium/User/snippets.json"

extensions=(
  bradlc.vscode-tailwindcss
  cardinal90.multi-cursor-case-preserve
  catppuccin.catppuccin-vsc
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  pkief.material-icon-theme
  sleistner.vscode-fileutils
  streetsidesoftware.code-spell-checker
  streetsidesoftware.code-spell-checker-french
  zhuangtongfa.material-theme
)

for extension in "${extensions[@]}"; do
  code --install-extension "$extension"
done

# waybar

mkdir -p "$config/waybar"
ln -s "$dot/waybar/waybar.jsonc" "$config/waybar/config.jsonc"
ln -s "$dot/waybar/waybar.css" "$config/waybar/style.css"

# wofi

mkdir -p "$config/wofi"
ln -s "$dot/wofi/wofi.ini" "$config/wofi/config"
ln -s "$dot/wofi/wofi.css" "$config/wofi/style.css"

# zsh

mkdir -p "$config/zsh"
ln -s "$dot/zsh/zshrc.sh" "$config/zsh/.zshrc"
ln -s "$dot/zsh/zshenv.sh" "$HOME/.zshenv"
