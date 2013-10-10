require 'spec_helper'

describe ToyRobotSimulator::Robot do
  let(:table) { double("table", :include? => true) }
  let(:position) { double("position") }
  let(:facing) { double("facing") }
  let(:robot) { build(:robot, table) }

  describe "#place" do

    before(:each) do
      table.should_receive(:include?).with(position).and_return(table_includes_position)
      robot.place(position, facing)
    end

    context "table includes position" do
      let(:table_includes_position) { true }

      it "should set position" do
        robot.position.should == position
      end

      it "should set facing" do
        robot.facing.should == facing
      end
    end

    context "table does not include position" do
      let(:table_includes_position) { false }

      it "should not set position" do
        robot.position.should be_nil
      end

      it "should not set facing" do
        robot.facing.should be_nil
      end
    end
  end

  describe "#left" do
    before(:each) do
      robot.place(position, initial_direction)
      robot.left
    end

    context "robot faced north" do
      let(:initial_direction) { ToyRobotSimulator::Directions::NORTH }

      it "should be faced west" do
        robot.facing.should == ToyRobotSimulator::Directions::WEST
      end
    end

    context "robot faced east" do
      let(:initial_direction) { ToyRobotSimulator::Directions::EAST }

      it "should be faced north" do
        robot.facing.should == ToyRobotSimulator::Directions::NORTH
      end
    end

    context "robot faced south" do
      let(:initial_direction) { ToyRobotSimulator::Directions::SOUTH }

      it "should be faced east" do
        robot.facing.should == ToyRobotSimulator::Directions::EAST
      end
    end

    context "robot faced west" do
      let(:initial_direction) { ToyRobotSimulator::Directions::WEST }

      it "should be faced south" do
        robot.facing.should == ToyRobotSimulator::Directions::SOUTH
      end
    end
  end

  describe "#right" do
    before(:each) do
      robot.place(position, initial_direction)
      robot.right
    end

    context "robot faced north" do
      let(:initial_direction) { ToyRobotSimulator::Directions::NORTH }

      it "should be faced east" do
        robot.facing.should == ToyRobotSimulator::Directions::EAST
      end
    end

    context "robot faced east" do
      let(:initial_direction) { ToyRobotSimulator::Directions::EAST }

      it "should be faced south" do
        robot.facing.should == ToyRobotSimulator::Directions::SOUTH
      end
    end

    context "robot faced south" do
      let(:initial_direction) { ToyRobotSimulator::Directions::SOUTH }

      it "should be faced west" do
        robot.facing.should == ToyRobotSimulator::Directions::WEST
      end
    end

    context "robot faced west" do
      let(:initial_direction) { ToyRobotSimulator::Directions::WEST }

      it "should be faced north" do
        robot.facing.should == ToyRobotSimulator::Directions::NORTH
      end
    end
  end

  describe "#move" do
    let(:new_position) { double("new position") }

    before(:each) do
      robot.place(position, facing)
      position.should_receive(:heading).with(facing).and_return(new_position)
      table.should_receive(:include?).with(new_position).and_return(table_includes_position)
      robot.move
    end

    context "table includes new position" do
      let(:table_includes_position) { true }

      it "should set new position" do
        robot.position.should == new_position
      end

      it "should not change facing" do
        robot.facing.should == facing
      end
    end

    context "table does not include new position" do
      let(:table_includes_position) { false }

      it "should not change position" do
        robot.position.should == position
      end

      it "should not change facing" do
        robot.facing.should == facing
      end
    end
  end

end
