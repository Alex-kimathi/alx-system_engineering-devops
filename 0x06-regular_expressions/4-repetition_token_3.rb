#!/usr/bin/env ruby
# create a Ruby script that accepts one argument and
# pass it to a regular expression matching method
# the match is 'hbt't up to n times
#
puts ARGV[0].scan(/hbt*n$/).join
