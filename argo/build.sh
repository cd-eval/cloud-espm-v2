#!/bin/bash
set -eu
cd "$(dirname "$BASH_SOURCE")/.."
sed -e 's/webshop/webshopargo/g' -i mta.yaml
export PATH=./node_modules/.bin:${PATH}
mta.sh --mtar /argo/result.mtar --build-target=NEO build
