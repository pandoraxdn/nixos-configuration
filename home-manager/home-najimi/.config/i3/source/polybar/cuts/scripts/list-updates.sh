#!/usr/bin/bash

updates=`dnf check-update | wc -l`

if [ $updates -eq 1 ]
        then list=0
else
        list=$updates
fi

echo $list
