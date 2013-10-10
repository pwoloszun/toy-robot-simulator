#!/usr/bin/env ruby
dir_name = File.dirname(__FILE__)
require "#{dir_name}/../lib/toy_robot_simulator"

def position position_coords
  ToyRobotSimulator::Position.new(*position_coords)
end

def facing facing_str
  eval("ToyRobotSimulator::Directions::#{facing_str}")
end

tabletop = ToyRobotSimulator::Tabletop.new(5, 5)
robot = ToyRobotSimulator::Robot.new(tabletop)

line_number = 0
File.open("#{dir_name}/robot_commands.txt").each do |line|
  if line.empty? || line == "\n"
    robot = ToyRobotSimulator::Robot.new(tabletop)
  elsif line =~ /^place/i
    position_coords = line.scan(/\d+/).map(&:to_i)
    facing_str = line.scan(/\w+$/).first
    robot.place(position(position_coords), facing(facing_str))
  elsif line =~ /^move/i
    robot.move
  elsif line =~ /^left/i
    robot.left
  elsif line =~ /^right/i
    robot.right
  elsif line =~ /^report/i
    puts "Output: #{robot.position.x},#{robot.position.y},#{robot.facing.to_s.upcase}"
  else
    raise "Unknown command: \"#{line}\", at: #{line_number}"
  end
  line_number += 1
end
