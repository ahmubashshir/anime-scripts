#!/usr/bin/env bats
source "$BATS_TEST_DIRNAME/../14parse"
load "00-load"
regex="(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"
function setup {
    if curl -I google.com &>/dev/null;then
        export CONNECTED=true
    fi
}

@test "check 'get_effective_url()'" {
    ${CONNECTED:-false} || skip
    run get_effective_url <<<$(echo google.com)
    assert_output "http://www.google.com/"
}

@test "get url from trollvid" {
    ${CONNECTED:-false} || skip
    [ -f ~/.da-cookies.txt ] || skip
    run trollvid:get_url 0184811bd997 202835
    assert_output -e "$regex"
}

@test "get url from mp4upload" {
    ${CONNECTED:-false} || skip
    run mp4upload:get_url 8jb45b4wypsn
    assert_output --regexp "$regex"
}

@test "get url from vidstreaming" {
    ${CONNECTED:-false} || skip
    run vidstreaming:get_url MTQ1NTY5
    [ -z "$output" ] && skip
    assert_output --regexp "$regex"
}

@test "get url from xstreamcdn" {
    ${CONNECTED:-false} || skip
    run xstreamcdn:get_url 36d3ecmrw73xzew
    assert_output --regexp "$regex"
}

@test "get url from cloud9" {
    ${CONNECTED:-false} || skip
    run cloud9:get_url uw-nKG9IKU7_
    assert_output --regexp "$regex"
}

@test "get url from gogo server" {
    ${CONNECTED:-false} || skip
    run gogo+server:get_url MTQ1NTY5
    assert_output --regexp "$regex"
}

@test "get url from mixdrop" {
    ${CONNECTED:-false} || skip
    run mixdrop:get_url rw6vnp0xu3nj7w
    assert_output --regexp "$regex"
}
