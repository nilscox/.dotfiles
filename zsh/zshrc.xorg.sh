alias -g C=' | xclip -selection clipboard'

if [ "$TTY" = /dev/tty1 ]; then
  startx
fi
