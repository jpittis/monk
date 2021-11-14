#!/bin/bash
lilypond -fpng -dmidi-extension=mid -danti-alias-factor=8 -dresolution=600 main.lily &&
timidity main.mid -Ow -o main.wav &&
pngtopnm main.png > main.pnm &&
pnmcrop -white -margin=20 main.pnm > main-cropped.pnm &&
pnmtopng main-cropped.pnm > main-cropped.png &&
mv main-cropped.png main.png &&
aplay main.wav;
rm main-cropped.pnm main.pnm
