#!/usr/bin/env bash

set -ef -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
MODULES_DIR=$DIR/modules

for file in `ls $MODULES_DIR`; do
    $MODULES_DIR/$file
done


