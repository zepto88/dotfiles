#!/bin/bash
export DISPLAY=:0

which xcape &>/dev/null
if [ "$?" == "0" ];then
    pkill xcape
    xcape -e 'Control_L=Escape'
fi

xset r rate 225 50
