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

  def debug_print(x, y)
    line = @raw[x]
    line[y % width] = tree?(x, y) ? 'X' : 'O' unless line.nil?
    puts line
  end

  def trees_hit_for_slope(dx, dy, debug = false)
    x, y, trees = 0, 0, 0

    while x < height
      x += dx
      y += dy

      trees += 1 if tree?(x, y)
      debug_print(x, y) if debug
    end
    trees
  end
end

map = Map.new(File.read('day_03.input').lines)

puts map.trees_hit_for_slope(1, 3)
