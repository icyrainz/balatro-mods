#!/bin/sh

MY_MODS_PATH="$HOME/Github/balatro-mods/"
BALATRO_PATH="$HOME/Library/Application Support/Balatro"
MOD_PATH="$BALATRO_PATH/Mods"
STEAMODDED_PATH="$MOD_PATH/Steamodded"

rm -r "$MOD_PATH"
mkdir "$MOD_PATH"
rsync -avzh --exclude '*.git*/*' "$MY_MODS_PATH/Steamodded/" "$STEAMODDED_PATH"
rsync -avzh --exclude '*.git*/*' "$MY_MODS_PATH/Mods/" "$MOD_PATH"

rm -r "$STEAMODDED_PATH/example_mods"
