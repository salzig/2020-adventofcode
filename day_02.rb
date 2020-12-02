#!/usr/bin/env ruby

input = File.open('day_02.input').lines.map do |line|
  rule, password = line.split(': ')
  quantity, char = rule.split(' ')
  range = Range.new(*quantity.split('-').map(&:to_i))
  {
    char: char,
    range: range,
    password: password
  }
end

valid = input.select do |char:, range:, password:|
  puts "char: '#{char}', range: #{range}, char count: #{password.count(char)}, includes: #{range.cover?(password.count(char))} password: #{password}"
  range.cover?(password.count(char))
end

puts "input: #{input.count}, valid: #{valid.count}"
