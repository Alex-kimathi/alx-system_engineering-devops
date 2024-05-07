#!/usr/bin/env ruby
# create a Ruby script that accepts one argument and
# the match starts with h and ends with n and have any value in between
#
puts ARGV[0].scan(/h.n$/).join
