#!/usr/bin/env sh

dot=${dot:-$(dirname $(readlink -f "$0"))}
config="${XDG_CONFIG_HOME:-$HOME/.config}"
data="${XDG_DATA_HOME:-$HOME/.local/share}"

exit_error() {
  echo "$1" >&2
  exit 1
}

install_packages() {
  [ $(whoami) != 'root' ] && exit_error 'must be root'

  pacman-key --init; pacman-key --populate
  pacman -Syyu --noconfirm $(cat "$dot/packages/packages.pacman" | grep -v '^#')
}

install_packages_aur() {
  git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
  (cd /tmp/yay-bin && makepkg -si --noconfirm)
  yay -Syyu --noconfirm $(cat "$dot/packages/packages.aur" | grep -v '^#')
}

setup_autologin() {
  [ $(whoami) == 'root' ] && exit_error 'must not be root'

  file=/etc/systemd/system/getty@tty1.service.d/autologin.conf
  sudo mkdir -p $(dirname "$file")

  echo "[Service]
ExecStart=
ExecStart=-/sbin/agetty --noreset --noclear --autologin $(whoami) - \${TERM}" | sudo tee "$file"
}

setup_zsh() {
  mkdir -p "$config/zsh"

  ln -sf "$dot/zsh/zshrc.sh" "$config/zsh/.zshrc"
  ln -sf "$dot/zsh/zshenv.sh" "$HOME/.zshenv"

  git clone https://github.com/ohmyzsh/ohmyzsh "$data/ohmyzsh"

  sudo chsh $(whoami) -s $(which zsh)
}

setup_systemd() {
  mkdir -p "$config/systemd/user"

  for unit in $(ls "$dot/systemd"); do
    ln -s "$dot/systemd/$unit" "$config/systemd/user/$unit"
  done

  sudo systemctl enable NetworkManager.service
  sudo systemctl enable systemd-timesyncd.service
  sudo systemctl enable reflector.timer

  systemctl --user enable ssh-agent.service
  systemctl --user enable kanshi.service
  systemctl --user enable mako.service
  systemctl --user enable waybar.service
  systemctl --user enable wallpaper.timer
}

setup_ssh() {
  mkdir -p "$HOME/.ssh"
  ln -s "$dot/ssh/config" "$HOME/.ssh/config"
}

setup_git() {
  [ -z "$GIT_NAME" ] && exit_error "\$GIT_NAME is not set"
  [ -z "$GIT_EMAIL" ] && exit_error "\$GIT_EMAIL is not set"

  mkdir -p "$config/git"
  envsubst < "$dot/git/config.ini" > "$config/git/config"
}

setup_node() {
  git clone https://github.com/nvm-sh/nvm "$data/nvm"
  source "$data/nvm/nvm.sh"
  nvm install --lts
  corepack enable pnpm
}

setup_sway() {
  mkdir -p "$config/sway"
  ln -s "$dot/sway/config.sway" "$config/sway/config"
  ln -s "$dot/sway/config.d" "$config/sway/config.d"
  ln -s "$dot/sway/scripts" "$config/sway/scripts"
}

setup_waybar() {
  mkdir -p "$config/waybar"
  ln -s "$dot/waybar/config.jsonc" "$config/waybar/config.jsonc"
  ln -s "$dot/waybar/style.css" "$config/waybar/style.css"
  ln -s "$dot/waybar/power-menu.xml" "$config/waybar/power-menu.xml"
}

setup_wallpapers() {
  mkdir -p $XDG_DATA_HOME/wallpapers
  ln -s /usr/share/pixmaps/archlinux-logo.png $XDG_DATA_HOME/wallpapers/default.png
}

setup_alacritty() {
  mkdir -p "$config/alacritty"
  ln -s "$dot/alacritty/alacritty.toml" "$config/alacritty/alacritty.toml"
  git clone https://github.com/alacritty/alacritty-theme "$config/alacritty/alacritty-theme"
}

setup_kanshi() {
  mkdir -p "$config/kanshi"
  ln -s "$dot/kanshi/config" "$config/kanshi/config"
  touch "$config/kanshi/config.local"
}

setup_mako() {
  mkdir -p "$config/mako"
  ln -s "$dot/mako/config.ini" "$config/mako/config"
}

setup_chromium() {
  ln -s "$dot/chromium/chromium-flags.conf" "$config/chromium-flags.conf"
}

setup_vscode() {
  ln -sf "$dot/vscode/code-flags.conf" "$config/code-flags.conf"

  dest="$config/Code/User"
  mkdir -p "$dest"

  ln -sf "$dot/vscode/settings.jsonc" "$dest/settings.json"
  ln -sf "$dot/vscode/keybindings.jsonc" "$dest/keybindings.json"
  ln -sf "$dot/vscode/snippets" "$dest/snippets"

  extensions=(
    anjali.clipboard-history
    bradlc.vscode-tailwindcss
    cardinal90.multi-cursor-case-preserve
    dbankier.vscode-quick-select
    dcasella.i3
    esbenp.prettier-vscode
    github.copilot
    github.copilot-chat
    sleistner.vscode-fileutils
    streetsidesoftware.code-spell-checker
    streetsidesoftware.code-spell-checker-french
    zhuangtongfa.material-theme
  )

  for extension in "${extensions[@]}"; do
    code --install-extension "$extension"
  done
}

setup_all() {
  setup_autologin
  setup_zsh
  setup_systemd
  setup_ssh
  setup_git
  setup_node
  setup_sway
  setup_waybar
  setup_wallpapers
  setup_alacritty
  setup_kanshi
  setup_mako
  setup_chromium
  setup_vscode
}
