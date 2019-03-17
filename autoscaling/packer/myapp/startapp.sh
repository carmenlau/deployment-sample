#!/bin/sh

set -e

docker-compose -f /home/ubuntu/myapp/docker-compose.yml -f /home/ubuntu/myapp/docker-compose.override.yml pull
docker-compose -f /home/ubuntu/myapp/docker-compose.yml -f /home/ubuntu/myapp/docker-compose.override.yml up -d

echo "Check web server status\n"

while (curl http://localhost:80); [ $? -ne 0 ]; do
  # Docker takes a few seconds to initialize
  echo "Waiting for web server ready ...\n"
  sleep 3
done

echo "Web server ready"
