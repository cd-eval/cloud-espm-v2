#!/bin/bash
set -eu
cd "$(dirname "$BASH_SOURCE")/.."
sed -e 's/webshop/webshopinfrabox/g' -i mta.yaml
export PATH=./node_modules/.bin:${PATH}
mta.sh --mtar /infrabox/output/result.mtar --build-target=NEO build
