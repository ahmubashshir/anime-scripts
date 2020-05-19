#!/usr/bin/env bats

source "$BATS_TEST_DIRNAME/../14parse"
load "00-load"
regex="(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"
@test "Checking for connectivity" {
    run rm -rf "$BATS_TEST_DIRNAME/.connected"
    run curl -I google.com
    if [[ $status = 0 ]];then
        touch "$BATS_TEST_DIRNAME/.connected"
    else
        skip
    fi
}

@test "get url from mp4upload" {
    [ -e "$BATS_TEST_DIRNAME/.connected" ] || skip
    run mp4upload:get_url wgnpbl58m6xi
    assert_output --regexp "$regex"
}

@test "get url from mp4.sh" {
    [ -e "$BATS_TEST_DIRNAME/.connected" ] || skip
    run mp4.sh:get_url 66b888095e74
    assert_output --regexp "$regex"
}

@test "get url from trollvid" {
    [ -e "$BATS_TEST_DIRNAME/.connected" ] || skip
    run trollvid:get_url 895522bbba8d
    assert_output -e "$regex"
}

@test "get url from vidstreaming" {
    [ -e "$BATS_TEST_DIRNAME/.connected" ] || skip
    run vidstreaming:get_url MTEwNTM2
    [ -z "$output" ] && skip
    assert_output --regexp "$regex"
}

@test "get url from xstreamcdn" {
    [ -e "$BATS_TEST_DIRNAME/.connected" ] || skip
    run xstreamcdn:get_url 8xopy1nwqo7
    assert_output --regexp "$regex"
}
@test "cleaning leftovers of url test" {
    run rm -rf "$BATS_TEST_DIRNAME/.connected"
}
