#!/bin/bash

if dunstctl is-paused | grep -q true; then
  echo "" # bell-slash (muted)
else
  echo "" # bell (active)
fi
