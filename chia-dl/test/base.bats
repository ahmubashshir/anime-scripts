#!/usr/bin/env bats
function setup
{
	load "00-load"
	source "$BATS_TEST_DIRNAME/../01include"
}

@test "Checking for dependencies" {
	run "$BATS_TEST_DIRNAME/../deps"
	assert_output ""
}

@test "Checking 'ellipsis()'" {
	run ellipsis 10 abcdefghijklmnopqrstuvwx
	assert_output 'abcde...tuvwx'
}

@test "Checking 'expand_limit()'" {
	run expand_limit 1-3,5-7,9,11-14,16- 18
	assert_output $'1\n2\n3\n5\n6\n7\n9\n11\n12\n13\n14\n16\n17\n18'
}

@test "Checking 'contract_limit()'" {
	run contract_limit 18 1 2 3 5 6 7 9 11 12 13 14 16 17 18
	assert_output '1-3,5-7,9,11-14,16-'
}

@test "Checking 'byte_mr()'" {
	run byte_mr <<< "2.5M"
	assert_output '2500000'
	run byte_mr <<< "195M"
	assert_output '195000000'
}

@test "Checking 'validate_limit()'" {
	run validate_limit 1-3,5,8,9,19-
	assert_success
	run validate_limit 1-3,5,8,9,19-25
	assert_success
	run validate_limit 1-3,5,8,9,25-19
	assert_failure
	run validate_limit 1-3,5,8,9,19-25-
	assert_failure
}

@test "Checking 'num_unicode2ascii()'" {
	run num_unicode2ascii <<< "২৩৪"
	assert_output '234'
	run num_unicode2ascii <<< "２３４"
	assert_output '234'
	run num_unicode2ascii <<< "二三四"
	assert_output '234'
}

@test "Checking 'srand(min,max,del,count)'" {
	run srand 1 12 2 6
	assert_output '1 3 5 7 9 11'
	run srand 2 12 2 6
	assert_output '2 4 6 8 10 12'
}

@test "Checking 'replace_invalid()'" {
	run replace_invalid <<< $(echo "<>:/\\?*|")
	assert_output '＜＞꞉⧸⧹？🞵ǀ'
}

@test "Checking 'remote_exist()'" {
	${CONNECTED:-false} || skip
	run remote_exist http://google.com/
	assert_success
}

@test "Checking 'xpath()'" {
	run xpath '//data/@property' <<< '<data property="property" />'
	assert_output ' property="property"'

	run xpath 'string(//data/@property)' <<< '<data property="property" />'
	assert_output 'property'

	run xpath '/a/text()' <<< '<a><![CDATA[<xml />]]></a>'
	assert_failure
}
