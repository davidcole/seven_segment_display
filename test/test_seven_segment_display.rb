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
    @all_digits_2 = <<-END
     ——  ——      ——  ——  ——  ——  ——  —— 
   |   |   ||  ||   |      ||  ||  ||  |
   |   |   ||  ||   |      ||  ||  ||  |
     ——  ——  ——  ——  ——      ——  ——     
   ||      |   |   ||  |   ||  |   ||  |
   ||      |   |   ||  |   ||  |   ||  |
     ——  ——      ——  ——      ——  ——  —— 
    END
    @all_digits_5 = <<-END
        —————  —————         —————  —————  —————  —————  —————  ————— 
      |      |      ||     ||      |            ||     ||     ||     |
      |      |      ||     ||      |            ||     ||     ||     |
      |      |      ||     ||      |            ||     ||     ||     |
      |      |      ||     ||      |            ||     ||     ||     |
      |      |      ||     ||      |            ||     ||     ||     |
        —————  —————  —————  —————  —————         —————  —————        
      ||            |      |      ||     |      ||     |      ||     |
      ||            |      |      ||     |      ||     |      ||     |
      ||            |      |      ||     |      ||     |      ||     |
      ||            |      |      ||     |      ||     |      ||     |
      ||            |      |      ||     |      ||     |      ||     |
        —————  —————         —————  —————         —————  —————  ————— 
    END
    @all_digits_negative = <<-END
       —  — 
     |  |  |
 —     —  — 
     ||    |
       —  — 
    END
    @all_digits_negative_2 = <<-END
         ——  —— 
       |   |   |
       |   |   |
 ——      ——  —— 
       ||      |
       ||      |
         ——  —— 
    END
  end
  
  def test_display
    assert_equal( @all_digits, 1234567890.seven_segment )
    assert_equal( @all_digits_backwards, 9876543210.seven_segment )
    assert_equal( @all_digits_2, 1234567890.seven_segment( 2 ) )
    assert_equal( @all_digits_5, 1234567890.seven_segment( 5 ) )
    assert_equal( @all_digits_negative, -123.seven_segment )
    assert_equal( @all_digits_negative_2, -123.seven_segment( 2 ) )
    assert_raise( ArgumentError ) { 1234567890.seven_segment( 0 ) }
  end
end
