#!/bin/bash

action=$1

if [ $action = "deploy" ]; then

    [ ! -f traefik.log ] && touch traefik.log && echo "\ncreate traefik.log for error logs"

    docker-compose build develop

    docker-compose up -d

elif [ $action = "refresh" ]; then

    git switch main
    git pull

    docker-compose build develop

    docker-compose up -d

elif [ $action = "temp-staging" ]; then

    commit=$2

    git checkout $commit

    docker build -t $commit-commit .

    docker run -d \
      --label "traefik.http.routers.$commit.rule=Host(\`$commit.alvarezcristian.com\`)" \
      --network github-action-cicd_default \
      --name $commit-container $commit-commit

    echo ""
    echo "Deployed on $commit.alvarezcristian.com"

elif [ $action = "rm-temp-staging" ]; then

    commit=$2

    docker stop $commit-container

    docker rm -f $commit-container

    docker rmi $commit-commit

fi
