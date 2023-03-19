#!/bin/sh

case "$1" in

    lock)

        #betterlockscreen -l dimblur -- --timestr="%H:%M"
        i3lock -i ~/Imágenes/wallpaper/1051013.png

        ;;

    logout)

        i3-msg exit

        ;;

    suspend)

        systemctl suspend

        ;;

    hibernate)

        systemctl hibernate

        ;;

    reboot)

        systemctl reboot

        ;;

    shutdown)

        systemctl poweroff

        ;;

    *)

        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"

        exit 2
        
esac

exit 0
