#!/usr/bin/env bats

source "$BATS_TEST_DIRNAME/../14parse"
load "00-load"
regex="(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"
@test "get url from mp4upload" {
    run mp4upload:get_url wgnpbl58m6xi
    assert_output --regexp "$regex"
}

@test "get url from mp4.sh" {
    run mp4.sh:get_url 66b888095e74
    assert_output --regexp "$regex"
}

@test "get url from trollvid" {
    run trollvid:get_url 895522bbba8d
    assert_output -e "$regex"
}

@test "get url from vidstreaming" {
    run vidstreaming:get_url MTEwNTM2
    [ -z "$output" ] && skip
    assert_output --regexp "$regex"
}

@test "get url from xstreamcdn" {
    run xstreamcdn:get_url 8xopy1nwqo7
    assert_output --regexp "$regex"
}
