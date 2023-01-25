#!/bin/bash

action=$1

if [ $action = "deploy" ]; then

    [ ! -f traefik.log ] && touch traefik.log && echo "\ncreate traefik.log for error logs"

    docker compose build develop

    docker compose up -d

elif [ $action = "temp-staging" ]; then

    git checkout $(commit)

    docker compose build --no-cache develop

    # docker compose run --label "traefik.http.routers.develop.rule=Host(`$(commit).cristianalvarezh.com`)" --name $(commit) develop

fi
