       IDENTIFICATION DIVISION.
       FUNCTION-ID. factorial.

       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01  prev-n PIC 9(10).

       LINKAGE SECTION.
       01  n      PIC 9(10).
       01  ret    PIC 9(10).

       PROCEDURE DIVISION USING BY VALUE n RETURNING ret.
           IF n = 0
               MOVE 1 TO ret
           ELSE
               SUBTRACT 1 FROM n GIVING prev-n
               MULTIPLY n BY fac(prev-n) GIVING ret
           END-IF

           GOBACK
           .
