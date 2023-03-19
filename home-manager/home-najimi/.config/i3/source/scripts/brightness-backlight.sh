#!/bin/bash

max_br=7812; min_br=0; porcent=390 # 7812 * 0.05 = 390  // 5%

valid ()
{
    local var="$(brightlight -r)"

    local sed=$( echo $var | sed -r 's/current backlight brightness is: ([0-9]+)/\1/g' )

    if [ $1 = 1 ]

    then

        if [ $( expr $sed + $porcent ) -eq $max_br  ] || [ $( expr $sed + $porcent ) -lt $max_br ]

        then

            local resultado="true"

        else

            local resultado="false"

        fi

    elif [ $1 = 2 ]

    then

        if [ $( expr $sed - $porcent ) -eq $min_br  ] || [ $( expr $sed - $porcent ) -gt $min_br ]

        then

            local resultado="true"

        else

            local resultado="false"

        fi

    elif [ $1 = 3 ]
        
    then

        local resultado=$sed

    else

        local resultado="nothing"

    fi

    echo $resultado

}

if [ $1 = "up" ]

then

    if [ $(valid 1) = "true" ]

    then

        add=$( expr $(valid 3) + $porcent )

        value=$( expr $add \* 100 / $max_br )

        brightlight -w $add

        notify-send "Brillo: $value%" -t 650

    fi

elif [ $1 = "down" ]

then

    if [ $(valid 2) = "true" ]

    then

        add=$( expr $(valid 3) - $porcent )

        value=$( expr $add \* 100 / $max_br )

        brightlight -w $add

        notify-send "Brillo: $value%" -t 650

    fi

fi
