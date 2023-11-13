#!/usr/bin/env bash
set -xe -o pipefail

function onExit () {
    docker-compose down -v --remove-orphans
}

trap onExit EXIT

docker-compose build
docker-compose up
