      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDU9128.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDU9128                                         **
      **  REMARKS:  COMPARE MBCS FIELDS.                             **
      **            THIS MODULE CONVERTS A MIXED CHARACTER STRING TO **
      **            DOUBLE BYTE CHARACTER STRING.                    **
      **                                                             **
      **  DOMAIN :  CL                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
MGARNB**  10JUN10  CTS    CREATED FOR DBCS STRING CONVERSION         **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      **********************
       CONFIGURATION SECTION.
      **********************

       COPY XCWWCSNM.
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU9128'.
 
       COPY XCWWMBCS.

      *****************************************************************
      *  SBCS ALPHABET TO DBCS ALPHABET CONVERSION TABLE              *
      *****************************************************************
       COPY XCWW9128.
 
       01  WS-WORK-FIELDS.
           10 W9128-INPUT-FIELD.
              15 W9128-INPUT-FIELD-X         PIC X(01) OCCURS 200 TIMES.
              
           10 W9128-OUTPUT-FIELD.
              15 W9128-OUTPUT-FIELD-X        PIC X(01) OCCURS 200 TIMES.  

           10 W9128-OUT-FIELD-LEN            PIC S9(03) VALUE ZERO.  
           10 W9128-DBCS-CHARS-IN-SOSI       PIC S9(03) VALUE ZERO.
           10 I                              PIC S9(04) VALUE ZERO.
           10 J                              PIC S9(04) VALUE ZERO.
           10 K                              PIC S9(04) VALUE ZERO.
           10 W9128-DB-SPACE   VALUE X'8140' PIC X(02).           
           10 W9128-PREV-SOSI                PIC X(01)  VALUE SPACES.
           10 W9128-FIELD-OUTPUT-LEN         PIC S9(03) VALUE ZERO.
           
           10 W9128-DBCS-CONVERT-RETRN-CD    PIC S9(04) COMP.
               88  W9128-DBCS-CONVERT-OK                VALUE 00.
               88  W9128-DBCS-CHAR-SPACE                VALUE 90.               
               88  W9128-DBCS-UNMATCH-SOSI              VALUE 91.
               88  W9128-DBCS-CHAR-INVALID              VALUE 92.
               88  W9128-DBCS-CHAR-END                  VALUE 93.
               
           10 W9128-CS-PREV-SPACE-CHK        PIC X(01).
               88  W9128-CS-PREV-SPACE                  VALUE 'Y'.
               88  W9128-CS-PREV-SPACE-NO               VALUE 'N'.               
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       COPY XCWL9128.
      /
       PROCEDURE DIVISION USING L9128-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.
 
           IF  L9128-RQST-CONVERT-DBCS
               PERFORM  2000-CONVERT-TO-DBCS 
                   THRU 2000-CONVERT-TO-DBCS-X              
           END-IF.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           INITIALIZE L9128-OUTPUT-PARM-INFO.
           SET L9128-RETRN-OK               TO TRUE.

           PERFORM  MBCS-0000-INIT
               THRU MBCS-0000-INIT-X.
      *
      *--INITIALIZE WORK FIELDS AND VALIDATE INPUT PARAMETERS.
      *
           MOVE SPACES                      TO W9128-OUTPUT-FIELD
                                               W9128-INPUT-FIELD.
           MOVE L9128-FIELD-INPUT           TO W9128-INPUT-FIELD.
           MOVE LENGTH OF L9128-FIELD-OUTPUT 
                                            TO W9128-FIELD-OUTPUT-LEN

           MOVE SPACES                      TO W9128-OUTPUT-FIELD.          
 
       1000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       2000-CONVERT-TO-DBCS.
      *---------------------
 
           IF  L9128-OUT-FIELD-LEN > ZERO
               CONTINUE 
           ELSE
               GO TO 2000-CONVERT-TO-DBCS-X
           END-IF. 
           
           COMPUTE W9128-OUT-FIELD-LEN      = L9128-OUT-FIELD-LEN.
 
           SET W9128-CS-PREV-SPACE-NO       TO TRUE.           
           MOVE  1                          TO  I.
           MOVE  1                          TO  J.
           MOVE  SPACES                     TO  W9128-PREV-SOSI.           
 
           PERFORM  2100-CHK-AND-CONVERT
               THRU 2100-CHK-AND-CONVERT-X
               UNTIL I  >  L9128-OUT-FIELD-LEN
               OR    J  >  W9128-OUT-FIELD-LEN.

           MOVE W9128-OUTPUT-FIELD          TO L9128-FIELD-OUTPUT.
 
       2000-CONVERT-TO-DBCS-X.
           EXIT.
      /
      *---------------------
       2100-CHK-AND-CONVERT.
      *---------------------

           SET W9128-DBCS-CONVERT-OK        TO TRUE                
      *
      *    CHECK WHETHER THE NEXT BYTE IS SOSI, DBCS or SBCS
      *
           MOVE W9128-INPUT-FIELD-X (I)  TO  WMBCS-CS-CHARACTER.
           
           PERFORM  MBCS-1000-CHECK
               THRU MBCS-1000-CHECK-X.
 
           EVALUATE TRUE
 
           WHEN WMBCS-CS-IS-DBCS
              
              IF (I + 1 ) > L9128-OUT-FIELD-LEN
                 SET  W9128-DBCS-CHAR-END   TO  TRUE
              ELSE
                 MOVE W9128-INPUT-FIELD (I:2)
                                    TO  W9128-OUTPUT-FIELD (J:2)
                 ADD   2            TO  J
              END-IF
              ADD   2               TO  I              
 
           WHEN WMBCS-CS-IS-SBCS
              
              MOVE W9128-INPUT-FIELD-X (I)
                                    TO  W9128-SBCS-FROM-CHAR
              ADD   1               TO  I              
              PERFORM  3000-CHECK-VALID-CHAR
                  THRU 3000-CHECK-VALID-CHAR-X
 
              IF W9128-MATCH-FOUND
                 MOVE W9128-SBCS-FROM-CHAR
                                    TO  W9128-OUTPUT-FIELD (J:1)
                 ADD   1            TO  J                                    
              ELSE
                 SET W9128-DBCS-CHAR-INVALID TO  TRUE
              END-IF
 
           WHEN WMBCS-CS-IS-SPACE
              MOVE W9128-INPUT-FIELD-X (I)  TO 
                                          W9128-OUTPUT-FIELD (J:1)
              ADD 1                         TO I
              ADD 1                         TO J
                                         
          WHEN WMBCS-CS-IS-SHIFT-IN
             
              ADD  1                        TO  I
              IF  W9128-PREV-SOSI = WMBCS-SHIFT-OUT
                  MOVE  WMBCS-SHIFT-IN          TO  W9128-PREV-SOSI
              ELSE
                  SET   W9128-DBCS-UNMATCH-SOSI TO  TRUE
              END-IF
 
           WHEN WMBCS-CS-IS-SHIFT-OUT
              
              ADD  1                        TO  I
              IF  W9128-PREV-SOSI = WMBCS-SHIFT-OUT
                  SET  W9128-DBCS-UNMATCH-SOSI  TO  TRUE
              ELSE
                  MOVE  WMBCS-SHIFT-OUT         TO  W9128-PREV-SOSI
                  PERFORM  2100-MOVE-DBCS
                      THRU 2100-MOVE-DBCS-X
                  IF  W9128-DBCS-CHARS-IN-SOSI NOT > ZERO
                      SET  W9128-DBCS-CHAR-INVALID  TO  TRUE
                  END-IF
              END-IF
 
           WHEN  OTHER

              ADD  1                        TO  I              
              SET  W9128-DBCS-CHAR-INVALID  TO  TRUE
 
           END-EVALUATE.
 
           IF  W9128-DBCS-CHAR-END
               GO TO 2100-CHK-AND-CONVERT-X
           END-IF.
           
       2100-CHK-AND-CONVERT-X.
           EXIT.
      /
      *---------------
       2100-MOVE-DBCS.
      *---------------

      *  DIRECTLY MOVE ALL DOUBLE BYTES CHARACTERS BETWEEN SOSI
      *  CHARACTER WITHOUT CONVERSION.
      *
           MOVE  0  TO  W9128-DBCS-CHARS-IN-SOSI.
           PERFORM
             UNTIL I > L9128-OUT-FIELD-LEN
             OR    J > W9128-OUT-FIELD-LEN             
             OR    NOT W9128-DBCS-CONVERT-OK
      *
      * CHECK WHETHER THE NEXT BYTE IS SOSI, DBCS or SBCS
      *
      * IF NEXT CHARACTER IS SHIFT-IN, SET PREVIOUS SHIFT-IN
      * CHARACTER AND EXIT
      *
              IF W9128-INPUT-FIELD-X (I) =  WMBCS-SHIFT-IN
                 MOVE  WMBCS-SHIFT-IN      TO  W9128-PREV-SOSI
                 GO TO 2100-MOVE-DBCS-X
              END-IF
      *
      *  CHECK FIRST CHARACTER
      *
              IF W9128-INPUT-FIELD-X (I) = WMBCS-SHIFT-OUT
                 SET  W9128-DBCS-UNMATCH-SOSI  TO  TRUE
              ELSE
      *
      *  CHECK SECOND CHARACTER
      *
                 COMPUTE  K =  I + 1
                 IF W9128-INPUT-FIELD-X (K)  =  WMBCS-SHIFT-IN
                                            OR  WMBCS-SHIFT-OUT
                    SET  W9128-DBCS-UNMATCH-SOSI  TO  TRUE
                 ELSE
                    MOVE W9128-INPUT-FIELD (I:2)
                                    TO  W9128-OUTPUT-FIELD-X (J)
                    ADD   2         TO  I
                    ADD   1         TO  J
                    ADD   1         TO  W9128-DBCS-CHARS-IN-SOSI
                 END-IF
              END-IF
              
           END-PERFORM.
 
       2100-MOVE-DBCS-X.
           EXIT.
      /
      *---------------------
       3000-CHECK-VALID-CHAR.
      *---------------------
      *
      * DO A TABLE LOOKUP ON THE SBCS ALPHABET.
      *
           MOVE SPACES                   TO W9128-DBCS-TO-CHAR.
           MOVE 'N'                      TO W9128-MATCH-IND.
 
           PERFORM  3100-SCAN-PC-CONV-TABLE
               THRU 3100-SCAN-PC-CONV-TABLE-X
               VARYING W9128-SUB FROM 1 BY 1
               UNTIL   W9128-SUB > W9128-CONV-TABLE-SIZE
               OR      W9128-MATCH-FOUND.
 
       3000-CHECK-VALID-CHAR-X.
           EXIT.
      /
      *------------------------
       3100-SCAN-PC-CONV-TABLE.
      *------------------------
 
           IF  W9128-SBCS-FROM-CHAR = W9128-SBCS-LETTER-PC (W9128-SUB)
               MOVE W9128-DBCS-LETTER-PC (W9128-SUB)
                                         TO W9128-DBCS-TO-CHAR
               MOVE 'Y'                  TO W9128-MATCH-IND
           END-IF.
 
       3100-SCAN-PC-CONV-TABLE-X.
           EXIT.
 
      *****************************************************************
      ** PARAGRAPH TO CHECK FOR CHARACTER SET                        **
      *****************************************************************
      /
       COPY XCPPMBCS.
      *****************************************************************
      **                 END OF PROGRAM XSDU9128                     **
      *****************************************************************
