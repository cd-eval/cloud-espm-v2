#!/bin/bash
set -eu
cd "$(dirname "$BASH_SOURCE")"
export PATH=./node_modules/.bin:${PATH}
java -jar /opt/mta/mta.jar --mtar /infrabox/output/result.mtar --build-target=NEO build
