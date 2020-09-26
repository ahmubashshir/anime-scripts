#!/usr/bin/env bats
load 'support/load'
load 'assert/load'
source "$BATS_TEST_DIRNAME/../.env_setup"
chrome_apparent="$(chromium --version 2>/dev/null | awk "{print \$2}")"
export USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/${chrome_apparent:-85.0.4183.102} Safari/537.36"
assert_dep_py3()
{
	run bash -c "python3 -c 'import $1' &>/dev/null||(echo python3 module $1 not found. && return 1)"
	assert_success;
}
assert_dep_py2()
{
	run bash -c "python2 -c 'import $1' &>/dev/null||(echo python2 module $1 not found. && return 1)"
	assert_success;
}
assert_dep_exec()
{
	run type $1
	assert_success;
}
