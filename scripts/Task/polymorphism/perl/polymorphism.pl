{
     package Point;
     use Class::Spiffy -base;
     use Clone qw(clone);

     sub _print {
         my %self = %{shift()};
         while (my ($k,$v) = each %self) {
             print "$k: $v\n";
         }
     }

     sub members {
         no strict;
         grep {
             1 == length and defined *$_{CODE}
         } keys %{*{__PACKAGE__."\::"}};
     }

     sub new {
         my $class = shift;
         my %param = @_;
         $param{$_} = 0 for grep {!defined $param{$_}} members;
         bless \%param, $class;
     }

     sub copy_constructor {
         clone shift;
     }

     sub copy_assignment {
         my $self = shift;
         my $from = shift;
         $self->$_($from->$_) for $from->members;
     }

     field 'x';
     field 'y';
}

{
     package Circle;
     use base qw(Point);
     field 'r';
}

{
     package main;
     $_->_print, print "\n" for (
        Point->new,
        Point->new(x => 2),
        Point->new(y => 3),
        Point->new(x => 8, y => -5),
     );
     my $p1 = Point->new(x => 8, y => -5);

     my $p2 = $p1->copy_constructor;
     print "we are really different objects, not just references ".
           "to the same instance\n" unless \$p1 eq \$p2;

     # accessors autogenerated
     $p1->x(1);
     $p1->y(2);
     print $p1->x, "\n";
     print $p1->y, "\n";

     $p2->copy_assignment($p1);
     print $p2->x, "\n";
     print $p2->y, "\n";
     print "we now have the same values, but we are still ".
           "different objects\n" unless \$p1 eq \$p2;

     $_->_print, print "\n" for (
        Circle->new,
        Circle->new(x => 1),
        Circle->new(y => 2),
        Circle->new(r => 3),
        Circle->new(x => 4, y => 5),
        Circle->new(x => 6, r => 7),
        Circle->new(y => 8, r => 9),
        Circle->new(x => 1, y => 2, r => 3),
     );

     my $c = Circle->new(r => 4);
     print $c->r, "\n"; # accessor autogenerated
}
