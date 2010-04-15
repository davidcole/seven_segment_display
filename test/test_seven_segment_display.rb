require File.dirname(__FILE__) + '/test_helper.rb'


class TestSevenSegmentDisplay < Test::Unit::TestCase

  include SevenSegmentDisplay

  def setup
  end
  
  def test_truth
    puts seven_segment( 1029384756 )
  end
end
