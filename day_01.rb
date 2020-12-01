#!/usr/bin/env ruby

values = File.read('day_01.input').lines.map(&:to_i)

values.each do |x|
  values.each do |y|
    puts "#{x} + #{y} = 2020; #{x} * #{y} = #{x*y}" if x + y == 2020
  end
end
