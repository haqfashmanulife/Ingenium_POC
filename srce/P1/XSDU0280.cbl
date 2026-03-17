      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDU0280.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDU0280                                         **
      **  REMARKS:  NUMERIC EDIT AND CONVERSION PROGRAM.             **
      **  THIS PROGRAM EDITS AND CONVERTS A NUMERIC DATA FIELD       **
      **  CONTAINED IN A CHAR STRING.  IF THE EDITS SUCCEED, THE     **
      **  NUMERIC VALUE IS AVAILABLE IN PACKED DECIMAL FORMAT        **
      **  (COMP-3).                                                  **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *
      *   INPUT FIELDS:
      *       L0280-INPUT-DATA    THE USERS INPUT FIELD.
      *       L0280-SIGN-IND      WHETHER THE INPUT FIELD IS
      *                           PERMITTED TO BE SIGNED OR NOT.
      *       L0280-LENGTH        THE NUMBER OF DIGITS BEFORE THE
      *                           DECIMAL PLACE.
      *       L0280-PRECISION     THE NUMBER OF DECIMAL PLACES IN THE
      *                           OUTPUT FIELD.
      *       L0280-SPACES-PERMITTED-IND
      *                           WHETHER THE INPUT DATA MUST BE
      *                           A COMPLETELY ENTERED NUMERIC FIELD.
      *                           COMPRESSION IS NOT ALLOWED.
      *   OUTPUT FIELDS:
      *       L0280-STATUS        THE STATUS OF THE EDIT AND
      *                           CONVERSION PROCESS.
      *       L0280-OUTPUT-DATA   THE CONVERTED OUTPUT (IF STATUS OK)
      *                           STORED AS A CHARACTER STRING.
      *
      *   USING THE OUTPUT:
      *       THE OUTPUT DATA FIELD "L0280-OUTPUT-DATA" IS A CHARACTER
      *       STRING WHICH IS A REDEFINITION OF A PACKED FIELD WITH THE
      *       CORRECT NUMBER OF DIGITS BEFORE AND AFTER THE DECIMAL
      *       POINT.  IF THIS FIELD IS COPIED TO A CHARACTER FIELD OF
      *       THE APPROPRIATE LENGTH, AND THEN ACCESSED AS A PACKED
      *       FIELD WITH THE CORRECT PICTURE, THE CORRECT DATA VALUE
      *       WILL BE RETRIEVED.
      *
      *       THE FIELD "L0280-OUTPUT" WILL GIVE THE CORRECT RESULTS
      *       FOR A DATA FIELD WITH NO DECIMAL PLACES.
      *       THE FIELD "L0280-OUTPUT-DOLLAR" WILL GIVE THE CORRECT
      *       RESULTS FOR A DATA FIELD WITH TWO (2) DECIMAL PLACES.
      *       THE FIELD "L0280-OUTPUT-PCNT" WILL GIVE THE CORRECT
      *       RESULTS FOR A DATA FIELD WITH THREE (3) DECIMAL PLACES.
      *
      *   IMPLEMENTATION NOTES:
      *       THE LOGIC OF THIS ROUTINE DEPENDS UPON THE FACT THAT A
      *       PACKED NUMERIC FIELD HAS AN IMPLIED DECIMAL POINT.
      *       INTERNALLY, THIS ROUTINE DOES ALL WORK WITH A
      *       PIC S9(18) COMP-3 FIELD AND ALLOWS FOR THE IMPLIED
      *       DECIMAL POINT BY MULTIPLYING THE TRUE FIELD VALUE
      *       BY 10 FOR EACH DECIMAL PLACE.
      *
      *       NOTE THAT 18 DIGITS IS THE MAXIMUM PERMISSIBLE SIZE OF A
      *       NUMERIC FIELD (WITH IBM COBOL I), AND AS SUCH, THIS
      *       ROUTINE SHOULD BE CAPABLE OF HANDLING ANY LEGAL NUMERIC
      *       CONVERSION.
      *
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  10MAR89  EWD    INITIAL DESIGN                             **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
54-001**  01SEP96  GLG    MODIFICATIONS FOR MAINTAINABILITY,         **
54-001**                  ADDITIONAL CHECK ADDED WHEN SKIPPING       **
54-001**                  TRAILING SPACES FOR FIELDS 20 BYTES LONG   **
557663**  30SEP97  REC    IMPROVE GENERATION OF CLIENT DRIVER/WORKER **
008455**  31MAR98  552    EXTENSIVE NUMERIC FORMATTING               **
015543**  15DEC99  60     CODE CLEANUP                               **
017150**  09FEB01  612J   CURRENCY SCALING                           **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0280'.
 
       01  WS-CONTROL-FIELDS.
           05  WS-LEN-PREC-MAX    PIC 9(02)  VALUE 18.
           05  WS-LEN-PREC-MIN    PIC 9(02)  VALUE 01.
      /
 
      *****************
       LINKAGE SECTION.
      *****************
 
       COPY XCWL0280.
      /
 
       PROCEDURE DIVISION USING L0280-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET L0280-RETRN-OK TO TRUE.
 
           EVALUATE TRUE
 
               WHEN L0280-RQST-NUMERIC-EDIT
                    PERFORM  1000-NUMERIC-EDIT
                        THRU 1000-NUMERIC-EDIT-X
 
017150         WHEN L0280-RQST-CRCY-EDIT
017150              PERFORM  2000-CRCY-EDIT
017150                  THRU 2000-CRCY-EDIT-X
 
               WHEN OTHER
                    SET L0280-RETRN-INVALID-REQUEST TO TRUE
 
           END-EVALUATE.
 
       0000-MAINLINE-X.
           GOBACK.
      /
 
      *------------------
       1000-NUMERIC-EDIT.
      *------------------
 
      *
      *   *** INITIALIZE WORK FIELDS
      *
           SET L0280-IN-IDX TO 1.
           SET L0280-OK     TO TRUE.
           MOVE ZERO        TO L0280-NEGATIVE-IND.
           MOVE ZERO        TO L0280-OUTPUT.
           MOVE ZERO        TO L0280-POINT-SUB.
           MOVE ZERO        TO L0280-HOLD-SUB.
           MOVE ZERO        TO L0280-SUB.
 
      *
      *    *** CHECK FOR EMPTY INPUT FIELD.
      *
           IF  (L0280-INPUT-DATA = SPACES)
           OR  (L0280-INPUT-DATA = LOW-VALUES)
               SET L0280-BLANK-FIELD       TO TRUE
               GO TO 1000-NUMERIC-EDIT-X
           END-IF.
 
      *
      *    *** CHECK ARGUMENTS.
      *
           IF  (L0280-LENGTH + L0280-PRECISION > WS-LEN-PREC-MAX)
           OR  (L0280-LENGTH + L0280-PRECISION < WS-LEN-PREC-MIN)
               SET L0280-ARGS-INVALID      TO TRUE
               GO TO 1000-NUMERIC-EDIT-X
           END-IF.
 
      *
      *    *** CHECK FOR INVALID SPACES (REQUESTED SPACES INVALID CHECK)
      *
           IF L0280-NO-SPACES-ALLOWED
               PERFORM
                   VARYING L0280-SUB FROM 1 BY 1
                   UNTIL   L0280-SUB > L0280-INPUT-SIZE
                   OR      L0280-IN-SPACE (L0280-SUB)
015543             CONTINUE
               END-PERFORM
 
               IF L0280-SUB > L0280-INPUT-SIZE
                  CONTINUE
               ELSE
                  SET L0280-INVALID-BLANKS TO TRUE
                  GO TO 1000-NUMERIC-EDIT-X
               END-IF
           END-IF.
 
      *
      *    *** SKIP LEADING SPACES
      *
           SET L0280-HOLD-SUB              TO L0280-IN-IDX.
           IF  L0280-IN-SPACE (L0280-IN-IDX)
               PERFORM
                   VARYING L0280-IN-IDX FROM L0280-HOLD-SUB BY 1
                   UNTIL   L0280-IN-IDX > L0280-INPUT-SIZE
                   OR NOT  L0280-IN-SPACE (L0280-IN-IDX)
015543             CONTINUE
               END-PERFORM
           END-IF.
 
      *
      *    *** CHECK FOR EMPTY INPUT FIELD.
      *
           IF  L0280-IN-IDX > L0280-INPUT-SIZE
               SET L0280-BLANK-FIELD       TO TRUE
               GO TO 1000-NUMERIC-EDIT-X
           END-IF.
 
      *
      *    *** CHECK FOR SIGN.
      *
 
           EVALUATE TRUE
               WHEN L0280-IN-NEGATIVE (L0280-IN-IDX)
                    IF  L0280-SIGN-PERMITTED
                        SET L0280-NEGATIVE-DATA TO TRUE
                        SET L0280-IN-IDX UP BY 1
                    ELSE
                        SET L0280-SIGN-INVALID  TO TRUE
                        MOVE ZERO               TO L0280-OUTPUT
                        GO TO 1000-NUMERIC-EDIT-X
                    END-IF
 
               WHEN L0280-IN-POSITIVE (L0280-IN-IDX)
                    IF  L0280-SIGN-PERMITTED
557663****              MOVE ZERO               TO L0280-NEGATIVE-IND
557663                  SET L0280-POSITIVE-DATA TO TRUE
                        SET L0280-IN-IDX UP BY 1
                    ELSE
                        SET L0280-SIGN-INVALID  TO TRUE
                        MOVE ZERO               TO L0280-OUTPUT
                        GO TO 1000-NUMERIC-EDIT-X
                    END-IF
           END-EVALUATE.
 
      *
      *    *** CHECK FOR FIRST DIGIT.
      *
008455*    IF NOT L0280-IN-NUMERIC (L0280-IN-IDX)
008455     IF (NOT L0280-IN-NUMERIC   (L0280-IN-IDX)
008455         AND NOT L0280-IN-POINT (L0280-IN-IDX) )
               SET  L0280-EDIT-INVALID TO TRUE
               MOVE ZERO               TO L0280-OUTPUT
               GO TO 1000-NUMERIC-EDIT-X
           END-IF.
 
      *
      *    *** PROCESS NUMBER.
      *
           SET L0280-HOLD-SUB          TO L0280-IN-IDX.
017150*    PERFORM  2000-PROCESS-IN-CHAR
017150*        THRU 2000-PROCESS-IN-CHAR-X
017150     PERFORM  1500-PROCESS-IN-CHAR
017150         THRU 1500-PROCESS-IN-CHAR-X
               VARYING L0280-IN-IDX FROM L0280-HOLD-SUB BY 1
               UNTIL L0280-IN-IDX > L0280-INPUT-SIZE
008455*        OR NOT L0280-IN-NUMERIC (L0280-IN-IDX)
008455         OR (    NOT L0280-IN-NUMERIC (L0280-IN-IDX)
008455             AND NOT L0280-IN-POINT   (L0280-IN-IDX) )
               OR NOT L0280-OK.
 
      *
      *    *** CHECK FOR MULTIPLE DECIMAL POINTS
      *
           IF NOT L0280-OK
               MOVE ZERO               TO L0280-OUTPUT
               GO TO 1000-NUMERIC-EDIT-X
           END-IF.
 
      *
      *    *** SAVE POSITION OF FIRST INVALID CHAR
      *
           SET L0280-LAST-SUB          TO L0280-IN-IDX.
 
557663*
557663*    *** CHECK FOR SIGN ON THE RIGHT OF THE NUMBER
557663*
557663
557663     EVALUATE TRUE
557663
557663         WHEN L0280-IN-NEGATIVE (L0280-IN-IDX)
557663              IF  NOT L0280-SIGN-PERMITTED
557663              OR  L0280-NEGATIVE-DATA
557663              OR  L0280-POSITIVE-DATA
557663                  SET L0280-SIGN-INVALID  TO TRUE
557663                  MOVE ZERO               TO L0280-OUTPUT
557663                  GO TO 1000-NUMERIC-EDIT-X
557663              END-IF
557663
557663              SET L0280-NEGATIVE-DATA TO TRUE
557663              SET L0280-IN-IDX UP BY 1
557663
557663         WHEN L0280-IN-POSITIVE (L0280-IN-IDX)
557663              IF  NOT L0280-SIGN-PERMITTED
557663              OR  L0280-NEGATIVE-DATA
557663              OR  L0280-POSITIVE-DATA
557663                  SET L0280-SIGN-INVALID  TO TRUE
557663                  MOVE ZERO               TO L0280-OUTPUT
557663                  GO TO 1000-NUMERIC-EDIT-X
557663              END-IF
557663
557663              SET L0280-POSITIVE-DATA TO TRUE
557663              SET L0280-IN-IDX UP BY 1
557663
557663     END-EVALUATE.
557663
      *
      *    *** APPLY SIGN
      *
           IF L0280-NEGATIVE-DATA
               IF L0280-SIGN-PERMITTED
                   MULTIPLY -1 BY L0280-OUTPUT
               ELSE
                   SET L0280-SIGN-INVALID TO TRUE
                   MOVE ZERO              TO L0280-OUTPUT
                   GO TO 1000-NUMERIC-EDIT-X
               END-IF
           END-IF.
 
      *
      *    *** SKIP TRAILING SPACES
      *
           SET L0280-HOLD-SUB             TO L0280-IN-IDX.
           IF  L0280-IN-IDX < L0280-INPUT-SIZE
           OR  L0280-IN-IDX = L0280-INPUT-SIZE
               IF L0280-IN-SPACE (L0280-IN-IDX)
                   PERFORM
                       VARYING L0280-IN-IDX FROM L0280-HOLD-SUB BY 1
                       UNTIL   L0280-IN-IDX > L0280-INPUT-SIZE
                       OR NOT  L0280-IN-SPACE (L0280-IN-IDX)
015543                 CONTINUE
                   END-PERFORM
               END-IF
           END-IF.
 
      *
      *    *** INSIST ON END-OF-FIELD
      *
           IF L0280-IN-IDX <= L0280-INPUT-SIZE
               SET L0280-EDIT-INVALID     TO TRUE
               MOVE ZERO                  TO L0280-OUTPUT
               GO TO 1000-NUMERIC-EDIT-X
           END-IF.
 
      *
      *    *** COMPUTE NUMBER OF DECIMAL PLACES
      *
           IF L0280-POINT-SUB = ZERO
               MOVE ZERO                  TO L0280-PLACES
           ELSE
               COMPUTE L0280-PLACES =
                   L0280-LAST-SUB - L0280-POINT-SUB - 1
           END-IF.
 
      *
      *    *** CHECK DECIMAL PLACES
      *
           IF L0280-PLACES > L0280-PRECISION
008455*        SET L0280-TOO-MANY-PLACES  TO TRUE
008455*        MOVE ZERO                  TO L0280-OUTPUT
008455         IF  L0280-INPUT-DATA
008455                 ((L0280-POINT-SUB + L0280-PRECISION + 1) :
008455                  (L0280-PLACES - L0280-PRECISION))
008455                 = ALL ZEROS
008455             COMPUTE L0280-OUTPUT = L0280-OUTPUT /
008455                     (10 ** (L0280-PLACES - L0280-PRECISION))
008455         ELSE
                   SET  L0280-TOO-MANY-PLACES  TO TRUE
                   MOVE ZERO                   TO L0280-OUTPUT
008455         END-IF
           ELSE
               IF L0280-PLACES < L0280-PRECISION
                  COMPUTE L0280-OUTPUT = L0280-OUTPUT *
                       (10 ** (L0280-PRECISION - L0280-PLACES))
               END-IF
           END-IF.
 
      *
      *    *** CHECK LENGTH.
      *
           IF (L0280-LENGTH + L0280-PRECISION = WS-LEN-PREC-MAX)
               MOVE +999999999999999999   TO L0280-MAX-VALUE
           ELSE
               COMPUTE L0280-MAX-VALUE =
                       10 ** (L0280-LENGTH + L0280-PRECISION) - 1
           END-IF.
 
           IF L0280-OUTPUT > L0280-MAX-VALUE
               SET L0280-TOO-LONG         TO TRUE
           END-IF.
 
           IF  L0280-NEGATIVE-DATA
           AND ((L0280-OUTPUT * -1) > L0280-MAX-VALUE)
               SET L0280-TOO-LONG         TO TRUE
           END-IF.
 
       1000-NUMERIC-EDIT-X.
           EXIT.
      /
 
      ****************************************************************
      * PROCESS INPUT CHARACTER.
      * THIS ROUTINE CHECKS FOR THE DECIMAL POINT, NOTING ITS POSITION
      * EACH NUMERIC CHARACTER IS PROCESSED BY MULTIPLYING THE EXISTING
      * DATA VALUE BY 10 AND ADDING THE NUMERIC CHARACTER.
      ****************************************************************
      *---------------------
017150*2000-PROCESS-IN-CHAR.
017150 1500-PROCESS-IN-CHAR.
      *---------------------
 
           IF L0280-IN-POINT (L0280-IN-IDX)
               IF L0280-POINT-SUB NOT = ZERO
                   SET  L0280-EDIT-INVALID TO TRUE
               ELSE
                   SET L0280-POINT-SUB     TO L0280-IN-IDX
               END-IF
           ELSE
               COMPUTE L0280-OUTPUT =
                       L0280-OUTPUT * 10 + L0280-IN-NUM (L0280-IN-IDX)
           END-IF.
 
017150*2000-PROCESS-IN-CHAR-X.
017150 1500-PROCESS-IN-CHAR-X.
           EXIT.
017150/
017150
017150****************************************************************
017150* CURRENCY EDIT.
017150* THIS ROUTINE PERFORMS THE NORMAL NUMERIC EDIT, AND THEN ENSURES
017150* THAT THE DECIMALS FOLLOWING THE CURRENCY NUMBER OF DECIMALS IS
017150* ALL ZEROES.
017150****************************************************************
017150*---------------
017150 2000-CRCY-EDIT.
017150*---------------
017150
017150     PERFORM  1000-NUMERIC-EDIT
017150         THRU 1000-NUMERIC-EDIT-X.
017150
017150     IF NOT L0280-OK
017150         GO TO 2000-CRCY-EDIT-X
017150     END-IF.
017150
017150     IF L0280-PLACES NOT > L0280-CRCY-SCALE-QTY
017150         GO TO 2000-CRCY-EDIT-X
017150     END-IF.
017150
017150     IF  L0280-INPUT-DATA
017150             ((L0280-POINT-SUB + L0280-CRCY-SCALE-QTY + 1) :
017150              (L0280-PLACES - L0280-CRCY-SCALE-QTY))
017150             = ALL ZEROS
017150         CONTINUE
017150     ELSE
017150         SET  L0280-TOO-MANY-PLACES  TO TRUE
017150         MOVE ZERO                   TO L0280-OUTPUT
017150     END-IF.
017150
017150 2000-CRCY-EDIT-X.
017150     EXIT.
 
      *****************************************************************
      **                 END OF PROGRAM XSDU0280                     **
      *****************************************************************
