#!/usr/bin/env bats

load "00-load"
regex="(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"
if [[ $(realpath /usr/bin/python) =~ python3 ]]; then
	py3=python
	py2=python2
else
	py3=python3
	py2=python
fi
@test "Checking for awk..." {
	assert_dep_exec awk
}
@test "Checking for curl..." {
	assert_dep_exec curl
}
@test "Checking for cut..." {
	assert_dep_exec cut
}
@test "Checking for dd..." {
	assert_dep_exec dd
}
@test "Checking for false..." {
	assert_dep_exec false
}
@test "Checking for ffmpeg..." {
	assert_dep_exec ffmpeg
}
@test "Checking for ffprobe..." {
	assert_dep_exec ffprobe
}
@test "Checking for grep..." {
	assert_dep_exec grep
}
@test "Checking for head..." {
	assert_dep_exec head
}
@test "Checking for jq..." {
	assert_dep_exec jq
}
@test "Checking for lsof..." {
	assert_dep_exec lsof
}
@test "Checking for mkdir..." {
	assert_dep_exec mkdir
}
@test "Checking for mv..." {
	assert_dep_exec mv
}
@test "Checking for printf..." {
	assert_dep_exec printf
}
@test "Checking for rm..." {
	assert_dep_exec rm
}
@test "Checking for sed..." {
	assert_dep_exec sed
}
@test "Checking for sha256sum..." {
	assert_dep_exec sha256sum
}
@test "Checking for sleep..." {
	assert_dep_exec sleep
}
@test "Checking for sort..." {
	assert_dep_exec sort
}
@test "Checking for stat..." {
	assert_dep_exec stat
}
@test "Checking for tail..." {
	assert_dep_exec tail
}
@test "Checking for tput..." {
	assert_dep_exec tput
}
@test "Checking for tr..." {
	assert_dep_exec tr
}
@test "Checking for true..." {
	assert_dep_exec true
}
@test "Checking for wc..." {
	assert_dep_exec wc
}
@test "Checking for wget..." {
	assert_dep_exec wget
}
@test "Checking for xmllint..." {
	assert_dep_exec xmllint
}
@test "Checking for python3..." {
	assert_dep_exec python3
}
@test "Checking for $py3-jsbeautifier..." {
	assert_dep_py3 jsbeautifier
	assert_dep_exec js-beautify
}
@test "Checking for $py3-json..." {
	assert_dep_py3 json
}
@test "Checking for $py3-numpy..." {
	assert_dep_py3 numpy
}
@test "Checking for $py3-requests..." {
	assert_dep_py3 requests
}
@test "Checking for $py3-yaml..." {
	assert_dep_py3 yaml
}
