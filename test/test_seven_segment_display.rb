require File.dirname(__FILE__) + '/test_helper.rb'


class TestSevenSegmentDisplay < Test::Unit::TestCase

  include SevenSegmentDisplay

  def setup
  end
  
  def test_truth
    convert_to_seven_segments( 1029384756, 2 )
  end
end
