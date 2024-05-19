!/bin/sh

BALATRO_EXE_LOCATION="$HOME/.local/share/Steam/steamapps/common/Balatro/Balatro.exe"

python3 Steamodded/steamodded_injector.py $($BALATRO_EXE_LOCATION | head -n 1) $BALATRO_EXE_LOCATION
