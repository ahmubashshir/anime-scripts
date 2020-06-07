#!/usr/bin/env bats
source "$BATS_TEST_DIRNAME/../14parse"
load "00-load"
regex="(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"
setup() {
    if curl -I google.com &>/dev/null;then
        export CONNECTED=true
    fi
}

@test "check 'get_effective_url()'" {
    ${CONNECTED:-false} || skip
    run get_effective_url <<<$(echo google.com)
    assert_output "http://www.google.com/"
}
@test "get url from mp4upload" {
    ${CONNECTED:-false} || skip
    run mp4upload:get_url wgnpbl58m6xi
    assert_output --regexp "$regex"
}

@test "get url from mp4.sh" {
    ${CONNECTED:-false} || skip
    run mp4.sh:get_url 66b888095e74
    assert_output --regexp "$regex"
}

@test "get url from trollvid" {
    ${CONNECTED:-false} || skip
    run trollvid:get_url 895522bbba8d
    assert_output -e "$regex"
}

@test "get url from vidstreaming" {
    ${CONNECTED:-false} || skip
    run vidstreaming:get_url MTEwNTM2
    [ -z "$output" ] && skip
    assert_output --regexp "$regex"
}

@test "get url from xstreamcdn" {
    ${CONNECTED:-false} || skip
    run xstreamcdn:get_url 8xopy1nwqo7
    assert_output --regexp "$regex"
}
