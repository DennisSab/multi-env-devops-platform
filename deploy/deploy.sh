#!/bin/bash
set -e

ENV=$1

if [ -z "$ENV" ]; then
  echo "Usage: ./deploy.sh [dev|staging|prod]"
  exit 1
fi

case "$ENV" in
  dev|staging|prod)
    ;;
  *)
    echo "Invalid environment: $ENV"
    echo "Allowed values: dev, staging, prod"
    exit 1
    ;;
esac

cd ~/multi-env/deploy

SERVICE="app-$ENV"

echo "=================================="
echo "Deploying environment: $ENV"
echo "Service: $SERVICE"
echo "=================================="

docker compose pull "$SERVICE"
docker compose up -d "$SERVICE"

echo "Deployment completed for $ENV"
