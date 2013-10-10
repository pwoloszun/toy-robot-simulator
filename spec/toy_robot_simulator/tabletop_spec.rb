require 'spec_helper'

describe ToyRobotSimulator::Tabletop do
  let(:width) { 3 }
  let(:height) { 3 }
  let(:tabletop) { build(:tabletop, width, height) }

  describe "#include?" do

    context "position inside tabletop" do
      subject { tabletop.include?(pos) }

      let(:pos) { position(1, 1) }

      it { should be_true }
    end

    context "position on tabletop edge" do

      it "should include top edge position" do
        tabletop.should include(position(1, 2))
      end

      it "should include right edge position" do
        tabletop.should include(position(2, 1))
      end

      it "should include bottom edge position" do
        tabletop.should include(position(1, 0))
      end

      it "should include left edge position" do
        tabletop.should include(position(0, 1))
      end

    end

    context "position on corner" do
      it "should include top-left corner position" do
        tabletop.should include(position(0, 2))
      end

      it "should include top-right corner position" do
        tabletop.should include(position(2, 2))
      end

      it "should include bottom-right corner position" do
        tabletop.should include(position(2, 0))
      end

      it "should include bottom-left corner position" do
        tabletop.should include(position(0, 0))
      end
    end

    context "position beyond bounds" do
      it "should not include position beyond top bound" do
        tabletop.should_not include(position(0, height))
      end

      it "should not include position beyond right bound" do
        tabletop.should_not include(position(width, 0))
      end

      it "should not include position beyond bottom bound" do
        tabletop.should_not include(position(0, -1))
      end

      it "should not include position beyond left bound" do
        tabletop.should_not include(position(-1, 0))
      end
    end

  end

  def position x, y
    build(:position, x, y)
  end

end
