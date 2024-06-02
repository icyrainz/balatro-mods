#!/bin/sh

rm -rf ../Mods
mkdir ../Mods

cp *.lua ../Mods

# FlushHotkeys
rsync -avzh ./FlushHotkeys/steamodded/* ../Mods

# SDM0
rsync -avzh ./SDM0/SDM_0\'s\ Stuff/* ../Mods
