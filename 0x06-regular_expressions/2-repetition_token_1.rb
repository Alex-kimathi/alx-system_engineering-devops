#!/usr/bin/env ruby
# create a Ruby script that accepts one argument and
# pass it to a regular expression matching method
# the match is 'hbtn' or htn
#
puts ARGV[0].scan(/hb?tn$/).join
