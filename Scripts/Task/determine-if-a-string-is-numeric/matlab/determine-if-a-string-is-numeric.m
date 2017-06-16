    % copy from Octave version on this page
    function r = isnum(a)
     if ( isnumeric(a) )
       r = 1;
     else
       o = str2num(a);
       r = !isempty(o);
     endif
   end

% tests
disp(isnum(123)) % 1
disp(isnum("123")) % 1
disp(isnum("foo123")) % 0
disp(isnum("123bar")) % 0
disp(isnum("3.1415")) % 1
