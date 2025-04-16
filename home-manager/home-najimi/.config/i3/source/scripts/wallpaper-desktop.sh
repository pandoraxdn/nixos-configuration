#!/usr/bin/env bash
#!/bin/bash

#wallpaper="$HOME/Imágenes/wallpaper/104359432_p0.jpg"
wallpaper="$HOME/Imágenes/wallpaper/974034.jpg"


case $1 in

    random)

        aleatory=`find ~/Imágenes/wallpaper -type f | shuf -n 1`

        cp /dev/null ~/.config/i3/scripts/.log-wallpaper

        echo $aleatory > ~/.config/i3/scripts/.log-wallpaper

        feh --bg-fill $aleatory --no-fehbg

    ;;

    pywal)
        
        wal -i $wallpaper -n

    ;;

    image-edit)

        sakura -e nvim ~/.config/i3/scripts/wallpaper-desktop.sh

    ;;

    delete-log)

        if [ -f ~/.config/i3/scripts/.log-wallpaper ]
        then

            rm ~/.config/i3/scripts/.log-wallpaper

        fi

    ;;

    default)

        if [ -f ~/.config/i3/scripts/.log-wallpaper ]
        then

            log=`cat ~/.config/i3/scripts/.log-wallpaper`

            feh --bg-fill $log --no-fehbg

        else

            echo $wallpaper > ~/.config/i3/scripts/.log-wallpaper

            feh --bg-fill $wallpaper --no-fehbg

        fi

    ;;


    center)

        if [ -f ~/.config/i3/scripts/.log-wallpaper ]
        then

            log=`cat ~/.config/i3/scripts/.log-wallpaper`

            feh --bg-center $log --no-fehbg

        else

            feh --bg-center $wallpaper --no-fehbg

        fi

    ;;

    extended)

        if [ -f ~/.config/i3/scripts/.log-wallpaper ]
        then

            log=`cat ~/.config/i3/scripts/.log-wallpaper`

            feh --bg-fill $log --no-fehbg

        else

            feh --bg-fill $wallpaper --no-fehbg

        fi

    ;;

    max)

        if [ -f ~/.config/i3/scripts/.log-wallpaper ]
        then

            log=`cat ~/.config/i3/scripts/.log-wallpaper`

            feh --bg-max $log --no-fehbg

        else

            feh --bg-max $wallpaper --no-fehbg

        fi

    ;;

    scale)

        if [ -f ~/.config/i3/scripts/.log-wallpaper ]
        then

            log=`cat ~/.config/i3/scripts/.log-wallpaper`

            feh --bg-scale $log --no-fehbg

        else

            feh --bg-scale $wallpaper --no-fehbg

        fi

    ;;

    repeat)

        if [ -f ~/.config/i3/scripts/.log-wallpaper ]
        then

            log=`cat ~/.config/i3/scripts/.log-wallpaper`

            feh --bg-tile $log --no-fehbg

        else

            feh --bg-tile $wallpaper --no-fehbg

        fi

    ;;


    *)
        echo "No aplica el valor ingresado"

    ;;

esac
