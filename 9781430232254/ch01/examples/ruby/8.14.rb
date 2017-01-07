#!/usr/bin/env ruby

require 'sqlite3'

db = SQLite3::Database.new(File.join(__FILE__, '../seinfeld.db'))

db.results_as_hash = true

result = db.query('select * from foods limit 10')
result.each do |row|
  puts row['name']
end

result.reset

puts row['name'] while row == result.next
result.close
