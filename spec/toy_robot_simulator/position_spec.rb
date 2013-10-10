require 'spec_helper'

describe ToyRobotSimulator::Position do
  let(:x) { 11 }
  let(:y) { 97 }
  let(:position) { build(:position, x, y) }

  describe "#heading" do
    let(:new_position) { position.heading(direction) }

    context "heading north" do
      let(:direction) { ToyRobotSimulator::Directions::NORTH }

      it "should have same x coordinate" do
        new_position.x.should == position.x
      end

      it "should increment y coordinate by 1" do
        new_position.y.should == position.y + 1
      end
    end

    context "heading east" do
      let(:direction) { ToyRobotSimulator::Directions::EAST }

      it "should have same y coordinate" do
        new_position.y.should == position.y
      end

      it "should increment x coordinate by 1" do
        new_position.x.should == position.x + 1
      end
    end

    context "heading south" do
      let(:direction) { ToyRobotSimulator::Directions::SOUTH }

      it "should have same x coordinate" do
        new_position.x.should == position.x
      end

      it "should decrement y coordinate by 1" do
        new_position.y.should == position.y - 1
      end
    end

    context "heading west" do
      let(:direction) { ToyRobotSimulator::Directions::WEST }

      it "should have same y coordinate" do
        new_position.y.should == position.y
      end

      it "should decrement x coordinate by 1" do
        new_position.x.should == position.x - 1
      end
    end

  end

  def pos x, y
    build(:position, x, y)
  end

end
