#!/bin/sh

rm -rf ./Mods
mkdir ./Mods

# Generic lua mods
cp ./Mods_Repo/*.lua ./Mods

# FlushHotkeys
rsync -avzh ./Mods_Repo/FlushHotkeys/steamodded/* ./Mods

# SDM0
# rsync -avzh ./Mods_Repo/SDM0/SDM_0\'s\ Stuff/* ./Mods

# Fusion Jokers
# rsync -azvh ./Mods_Repo/Fusion-Jokers/mod/* ./Mods
