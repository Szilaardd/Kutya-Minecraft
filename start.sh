#!/bin/bash

# playit indítása háttérben
./playit &

while true
do
  echo "Minecraft szerver indítása..."
  
  java -Xms16G -Xmx16G -jar server.jar nogui
  
  echo "Szerver leállt, backup indul..."

  git add world/
  git commit -m "Auto backup $(date)" || echo "Nincs változás"
  git push

  echo "Újraindítás 5 másodperc múlva..."
  sleep 5
done