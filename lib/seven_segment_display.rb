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
    number_count = self.to_s.length
    digits = self.to_s.split( // )
    display = ''
    0.upto( 4 ) do | line |
      0.upto( number_count - 1 ) do | digit_index |
        number_layout = number_layouts[ digits[ digit_index ].to_i ]
        display << number_layout[ line ].join
      end
      display << "\n"
    end
    display
  }

  Integer.send( :define_method, 'seven_segment', seven_segment_block )

end
