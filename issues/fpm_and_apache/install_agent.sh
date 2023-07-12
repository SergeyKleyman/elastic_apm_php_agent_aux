#!/usr/bin/env bash

set -xe

ELASTIC_APM_PHP_AGENT_DEFAULT_RELEASE_VERSION_TO_INSTALL=1.9.0

install_local_code () {
    local local_agent_code_php_ini=/FROM_HOST/local_agent_code_php.ini
    local link_name=99_local_agent_code_php.ini
    cat "${local_agent_code_php_ini}"
    if [ -n "${PHP_INI_DIR}" ]; then
        local link_full_path=${PHP_INI_DIR}/conf.d/${link_name}
        [ -f "${link_full_path}" ] || ln -s "${local_agent_code_php_ini}" "${link_full_path}"
    fi
    if [ -n "${PHP_CONF_DIR}" ]; then
        local link_full_path=${PHP_CONF_DIR}/${link_name}
        [ -f "${link_full_path}" ] || ln -s "${local_agent_code_php_ini}" "${link_full_path}"
    fi
    if [ -n "${PHPFPM_CONF_DIR}" ]; then
        local link_full_path=${PHPFPM_CONF_DIR}/${link_name}
        [ -f "${link_full_path}" ] || ln -s "${local_agent_code_php_ini}" "${link_full_path}"
    fi
}

install_local_package_from_url () {
    package_url="$1"
    curl -fsSL "${package_url}" > /tmp/apm-gent-php.deb
    dpkg -i /tmp/apm-gent-php.deb
}

main () {
    set | grep ELASTIC || true

    if [ -n "${ELASTIC_APM_PHP_AGENT_INSTALL_LOCAL_EXTENSION_BINARY}" ]; then
        echo "Installing agent using local code (ELASTIC_APM_PHP_AGENT_INSTALL_LOCAL_EXTENSION_BINARY: ${ELASTIC_APM_PHP_AGENT_INSTALL_LOCAL_EXTENSION_BINARY}) ..."
        install_local_code
        return
    fi

    if [ -n "${ELASTIC_APM_PHP_AGENT_INSTALL_PACKAGE_FROM_URL}" ]; then
        echo "Installing agent using package from url (ELASTIC_APM_PHP_AGENT_INSTALL_PACKAGE_FROM_URL: ${ELASTIC_APM_PHP_AGENT_INSTALL_PACKAGE_FROM_URL}) ..."
        install_local_package_from_url "${ELASTIC_APM_PHP_AGENT_INSTALL_PACKAGE_FROM_URL}"
        return
    fi

    agent_version="${ELASTIC_APM_PHP_AGENT_INSTALL_RELEASE_VERSION:-${ELASTIC_APM_PHP_AGENT_DEFAULT_RELEASE_VERSION_TO_INSTALL}}"
    echo "Installing agent using release version ${agent_version} (ELASTIC_APM_PHP_AGENT_INSTALL_RELEASE_VERSION: ${ELASTIC_APM_PHP_AGENT_INSTALL_RELEASE_VERSION})..."
    install_local_package_from_url "https://github.com/elastic/apm-agent-php/releases/download/v${agent_version}/apm-agent-php_${agent_version}_all.deb"
}

main
