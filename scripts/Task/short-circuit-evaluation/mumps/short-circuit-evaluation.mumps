SSEVAL1(IN)
 WRITE !,?10,$STACK($STACK,"PLACE")
 QUIT IN
SSEVAL2(IN)
 WRITE !,?10,$STACK($STACK,"PLACE")
 QUIT IN
SSEVAL3
 NEW Z
 WRITE "1 AND 1"
 SET Z=$$SSEVAL1(1) SET:Z Z=Z&$$SSEVAL2(1)
 WRITE !,$SELECT(Z:"TRUE",1:"FALSE")
 WRITE !!,"0 AND 1"
 SET Z=$$SSEVAL1(0) SET:Z Z=Z&$$SSEVAL2(1)
 WRITE !,$SELECT(Z:"TRUE",1:"FALSE")
 WRITE !!,"1 OR 1"
 SET Z=$$SSEVAL1(1) SET:'Z Z=Z!$$SSEVAL2(1)
 WRITE !,$SELECT(Z:"TRUE",1:"FALSE")
 WRITE !!,"0 OR 1"
 SET Z=$$SSEVAL1(0) SET:'Z Z=Z!$$SSEVAL2(1)
 WRITE !,$SELECT(Z:"TRUE",1:"FALSE")
 KILL Z
 QUIT
