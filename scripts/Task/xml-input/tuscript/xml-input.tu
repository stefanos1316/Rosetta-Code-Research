$$ MODE TUSCRIPT
MODE DATA
$$ SET xmldata =*
<Students>
  <Student Name="April" Gender="F" DateOfBirth="1989-01-02" />
  <Student Name="Bob" Gender="M"  DateOfBirth="1990-03-04" />
  <Student Name="Chad" Gender="M"  DateOfBirth="1991-05-06" />
  <Student Name="Dave" Gender="M"  DateOfBirth="1992-07-08">
    <Pet Type="dog" Name="Rover" />
  </Student>
  <Student DateOfBirth="1993-09-10" Gender="F" Name="Emily" />
</Students>
$$ MODE TUSCRIPT
COMPILE
LOOP x = xmldata
SET name=GET_TAG_NAME (x)
IF (name!="student") CYCLE
 studentname=GET_ATTRIBUTE (x,"Name")
 IF (studentname!="") PRINT studentname
ENDLOOP
ENDCOMPILE
