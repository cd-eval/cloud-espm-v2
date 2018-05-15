#!/bin/bash
set -eu

function handle_error()
{
    local cmd="$BASH_COMMAND" rc=$?
    echo "error: command [$cmd] failed with exit code [$rc]" >&2
    exit 1
}

trap handle_error ERR

cd "$(dirname "$BASH_SOURCE")"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
/usr/local/tools/neo-java-web-sdk/tools/neo.sh deploy-mta \
    --synchronous \
    --host "$DEPLOY_HOST" --account "$DEPLOY_ACCOUNT" \
    --user "$DEPLOY_USER" --password "$DEPLOY_PASSWORD" \
    --source "/infrabox/inputs/build/result.mtar"
