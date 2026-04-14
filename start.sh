#!/bin/bash

# Playit indítása háttérben (logolva)
./playit > playit.log 2>&1 &
echo "Playit elindítva (PID: $!)"

while true
do
  echo "Minecraft szerver indítása..."

  java -Xms8G -Xmx10G -XX:+UseG1GC -jar server.jar nogui

  echo "Szerver leállt, backup indul..."

  # backup (csak ha van változás)
  git add world/

  git commit -m "Auto backup $(date)" || echo "Nincs változás"
  git push || echo "Git push sikertelen"

  echo "Újraindítás 5 másodperc múlva..."
  sleep 5
done