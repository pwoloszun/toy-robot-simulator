module ToyRobotSimulator
  class Position

    attr_reader :x, :y

    def initialize x, y
      @x, @y = x, y
    end

    def heading direction
      if direction == Directions::NORTH
        Position.new(@x, @y + 1)
      elsif direction == Directions::EAST
        Position.new(@x + 1, @y)
      elsif direction == Directions::SOUTH
        Position.new(@x, @y - 1)
      elsif direction == Directions::WEST
        Position.new(@x - 1, @y)
      end
    end

  end
end
