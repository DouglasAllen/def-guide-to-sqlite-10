#!/usr/bin/env ruby

require 'sqlite3'

db = SQLite3::Database.new(':memory:')

db.create_function('hello_newman', -1) do |func, *args|
  func.result = if args.empty?
                  'Hello Jerry'
                else
                  'Hello %s' % [args.join(', ')]
                end
end

puts db.get_first_value('SELECT hello_newman()')
puts db.get_first_value("SELECT hello_newman('Elaine')")
puts db.get_first_value("SELECT hello_newman('Elaine', 'Jerry')")
puts db.get_first_value("SELECT hello_newman('Elaine', 'Jerry', 'George')")
