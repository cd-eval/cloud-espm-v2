#!/bin/bash
set -eu

function handle_error()
{
    local cmd="$BASH_COMMAND" rc=$?
    echo "error: command [$cmd] failed with exit code [$rc]" >&2
    exit 1
}

trap handle_error ERR

cd "$(dirname "$BASH_SOURCE")/.."
neo.sh deploy-mta \
    --synchronous \
    --host "$NEO_DEPLOY_HOST" --account "$NEO_DEPLOY_ACCOUNT" \
    --user "$NEO_DEPLOY_USER" --password "$NEO_DEPLOY_PASSWORD" \
    --source "/infrabox/inputs/build/result.mtar"
echo "Application running at https://webshopinfrabox-${NEO_DEPLOY_ACCOUNT}.dispatcher.${NEO_DEPLOY_HOST}/index.html"
