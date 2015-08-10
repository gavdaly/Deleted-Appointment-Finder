#!/usr/bin/env ruby
require 'fileutils'
include FileUtils

# A quick little ruby script that
# goes through every file in the log/'subdirectory'
# and matches the arguments for each patient ID



def find_id(value)
  Dir['logs/**/*'].each do |name|
    unless File.directory?(name)
      File.open(name, 'r').each_line do |line|
        puts line if /APPOINTMENT DELETED~[0-9]+#{value}/.match(line)
      end
    end
  end
end


ARGV.each do |value|
  puts 'Matches for #{value}:'
  find_id value
end
