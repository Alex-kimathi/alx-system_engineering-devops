#!/usr/bin/env ruby
# create a Ruby script that accepts one argument and
# pass it to a regular expression matching method
# the match is 'hbtn't up to 5 times
#
puts ARGV[0].scan(/hbt{2,5}n$/).join
