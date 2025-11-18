#!/usr/bin/env sh

set -eo pipefail

dot=$(dirname $(readlink -f "$0"))
config="${XDG_CONFIG_HOME:-$HOME/.config}"
data="${XDG_DATA_HOME:-$HOME/.local/share}"

packages() {
  sudo pacman-key --init
  sudo pacman-key --populate archlinux
  sudo pacman -S $(cat ./packages/packages.pacman | grep -v '^#')

  tmp=$(mktemp -d)

  (
    cd "$tmp"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -is
  )

  rm -rf "$tmp"

  yay -Syy
  yay -S --noconfirm $(cat ./packages/packages.aur | grep -v '^#')
}

zsh() {
  mkdir -p "$config/zsh"

  ln -sf "$dot/zsh/zshrc.sh" "$config/zsh/.zshrc"
  ln -sf "$dot/zsh/zshenv.sh" "$HOME/.zshenv"

  ZDOTDIR="$config/zsh" ZSH="$data/oh-my-zsh" CHSH="no" RUNZSH="no" KEEP_ZSHRC="yes" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/lukechilds/zsh-nvm "$data/oh-my-zsh/custom/plugins/zsh-nvm"

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
  sudo systemctl enable --now polkit
  sudo systemctl enable --now NetworkManager.service
  sudo systemctl enable --now systemd-timesyncd.service
  sudo systemctl enable --now reflector.timer

  mkdir -p "$config/systemd/user"

  for unit in $(ls "$dot/systemd"); do
    ln -s "$dot/systemd/$unit" "$config/systemd/user/$unit"
  done

  systemctl --user enable --now ssh-agent.service
  systemctl --user enable --now kanshi.service
  systemctl --user enable --now mako.service
  systemctl --user enable --now ulanucher.service
  systemctl --user enable --now waybar.service
  systemctl --user enable --now wallpaper.timer
}

vscode() {
  dir="$config/Code - OSS/User"

  mkdir -p "$dir"

  ln -sf "$dot/vscode/settings.json" "$dir/settings.json"
  ln -sf "$dot/vscode/keybindings.json" "$dir/keybindings.json"
  ln -sf "$dot/vscode/snippets" "$dir/snippets"

  ln -sf "$dot/vscode/code-flags.conf" "$config/code-flags.conf"

  extensions=(
    Anjali.clipboard-history
    bradlc.vscode-tailwindcss
    cardinal90.multi-cursor-case-preserve
    catppuccin.catppuccin-vsc
    Catppuccin.catppuccin-vsc
    dbaeumer.vscode-eslint
    dbankier.vscode-quick-select
    esbenp.prettier-vscode
    formulahendry.auto-rename-tag
    PKief.material-icon-theme
    sleistner.vscode-fileutils
    streetsidesoftware.code-spell-checker
    streetsidesoftware.code-spell-checker-french
  )

  for extension in "${extensions[@]}"; do
    code --install-extension "$extension"
  done
}

wallpaper() {
  ln -s /usr/share/pixmaps/archlinux-logo.png $HOME/.default.png
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
