#!/usr/bin/env bash
set -xe -o pipefail

docker_cmd_prefix="docker-compose"
if [ -n "${ELASTIC_APM_PHP_AGENT_INSTALL_LOCAL_EXTENSION_BINARY}" ]; then
    docker_cmd_prefix="${docker_cmd_prefix} -f docker-compose_local_agent_code.yml"
fi

docker_cmd_prefix="${docker_cmd_prefix} -f docker-compose.yml"

function onExit () {
    ${docker_cmd_prefix} down -v --remove-orphans
}

trap onExit EXIT

${docker_cmd_prefix} build
${docker_cmd_prefix} up
