module ToyRobotSimulator
  class Tabletop

    def initialize width, height
      @width, @height = width, height
    end

    def include? position
      (0...@width).include?(position.x) && (0...@height).include?(position.y)
    end

  end
end
