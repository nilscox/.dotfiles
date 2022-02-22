export WLR_DRM_NO_MODIFIERS=1

alias -g C=' | wl-copy'

if [ "$TTY" = /dev/tty1 ]; then
  sway > /tmp/sway.log 2>&1
fi
