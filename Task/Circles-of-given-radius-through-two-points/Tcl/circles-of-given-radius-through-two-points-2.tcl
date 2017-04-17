foreach {p1 p2 r} {
    {0.1234 0.9876} {0.8765 0.2345} 2.0
    {0.0000 2.0000} {0.0000 0.0000} 1.0
    {0.1234 0.9876} {0.1234 0.9876} 2.0
    {0.1234 0.9876} {0.8765 0.2345} 0.5
    {0.1234 0.9876} {0.1234 0.9876} 0.0
} {
    puts "p1:([join $p1 {, }]) p2:([join $p2 {, }]) r:$r =>"
    if {[catch {
	foreach c [findCircles $p1 $p2 $r] {
	    puts "\tCircle:([join $c {, }])"
	}
    } msg]} {
	puts "\tERROR: $msg"
    }
}