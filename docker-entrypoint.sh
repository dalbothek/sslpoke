#!/bin/bash

set -euo pipefail

HOST=$1
PORT=${2:-443}

declare -a JAVA_ARGS

if [ -f "$TRUST_STORE_PATH" ]; then
    JAVA_ARGS=("${JAVA_ARGS[@]}" "-Djavax.net.ssl.trustStore=$TRUST_STORE_PATH")
    JAVA_ARGS=("${JAVA_ARGS[@]}" "-Djavax.net.ssl.trustStorePassword=$TRUST_STORE_PASSWORD")
fi

if [ -f "$KEY_STORE_PATH" ]; then
    JAVA_ARGS=("${JAVA_ARGS[@]}" "-Djavax.net.ssl.keyStore=$KEY_STORE_PATH")
    JAVA_ARGS=("${JAVA_ARGS[@]}" "-Djavax.net.ssl.keyStorePassword=$KEY_STORE_PASSWORD")
fi

JAVA_ARGS=("${JAVA_ARGS[@]}" "-Djavax.net.debug=$DEBUG")

exec java "${JAVA_ARGS[@]}" SSLPoke "$HOST" "$PORT"
