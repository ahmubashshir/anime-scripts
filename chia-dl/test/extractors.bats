#!/usr/bin/env bats
function setup
{
	load "00-load"
	source "$BATS_TEST_DIRNAME/../14parse"
	regex="(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"
}

@test "check 'get_effective_url()'" {
	${CONNECTED:-false} || skip 'You are currently offline'
	run get_effective_url <<< $(echo https://duck.com)
	assert_output "https://duckduckgo.com/"
}

@test "get url from mp4upload" {
	#skip 'Video deleted, have to find new video ID to test with'

	${CONNECTED:-false} || skip 'You are currently offline'
	run get_url mp4upload bj39hjtftcje
	assert_output --regexp "$regex"
}

@test "get url from vidcdn" {
	skip 'This shit is like influenza, always evolving'

	${CONNECTED:-false} || skip 'You are currently offline'
	run get_url vidcdn MjAyMTUw:23Y-yB82U9FHtx0tqMyyNQ:1686594347
	assert_output --regexp "$regex"
}

@test "get url from xstreamcdn" {
	skip 'Video deleted, have to find new video ID to test with'

	${CONNECTED:-false} || skip 'You are currently offline'
	run get_url xstreamcdn nd27xs2g7d4z-q2
	assert_output --regexp "$regex"
}

@test "get url from doodstream" {
	${CONNECTED:-false} || skip 'You are currently offline'
	run get_url doodstream nzmxe2o2udyi
	assert_output --regexp "$regex"
}

@test "get url from mixdrop" {
	# skip 'Video deleted, have to find new video ID to test with'

	${CONNECTED:-false} || skip 'You are currently offline'
	run get_url mixdrop rw6vnp0xu3nj7w
	assert_output --regexp "$regex"
}
