require File.dirname(__FILE__) + '/test_helper.rb'

class TestSevenSegmentDisplay < Test::Unit::TestCase

  include SevenSegmentDisplay

  def setup
    @all_digits = <<-END
    —  —     —  —  —  —  —  — 
  |  |  || ||  |    || || || |
    —  —  —  —  —     —  —    
  ||    |  |  || |  || |  || |
    —  —     —  —     —  —  — 
    END
    @all_digits_backwards = <<-END
 —  —  —  —  —     —  —     — 
| || |  ||  |  | |  |  |  || |
 —  —     —  —  —  —  —       
  || |  || |  |  |  ||    || |
 —  —     —  —     —  —     — 
    END
  end
  
  def test_display    
    assert_equal( @all_digits, 1234567890.seven_segment )
    assert_equal( @all_digits_backwards, 9876543210.seven_segment )
  end
end
