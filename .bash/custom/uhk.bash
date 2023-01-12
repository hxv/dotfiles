#!/usr/bin/env bash

alias led='[[ "$?" == "0" ]] && uhk-cmd "set backlight.constantRgb.rgb 0 255 0" || uhk-cmd "set backlight.constantRgb.rgb 255 0 0" ; uhk-cmd "set leds.brightness 255"'
