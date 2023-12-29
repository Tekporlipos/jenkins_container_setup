#!/bin/sh

# Generate required configuration files
sh get_env.sh
touch plugins.txt

# take down any existing deployments
docker compose --file "docker-compose.yaml" down \
|| docker-compose --file "docker-compose.yaml" down \
|| echo "docker-compose-plugin not installed" | exit 1

# deploy stack using docker-compose.yaml
docker compose --file "docker-compose.yaml" --env-file ".env" up -d --build \
|| docker-compose --file "docker-compose.yaml" --env-file ".env" up -d --build \
|| echo "docker-compose-plugin not installed" | exit 1

exit 0
