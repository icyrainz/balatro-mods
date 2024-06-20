#!/bin/sh

MY_MODS_PATH=$(dirname $0 | realpath)
BALATRO_PATH="$HOME/Library/Application Support/Balatro"
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
