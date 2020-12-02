#!/usr/bin/env ruby

input = File.open('day_02.input').lines.map do |line|
  rule, password = line.split(': ')
  quantity, char = rule.split(' ')
  positions = quantity.split('-').map(&:to_i)
  {
    char: char,
    positions: positions,
    password: password
  }
end

valid = input.select do |char:, positions:, password:|
  positions.map {|pos| password[pos - 1]}.count(char) == 1
end

puts "input: #{input.count}, valid: #{valid.count}"
