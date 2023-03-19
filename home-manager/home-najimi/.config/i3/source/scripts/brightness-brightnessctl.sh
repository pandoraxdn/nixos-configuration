#!/usr/bin/env bash
#!/bin/bash

max_br=7812; min_br=0; porcent=390 # 7812 * 0.05 = 390  // 5%

valid ()
{
    local var="$(brightnessctl g)"

    if [ $1 = 1 ]

    then

        if [ $( expr $var + $porcent ) -eq $max_br  ] || [ $( expr $var + $porcent ) -lt $max_br ]

        then

            local resultado="true"

        else

            local resultado="false"

        fi

    elif [ $1 = 2 ]

    then

        if [ $( expr $var - $porcent ) -eq $min_br  ] || [ $( expr $var - $porcent ) -gt $min_br ]

        then

            local resultado="true"

        else

            local resultado="false"

        fi

    elif [ $1 = 3 ]
        
    then

        local resultado=$var

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

        brightnessctl s $add

    fi

elif [ $1 = "down" ]

then

    if [ $(valid 2) = "true" ]

    then

        add=$( expr $(valid 3) - $porcent )

        value=$( expr $add \* 100 / $max_br )

        brightnessctl s $add

    fi

fi
