#!/bin/bash

if dunstctl is-paused | grep -q true; then
  dunstctl set-paused false
  notify-send "🔔 Notifications ON"
else
  dunstctl set-paused true
fi
