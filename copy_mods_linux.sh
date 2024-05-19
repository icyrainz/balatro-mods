#!/bin/sh

MOD_PATH="$HOME/.steam/steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro"

rm -r $MOD_PATH/Mods
rsync -avzh ~/Github/balatro-mods/Mods $MOD_PATH/
