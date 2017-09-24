#!/bin/bash

pid=`pidof xautolock`
if [ "$pid" != "" ];then
    kill $pid
fi
xautolock -locker "~/.i3/lock"&
