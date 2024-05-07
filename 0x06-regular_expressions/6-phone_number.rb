#!/usr/bin/env ruby
# create a Ruby script that accepts one argument and
# the match 10 mobile numbers
#
puts ARGV[0].scan(/\d[1,10]$/).join
