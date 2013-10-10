module Factories

  def build class_name, *args
    klass = CLASSES_MAP[class_name]
    klass.new(*args)
  end

  private

  CLASSES_MAP = {
    position: ToyRobotSimulator::Position,
    tabletop: ToyRobotSimulator::Tabletop,
    robot: ToyRobotSimulator::Robot
  }.freeze

end
