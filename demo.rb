require 'lib/seven_segment_display'

0.step( 100, 5 ) do | x |
  puts x.seven_segment
end
0.step( 100, 5 ) do | x |
  puts x.seven_segment( 2 )
end
0.step( 100, 5 ) do | x |
  puts x.seven_segment( 5 )
end
