while true; do
  systemctl --user restart mako; notify-send 'Hello world!' 'This is an example notification.' --icon=spotify-client
  inotifywait -e create,modify "$HOME/.dotfiles/mako/mako.config.ini"
done
