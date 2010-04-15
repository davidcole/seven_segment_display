$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module SevenSegmentDisplay
  VERSION = '0.0.1'
  
  def convert_to_seven_segments( number, size = 1 )
    number_count = number.to_s.length
    digits = number.to_s.split( // )
    1.upto( 5 ) do | line |
      0.upto( number_count - 1 ) do | digit_number |
        number_layout = layout( digits[ digit_number ] )
        print self.send( "line_#{ line }", number_layout )
      end
      puts
    end
  end
        
    
    
  
  private
  
    def line_1( number_layout )
      " #{ number_layout[ 0 ] ? '-' : ' ' } "
    end
    def line_2( number_layout )
      "#{ number_layout[ 1 ] ? '|' : ' ' } #{ number_layout[ 2 ] ? '|' : ' ' }"
    end
    def line_3( number_layout )
      " #{ number_layout[ 3 ] ? '-' : ' ' } "
    end
    def line_4( number_layout )
      "#{ number_layout[ 4 ] ? '|' : ' ' } #{ number_layout[ 5 ] ? '|' : ' ' }"
    end
    def line_5( number_layout )
      " #{ number_layout[ 6 ] ? '-' : ' ' } "
    end
  
    def layout( number )
      numbers = 
      [
        [ true, true, true, false, true, true, true ],
        [ false, false, true, false, false, true, false ],
        [ true, false, true, true, true, false, true ],
        [ true, false, true, true, false, true, true ],
        [ false, true, true, true, false, true, false ],
        [ true, true, false, true, false, true, true ],
        [ true, true, false, true, true, true, true ],
        [ true, false, true, false, false, true, false ],
        [ true, true, true, true, true, true, true ],
        [ true, true, true, true, false, true, true ]
      ]
      numbers[ number.to_i ]
    end
  
end
