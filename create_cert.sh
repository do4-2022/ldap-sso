#!/usr/bin/env sh

set -e

if [ -z "$(which mkcert)"]; then
    echo "mkcert not found"
    echo "Please install mkcert at https://github.com/FiloSottile/mkcert#installation"
    exit 1
fi

mkcert -cert-file cert.pem -key-file key.pem keycloak