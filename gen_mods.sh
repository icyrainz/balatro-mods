#!/bin/sh

rm -rf ./Mods
mkdir ./Mods

# Generic lua mods
cp ./Mods_Repo/*.lua ./Mods
cp ./Mods_Repo/*.ttf ./Mods

# FlushHotkeys
rsync -avzh ./Mods_Repo/FlushHotkeys/steamodded/* ./Mods

# SDM0
rsync -avzh ./Mods_Repo/SDM0/SDM_0\'s\ Stuff ./Mods

# Fusion Jokers
# rsync -azvh ./Mods_Repo/Fusion-Jokers/mod/* ./Mods

# Talisman
rsync -azvh ./Mods_Repo/Talisman ./Mods
cp -f ./Mods_Repo/talisman_config.lua ./Mods/Talisman/config.lua

# Cryptid
rsync -azvh ./Mods_Repo/Cryptid ./Mods

# Aura
rsync -azvh ./Mods_Repo/Aura ./Mods

# JokerDisplay
rsync -azvh ./Mods_Repo/JokerDisplay ./Mods

# JokerEvolution
rsync -azvh ./Mods_Repo/Joker-Evolution/JokerEvolution ./Mods

# Betmma
rsync -azvh ./Mods_Repo/betmma ./Mods

# D6-Jokers
# rsync -azvh ./Mods_Repo/D6-Jokers ./Mods

# Jimbo-s-Pack
rsync -azvh ./Mods_Repo/Jimbo-s-Pack/JimbosPack ./Mods

# BBBalatro
# rsync -azvh ./Mods_Repo/BBBalatro ./Mods
