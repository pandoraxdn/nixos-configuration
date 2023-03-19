#! /bin/bash

CFG="$HOME/.config/hypr/wofi/launcher/config"
STYLE="$HOME/.config/hypr/wofi/style.css"


if [[ -z "$(pidof wofi)" ]];then
  wofi -c "$CFG" -s "$STYLE" --show drun
else
  killall wofi
fi
