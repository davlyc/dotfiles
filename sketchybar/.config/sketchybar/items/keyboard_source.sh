#!/bin/bash

# Check the raw plist for any mention of Pinyin/Chinese input
IS_ZH=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -E "Pinyin|Chinese|ITABC")

if [ -z "$IS_ZH" ]; then
    LABEL="JESUS <3 U"
else
    LABEL="耶稣爱你"
fi

sketchybar --set $NAME label="$LABEL"