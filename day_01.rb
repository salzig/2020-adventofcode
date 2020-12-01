#!/usr/bin/env ruby

values = File.read('day_01.input').lines.map(&:to_i)

values.each do |x|
  values.each do |y|
    values.each do |z|
      puts "#{x} + #{y} + #{z} = 2020; #{x} * #{y} * #{z} = #{x*y*z}" if x + y + z == 2020
    end
  end
end
