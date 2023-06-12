#!/bin/bash
#export BATS_LIB_PATH=${BATS_LIB_PATH:+:$BATS_LIB_PATH}${BATS_TEST_DIRNAME}
source "${BATS_TEST_DIRNAME}/support/load.bash"
source "${BATS_TEST_DIRNAME}/assert/load.bash"
export PATH="$PATH:$(realpath "$BATS_TEST_DIRNAME/..")"
if curl --config /dev/null --no-keepalive -I example.com &> /dev/null; then
	export CONNECTED=true
fi
