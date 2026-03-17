      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDUDBCV.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDUDBCV                                         **
      **  REMARKS:  COMPARE MBCS FIELDS.                             **
      **            THIS MODULE CONVERTS A MIXED CHARACTER STRING TO **
      **            DOUBLE BYTE CHARACTER STRING.                    **
      **                                                             **
      **  DOMAIN :  CL                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
MP265B**  16JAN15  CTS    CREATED FOR SINGLE->DOUBLE BYTE CONVERSION **
R14652**  13MAR18  CTS    ADDED CHARACTERS FOR CONVERSION            **
R14652**                   (ONLY FOR TAX PAYMENT REPORTS)            **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDUDBCV'.
 
       COPY XCWWMBCS.

      *****************************************************************
      *  SBCS ALPHABET TO DBCS ALPHABET CONVERSION TABLE              *
      *****************************************************************
       COPY XCWWDBCV.
 
       01  WS-WORK-FIELDS.
           10 WDBCV-INPUT-FIELD.
              15 WDBCV-INPUT-FIELD-X         PIC X(01) OCCURS 200 TIMES.
              
           10 WDBCV-OUTPUT-FIELD.
              15 WDBCV-OUTPUT-FIELD-X        PIC X(01) OCCURS 200 TIMES.  

           10 WDBCV-OUT-FIELD-LEN            PIC S9(03) VALUE ZERO.  
           10 WDBCV-DBCS-CHARS-IN-SOSI       PIC S9(03) VALUE ZERO.
           10 I                              PIC S9(04) VALUE ZERO.
           10 J                              PIC S9(04) VALUE ZERO.
           10 WDBCV-DB-SPACE   VALUE X'8140' PIC X(02).           
           10 K                              PIC S9(04) VALUE ZERO.
           10 WDBCV-PREV-SOSI                PIC X(01)  VALUE SPACES.
           10 WDBCV-FIELD-OUTPUT-LEN         PIC S9(03) VALUE ZERO.
           
           10 WDBCV-DBCS-CONVERT-RETRN-CD    PIC S9(04) COMP.
               88  WDBCV-DBCS-CONVERT-OK                VALUE 00.
               88  WDBCV-DBCS-CHAR-SPACE                VALUE 90.               
               88  WDBCV-DBCS-UNMATCH-SOSI              VALUE 91.
               88  WDBCV-DBCS-CHAR-INVALID              VALUE 92.
               88  WDBCV-DBCS-CHAR-END                  VALUE 93.
               
           10 WDBCV-CS-PREV-SPACE-CHK        PIC X(01).
               88  WDBCV-CS-PREV-SPACE                  VALUE 'Y'.
               88  WDBCV-CS-PREV-SPACE-NO               VALUE 'N'.

      /
      *****************
       LINKAGE SECTION.
      *****************
 
       COPY XCWLDBCV.
      /
       PROCEDURE DIVISION USING LDBCV-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.
 
           IF  LDBCV-RQST-CONVERT-DBCS
               PERFORM  2000-CONVERT-TO-DBCS 
                   THRU 2000-CONVERT-TO-DBCS-X              
           END-IF.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           INITIALIZE LDBCV-OUTPUT-PARM-INFO.
           SET LDBCV-RETRN-OK               TO TRUE.

           PERFORM  MBCS-0000-INIT
               THRU MBCS-0000-INIT-X.
      *
      *--INITIALIZE WORK FIELDS AND VALIDATE INPUT PARAMETERS.
      *
           MOVE SPACES                      TO WDBCV-OUTPUT-FIELD
                                               WDBCV-INPUT-FIELD.
           MOVE LDBCV-FIELD-INPUT           TO WDBCV-INPUT-FIELD.
           MOVE LENGTH OF LDBCV-FIELD-OUTPUT 
                                            TO WDBCV-FIELD-OUTPUT-LEN

           MOVE SPACES                      TO WDBCV-OUTPUT-FIELD.          
 
       1000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       2000-CONVERT-TO-DBCS.
      *---------------------
 
           IF  LDBCV-OUT-FIELD-LEN > ZERO
               CONTINUE 
           ELSE
               GO TO 2000-CONVERT-TO-DBCS-X
           END-IF. 
           
           COMPUTE WDBCV-OUT-FIELD-LEN      = LDBCV-OUT-FIELD-LEN.
 
           SET WDBCV-CS-PREV-SPACE-NO       TO TRUE.           
           MOVE  1                          TO  I.
           MOVE  1                          TO  J.
           MOVE  SPACES                     TO  WDBCV-PREV-SOSI.           
 
           PERFORM  2100-CHK-AND-CONVERT
               THRU 2100-CHK-AND-CONVERT-X
               UNTIL I  >  LDBCV-OUT-FIELD-LEN
               OR    J  >  WDBCV-OUT-FIELD-LEN.

           MOVE WDBCV-OUTPUT-FIELD          TO LDBCV-FIELD-OUTPUT.
 
       2000-CONVERT-TO-DBCS-X.
           EXIT.
      /
      *---------------------
       2100-CHK-AND-CONVERT.
      *---------------------

           SET WDBCV-DBCS-CONVERT-OK        TO TRUE.                
      *
      *    CHECK WHETHER THE NEXT BYTE IS SOSI, DBCS or SBCS
      *
           MOVE WDBCV-INPUT-FIELD-X (I)     TO  WMBCS-CS-CHARACTER.
           
           PERFORM  MBCS-1000-CHECK
               THRU MBCS-1000-CHECK-X.
               
           EVALUATE TRUE
 
           WHEN WMBCS-CS-IS-DBCS
              
              IF (I + 1 ) > LDBCV-OUT-FIELD-LEN
                 SET  WDBCV-DBCS-CHAR-END   TO  TRUE
              ELSE
                 MOVE WDBCV-INPUT-FIELD (I:2)
                                    TO  WDBCV-OUTPUT-FIELD (J:2)
                 ADD   2            TO  J
              END-IF
              ADD   2               TO  I              
 
           WHEN WMBCS-CS-IS-SBCS
           WHEN WMBCS-CS-IS-SPACE
              
              MOVE WDBCV-INPUT-FIELD-X (I)
                                    TO  WDBCV-SBCS-FROM-CHAR
              ADD   1               TO  I              
              PERFORM  3000-CHECK-VALID-CHAR
                  THRU 3000-CHECK-VALID-CHAR-X
 
              IF WDBCV-MATCH-FOUND
                 MOVE WDBCV-DBCS-TO-CHAR
                                    TO  WDBCV-OUTPUT-FIELD (J:2)
                 ADD   2            TO  J                                    
              ELSE
                 SET WDBCV-DBCS-CHAR-INVALID TO  TRUE
              END-IF
 
                                         
          WHEN WMBCS-CS-IS-SHIFT-IN
             
              ADD  1                        TO  I
              IF  WDBCV-PREV-SOSI = WMBCS-SHIFT-OUT
                  MOVE  WMBCS-SHIFT-IN          TO  WDBCV-PREV-SOSI
              ELSE
                  SET   WDBCV-DBCS-UNMATCH-SOSI TO  TRUE
              END-IF
 
           WHEN WMBCS-CS-IS-SHIFT-OUT
              
              ADD  1                        TO  I
              IF  WDBCV-PREV-SOSI = WMBCS-SHIFT-OUT
                  SET  WDBCV-DBCS-UNMATCH-SOSI  TO  TRUE
              ELSE
                  MOVE  WMBCS-SHIFT-OUT         TO  WDBCV-PREV-SOSI
                  PERFORM  2100-MOVE-DBCS
                      THRU 2100-MOVE-DBCS-X
                  IF  WDBCV-DBCS-CHARS-IN-SOSI NOT > ZERO
                      SET  WDBCV-DBCS-CHAR-INVALID  TO  TRUE
                  END-IF
              END-IF
 
           WHEN  OTHER

              ADD  1                        TO  I              
              SET  WDBCV-DBCS-CHAR-INVALID  TO  TRUE
 
           END-EVALUATE.
 
           IF  WDBCV-DBCS-CHAR-END
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
           MOVE  0  TO  WDBCV-DBCS-CHARS-IN-SOSI.
           PERFORM
             UNTIL I > LDBCV-OUT-FIELD-LEN
             OR    J > WDBCV-OUT-FIELD-LEN             
             OR    NOT WDBCV-DBCS-CONVERT-OK
      *
      * CHECK WHETHER THE NEXT BYTE IS SOSI, DBCS or SBCS
      *
      * IF NEXT CHARACTER IS SHIFT-IN, SET PREVIOUS SHIFT-IN
      * CHARACTER AND EXIT
      *
              IF WDBCV-INPUT-FIELD-X (I) =  WMBCS-SHIFT-IN
                 MOVE  WMBCS-SHIFT-IN      TO  WDBCV-PREV-SOSI
                 GO TO 2100-MOVE-DBCS-X
              END-IF
      *
      *  CHECK FIRST CHARACTER
      *
              IF WDBCV-INPUT-FIELD-X (I) = WMBCS-SHIFT-OUT
                 SET  WDBCV-DBCS-UNMATCH-SOSI  TO  TRUE
              ELSE
      *
      *  CHECK SECOND CHARACTER
      *
                 COMPUTE  K =  I + 1
                 IF WDBCV-INPUT-FIELD-X (K)  =  WMBCS-SHIFT-IN
                                            OR  WMBCS-SHIFT-OUT
                    SET  WDBCV-DBCS-UNMATCH-SOSI  TO  TRUE
                 ELSE
                    MOVE WDBCV-INPUT-FIELD (I:2)
                                    TO  WDBCV-OUTPUT-FIELD-X (J)
                    ADD   2         TO  I
                    ADD   1         TO  J
                    ADD   1         TO  WDBCV-DBCS-CHARS-IN-SOSI
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
           MOVE SPACES                   TO WDBCV-DBCS-TO-CHAR.
           MOVE 'N'                      TO WDBCV-MATCH-IND.
 
           PERFORM  3100-SCAN-PC-CONV-TABLE
               THRU 3100-SCAN-PC-CONV-TABLE-X
               VARYING WDBCV-SUB FROM 1 BY 1
               UNTIL   WDBCV-SUB > WDBCV-CONV-TABLE-SIZE
               OR      WDBCV-MATCH-FOUND.
R14652*   THESE CHARACTERS TO BE CONVERTED ONLY FOR TAX PAYMENT
R14652     IF  NOT WDBCV-MATCH-FOUND 
R14652     AND LDBCV-ADDL-CHAR-CNVR-YES    
R14652         PERFORM  3200-SCAN-PC-ADDL-TABLE
R14652             THRU 3200-SCAN-PC-ADDL-TABLE-X
R14652         VARYING WDBCV-SUB FROM 1 BY 1
R14652         UNTIL   WDBCV-SUB > WDBCV-ADDL-TABLE-SIZE
R14652         OR      WDBCV-MATCH-FOUND
R14652            
R14652     END-IF.
               
 
       3000-CHECK-VALID-CHAR-X.
           EXIT.
      /
      *------------------------
       3100-SCAN-PC-CONV-TABLE.
      *------------------------
 
           IF  WDBCV-SBCS-FROM-CHAR = WDBCV-SBCS-LETTER-PC (WDBCV-SUB)
               MOVE WDBCV-DBCS-LETTER-PC (WDBCV-SUB)
                                         TO WDBCV-DBCS-TO-CHAR
               MOVE 'Y'                  TO WDBCV-MATCH-IND
           END-IF.
 
       3100-SCAN-PC-CONV-TABLE-X.
           EXIT.
           
      /
R14652*------------------------
R14652 3200-SCAN-PC-ADDL-TABLE.
R14652*------------------------
R14652
R14652     IF  WDBCV-SBCS-FROM-CHAR = 
R14652                   WDBCV-SBCS-ADDL-LETTER-PC (WDBCV-SUB)
R14652         MOVE WDBCV-DBCS-ADDL-LETTER-PC (WDBCV-SUB)
R14652                                      TO WDBCV-DBCS-TO-CHAR
R14652         MOVE 'Y'                     TO WDBCV-MATCH-IND
R14652      END-IF.
R14652
R14652  3200-SCAN-PC-ADDL-TABLE-X.
R14652      EXIT.
           
 
      *****************************************************************
      ** PARAGRAPH TO CHECK FOR CHARACTER SET                        **
      *****************************************************************
      /
       COPY XCPPMBCS.
      *****************************************************************
      **                 END OF PROGRAM XSDUDBCV                     **
      *****************************************************************