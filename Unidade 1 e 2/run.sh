docker compose down
docker compose up -d --build --remove-orphans --force-recreate
sleep 5
docker compose ps -a
