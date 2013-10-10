module ToyRobotSimulator
  class Robot

    FACINGS = [Directions::NORTH, Directions::EAST, Directions::SOUTH, Directions::WEST].freeze

    attr_reader :position, :facing

    def initialize tabletop
      @tabletop = tabletop
    end

    def place position, facing
      @position, @facing = position, facing if @tabletop.include?(position)
    end

    def move
      new_position = @position.heading(@facing)
      @position = new_position if @tabletop.include?(new_position)
    end

    def left
      @facing = FACINGS[facing_index - 1]
    end

    def right
      @facing = FACINGS[(facing_index + 1) % FACINGS.length]
    end

    private

    def facing_index
      FACINGS.index(@facing)
    end

  end
end
