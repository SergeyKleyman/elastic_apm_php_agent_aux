#!/usr/bin/env bash

set -xe

function cleanup () {
    docker-compose down -v --remove-orphans
}

trap cleanup EXIT
docker-compose build
docker-compose up
