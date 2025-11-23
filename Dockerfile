FROM archlinux

ENV dot /dotfiles

RUN source /dotfiles/setup.sh; install_packages

RUN echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers
RUN groupadd sudo; useradd -m user; usermod -aG sudo user
USER user

ENV NAME name
ENV EMAIL email

RUN source /dotfiles/setup.sh; install_packages_aur
RUN source /dotfiles/setup.sh; setup_zsh
RUN source /dotfiles/setup.sh; setup_ssh
RUN source /dotfiles/setup.sh; setup_git
# RUN source /dotfiles/setup.sh; setup_systemd
RUN source /dotfiles/setup.sh; setup_sway
RUN source /dotfiles/setup.sh; setup_waybar
RUN source /dotfiles/setup.sh; setup_alacritty
RUN source /dotfiles/setup.sh; setup_kanshi
RUN source /dotfiles/setup.sh; setup_mako
RUN source /dotfiles/setup.sh; setup_wallpaper
# RUN source /dotfiles/setup.sh; setup_vscode
