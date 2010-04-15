$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module SevenSegmentDisplay
  VERSION = '0.0.1'
  
  TOP = 0
  TOP_BODY = 1
  MIDDLE = 2
  BOTTOM_BODY = 3
  BOTTOM = 4
  
  #alias [] seven_segment

  def seven_segment( number, size = 1 )
    number_count = number.to_s.length
    digits = number.to_s.split( // )
    display = ''
    0.upto( 4 ) do | line |
      0.upto( number_count - 1 ) do | digit_index |
        number_layout = layout( digits[ digit_index ] )
        display << number_layout[ line ].join
      end
      display << "\n"
    end
    display
  end
        
  private
  
    def layout( number )
      numbers = 
      {
        0 => { 
          TOP         => [ ' ', '—', ' ' ],
          TOP_BODY    => [ '|', ' ', '|' ],
          MIDDLE      => [ ' ', ' ', ' ' ],
          BOTTOM_BODY => [ '|', ' ', '|' ],
          BOTTOM      => [ ' ', '—', ' ' ]
        },
        1 => { 
          TOP         => [ ' ', ' ', ' ' ],
          TOP_BODY    => [ ' ', ' ', '|' ],
          MIDDLE      => [ ' ', ' ', ' ' ],
          BOTTOM_BODY => [ ' ', ' ', '|' ],
          BOTTOM      => [ ' ', ' ', ' ' ]
        },
        2 => { 
          TOP         => [ ' ', '—', ' ' ],
          TOP_BODY    => [ ' ', ' ', '|' ],
          MIDDLE      => [ ' ', '—', ' ' ],
          BOTTOM_BODY => [ '|', ' ', ' ' ],
          BOTTOM      => [ ' ', '—', ' ' ]
        },
        3 => { 
          TOP         => [ ' ', '—', ' ' ],
          TOP_BODY    => [ ' ', ' ', '|' ],
          MIDDLE      => [ ' ', '—', ' ' ],
          BOTTOM_BODY => [ ' ', ' ', '|' ],
          BOTTOM      => [ ' ', '—', ' ' ]
        },
        4 => { 
          TOP         => [ ' ', ' ', ' ' ],
          TOP_BODY    => [ '|', ' ', '|' ],
          MIDDLE      => [ ' ', '—', ' ' ],
          BOTTOM_BODY => [ ' ', ' ', '|' ],
          BOTTOM      => [ ' ', ' ', ' ' ]
        },
        5 => { 
          TOP         => [ ' ', '—', ' ' ],
          TOP_BODY    => [ '|', ' ', ' ' ],
          MIDDLE      => [ ' ', '—', ' ' ],
          BOTTOM_BODY => [ ' ', ' ', '|' ],
          BOTTOM      => [ ' ', '—', ' ' ]
        },
        6 => {
          TOP         => [ ' ', '—', ' ' ],
          TOP_BODY    => [ '|', ' ', ' ' ],
          MIDDLE      => [ ' ', '—', ' ' ],
          BOTTOM_BODY => [ '|', ' ', '|' ],
          BOTTOM      => [ ' ', '—', ' ' ]
        },
        7 => { 
          TOP         => [ ' ', '—', ' ' ],
          TOP_BODY    => [ ' ', ' ', '|' ],
          MIDDLE      => [ ' ', ' ', ' ' ],
          BOTTOM_BODY => [ ' ', ' ', '|' ],
          BOTTOM      => [ ' ', ' ', ' ' ]
        },
        8 => { 
          TOP         => [ ' ', '—', ' ' ],
          TOP_BODY    => [ '|', ' ', '|' ],
          MIDDLE      => [ ' ', '—', ' ' ],
          BOTTOM_BODY => [ '|', ' ', '|' ],
          BOTTOM      => [ ' ', '—', ' ' ]
        },
        9 => { 
          TOP         => [ ' ', '—', ' ' ],
          TOP_BODY    => [ '|', ' ', '|' ],
          MIDDLE      => [ ' ', '—', ' ' ],
          BOTTOM_BODY => [ ' ', ' ', '|' ],
          BOTTOM      => [ ' ', '—', ' ' ]
        },
      }
      numbers[ number.to_i ]
    end
  
end
