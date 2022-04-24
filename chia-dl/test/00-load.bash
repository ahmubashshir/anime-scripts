#!/bin/bash
export BATS_LIB_PATH=${BATS_LIB_PATH:+:$BATS_LIB_PATH}${BATS_TEST_DIRNAME}
bats_load_library 'support'
bats_load_library 'assert'
export PATH="$PATH:$(realpath "$BATS_TEST_DIRNAME/.."):$(realpath "$BATS_TEST_DIRNAME/../../lib")"
if curl --config /dev/null --no-keepalive -I example.com &> /dev/null; then
	export CONNECTED=true
fi
