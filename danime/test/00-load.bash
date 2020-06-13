#!/usr/bin/env bats
load 'support/load'
load 'assert/load'
source ../.env_setup
assert_dep_py3()
{
	run bash -c "python3 -c 'import $1' &>/dev/null||(echo python3 module $1 not found. && return 1)"
	assert_success;
}
assert_dep_py2()
{
	run bash -c "python2 -c 'import $1' &>/dev/null||(echo python3 module $1 not found. && return 1)"
	assert_success;
}
assert_dep_exec()
{
	run type $1
	assert_success;
}
