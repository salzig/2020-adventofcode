#!/usr/bin/env ruby

class Map
  def initialize(raw)
    @raw = raw
  end

  private def width
    @width ||= @raw.first.length - 1
  end

  def height
    @raw.length
  end

  def at(x, y)
    @raw[x][y % width]
  end

  def tree?(x,y)
    at(x, y) == '#' rescue false
  end

  def print(x, y)
    line = @raw[x]
    line[y % width] = tree?(x, y) ? 'X' : 'O' unless line.nil?
    puts line
  end
end

map = Map.new(File.read('day_03.input').lines)

x, y, trees = 0, 0, 0

while x < map.height
  x += 1
  y += 3

  trees += 1 if map.tree?(x, y)
  map.print(x, y)
end

puts trees
