while true
do
  java -Xms8G -Xmx8G -jar server.jar nogui
  
  git add world/
  git commit -m "Auto backup $(date)" || echo "Nincs változás"

  git push

  sleep 5
done