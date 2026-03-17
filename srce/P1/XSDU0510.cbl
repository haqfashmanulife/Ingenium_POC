      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDU0510.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDU0510                                         **
      **  REMARKS:  COMPARE MBCS FIELDS.                             **
      **            THIS MODULE COMPARES TWO FIELDS WHICH CONTAIN    **
      **            EITHER SINGLE BYTE CHARACTERS, MBCS CHARACTERS   **
      **            OR PURE DBCS CHARACTERS.                         **
      **            L0510-FIELD-LEN CONTAINS THE PHYSICAL NUMBER OF  **
      **            BYTE TO COMPARE.                                 **
      **                                                             **
      **            NOTE THAT THE LOGICAL SIZE OF FIELD A AND B MAY  **
      **            BE DIFFERENT.                                    **
      **                                                             **
      **  DOMAIN :  CL                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
009160**  31MAR98  552    CREATED FOR MBCS FIELDS COMPARISON         **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      **********************
       CONFIGURATION SECTION.
      **********************
      *
      * SPECIAL NAME WITH CLASS DEFINITION
      *
       COPY XCWWCSNM.
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0510'.
 
       COPY XCWWMBCS.
 
      *****************************************************************
      *  SBCS ALPHABET TO DBCS ALPHABET CONVERSION TABLE              *
      *****************************************************************
       COPY XCWW0510.
 
       01  WS-WORK-FIELDS.
           10 W0510-DBCS-CONV-FROM.
              15 W0510-DBCS-CONV-FROM-X    PIC X(01) OCCURS 100 TIMES.
 
           10 W0510-DBCS-CONV-TO.
              15 W0510-DBCS-CONV-TO-X      PIC X(02) OCCURS 100 TIMES.
 
           10 W0510-DBCS-FIELD-A.
              15 W0510-DBCS-FIELD-A-X      PIC X(02) OCCURS 100 TIMES.
 
           10 W0510-DBCS-FIELD-B.
              15 W0510-DBCS-FIELD-B-X      PIC X(02) OCCURS 100 TIMES.
 
           10 W0510-PREV-SOSI              PIC X(01)  VALUE SPACES.
           10 W0510-DBCS-FIELD-LEN         PIC S9(03) VALUE ZERO.
           10 W0510-DBCS-CHARS-IN-SOSI     PIC S9(03) VALUE ZERO.
           10 I                            PIC S9(03) VALUE ZERO.
           10 J                            PIC S9(03) VALUE ZERO.
           10 K                            PIC S9(03) VALUE ZERO.
           10 W0510-DBCS-FIELD-A-SIZE      PIC S9(03) VALUE ZERO.
           10 W0510-DBCS-FIELD-B-SIZE      PIC S9(03) VALUE ZERO.
           10 W0510-DBCS-COMPARE-SIZE      PIC S9(03) VALUE ZERO.
           10 W0510-DBCS-CONVERT-RETRN-CD  PIC S9(04) COMP.
               88  W0510-DBCS-CONVERT-OK              VALUE 0.
               88  W0510-DBCS-UNMATCH-SOSI            VALUE 91.
               88  W0510-DBCS-INVALID-CHAR            VALUE 92.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       COPY XCWL0510.
      /
       PROCEDURE DIVISION USING L0510-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.
 
           IF L0510-RETRN-OK
              EVALUATE TRUE
 
                 WHEN L0510-RQST-COMPARE-MBCS
                    PERFORM  2000-COMPARE-MBCS
                        THRU 2000-COMPARE-MBCS-X
 
                 WHEN OTHER
                    SET L0510-RETRN-INVALID-REQUEST TO TRUE
 
              END-EVALUATE
           END-IF.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *----------------
       1000-INITIALIZE.
      *----------------
      *
      *-- CHECK WHETHER IT'S UNDER MAINFRAME OR PC ENVIRONMENT
      *
           PERFORM  MBCS-0000-INIT
               THRU MBCS-0000-INIT-X.
      *
      *--INITIALIZE WORK FIELDS AND VALIDATE INPUT PARAMETERS.
      *
           INITIALIZE L0510-OUTPUT-PARM-INFO.
           MOVE SPACES  TO  W0510-DBCS-CONV-TO
                            W0510-DBCS-FIELD-A
                            W0510-DBCS-FIELD-B.
 
           MOVE LENGTH OF W0510-DBCS-CONV-TO  TO W0510-DBCS-FIELD-LEN.
 
      *
      *--IF L0510-FIELD-LEN IS NOT INITIALIZED , RETRUN WITH ERROR CODE
      *
           IF  L0510-FIELD-LEN  IS NOT NUMERIC
               SET L0510-RETRN-LENGTH-ERR     TO TRUE
               GO TO  1000-INITIALIZE-X
           ELSE
               SET L0510-RETRN-OK             TO TRUE
           END-IF.
 
      *
      *--IF LENGTH IN INPUT PARAMETER IS LARGER THAN THE SIZE OF FILED
      *--A , RETURN WITH ERROR CODE.
      *
           IF  L0510-FIELD-LEN   >  LENGTH OF L0510-FIELD-A
               SET L0510-RETRN-LENGTH-ERR     TO TRUE
           ELSE
               SET L0510-RETRN-OK             TO TRUE
           END-IF.
 
 
       1000-INITIALIZE-X.
           EXIT.
      /
      *------------------
       2000-COMPARE-MBCS.
      *------------------
      *
      *--CONVERT FIELD-A TO PURE DOUBLE BYTE
      *
           MOVE L0510-FIELD-A               TO W0510-DBCS-CONV-FROM.
 
           PERFORM  3000-CONVERT-TO-DBCS
               THRU 3000-CONVERT-TO-DBCS-X.
 
           IF W0510-DBCS-CONVERT-OK
              MOVE W0510-DBCS-CONV-TO       TO W0510-DBCS-FIELD-A
              COMPUTE W0510-DBCS-FIELD-A-SIZE = ( J - 1 ) * 2
           ELSE
              SET  L0510-RETRN-FIELD-A-ERR  TO TRUE
              GO TO  2000-COMPARE-MBCS-X
           END-IF.
      *
      *--CONVERT FIELD-B TO PURE DOUBLE BYTE
      *
           MOVE SPACES                      TO W0510-DBCS-CONV-TO.
           MOVE L0510-FIELD-B               TO W0510-DBCS-CONV-FROM.
 
           PERFORM  3000-CONVERT-TO-DBCS
               THRU 3000-CONVERT-TO-DBCS-X
 
           IF W0510-DBCS-CONVERT-OK
              MOVE W0510-DBCS-CONV-TO       TO W0510-DBCS-FIELD-B
              COMPUTE W0510-DBCS-FIELD-B-SIZE = ( J - 1 ) * 2
           ELSE
              SET  L0510-RETRN-FIELD-B-ERR  TO TRUE
              GO TO  2000-COMPARE-MBCS-X
           END-IF.
      *
      *--DETERMINE THE NUMBER OF BYTES TO COMPARE
      *
           IF W0510-DBCS-FIELD-A-SIZE  >  W0510-DBCS-FIELD-B-SIZE
              MOVE W0510-DBCS-FIELD-A-SIZE  TO W0510-DBCS-COMPARE-SIZE
           ELSE
              MOVE W0510-DBCS-FIELD-B-SIZE  TO W0510-DBCS-COMPARE-SIZE
           END-IF.
      *
      *--COMPARE FIELD A & B IN PURE DBCS FORMAT
      *
           IF W0510-DBCS-FIELD-A  (1:W0510-DBCS-COMPARE-SIZE) =
              W0510-DBCS-FIELD-B  (1:W0510-DBCS-COMPARE-SIZE)
              SET L0510-RETRN-EQUAL         TO  TRUE
           ELSE
              SET L0510-RETRN-NOT-EQUAL     TO  TRUE
           END-IF.
 
       2000-COMPARE-MBCS-X.
           EXIT.
      /
      *---------------------
       3000-CONVERT-TO-DBCS.
      *---------------------
 
           SET   W0510-DBCS-CONVERT-OK   TO  TRUE.
           MOVE  1                       TO  I.
           MOVE  1                       TO  J.
           MOVE  SPACES                  TO  W0510-PREV-SOSI.
 
           PERFORM
               UNTIL I  >  L0510-FIELD-LEN
               OR    J  >  W0510-DBCS-FIELD-LEN
               OR    NOT   W0510-DBCS-CONVERT-OK
      *
      *-CHECK WHETHER THE NEXT BYTE IS SOSI, DBCS or SBCS
      *
           MOVE W0510-DBCS-CONV-FROM-X (I)  TO  WMBCS-CS-CHARACTER
           PERFORM  MBCS-1000-CHECK
               THRU MBCS-1000-CHECK-X
 
           EVALUATE TRUE
 
           WHEN WMBCS-CS-IS-DBCS
              IF (I + 1 ) > L0510-FIELD-LEN
                 SET  W0510-DBCS-INVALID-CHAR   TO  TRUE
              ELSE
                 MOVE W0510-DBCS-CONV-FROM (I:2)
                                    TO  W0510-DBCS-CONV-TO-X (J)
                 ADD   2            TO  I
                 ADD   1            TO  J
              END-IF
 
           WHEN WMBCS-CS-IS-SBCS
      *
      *-IN HOST ENVIORNMENT, THE ENCODING SEQUENCE OF DBCS
      * ALPHABET IS X'42' + THE ENCODING SEQUENCE OF SBCS ALPHABET
      *
              IF WMBCS-HOST
                 MOVE W0510-DBCS-CONV-FROM-X (I)
                                    TO  WMBCS-CONV-TO-NIBBLE2
                 MOVE WMBCS-CONV-TO-CHAR
                                    TO  W0510-DBCS-CONV-TO-X (J)
              ELSE
      *
      *-IN PC ENVIORNMENT, NEED TO DO A TABLE LOOKUP.
      * THE CONVERSION TABLE IS SPECIFIED IN XCWW0510.CPY
      *
                 MOVE W0510-DBCS-CONV-FROM-X (I)
                                    TO  W0510-SBCS-FROM-CHAR
                 PERFORM  4000-CONVERT-TO-DBCS
                     THRU 4000-CONVERT-TO-DBCS-X
 
                 IF W0510-MATCH-FOUND
                    MOVE W0510-DBCS-TO-CHAR
                                    TO  W0510-DBCS-CONV-TO-X (J)
                 ELSE
                    SET W0510-DBCS-INVALID-CHAR TO  TRUE
                 END-IF
 
              END-IF
              ADD  1                TO  J
              ADD  1                TO  I
 
           WHEN WMBCS-CS-IS-SPACE
              MOVE WMBCS-SPACE      TO  W0510-DBCS-CONV-TO-X (J)
              ADD  1                TO  J
              ADD  1                TO  I
 
           WHEN WMBCS-CS-IS-SHIFT-IN
              IF  W0510-PREV-SOSI = WMBCS-SHIFT-OUT
                  MOVE  WMBCS-SHIFT-IN          TO  W0510-PREV-SOSI
              ELSE
                  SET   W0510-DBCS-UNMATCH-SOSI TO  TRUE
              END-IF
              ADD  1                TO  I
 
           WHEN WMBCS-CS-IS-SHIFT-OUT
              ADD  1                            TO  I
              IF  W0510-PREV-SOSI = WMBCS-SHIFT-OUT
                  SET  W0510-DBCS-UNMATCH-SOSI  TO  TRUE
              ELSE
                  MOVE  WMBCS-SHIFT-OUT         TO  W0510-PREV-SOSI
                  PERFORM  3100-MOVE-DBCS
                      THRU 3100-MOVE-DBCS-X
      *
      *  IF THERE IS NOTHING BETWEEN SOSI CHARACTERS => ERROR         .
      *
                  IF  W0510-DBCS-CHARS-IN-SOSI NOT > ZERO
                      SET  W0510-DBCS-INVALID-CHAR  TO  TRUE
                  END-IF
              END-IF
 
           WHEN  OTHER
              SET  W0510-DBCS-INVALID-CHAR          TO  TRUE
 
           END-EVALUATE
 
           END-PERFORM.
 
       3000-CONVERT-TO-DBCS-X.
           EXIT.
      /
      *---------------
       3100-MOVE-DBCS.
      *---------------
      *
      *  DIRECTLY MOVE ALL DOUBLE BYTES CHARACTERS BETWEEN SOSI
      *  CHARACTER WITHOUT CONVERSION.
      *
           MOVE  0  TO  W0510-DBCS-CHARS-IN-SOSI.
           PERFORM
             UNTIL I > L0510-FIELD-LEN
               OR  NOT W0510-DBCS-CONVERT-OK
      *
      * CHECK WHETHER THE NEXT BYTE IS SOSI, DBCS or SBCS
      *
      * IF NEXT CHARACTER IS SHIFT-IN, SET PREVIOUS SHIFT-IN
      * CHARACTER AND EXIT
      *
              IF W0510-DBCS-CONV-FROM-X (I) =  WMBCS-SHIFT-IN
                 MOVE  WMBCS-SHIFT-IN      TO  W0510-PREV-SOSI
                 GO TO 3100-MOVE-DBCS-X
              END-IF
      *
      *  CHECK FIRST CHARACTER
      *
              IF W0510-DBCS-CONV-FROM-X (I) = WMBCS-SHIFT-OUT
                 SET  W0510-DBCS-UNMATCH-SOSI  TO  TRUE
              ELSE
      *
      *  CHECK SECOND CHARACTER
      *
                 COMPUTE  K =  I + 1
                 IF W0510-DBCS-CONV-FROM-X (K)  =  WMBCS-SHIFT-IN
                                               OR  WMBCS-SHIFT-OUT
                    SET  W0510-DBCS-UNMATCH-SOSI  TO  TRUE
                 ELSE
                    MOVE W0510-DBCS-CONV-FROM (I:2)
                                    TO  W0510-DBCS-CONV-TO-X (J)
                    ADD   2         TO  I
                    ADD   1         TO  J
                    ADD   1         TO  W0510-DBCS-CHARS-IN-SOSI
                 END-IF
              END-IF
           END-PERFORM.
 
       3100-MOVE-DBCS-X.
           EXIT.
      /
      *---------------------
       4000-CONVERT-TO-DBCS.
      *---------------------
      *
      * DO A TABLE LOOKUP ON THE SBCS ALPHABET.
      *
           MOVE SPACES                   TO W0510-DBCS-TO-CHAR.
           MOVE 'N'                      TO W0510-MATCH-IND.
 
           PERFORM  4100-SCAN-PC-CONV-TABLE
               THRU 4100-SCAN-PC-CONV-TABLE-X
               VARYING W0510-SUB FROM 1 BY 1
               UNTIL   W0510-SUB > W0510-CONV-TABLE-SIZE
               OR      W0510-MATCH-FOUND.
 
           IF  W0510-MATCH-FOUND
               GO TO 4000-CONVERT-TO-DBCS-X
           END-IF.
 
       4000-CONVERT-TO-DBCS-X.
           EXIT.
      /
      *------------------------
       4100-SCAN-PC-CONV-TABLE.
      *------------------------
 
           IF  W0510-SBCS-FROM-CHAR = W0510-SBCS-LETTER-PC (W0510-SUB)
               MOVE W0510-DBCS-LETTER-PC (W0510-SUB)
                                         TO W0510-DBCS-TO-CHAR
               MOVE 'Y'                  TO W0510-MATCH-IND
           END-IF.
 
       4100-SCAN-PC-CONV-TABLE-X.
           EXIT.
 
      *****************************************************************
      ** PARAGRAPH TO CHECK FOR CHARACTER SET                        **
      *****************************************************************
      /
       COPY XCPPMBCS.
      *****************************************************************
      **                 END OF PROGRAM XSDU0510                     **
      *****************************************************************
