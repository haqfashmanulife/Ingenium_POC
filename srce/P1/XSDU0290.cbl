
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSDU0290.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSDU0290                                         **
      **  REMARKS:  FORMAT A NUMERIC DATA ITEM INTO A STRING FOR     **
      **            DISPLAY ON A DATA ENTRY SCREEN.                  **
      **                                                             **
      **            FOLLOWING THE INPUT RULES SPECIFIED FOR LENGTH,  **
      **            PRECISION AND SIGN, THIS MODULE WILL REFORMAT    **
      **            THE NUMERIC L0290-INPUT-NUMBER INTO CHARACTER    **
      **            FIELD L0290-OUTPUT-DATA.                         **
      **                                                             **
      **            THIS ROUTINE IS NOW ENHANCED TO BE ABLE TO       **
      **            PERFORM EXTENSIVE FORMATTING DEPENDING ON THE    **
      **            INPUT PARAMETERS SET FOR THE CALL.               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      *
      * INPUT PARAMETERS :
      *  L0290-INPUT-NUMBER    THE NUMERIC FIELD TO BE FORMATTED.
      *                        THIS FIELD IS ACTUALLY A CHARACTER FIELD,
      *                        AND THE COMP-3 VALUE TO BE FORMATTED
      *                        SHOULD BE REDEFINED AS A PIC X VALUE AND
      *                        MOVED TO THIS FIELD.
      *  L0290-PRECISION       NUMBER OF DIGITS AFTER THE DECIMAL POINT.
      *  L0290-MAX-OUT-LEN     SIZE OF THE TARGET OUTPUT FIELD; REQUIRED
      *                        FOR JUSTIFICATION IF NECESSARY.
      *  L0290-SIGN-IND        WHETHER THE FIELD IS TO BE FORMATTED
      *                        WITH A SIGN OR NOT AND THE POSITION OF
      *                        THE SIGN. THIS IS THE ONLY FORMATTING
      *                        PARAM. AVAILABLE FOR INTERNAL FORMATTING.
      *  L0290-LEAD-ZEROS-IND  WHETHER THE FIELD IS TO BE FORMATTED
      *                        WITH LEADING ZEROS.  THIS IS ALWAYS THE
      *                        CASE FOR INTERNAL FORMATTING.
      *  L0290-FORMATTING-IND  CONTROL LEVEL OF FORMATING AVAILABLE.
      *  L0290-SIGN-POS-IND    POSITIVE SIGN IS DISPLAYED FOR VALUES
      *                        GREATER THAN OR EQUAL TO ZERO.
      *  L0290-CRCY-IND        WHETHER THE FIELD IS TO BE FORMATTED
      *                        WITH A CURRENCY SYMBOL OR NOT AND THE
      *                        POSITIONING OF THE SYMBOL.
      *  L0290-THOUSANDS-IND   WHETHER THE FIELD IS TO BE FORMATTED
      *                        WITH THOUSANDS SEPARATORS.
      *  L0290-DCML-IND        WHETHER THE FIELD IS TO DISPLAY THE
      *                        DECIMALS PART OF THE AMOUNT.
      *  L0290-CRCY-SYMBL      CONTAINS THE CHARACTER USED FOR CURRENCY.
      *  L0290-THOUSANDS-SYMBL CONTAINS THE CHARACTER USED TO SEPARATE
      *                        THOUSANDS.
      *  L0290-DCML-SYMBL      CONTAINS THE CHARACTER USED FOR DECIMAL
      *                        PLACE.
      *
      * OUTPUT FIELDS:
      *   L0290-OUTPUT-DATA    THE FORMATTED CHARACTER VERSION OF THE
      *                        DATA.
      *   L0290-OUTPUT-SIZE    THE FORMATTED CHARACTER VERSION OF THE
      *
      *
      * IMPLEMENTATION NOTES:
      *   THE LOGIC OF THIS ROUTINE DEPENDS UPON THE FACT THAT A PACKED
      *   NUMERIC FIELD HAS AN IMPLIED DECIMAL POINT.  INTERNALLY, THIS
      *   ROUTINE TREATS ALL INPUT NUMBERS AS A PIC S9(18) COMP-3 FIELD
      *   AND INSERTS A DECIMAL POINT IN THE OUTPUT ACCORDING TO THE
      *   NUMBER OF DECIMAL PLACES.
      *
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
008455**  31MAR98  552    EXTENSIVE ENHANCEMENT FOR NUMERIC FORMATTING*
      **                  (A COMPLETELY-REWRITTEN VERSION)           **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0290'.

       01  WS-VARIABLES.
           05  II                        PIC S9(04) COMP   VALUE +0.
           05  W0290-1ST-NZ-DGT-PTR      PIC S9(04) COMP   VALUE +0.
           05  W0290-THSD-SPR-COUNT      PIC S9(04) COMP   VALUE +0.
           05  W0290-THSD-SPR-COUNT-BEF  PIC S9(04) COMP   VALUE +0.
           05  W0290-INT-PORTION-LEN     PIC S9(04) COMP   VALUE +0.
           05  W0290-CRCY-SYMBL-COUNT    PIC S9(04) COMP   VALUE +0.
           05  W0290-LEFT-SYMBL-COUNT    PIC S9(04) COMP   VALUE +0.

       01  WS-CONSTANTS.
           05  W0290-MAX-INPUT-SIZE      PIC S9(04) COMP   VALUE +18.
           05  W0290-INPUT-FLD-PLUS-1    PIC S9(04) COMP   VALUE +19.
           05  W0290-INPUT-FLD-PLUS-2    PIC S9(04) COMP   VALUE +20.
           05  W0290-INPUT-FLD-PLUS-3    PIC S9(04) COMP   VALUE +21.
           05  W0290-MAX-OUTPUT-SIZE     PIC S9(04) COMP   VALUE +29.

       COPY XCWL0015.
      /
      *****************
       LINKAGE SECTION.
      *****************
       COPY XCWL0290.

      /
       PROCEDURE DIVISION        USING L0290-PARM-INFO.

      *--------------
       0000-MAINLINE.
      *--------------

           INITIALIZE L0290-OUTPUT-PARM-INFO.
           SET L0290-RETRN-OK    TO TRUE.

           EVALUATE TRUE

              WHEN L0290-RQST-NUMERIC-FORMAT
                 PERFORM 1000-NUMERIC-FORMAT
                    THRU 1000-NUMERIC-FORMAT-X

              WHEN OTHER
                 SET L0290-RETRN-INVALID-REQUEST TO TRUE

           END-EVALUATE.


       0000-MAINLINE-X.
           GOBACK.

      /
      *--------------------
       1000-NUMERIC-FORMAT.
      *--------------------

           MOVE L0290-INPUT-NUMBER          TO L0290-TEMP-NUMBER.
           MOVE SPACES                      TO L0290-OUTPUT-DATA.
           MOVE W0290-MAX-INPUT-SIZE        TO L0290-TEMP-IDX.
           MOVE ZERO                        TO L0290-THOUSANDS-CTR.

           PERFORM 1100-PREVENT-PARM-CONFLICT
              THRU 1100-PREVENT-PARM-CONFLICT-X.

           PERFORM 1150-CHECK-INPUT-PARM
              THRU 1150-CHECK-INPUT-PARM-X.

           IF NOT L0290-RETRN-OK
              GO TO 1000-NUMERIC-FORMAT-X
           END-IF.

           PERFORM 1200-CALC-OUTPUT-SIZE
              THRU 1200-CALC-OUTPUT-SIZE-X.
      *
      ***  EXIT IF TRUNCATION OCCURS THAT ALTER THE VALUES OF THE
      ***  FORMATTED OUTPUT
      *
           IF NOT L0290-RETRN-OK
              GO TO 1000-NUMERIC-FORMAT-X
           END-IF.

           SET L0290-OUT-IDX                TO L0290-OUTPUT-SIZE.
           PERFORM 1400-SYMBOLS-RIGHT
              THRU 1400-SYMBOLS-RIGHT-X.

           PERFORM 1500-DECIMALS
              THRU 1500-DECIMALS-X.

           PERFORM 1600-NUMERALS
              THRU 1600-NUMERALS-X.

           PERFORM 1700-FLOATING-SYMBOLS
              THRU 1700-FLOATING-SYMBOLS-X.

           PERFORM 1800-LEADING-ZEROS
              THRU 1800-LEADING-ZEROS-X.

           PERFORM 1900-SYMBOLS-LEFT
              THRU 1900-SYMBOLS-LEFT-X.

      *
      ***  COMPRESS OUTPUT FIELD IF MESSAGE FORMAT
      *
           IF L0290-MESSAGE-FORMAT
               MOVE L0290-OUTPUT-DATA       TO L0015-COMP-AREA-IN
               PERFORM 0015-2000-COMPRESS-NO-BLANKS
                  THRU 0015-2000-COMPRESS-NO-BLANKS-X
               MOVE L0015-COMP-AREA-OUT     TO L0290-OUTPUT-DATA
           END-IF.

       1000-NUMERIC-FORMAT-X.
           EXIT.

      /
      *---------------------------
       1100-PREVENT-PARM-CONFLICT.
      *---------------------------
      *
      ***  DEFAULT DECIMALS IF NOT SET
      *
           IF  NOT L0290-DCML-VALID
               SET L0290-DCML-DISPLAY         TO TRUE
           END-IF.

      *
      ***  DEFAULT LEAD ZEROS IF NOT SET
      *
           IF  NOT L0290-LEAD-ZEROS-VALID
               SET L0290-LEAD-ZEROS-DISPLAY   TO TRUE
           END-IF.

      *
      ***  DEFAULT THOUSANDS IF NOT SET
      *
           IF  NOT L0290-THOUSANDS-VALID
               SET L0290-THOUSANDS-SUPPRESS   TO TRUE
           END-IF.

      *
      ***  DEFAULT CURRENCY IF NOT SET
      *
           IF  NOT L0290-CRCY-VALID
               SET L0290-CRCY-SUPPRESS        TO TRUE
           END-IF.

      *
      ***  DEFAULT CURRENCY POSITION IF NOT SET
      *
           IF  NOT L0290-CRCY-POSN-VALID
               SET L0290-CRCY-LEFT            TO TRUE
           END-IF.

      *
      ***  DEFAULT SIGN-POSITIVE IF NOT SET
      *
           IF  NOT L0290-SIGN-POS-VALID
               SET L0290-SIGN-POS-SUPPRESS    TO TRUE
           END-IF.

      *
      ***  DEFAULT SIGN IF NOT SET
      *
           IF  NOT L0290-SIGN-VALID
               SET L0290-SIGN-DISPLAY         TO TRUE
           END-IF.

      *
      ***  DEFAULT SIGN POSITION IF NOT SET
      *
           IF  NOT L0290-SIGN-POSN-VALID
               SET L0290-SIGN-LEFT            TO TRUE
           END-IF.

      *
      ***  SUPPRESS LEAD ZEROES WHEN MESSAGE FORMAT
      *
           IF  L0290-MESSAGE-FORMAT
               SET L0290-LEAD-ZEROS-SUPPRESS  TO TRUE
           END-IF.

      *
      ***  RESET CURRENCY DISPLAY IF CURRENCY SYMBOL SPACES
      *
           IF  (L0290-CRCY-DISPLAY)
           AND (L0290-CRCY-SYMBL = SPACES)
               SET L0290-CRCY-SUPPRESS        TO TRUE
           END-IF.

      *
      ***  RESET CURRENCY POSITION WHEN SIGN FLOAT BUT NOT CRCY
      *
           IF  (L0290-SIGN-FLOAT)
           AND (L0290-CRCY-LEFT)
               SET L0290-CRCY-FLOAT           TO TRUE
           END-IF.

      *
      ***  RESET SIGN/CURRENCY POSITION WITH LEADING ZEROS DISPLAYED
      *
           IF  (L0290-LEAD-ZEROS-DISPLAY)
           AND (L0290-CRCY-FLOAT)
               SET L0290-CRCY-LEFT            TO TRUE
           END-IF.

           IF  (L0290-LEAD-ZEROS-DISPLAY)
           AND (L0290-SIGN-FLOAT)
               SET L0290-SIGN-LEFT            TO TRUE
           END-IF.

      *
      ***  RESET SIGN/CURRENCY POSITION WITH LEADING ZEROS SUPPRESSED
      *
           IF  (L0290-LEAD-ZEROS-SUPPRESS)
           AND (L0290-CRCY-LEFT)
               SET L0290-CRCY-FLOAT           TO TRUE
           END-IF.

           IF  (L0290-LEAD-ZEROS-SUPPRESS)
           AND (L0290-SIGN-LEFT)
               SET L0290-SIGN-FLOAT           TO TRUE
           END-IF.

      *
      ***  RESET SIGN POSITIVE IF SIGN BRACKETS
      *
           IF L0290-SIGN-BRCKTS
               SET L0290-SIGN-POS-SUPPRESS    TO TRUE
           END-IF.

       1100-PREVENT-PARM-CONFLICT-X.
           EXIT.

      /
      *---------------------------
       1150-CHECK-INPUT-PARM.
      *---------------------------
      *
      ***  CHECK INPUT GROUP PARAMETERS
      *

           IF  L0290-MAX-OUT-LEN < +1
               SET L0290-RETRN-INVAL-PARM TO TRUE
               GO TO 1150-CHECK-INPUT-PARM-X
           END-IF.

           IF  L0290-PRECISION   > W0290-MAX-INPUT-SIZE
               SET L0290-RETRN-INVAL-PARM TO TRUE
               GO TO 1150-CHECK-INPUT-PARM-X
           END-IF.

           IF  L0290-MAX-OUT-LEN > W0290-MAX-OUTPUT-SIZE
               COMPUTE L0290-MAX-OUT-LEN = W0290-MAX-OUTPUT-SIZE
           END-IF.


       1150-CHECK-INPUT-PARM-X.
           EXIT.

      /
      *----------------------
       1200-CALC-OUTPUT-SIZE.
      *----------------------

      *****************************************************************
      * CALC OUTPUT SIZE --                                           *
      *   ESTABLISH THE TOTAL OUTPUT DATA FIELD SIZE TAKING INTO      *
      *   ACCOUNT ALL THE REQUIRED FORMATING OPTIONS.                 *
      *   PERFORM APPROPRIATE TRUNCATION IF THE OUTPUT-SIZE IS GREATER*
      *   THAN THE MAX-OUT-LEN.                                       *
      *****************************************************************

           COMPUTE W0290-INT-PORTION-LEN =
                                           W0290-MAX-INPUT-SIZE
                                           - L0290-PRECISION.

           COMPUTE W0290-1ST-NZ-DGT-PTR  = 0.

      *
      ***  CALCULATE THE ACTUAL INTEGER LENGTH (RATHER THAN THE INTEGER
      ***  FIELD SIZE) FOR LATER USE
      *

           PERFORM
              VARYING II FROM +1  BY +1
              UNTIL  (II > W0290-INT-PORTION-LEN)
                 OR  (W0290-1ST-NZ-DGT-PTR NOT = 0)

                 IF  L0290-TEMP-CHAR (II) NOT = ZERO
                     MOVE II TO W0290-1ST-NZ-DGT-PTR
                 END-IF
           END-PERFORM.

           IF W0290-1ST-NZ-DGT-PTR = 0
              COMPUTE W0290-1ST-NZ-DGT-PTR = W0290-INT-PORTION-LEN
           END-IF.

           COMPUTE L0290-ACTUAL-INT-LEN = W0290-MAX-INPUT-SIZE
                                          -  L0290-PRECISION
                                          -  W0290-1ST-NZ-DGT-PTR
                                          +  1.

           IF L0290-ACTUAL-INT-LEN > L0290-MAX-OUT-LEN
              SET L0290-RETRN-TRUNCATION-ERR TO TRUE
              GO TO 1200-CALC-OUTPUT-SIZE-X
           END-IF.

           PERFORM 1220-FORMAT-SIZE
              THRU 1220-FORMAT-SIZE-X.

           IF NOT L0290-RETRN-OK
              GO TO 1200-CALC-OUTPUT-SIZE-X
           END-IF.

           PERFORM 1260-CHECK-MAX-OUT-LEN
              THRU 1260-CHECK-MAX-OUT-LEN-X.

       1200-CALC-OUTPUT-SIZE-X.
           EXIT.

      /
      *--------------------------
       1220-FORMAT-SIZE.
      *--------------------------

      ******************************************************************
      *   ESTABLISH THE TOTAL OUTPUT DATA FIELD SIZE TAKING INTO
      *   ACCOUNT THE REQUIRED FORMATING OPTIONS.
      ******************************************************************

           MOVE L0290-ACTUAL-INT-LEN        TO L0290-OUTPUT-SIZE.

           IF  L0290-PRECISION > ZERO
               IF L0290-DCML-DISPLAY
                  COMPUTE L0290-OUTPUT-SIZE =  L0290-OUTPUT-SIZE
                                               +  L0290-PRECISION + 1
               END-IF
           END-IF.

           IF  L0290-SIGN-DISPLAY
               IF  L0290-SIGN-BRCKTS
               AND L0290-INPUT-NUMBER < ZERO
                   ADD +2                   TO L0290-OUTPUT-SIZE
               ELSE
                   ADD +1                   TO L0290-OUTPUT-SIZE
               END-IF
           END-IF.

           IF L0290-OUTPUT-SIZE > L0290-MAX-OUT-LEN
              SET L0290-RETRN-TRUNCATION-ERR TO TRUE
              GO TO 1220-FORMAT-SIZE-X
           END-IF.

           MOVE 0 TO W0290-CRCY-SYMBL-COUNT.

           IF  L0290-CRCY-DISPLAY
               IF  L0290-CRCY-SYMBL-1 NOT = SPACES
                   ADD +1                  TO L0290-OUTPUT-SIZE
                   ADD +1                  TO W0290-CRCY-SYMBL-COUNT
               END-IF
               IF  L0290-CRCY-SYMBL-2 NOT = SPACES
                   ADD +1                  TO L0290-OUTPUT-SIZE
                   ADD +1                  TO W0290-CRCY-SYMBL-COUNT
               END-IF
               IF  L0290-CRCY-SYMBL-3 NOT = SPACES
                   ADD +1                  TO L0290-OUTPUT-SIZE
                   ADD +1                  TO W0290-CRCY-SYMBL-COUNT
               END-IF
           END-IF.

           IF  L0290-THOUSANDS-DISPLAY
               COMPUTE W0290-THSD-SPR-COUNT =
                                         (L0290-ACTUAL-INT-LEN - 1) / 3
               COMPUTE L0290-OUTPUT-SIZE    = L0290-OUTPUT-SIZE
                                              + W0290-THSD-SPR-COUNT
           END-IF.


       1220-FORMAT-SIZE-X.
           EXIT.

      /
      *-----------------------
       1260-CHECK-MAX-OUT-LEN.
      *-----------------------

      *
      ***  CHECK IF OUTPUT SIZE AND FORMATTING MUST BE ADJUSTED TO
      ***  AVOID TRUNCATION
      *
           IF  L0290-OUTPUT-SIZE <= L0290-MAX-OUT-LEN
               COMPUTE L0290-OUTPUT-SIZE = L0290-MAX-OUT-LEN
               GO TO 1260-CHECK-MAX-OUT-LEN-X
           END-IF.

      *
      ***  ADJUST OUTPUT LENGTH CHARACTER BY CHARACTER
      *
           PERFORM 1270-ADJUST-OUTPUT-LEN
              THRU 1270-ADJUST-OUTPUT-LEN-X
             UNTIL L0290-OUTPUT-SIZE NOT > L0290-MAX-OUT-LEN.

           IF  L0290-OUTPUT-SIZE < L0290-MAX-OUT-LEN
               COMPUTE L0290-OUTPUT-SIZE = L0290-MAX-OUT-LEN
           END-IF.


       1260-CHECK-MAX-OUT-LEN-X.
           EXIT.

      /
      *-----------------------
       1270-ADJUST-OUTPUT-LEN.
      *-----------------------

      *
      ***  FIRST ADJUSTMENT, LOSE SIGN IF POSITIVE
      *
           IF  (L0290-SIGN-POS-DISPLAY)
           AND (L0290-SIGN-DISPLAY)
           AND (L0290-INPUT-NUMBER NOT < ZERO)
               SUBTRACT +1 FROM L0290-OUTPUT-SIZE
               SET L0290-SIGN-SUPPRESS      TO TRUE
               SET L0290-SIGN-POS-SUPPRESS  TO TRUE
               GO TO 1270-ADJUST-OUTPUT-LEN-X
           END-IF.

      *
      ***  SECOND ADJUSTMENT, LOSE CURRENCY SYMBOL
      *
           IF  L0290-CRCY-DISPLAY
               IF  L0290-CRCY-SYMBL-1 NOT = SPACES
                   SUBTRACT +1 FROM L0290-OUTPUT-SIZE
                   SUBTRACT +1 FROM W0290-CRCY-SYMBL-COUNT
               END-IF
               IF  L0290-CRCY-SYMBL-2 NOT = SPACES
                   SUBTRACT +1 FROM L0290-OUTPUT-SIZE
                   SUBTRACT +1 FROM W0290-CRCY-SYMBL-COUNT
               END-IF
               IF  L0290-CRCY-SYMBL-3 NOT = SPACES
                   SUBTRACT +1 FROM L0290-OUTPUT-SIZE
                   SUBTRACT +1 FROM W0290-CRCY-SYMBL-COUNT
               END-IF

               SET L0290-CRCY-SUPPRESS TO TRUE
               GO TO 1270-ADJUST-OUTPUT-LEN-X
           END-IF.

      *
      ***  THIRD ADJUSTMENT, LOSE THOUSANDS SEPARATORS
      *
           IF  L0290-THOUSANDS-DISPLAY
               COMPUTE L0290-OUTPUT-SIZE = L0290-OUTPUT-SIZE
                                           - W0290-THSD-SPR-COUNT
               SET L0290-THOUSANDS-SUPPRESS    TO TRUE
               GO TO 1270-ADJUST-OUTPUT-LEN-X
           END-IF.

      *
      ***  IF WE REACH HERE, THE ACTUAL LENGTH OF THE INPUT NUMBER
      ***  IS LARGER THAN THE SIZE OF THE FIELD IT WILL BE PUT INTO
      ***  AFTER THIS ROUTINE RETURNS. SET RETURN CODE TO ERROR.
      *
           SET L0290-RETRN-TRUNCATION-ERR  TO TRUE.
           MOVE L0290-MAX-OUT-LEN                  TO L0290-OUTPUT-SIZE.


       1270-ADJUST-OUTPUT-LEN-X.
           EXIT.

      /
      *-------------------
       1400-SYMBOLS-RIGHT.
      *-------------------

           IF  (L0290-CRCY-RIGHT)
           AND (L0290-CRCY-DISPLAY)
               IF  (L0290-SIGN-RIGHT)
               AND (L0290-SIGN-DISPLAY)
                   NEXT SENTENCE
               ELSE
                   PERFORM 1410-MOVE-CURRENCY
                      THRU 1410-MOVE-CURRENCY-X
               END-IF
           END-IF.

           IF  (L0290-SIGN-RIGHT)
           AND (L0290-SIGN-DISPLAY)
               IF  L0290-INPUT-NUMBER < ZERO
                   MOVE '-'      TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                   SET L0290-OUT-IDX        DOWN BY +1
               ELSE
                   IF  L0290-SIGN-POS-DISPLAY
                       MOVE '+'  TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                       SET L0290-OUT-IDX    DOWN BY +1
                   ELSE
                       MOVE ' '  TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                       SET L0290-OUT-IDX    DOWN BY +1
                   END-IF
               END-IF
           END-IF.

           IF  (L0290-SIGN-BRCKTS)
           AND (L0290-SIGN-DISPLAY)
               IF  L0290-INPUT-NUMBER < ZERO
                   MOVE ')'      TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                   SET L0290-OUT-IDX        DOWN BY +1
               ELSE
                   MOVE SPACE    TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                   SET L0290-OUT-IDX        DOWN BY +1
               END-IF
           END-IF.

           IF  (L0290-CRCY-RIGHT)
           AND (L0290-CRCY-DISPLAY)
               IF  (L0290-SIGN-RIGHT)
               AND (L0290-SIGN-DISPLAY)
                   PERFORM 1410-MOVE-CURRENCY
                      THRU 1410-MOVE-CURRENCY-X
               END-IF
           END-IF.


       1400-SYMBOLS-RIGHT-X.
           EXIT.

      /
      *-------------------
       1410-MOVE-CURRENCY.
      *-------------------

      *****************************************************************
      *                                                               *
      *    MOVES EACH CHARACTER OF THE CURRENCY SYMBOL IF THEY        *
      *    ARE NOT SPACES                                             *
      *****************************************************************

      *
      ***  CHECK EACH BYTE OF THE SYMBOL AND MOVE IF NOT SPACES THEN
      ***  DECREMENT INDEX
      *
           IF  L0290-CRCY-SYMBL-3 NOT = SPACE
               MOVE L0290-CRCY-SYMBL-3 TO
                                       L0290-OUTPUT-CHAR (L0290-OUT-IDX)
               SET L0290-OUT-IDX            DOWN BY +1
           END-IF.

           IF  L0290-CRCY-SYMBL-2 NOT = SPACE
               MOVE L0290-CRCY-SYMBL-2 TO
                                       L0290-OUTPUT-CHAR (L0290-OUT-IDX)
               SET L0290-OUT-IDX            DOWN BY +1
           END-IF.

           IF  L0290-CRCY-SYMBL-1 NOT = SPACE
               MOVE L0290-CRCY-SYMBL-1 TO
                                       L0290-OUTPUT-CHAR (L0290-OUT-IDX)
               SET L0290-OUT-IDX            DOWN BY +1
           END-IF.


       1410-MOVE-CURRENCY-X.
           EXIT.

      /
      *--------------
       1500-DECIMALS.
      *--------------

      *****************************************************************
      *   SETS THE DECIMALS AND THE DECIMAL PLACE SYMBOL.             *
      *   ALSO SET THE FIRST NUMERAL TO ZERO AND A DEFAULT.           *
      *****************************************************************

           IF  L0290-DCML-SUPPRESS
               GO TO 1500-DECIMALS-X
           END-IF.

      *
      ***  EXIT SECTION IF NO DECIMALS EXIST
      *
           IF  L0290-PRECISION = ZERO
               GO TO 1500-DECIMALS-X
           END-IF.

      *
      ***  MOVE DECIMALS FROM INPUT NUMBER TO OUTPUT DATA
      *
           PERFORM 2000-SHIFT-CHAR
              THRU 2000-SHIFT-CHAR-X
              VARYING L0290-TEMP-PRECISION
              FROM    L0290-PRECISION BY -1
              UNTIL   L0290-TEMP-PRECISION NOT > ZERO.

      *
      ***  SET DECIMAL POINT CHARACTER
      *
            MOVE L0290-DCML-SYMBL TO L0290-OUTPUT-CHAR (L0290-OUT-IDX).
            SET L0290-OUT-IDX     DOWN BY +1.

      *
      ***  SET NEXT OUTPUT CHARACTER TO BE '0'. THIS WILL NORMALLY GET
      ***  OVERWRITTEN BY A NUMERAL
      *
            IF  L0290-OUT-IDX > 0
                MOVE '0'          TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
            END-IF.


       1500-DECIMALS-X.
           EXIT.

      /
      *--------------
       1600-NUMERALS.
      *--------------

      *****************************************************************
      *   SETS THE DECIMALS AND THE DECIMAL PLACE SYMBOL.             *
      *   ALSO SET THE FIRST NUMERAL TO ZERO AND A DEFAULT.           *
      *****************************************************************

      *
      ***  INITIALISE THOUSANDS COUNTER
      *
           IF  L0290-THOUSANDS-DISPLAY
               MOVE +1 TO L0290-THOUSANDS-CTR
           END-IF.

      *
      ***  OUTPUT WHOLE PART OF NUMBER
      *
           PERFORM  2000-SHIFT-CHAR
              THRU  2000-SHIFT-CHAR-X
              UNTIL (L0290-OUT-IDX NOT > ZERO)
                 OR (L0290-TEMP-IDX < W0290-1ST-NZ-DGT-PTR).


       1600-NUMERALS-X.
           EXIT.

      /
      *----------------------
       1700-FLOATING-SYMBOLS.
      *----------------------

      *****************************************************************
      *  SET THE CURRENCY AND SIGN SYMBOLS TO FLOAT ADJACENT TO THE   *
      *  LEFT OF THE AMOUNT. CURRENCY SYMBOL WILL BE NEAREST THE AMOUNT
      *****************************************************************

           IF  (L0290-CRCY-FLOAT)
           AND (L0290-CRCY-DISPLAY)
               IF  (L0290-SIGN-BRCKTS AND L0290-SIGN-DISPLAY)
               AND (L0290-LEAD-ZEROS-SUPPRESS)
                   NEXT SENTENCE
               ELSE
                   PERFORM 1410-MOVE-CURRENCY
                      THRU 1410-MOVE-CURRENCY-X
               END-IF
           END-IF.

           IF  (L0290-SIGN-FLOAT)
           AND (L0290-SIGN-DISPLAY)
               IF  L0290-INPUT-NUMBER < ZERO
                   MOVE '-'         TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                   SET L0290-OUT-IDX        DOWN BY +1
               ELSE
                   IF  L0290-SIGN-POS-DISPLAY
                       MOVE '+'     TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                       SET L0290-OUT-IDX    DOWN BY +1
                   ELSE
                       MOVE ' '     TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                       SET L0290-OUT-IDX    DOWN BY +1
                   END-IF
               END-IF
           END-IF.

           IF  (L0290-SIGN-BRCKTS AND L0290-SIGN-DISPLAY)
           AND (L0290-LEAD-ZEROS-SUPPRESS)
               IF  L0290-INPUT-NUMBER < ZERO
                   MOVE '('         TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                   SET L0290-OUT-IDX        DOWN BY +1
               END-IF
           END-IF.

           IF  (L0290-CRCY-FLOAT)
           AND (L0290-CRCY-DISPLAY)
               IF  (L0290-SIGN-BRCKTS AND L0290-SIGN-DISPLAY)
               AND (L0290-LEAD-ZEROS-SUPPRESS)
                   PERFORM 1410-MOVE-CURRENCY
                      THRU 1410-MOVE-CURRENCY-X
               END-IF
           END-IF.


       1700-FLOATING-SYMBOLS-X.
           EXIT.

      /
      *-------------------
       1800-LEADING-ZEROS.
      *-------------------

      *****************************************************************
      * CALC SPACES REQUIRED TO BE RESERVED FOR LEFT SYMBOLS
      *****************************************************************
           MOVE 0 TO W0290-LEFT-SYMBL-COUNT.

           IF  L0290-SIGN-LEFT AND L0290-SIGN-DISPLAY
               ADD +1 TO W0290-LEFT-SYMBL-COUNT
           END-IF.

           IF  (L0290-SIGN-BRCKTS AND L0290-SIGN-DISPLAY)
           AND (L0290-LEAD-ZEROS-DISPLAY)
               ADD +1 TO W0290-LEFT-SYMBL-COUNT
           END-IF.

           IF  L0290-CRCY-LEFT AND L0290-CRCY-DISPLAY
               ADD W0290-CRCY-SYMBL-COUNT TO W0290-LEFT-SYMBL-COUNT
           END-IF.

      ***************************************************************
      * SET THE LEADING ZEROS OR SPACES TO THE AMOUNT
      ***************************************************************

           IF  L0290-LEAD-ZEROS-SUPPRESS
               PERFORM  2100-INSERT-A-BLANK
                  THRU  2100-INSERT-A-BLANK-X
                 UNTIL  (L0290-OUT-IDX  NOT > W0290-LEFT-SYMBL-COUNT)
           ELSE
               PERFORM  2000-SHIFT-CHAR
                  THRU  2000-SHIFT-CHAR-X
                 UNTIL  (L0290-OUT-IDX  NOT > W0290-LEFT-SYMBL-COUNT)

               SET L0290-OUT-IDX UP BY +1
               IF L0290-OUTPUT-CHAR (L0290-OUT-IDX) =
                  L0290-THOUSANDS-SYMBL
                  MOVE '0' TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
               END-IF
               SET L0290-OUT-IDX DOWN BY +1

           END-IF.


       1800-LEADING-ZEROS-X.
           EXIT.

      /
      *------------------
       1900-SYMBOLS-LEFT.
      *------------------

      ****************************************************************
      * SET THE CURRENCY AND SIGN SYMBOLS TO THE LEFT OF THE OUTPUT  *
      * FIELD. THE CURRENCY SYMBOL WILL BE NEAREST THE AMOUNT.       *
      ****************************************************************

           IF  (L0290-CRCY-LEFT)
           AND (L0290-CRCY-DISPLAY)
               IF  (L0290-SIGN-BRCKTS AND L0290-SIGN-DISPLAY)
               AND (L0290-LEAD-ZEROS-DISPLAY)
                   NEXT SENTENCE
               ELSE
                   PERFORM 1410-MOVE-CURRENCY
                      THRU 1410-MOVE-CURRENCY-X
               END-IF
           END-IF.

           IF  L0290-SIGN-LEFT AND L0290-SIGN-DISPLAY
               IF  L0290-INPUT-NUMBER < ZERO
                   MOVE '-'         TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                   SET L0290-OUT-IDX        DOWN BY +1
               ELSE
                   IF  L0290-SIGN-POS-DISPLAY
                       MOVE '+'     TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                       SET L0290-OUT-IDX    DOWN BY +1
                   ELSE
                       MOVE ' '     TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                       SET L0290-OUT-IDX    DOWN BY +1
                   END-IF
               END-IF
           END-IF.

           IF  (L0290-SIGN-BRCKTS AND L0290-SIGN-DISPLAY)
           AND (L0290-LEAD-ZEROS-DISPLAY)
               IF  L0290-INPUT-NUMBER < ZERO
                   MOVE '('         TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                   SET L0290-OUT-IDX        DOWN BY +1
               END-IF
           END-IF.

           IF  (L0290-CRCY-LEFT)
           AND (L0290-CRCY-DISPLAY)
               IF  (L0290-SIGN-BRCKTS AND L0290-SIGN-DISPLAY)
               AND (L0290-LEAD-ZEROS-DISPLAY)
                   PERFORM 1410-MOVE-CURRENCY
                      THRU 1410-MOVE-CURRENCY-X
               END-IF
           END-IF.


       1900-SYMBOLS-LEFT-X.
           EXIT.

      /
      *----------------
       2000-SHIFT-CHAR.
      *----------------

      *************************************************************
      * ONE CHARACTER IS SHIFTED FROM THE TEMP AREA TO THE OUTPUT *
      * AREA, AND BOTH INDEXES ARE DECREMENTED TO POINT TO THE    *
      * NEXT CHARACTER TO BE MOVED.                               *
      *************************************************************

      *
      ***  CHECK THOUSANDS INDICATOR > ZERO INDICATES THIS IS BEING
      ***  CALLED FROM 1500-NUMERALS AND THAT THOUSANDS SEPARATOR
      ***  IS REQUIRED FOR EXTERNAL FORMATTING. WHEN COUNTER IS
      ***  GREATER THAN 3 A THOUSANDS SYMBOL IS WRITTEN TO THE OUTPUT.
      *
           IF  L0290-THOUSANDS-CTR > ZERO
               IF L0290-THOUSANDS-CTR > 3
                  MOVE L0290-THOUSANDS-SYMBL TO
                                    L0290-OUTPUT-CHAR (L0290-OUT-IDX)
                  SET L0290-OUT-IDX         DOWN BY +1
                  MOVE +1 TO L0290-THOUSANDS-CTR
                  GO TO 2000-SHIFT-CHAR-X
               ELSE
                  ADD +1 TO L0290-THOUSANDS-CTR
               END-IF
           END-IF.

      *
      ***  MOVE TEMP-CHAR TO THE OUTPUT-CHAR, UNLESS IT IS SPACES
      *
           IF L0290-TEMP-IDX >= W0290-1ST-NZ-DGT-PTR
              IF  L0290-TEMP-CHAR (L0290-TEMP-IDX) = SPACES
                  MOVE '0'      TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
              ELSE
                  MOVE L0290-TEMP-CHAR (L0290-TEMP-IDX)
                                TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
              END-IF
           ELSE
              IF L0290-LEAD-ZEROS-DISPLAY
                  MOVE '0'      TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
              ELSE
                  MOVE SPACE    TO L0290-OUTPUT-CHAR (L0290-OUT-IDX)
              END-IF
           END-IF.

           IF L0290-TEMP-IDX > 0
              SUBTRACT 1 FROM L0290-TEMP-IDX
           END-IF.

           SET L0290-OUT-IDX DOWN BY +1.


       2000-SHIFT-CHAR-X.
           EXIT.

      /
      *----------------
       2100-INSERT-A-BLANK.
      *----------------

           MOVE SPACE        TO L0290-OUTPUT-CHAR (L0290-OUT-IDX).

           IF L0290-TEMP-IDX > 0
              SUBTRACT 1 FROM L0290-TEMP-IDX
           END-IF.

           SET L0290-OUT-IDX DOWN BY +1.

       2100-INSERT-A-BLANK-X.
           EXIT.

      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************

       COPY XCPL0015.

      *****************************************************************
      **                 END OF PROGRAM XSDU0290                     **
      *****************************************************************

