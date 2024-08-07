#!/usr/bin/env sh

set -eo pipefail

dot=$(dirname $(readlink -f "$0"))
config="${XDG_CONFIG_HOME:-$HOME/.config}"

packages() {
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
}

zsh() {
  mkdir -p "$config/zsh"

  ln -s "$dot/zsh/zshrc.sh" "$config/zsh/.zshrc"
  ln -s "$dot/zsh/zshenv.sh" "$HOME/.zshenv"

  chsh -s $(which zsh)
}

alacritty() {
  mkdir -p "$config/alacritty"
  ln -s "$dot/alacritty/alacritty.toml" "$config/alacritty/alacritty.toml"
}

electron() {
  ln -s "$dot/electron/electron-flags.conf" "$config/electron-flags.conf"
}

firefox() {
  xdg-settings set default-web-browser firefox.desktop
}

git() {
  mkdir -p "$config/git"
  envsubst < "$dot/git/gitconfig.ini" > "$config/git/config"
}

kanshi() {
  mkdir -p "$config/kanshi"
  ln -s "$dot/kanshi/kanshi.config" "$config/kanshi/config"
}

mako() {
  mkdir -p "$config/mako"
  ln -s "$dot/mako/mako.ini" "$config/mako/config"
}

node() {
  git clone https://github.com/lukechilds/zsh-nvm.git "$ZSH/custom/plugins/zsh-nvm" --depth=1
  nvm install --lts
  nvm use --lts
  corepack enable pnpm
  pnpm install -g typescript tsx nodemon
}

podman() {
  mkdir -p "$config/containers"
  ln -s "$dot/podman/registries.conf" "$config/containers/registries.conf"
}

sqlite() {
  ln -sf "$dot/sqlite/sqliterc" "$HOME/.sqliterc"
}

starship() {
  mkdir -p "$config/starship"
  ln -s "$dot/starship/starship.toml" "$config/starship/starship.toml"
}

sway() {
  mkdir -p "$config/sway"
  ln -s "$dot/sway/config.sway" "$config/sway/config"
  ln -s "$dot/sway/config.d" "$config/sway/config.d"
  ln -s "$dot/sway/scripts" "$config/sway/scripts"
}

systemd() {
  sudo systemctl enable reflector.timer
  sudo systemctl enable systemd-timesyncd.service

  mkdir -p "$config/systemd/user"

  for unit in $(ls "$dot/systemd"); do
    ln -s "$dot/systemd/$unit" "$config/systemd/user/$unit"
  done
}

vscode() {
  dir="$config/VSCodium/User"

  mkdir -p "$dir"
  ln -s "$dot/vscode/settings.json" "$dir/settings.json"
  ln -s "$dot/vscode/keybindings.json" "$dir/keybindings.json"
  ln -s "$dot/vscode/snippets.json" "$dir/snippets.json"

  extensions=(
    bradlc.vscode-tailwindcss
    cardinal90.multi-cursor-case-preserve
    catppuccin.catppuccin-vsc
    Catppuccin.catppuccin-vsc
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    PKief.material-icon-theme
    sleistner.vscode-fileutils
    streetsidesoftware.code-spell-checker
    streetsidesoftware.code-spell-checker-french
  )

  # not available with vscodium
  # Anjali.clipboard-history
  # dbankier.vscode-quick-select

  for extension in "${extensions[@]}"; do
    vscodium --install-extension "$extension"
  done
}

waybar() {
  mkdir -p "$config/waybar"
  ln -s "$dot/waybar/waybar.jsonc" "$config/waybar/config.jsonc"
  ln -s "$dot/waybar/waybar.css" "$config/waybar/style.css"
}

wofi() {
  mkdir -p "$config/wofi"
  ln -s "$dot/wofi/wofi.ini" "$config/wofi/config"
  ln -s "$dot/wofi/wofi.css" "$config/wofi/style.css"
}

xdg() {
  ln -s "$dot/xdg/user-dirs.dirs" "$config/user-dirs.dirs"
}

if [ -n "$1" ]; then
  "$1"
else
  declare -F | sed 's/declare -f //'
fi
