#!/bin/sh
# Starts hxwell.org. On the first run it creates .env from .env.example
# and fills APP_KEY with a new random key.
set -eu
cd "$(dirname "$0")"

if [ ! -f .env ]; then
    cp .env.example .env
    chmod 600 .env
fi

if ! grep -Eq '^APP_KEY=.+' .env; then
    key=$(head -c 32 /dev/urandom | base64 | tr -d '\n')
    if grep -q '^APP_KEY=' .env; then
        sed "s|^APP_KEY=.*|APP_KEY=$key|" .env > .env.tmp
        mv .env.tmp .env
    else
        printf 'APP_KEY=%s\n' "$key" >> .env
    fi
    chmod 600 .env
fi

exec java ${JAVA_OPTS:-} -jar hxwell.jar start
