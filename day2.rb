# frozen_string_literal: true

class Day2
  attr_reader :input, :range, :dive

  def initialize
    @input = File.read('input/day2.txt')
                 .split("\n")
                 .map { |line| line.split(' ') }
  end

  def run
    @range = input.filter { |c, _| c == 'forward' }
    @dive = input.filter { |c, _| c != 'forward' }

    puts distance * depth
    [distance, depth]
  end

  def distance
    range.transpose[1].map(&:to_i).reduce(0) { |sum, num| sum + num }
  end

  def depth
    dive.reduce(0) do |sum, pair|
      if pair[0] == 'down'
        sum + pair[1].to_i
      else
        sum - pair[1].to_i
      end
    end
  end
end
