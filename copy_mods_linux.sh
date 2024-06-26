#!/bin/sh

MY_MODS_PATH=$(realpath $(dirname $0))
BALATRO_PATH="$HOME/.steam/steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro"
MOD_PATH="$BALATRO_PATH/Mods"
STEAMODDED_PATH="$MOD_PATH/Steamodded"

# Clean up destination
rm -r "$MOD_PATH"
mkdir "$MOD_PATH"

# Regenerate source
sh ./gen_mods.sh

# Sync files
rsync -avzh --exclude '*.git*/*' "$MY_MODS_PATH/Steamodded/" "$STEAMODDED_PATH"
rsync -avzh --exclude '*.git*/*' "$MY_MODS_PATH/Mods/" "$MOD_PATH"

rm -r "$STEAMODDED_PATH/example_mods"
