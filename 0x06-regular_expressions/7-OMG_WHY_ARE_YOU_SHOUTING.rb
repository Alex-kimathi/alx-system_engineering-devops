#!/usr/bin/env ruby
#
# create a Ruby script that accepts one argument and
# matches capital letters only
#
puts ARGV[0].scan(/[A-Z]*/).join
