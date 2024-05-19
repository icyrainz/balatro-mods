#!/bin/sh

MOD_PATH="$HOME/Library/Application Support/Balatro"

rm -r "$MOD_PATH/Mods"
rsync -avzh ~/Github/balatro-mods/Mods "$MOD_PATH/"
