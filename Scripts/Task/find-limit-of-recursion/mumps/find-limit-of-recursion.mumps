RECURSE
 IF $DATA(DEPTH)=1 SET DEPTH=1+DEPTH
 IF $DATA(DEPTH)=0 SET DEPTH=1
 WRITE !,DEPTH_" levels down"
 DO RECURSE
 QUIT
