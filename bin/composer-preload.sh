#!/usr/bin/env bash

# @see https://github.com/Ayesh/Composer-Preload

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="${SCRIPT_DIR}/.."

PHP_BIN=/usr/local/php7/bin/php
COMPOSER_BIN=/usr/local/bin/composer

pushd "${PROJECT_DIR}" || exit

command cp -f composer.json-dist composer.json

"${PHP_BIN}" "${COMPOSER_BIN}" preload
"${PHP_BIN}" vendor/preload.php

popd || exit
