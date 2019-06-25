#!/usr/bin/env bash

# @see https://github.com/roundcube/roundcubemail/wiki/Build-from-source

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="${SCRIPT_DIR}/.."

PHP_BIN=/usr/local/php7/bin/php
COMPOSER_BIN=/usr/local/bin/composer

pushd "${PROJECT_DIR}" || exit

./bin/install-jsdeps.sh
./bin/jsshrink.sh

./bin/updatecss.sh
./bin/cssshrink.sh

command cp -f composer.json-dist composer.json

"${PHP_BIN}" "${COMPOSER_BIN}" req --no-update --prefer-dist \
    pear/net_ldap2:^2.2.0 \
    kolab/net_ldap3:^1.1.0

"${PHP_BIN}" "${COMPOSER_BIN}" u -o -a --no-dev --prefer-dist

popd || exit
