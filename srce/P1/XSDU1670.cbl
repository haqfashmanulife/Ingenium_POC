      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.  XSDU1670.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDU1670                                         **
      **  REMARKS:  CONVERT DATES TO OR FROM JULIAN DATE FORMAT.     **
      **            THIS MODULE CONVERTS THE PASSED INTERNAL DATE TO **
      **            THE REQUESTED JULIAN FORMAT OR VICE VERSA,       **
      **            ACCORDING TO THE INPUT REQUEST CODE.             **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
54-001**  01SEP96  GJR    MODIFICATIONS FOR MAINTAINABILITY          **
557658**  30SEP97  GV     MODIFICATIONS FOR YEAR 2000                **
005409**  30OCT98  56     MODIFICATIONS FOR LEAP YEAR                **
015543**  15DEC99  60     CODE CLEANUP                               **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
54-001 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU1670'.
 
       COPY XCWTDTTB.
 
       COPY XCWWWKDT.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       COPY XCWLDTLK.
       COPY XCWL1670.
      /
       PROCEDURE DIVISION USING LDTLK-PARM-INFO
                                L1670-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET LDTLK-VALID                    TO TRUE.
           SET L1670-RETRN-OK                 TO TRUE.
 
005409*    IF  L1670-LEAP-YEAR-VALID
005409*        CONTINUE
005409*    ELSE
005409*        SET L1670-DO-NOT-USE-LEAP-YEAR TO TRUE
005409*    END-IF.
 
           PERFORM  1000-PROCESS-DATE
               THRU 1000-PROCESS-DATE-X.
 
           MOVE LDTLK-VALID-SW                TO L1670-VALID-SW.
 
       0000-MAINLINE-X.
           GOBACK.
 
      *------------------
       1000-PROCESS-DATE.
      *------------------
 
005409*    MOVE L1670-LEAP-YEAR-SW          TO LDTLK-LEAP-YEAR-SW.
 
           IF  L1670-INTERNAL
               IF  L1670-INTERNAL-DATE = WWKDT-ZERO-DT
                   MOVE SPACES              TO L1670-CONVERTED-DATE
                   SET  LDTLK-NOT-VALID     TO TRUE
                   GO TO 1000-PROCESS-DATE-X
               ELSE
                   MOVE L1670-INTERNAL-DATE TO LDTLK-DATE-1
               END-IF
           ELSE
               MOVE WWKDT-ZERO-DT           TO L1670-INTERNAL-DATE
           END-IF.
 
           EVALUATE TRUE
 
               WHEN L1670-INTERNAL-TO-YYYYDDD
                    PERFORM  2000-INTERNAL-YYYYDDD
                        THRU 2000-INTERNAL-YYYYDDD-X
 
               WHEN L1670-INTERNAL-TO-DDDYYYY
                    PERFORM  3000-INTERNAL-DDDYYYY
                        THRU 3000-INTERNAL-DDDYYYY-X
 
557658*        WHEN L1670-INTERNAL-TO-YYDDD
557658*             PERFORM  4000-INTERNAL-YYDDD
557658*                 THRU 4000-INTERNAL-YYDDD-X
 
557658*        WHEN L1670-INTERNAL-TO-DDDYY
557658*             PERFORM  5000-INTERNAL-DDDYY
557658*                 THRU 5000-INTERNAL-DDDYY-X
 
               WHEN L1670-YYYYDDD-TO-INTERNAL
                    PERFORM  6000-YYYYDDD-INTERNAL
                        THRU 6000-YYYYDDD-INTERNAL-X
 
               WHEN L1670-DDDYYYY-TO-INTERNAL
                    PERFORM  7000-DDDYYYY-INTERNAL
                        THRU 7000-DDDYYYY-INTERNAL-X
 
557658*        WHEN L1670-YYDDD-TO-INTERNAL
557658*             PERFORM  8000-YYDDD-INTERNAL
557658*                 THRU 8000-YYDDD-INTERNAL-X
 
557658*        WHEN L1670-DDDYY-TO-INTERNAL
557658*             PERFORM  9000-DDDYY-INTERNAL
557658*                 THRU 9000-DDDYY-INTERNAL-X
 
               WHEN OTHER
                    SET LDTLK-NOT-VALID             TO TRUE
                    SET L1670-RETRN-INVALID-REQUEST TO TRUE
 
           END-EVALUATE.
 
       1000-PROCESS-DATE-X.
           EXIT.
 
      *----------------------
       2000-INTERNAL-YYYYDDD.
      *----------------------
 
           MOVE LDTLK-YYYY-1           TO  LDTLK-JUL1-CCYY.
           MOVE LDTLK-DD-1             TO  LDTLK-DAYS.
           MOVE LDTLK-MM-1             TO  LDTLK-MM-SUB.
 
005409*    IF  LDTLK-USE-LEAP-YEAR
005409*        MOVE LDTLK-JUL1-CCYY    TO  LDTLK-LEAP-YEAR
005409*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
005409*        IF  LDTLK-USE-LEAP-YEAR
005409*            MOVE +2             TO  LDTLK-LEAP-SUB
005409*        ELSE
005409*            MOVE +1             TO  LDTLK-LEAP-SUB
005409*        END-IF
005409*    ELSE
005409*        MOVE +1                 TO  LDTLK-LEAP-SUB
005409*    END-IF.
 
005409     MOVE LDTLK-JUL1-CCYY    TO  LDTLK-LEAP-YEAR.
005409     PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409         THRU LEAP-0100-EDIT-LEAP-YEAR-X.
005409     IF  LDTLK-IS-LEAP-YEAR
005409         MOVE +2             TO  LDTLK-LEAP-SUB
005409     ELSE
005409         MOVE +1             TO  LDTLK-LEAP-SUB
005409     END-IF.
 
           ADD TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
                                       TO LDTLK-DAYS.
           MOVE LDTLK-DAYS             TO  L1670-DDD-1.
           MOVE LDTLK-JUL1-CCYY        TO  L1670-YYYY-1.
 
       2000-INTERNAL-YYYYDDD-X.
           EXIT.
 
      *----------------------
       3000-INTERNAL-DDDYYYY.
      *----------------------
 
           MOVE LDTLK-YYYY-1           TO  LDTLK-JUL2-CCYY.
           MOVE LDTLK-DD-1             TO  LDTLK-DAYS.
           MOVE LDTLK-MM-1             TO  LDTLK-MM-SUB.
 
005409*    IF  LDTLK-USE-LEAP-YEAR
005409*        MOVE LDTLK-JUL2-CCYY    TO  LDTLK-LEAP-YEAR
005409*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
005409*        IF  LDTLK-USE-LEAP-YEAR
005409*            MOVE +2             TO  LDTLK-LEAP-SUB
005409*        ELSE
005409*            MOVE +1             TO  LDTLK-LEAP-SUB
005409*        END-IF
005409*    ELSE
005409*        MOVE +1                 TO  LDTLK-LEAP-SUB
005409*    END-IF.
 
005409     MOVE LDTLK-JUL2-CCYY    TO  LDTLK-LEAP-YEAR.
005409     PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409         THRU LEAP-0100-EDIT-LEAP-YEAR-X.
005409     IF  LDTLK-IS-LEAP-YEAR
005409         MOVE +2             TO  LDTLK-LEAP-SUB
005409     ELSE
005409         MOVE +1             TO  LDTLK-LEAP-SUB
005409     END-IF.
 
           ADD TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
                                       TO  LDTLK-DAYS.
           MOVE LDTLK-DAYS             TO  L1670-DDD-2.
           MOVE LDTLK-JUL2-CCYY        TO  L1670-YYYY-2.
 
       3000-INTERNAL-DDDYYYY-X.
           EXIT.
 
557658*--------------------
557658*4000-INTERNAL-YYDDD.
557658*--------------------
 
557658*    MOVE ZEROS                  TO  L1670-JULIAN-DATE-R-3.
557658*    MOVE LDTLK-YYYY-1           TO  L1670-YY-3.
557658*    MOVE LDTLK-DD-1             TO  LDTLK-DAYS.
557658*    MOVE LDTLK-MM-1             TO  LDTLK-MM-SUB.
 
557658*    IF  LDTLK-USE-LEAP-YEAR
557658*        MOVE LDTLK-YYYY-1       TO  LDTLK-LEAP-YEAR
557658*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
557658*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
557658*        IF  LDTLK-USE-LEAP-YEAR
557658*            MOVE +2             TO  LDTLK-LEAP-SUB
557658*        ELSE
557658*            MOVE +1             TO  LDTLK-LEAP-SUB
557658*        END-IF
557658*    ELSE
557658*        MOVE +1                 TO  LDTLK-LEAP-SUB
557658*    END-IF.
 
557658*    ADD TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
557658*                                TO  LDTLK-DAYS.
557658*    MOVE LDTLK-DAYS             TO  L1670-DDD-3.
 
557658*4000-INTERNAL-YYDDD-X.
557658*    EXIT.
 
557658*--------------------
557658*5000-INTERNAL-DDDYY.
557658*--------------------
 
557658*    MOVE ZEROS                  TO  L1670-JULIAN-DATE-R-4.
557658*    MOVE LDTLK-YYYY-1           TO  L1670-YY-4.
557658*    MOVE LDTLK-DD-1             TO  LDTLK-DAYS.
557658*    MOVE LDTLK-MM-1             TO  LDTLK-MM-SUB.
 
557658*    IF  LDTLK-USE-LEAP-YEAR
557658*        MOVE LDTLK-YYYY-1       TO  LDTLK-LEAP-YEAR
557658*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
557658*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
557658*        IF  LDTLK-USE-LEAP-YEAR
557658*            MOVE +2             TO  LDTLK-LEAP-SUB
557658*        ELSE
557658*            MOVE +1             TO  LDTLK-LEAP-SUB
557658*        END-IF
557658*    ELSE
557658*        MOVE +1                 TO  LDTLK-LEAP-SUB
557658*    END-IF.
 
557658*    ADD TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
557658*                                TO LDTLK-DAYS.
557658*    MOVE LDTLK-DAYS             TO  L1670-DDD-4.
 
557658*5000-INTERNAL-DDDYY-X.
557658*    EXIT.
 
      *----------------------
       6000-YYYYDDD-INTERNAL.
      *----------------------
 
           IF  L1670-JULIAN-DATE-R-1 NOT NUMERIC
               SET LDTLK-NOT-VALID     TO TRUE
               GO TO 6000-YYYYDDD-INTERNAL-X
           END-IF.
 
           IF  L1670-DDD-1 > 366
           OR  L1670-DDD-1 < 1
               SET LDTLK-NOT-VALID     TO TRUE
               GO TO 6000-YYYYDDD-INTERNAL-X
           END-IF.
 
           MOVE L1670-JULIAN-DATE-R-1  TO LDTLK-JUL-1.
 
005409*    IF  LDTLK-USE-LEAP-YEAR
005409*        MOVE LDTLK-JUL1-CCYY    TO LDTLK-LEAP-YEAR
005409*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
005409*        IF  LDTLK-USE-LEAP-YEAR
005409*            MOVE +2             TO  LDTLK-LEAP-SUB
005409*        ELSE
005409*            MOVE +1             TO  LDTLK-LEAP-SUB
005409*        END-IF
005409*    ELSE
005409*        MOVE +1                 TO  LDTLK-LEAP-SUB
005409*    END-IF.
 
005409     MOVE LDTLK-JUL1-CCYY    TO LDTLK-LEAP-YEAR.
005409     PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409         THRU LEAP-0100-EDIT-LEAP-YEAR-X.
005409     IF  LDTLK-IS-LEAP-YEAR
005409         MOVE +2             TO  LDTLK-LEAP-SUB
005409     ELSE
005409         MOVE +1             TO  LDTLK-LEAP-SUB
005409     END-IF.
 
           MOVE LDTLK-JUL1-CCYY        TO L1670-YYYY.
 
           PERFORM
               VARYING LDTLK-MM-SUB FROM 1 BY 1
               UNTIL   LDTLK-MM-SUB > 12
               OR TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
                           > LDTLK-JUL1-DDD
               OR TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
                           = LDTLK-JUL1-DDD
015543         CONTINUE
           END-PERFORM.
 
           IF  LDTLK-MM-SUB > 13
               SET LDTLK-NOT-VALID     TO TRUE
               GO TO 6000-YYYYDDD-INTERNAL-X
           END-IF.
 
           IF  TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB) >
                  LDTLK-JUL1-DDD
               SUBTRACT 1 FROM LDTLK-MM-SUB
               MOVE LDTLK-MM-SUB TO L1670-MM
               COMPUTE L1670-DD = LDTLK-JUL1-DDD -
                   TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
           END-IF.
 
           IF  TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB) =
                   LDTLK-JUL1-DDD
               IF  LDTLK-MM-SUB = 13
                   MOVE 12 TO L1670-MM
                   MOVE 31 TO L1670-DD
               ELSE
                   COMPUTE L1670-MM = LDTLK-MM-SUB - 1
                   MOVE TDTTB-DAYS-IN-MONTH (L1670-MM, LDTLK-LEAP-SUB)
                           TO L1670-DD
               END-IF
           END-IF.
 
       6000-YYYYDDD-INTERNAL-X.
           EXIT.
 
      *----------------------
       7000-DDDYYYY-INTERNAL.
      *----------------------
 
           IF  L1670-JULIAN-DATE-R-2 NOT NUMERIC
               SET LDTLK-NOT-VALID     TO TRUE
               GO TO 7000-DDDYYYY-INTERNAL-X
           END-IF.
 
           IF  L1670-DDD-2 > 366
           OR  L1670-DDD-2 < 1
               SET LDTLK-NOT-VALID     TO TRUE
               GO TO 7000-DDDYYYY-INTERNAL-X
           END-IF.
 
           MOVE L1670-JULIAN-DATE-R-2 TO LDTLK-JUL-2.
 
005409*    IF  LDTLK-USE-LEAP-YEAR
005409*        MOVE LDTLK-JUL2-CCYY   TO LDTLK-LEAP-YEAR
005409*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
005409*        IF  LDTLK-USE-LEAP-YEAR
005409*            MOVE +2            TO LDTLK-LEAP-SUB
005409*        ELSE
005409*            MOVE +1            TO LDTLK-LEAP-SUB
005409*        END-IF
005409*    ELSE
005409*        MOVE +1                TO LDTLK-LEAP-SUB
005409*    END-IF.
 
005409     MOVE LDTLK-JUL2-CCYY   TO LDTLK-LEAP-YEAR.
005409     PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409         THRU LEAP-0100-EDIT-LEAP-YEAR-X.
005409     IF  LDTLK-IS-LEAP-YEAR
005409         MOVE +2            TO LDTLK-LEAP-SUB
005409     ELSE
005409         MOVE +1            TO LDTLK-LEAP-SUB
005409     END-IF.
 
           MOVE LDTLK-JUL2-CCYY       TO L1670-YYYY.
 
           PERFORM
               VARYING LDTLK-MM-SUB FROM 1 BY 1
               UNTIL   LDTLK-MM-SUB > 12
               OR TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
                           > LDTLK-JUL2-DDD
               OR TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
                           = LDTLK-JUL2-DDD
015543         CONTINUE
           END-PERFORM.
 
           IF  LDTLK-MM-SUB > 13
               SET LDTLK-NOT-VALID     TO TRUE
               GO TO 7000-DDDYYYY-INTERNAL-X
           END-IF.
 
           IF  TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB) >
               LDTLK-JUL2-DDD
               SUBTRACT 1 FROM LDTLK-MM-SUB
               MOVE LDTLK-MM-SUB TO L1670-MM
               COMPUTE L1670-DD = LDTLK-JUL2-DDD -
                   TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
           END-IF.
 
           IF  TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB) =
                   LDTLK-JUL2-DDD
               IF  LDTLK-MM-SUB = 13
                   MOVE 12 TO L1670-MM
                   MOVE 31 TO L1670-DD
               ELSE
                   COMPUTE L1670-MM = LDTLK-MM-SUB - 1
                   MOVE TDTTB-DAYS-IN-MONTH (L1670-MM, LDTLK-LEAP-SUB)
                           TO L1670-DD
               END-IF
           END-IF.
 
       7000-DDDYYYY-INTERNAL-X.
           EXIT.
 
      *--------------------
557658*8000-YYDDD-INTERNAL.
      *--------------------
557658*
557658*    IF  L1670-JULIAN-DATE-3 NOT NUMERIC
557658*        SET LDTLK-NOT-VALID     TO TRUE
557658*        GO TO 8000-YYDDD-INTERNAL-X
557658*    END-IF.
557658*
557658*    IF  L1670-DDD-3 > 366
557658*    OR  L1670-DDD-3 < 1
557658*        SET LDTLK-NOT-VALID     TO TRUE
557658*        GO TO 8000-YYDDD-INTERNAL-X
557658*    END-IF.
557658*
557658*    MOVE L1670-JULIAN-DATE-3 TO LDTLK-JUL-3.
557658*
557658*    IF  LDTLK-USE-LEAP-YEAR
557658*        COMPUTE LDTLK-LEAP-YEAR = 1900 + LDTLK-JUL3-YY
557658*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
557658*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
557658*        IF LDTLK-USE-LEAP-YEAR
557658*            MOVE +2          TO LDTLK-LEAP-SUB
557658*        ELSE
557658*            MOVE +1          TO LDTLK-LEAP-SUB
557658*        END-IF
557658*    ELSE
557658*        MOVE +1              TO LDTLK-LEAP-SUB
557658*    END-IF.
557658*
557658*    COMPUTE L1670-YYYY = 1900 + LDTLK-JUL3-YY.
557658*
557658*    PERFORM
557658*        VARYING LDTLK-MM-SUB FROM 1 BY 1
557658*        UNTIL   LDTLK-MM-SUB > 12
557658*        OR TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
557658*                    > LDTLK-JUL3-DDD
557658*        OR TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
557658*                    = LDTLK-JUL3-DDD
557658*    END-PERFORM.
557658*
557658*    IF  LDTLK-MM-SUB > 13
557658*        SET LDTLK-NOT-VALID     TO TRUE
557658*        GO TO 8000-YYDDD-INTERNAL-X
557658*    END-IF.
557658*
557658*    IF  TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB) >
557658*        LDTLK-JUL3-DDD
557658*        SUBTRACT 1 FROM LDTLK-MM-SUB
557658*        MOVE LDTLK-MM-SUB TO L1670-MM
557658*        COMPUTE L1670-DD = LDTLK-JUL3-DDD -
557658*            TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
557658*    END-IF.
557658*
557658*    IF  TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB) =
557658*            LDTLK-JUL3-DDD
557658*        IF  LDTLK-MM-SUB = 13
557658*            MOVE 12 TO L1670-MM
557658*            MOVE 31 TO L1670-DD
557658*        ELSE
557658*            COMPUTE L1670-MM = LDTLK-MM-SUB - 1
557658*            MOVE TDTTB-DAYS-IN-MONTH (L1670-MM, LDTLK-LEAP-SUB)
557658*                     TO L1670-DD
557658*        END-IF
557658*    END-IF.
557658*
557658*8000-YYDDD-INTERNAL-X.
557658*    EXIT.
557658*
      *--------------------
557658*9000-DDDYY-INTERNAL.
      *--------------------
557658*
557658*    IF  L1670-JULIAN-DATE-4 NOT NUMERIC
557658*        SET LDTLK-NOT-VALID  TO TRUE
557658*        GO TO 9000-DDDYY-INTERNAL-X
557658*    END-IF.
557658*
557658*    IF  L1670-DDD-4 > 366
557658*    OR  L1670-DDD-4 < 1
557658*        SET LDTLK-NOT-VALID  TO TRUE
557658*        GO TO 9000-DDDYY-INTERNAL-X
557658*    END-IF.
557658*
557658*    MOVE L1670-JULIAN-DATE-4 TO LDTLK-JUL-4.
557658*
557658*    IF  LDTLK-USE-LEAP-YEAR
557658*        COMPUTE LDTLK-LEAP-YEAR = 1900 + LDTLK-JUL4-YY
557658*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
557658*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
557658*        IF  LDTLK-USE-LEAP-YEAR
557658*            MOVE +2          TO LDTLK-LEAP-SUB
557658*        ELSE
557658*            MOVE +1          TO LDTLK-LEAP-SUB
557658*        END-IF
557658*    ELSE
557658*        MOVE +1              TO LDTLK-LEAP-SUB
557658*    END-IF.
557658*
557658*    COMPUTE L1670-YYYY = 1900 + LDTLK-JUL4-YY.
557658*
557658*    PERFORM
557658*        VARYING LDTLK-MM-SUB FROM 1 BY 1
557658*        UNTIL   LDTLK-MM-SUB > 12
557658*        OR TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
557658*                    > LDTLK-JUL4-DDD
557658*        OR TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
557658*                    = LDTLK-JUL4-DDD
557658*    END-PERFORM.
557658*
557658*    IF  LDTLK-MM-SUB > 13
557658*        SET LDTLK-NOT-VALID  TO TRUE
557658*        GO TO 9000-DDDYY-INTERNAL-X
557658*    END-IF.
557658*
557658*    IF  TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB) >
557658*        LDTLK-JUL4-DDD
557658*        SUBTRACT 1 FROM LDTLK-MM-SUB
557658*        MOVE LDTLK-MM-SUB TO L1670-MM
557658*        COMPUTE L1670-DD = LDTLK-JUL4-DDD -
557658*            TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB)
557658*    END-IF.
557658*
557658*    IF  TDTTB-DAYS-TO-MONTH (LDTLK-MM-SUB, LDTLK-LEAP-SUB) =
557658*            LDTLK-JUL4-DDD
557658*        IF  LDTLK-MM-SUB = 13
557658*            MOVE 12 TO L1670-MM
557658*            MOVE 31 TO L1670-DD
557658*        ELSE
557658*            COMPUTE L1670-MM = LDTLK-MM-SUB - 1
557658*            MOVE TDTTB-DAYS-IN-MONTH (L1670-MM, LDTLK-LEAP-SUB)
557658*                     TO L1670-DD
557658*        END-IF
557658*    END-IF.
557658*
557658*9000-DDDYY-INTERNAL-X.
557658*    EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPPLEAP.
      *****************************************************************
      **                 END OF PROGRAM XSDU1670                     **
      *****************************************************************
