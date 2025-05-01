#!/bin/bash

if ! command -v docker-compose &> /dev/null; then
  echo "Error: docker-compose not found."
  exit 1
fi

if ! docker-compose ps -q web &> /dev/null; then
  echo "Error: Service 'web' not found."
  exit 1
fi

docker-compose exec -it web /bin/bash