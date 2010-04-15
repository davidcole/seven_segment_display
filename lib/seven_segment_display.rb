$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module SevenSegmentDisplay
  VERSION = '0.0.1'

  TOP = 0
  TOP_BODY = 1
  MIDDLE = 2
  BOTTOM_BODY = 3
  BOTTOM = 4

  number_layouts = {
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
    }
  }

  seven_segment_block = lambda { | *args |
    size = args[0] ||= 1
    raise ArgumentError.new( 'Size cannot be less than one.' ) if size < 1
    number_count = self.to_s.length
    digits = self.to_s.split( // )
    display = ''
     
    make_line = lambda { | line_number |
      line = ''
      0.upto( number_count - 1 ) do | digit_index |
        number_layout = number_layouts[ digits[ digit_index ].to_i ]
        line << "#{ number_layout[ line_number ][ 0 ] }#{ number_layout[ line_number ][ 1 ] * size }#{ number_layout[ line_number ][ 2 ] }"
      end
      line + "\n"
    }
    
    0.upto( 4 ) do | line_number |
      if line_number.odd?
        display << make_line.call( line_number ) * size 
      else
        display << make_line.call( line_number )
      end
    end
    display    
  }

  Integer.send( :define_method, 'seven_segment', seven_segment_block )

end
