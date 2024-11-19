#!/bin/bash

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Check which branch is being built
if [ $GIT_BRANCH = "origin/dev" ]; then
    # Build your project
    chmod +x build.sh
    ./build.sh

    # Tag the Docker image for the dev environment
    docker tag sivaapp:reactapp $DOCKER_USERNAME/dev:reactapp

    # Push the Docker image to the dev repository
    docker push $DOCKER_USERNAME/dev:reactapp

elif [$GIT_BRANCH = "origin/main"]; then
    chmod +x build.sh
    ./build.sh

    # Tag the Docker image for the prod environment
    docker tag sivaapp:reactapp $DOCKER_USERNAME/prod:reactapp

    # Push the Docker image to the prod repository
    docker push $DOCKER_USERNAME/prod:reactapp
else 
    echo "Branch-not recognized. No build or push will occur."
    exit 1
fi

docker-compose down || true
docker-compose up -d
