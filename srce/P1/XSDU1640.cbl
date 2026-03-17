      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDU1640.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSDU1640                                         **
      **  REMARKS : DATE CONVERSION ROUTINE                          **
      **            (INTERNAL TO EXTERNAL AND EXTERNAL TO INTERNAL)  **
      **            THIS MODULE WILL CONVERT THE PASSED INPUT DATE   **
      **            TO THE REQUESTED FORMAT, USING THE PASSED        **
      **            LANGUAGE AND LEAP YEAR INDICATOR.  IF AN INVALID **
005409**            LANGUAGE.  IF AN INVALID                         **
      **            REQUEST OR AN INVALID DATE IS PASSED, SET THE    **
      **            RETURN CODE TO ERROR.                            **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **                                                             **
      **  INPUT FIELDS  = L1640-RQST-CODE                            **
      **                = L1640-EXTERNAL-DATE / L1640-INTERNAL-DATE  **
      **                = L1640-DT-FRMT-CD      'A' - DDMMMYYYY      **
      **                                        'B' - DD-MM-YYYY     **
      **                                        'C' - MM-DD-YYYY     **
      **                                        'D' - YYYY-MM-DD     **
      **                = L1640-DT-SEPARATOR-SYMBL (/,-,., ...)      **
      **                = L1640-DT-ZERO-SUPRES-IND (Y/N)             **
      **  OUTPUT FIELDS = L1640-EXTERNAL-DATE / L1640-INTERNAL-DATE  **
      **                                                             **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
      **                                                             **
008453**  31MAR98  552     MODULE REWRITTEN FOR 5.5.2 RELEASE        **
005409**  30OCT98  56      MODIFICATIONS REQUIRED FOR LEALP YEAR     **
015543**  15DEC99  60      CODE CLEANUP                              **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU1640'.
 
       01  WS-WORK-AREA.
           05  WS-I1                   PIC S9(04) COMP.
           05  WS-O1                   PIC S9(04) COMP.
           05  WS-COUNT-DIGITS         PIC S9(04) COMP.
           05  WS-MAX-LEN              PIC S9(04) COMP VALUE +10.
           05  WS-ALLOW-ZERO-YEAR-IND  PIC X(01)  VALUE 'N'.
               88  WS-ALLOW-ZERO-YEAR             VALUE 'Y'.
               88  WS-ALLOW-ZERO-YEAR-NOT         VALUE 'N'.
      *
           05  WS-DATE-IN              PIC X(10).
           05  WS-DATE-IN-R            REDEFINES WS-DATE-IN.
               10  WS-DT-IN            PIC X OCCURS 10 TIMES.
           05  WS-DATE-IN-S.
               10  WS-DATE-IN-1-5      PIC X(5).
               10  WS-DATE-IN-6-10     PIC X(5).
      *
           05  WS-DATE-OUT             PIC X(10).
           05  WS-DATE-OUT-R           REDEFINES WS-DATE-OUT.
               10  WS-DT-OUT           PIC X OCCURS 10 TIMES.
      *
           05  WS-EDIT-DATE.
               10  WS-EDIT-YYYY-X.
                   15  WS-EDIT-YYYY    PIC 9(04).
               10  FILLER              PIC X(01).
               10  WS-EDIT-MM-X.
                   15  WS-EDIT-MM      PIC 9(02).
                   88  WS-EDIT-MM-VALID VALUES  01 THRU 12.
               10  FILLER              PIC X(01).
               10  WS-EDIT-DD-X.
                   15  WS-EDIT-DD      PIC 9(02).
                   88  WS-EDIT-DD-VALID VALUES  01 THRU 31.
      *
           05  WS-WORK-DATE            PIC X(10) VALUE SPACES.
           05  WS-WORK-DATE-A          REDEFINES WS-WORK-DATE.
               10  WS-A-DD             PIC X(02).
               10  WS-A-MMM            PIC X(03).
               10  WS-A-YYYY           PIC X(04).
               10  WS-A-FILLER         PIC X(01).
           05  WS-WORK-DATE-B          REDEFINES WS-WORK-DATE.
               10  WS-B-DD             PIC X(02).
               10  WS-B-DD-Z9          REDEFINES WS-B-DD
                                       PIC Z9.
               10  WS-B-SEP-1          PIC X(01).
               10  WS-B-MM             PIC X(02).
               10  WS-B-MM-Z9          REDEFINES WS-B-MM
                                       PIC Z9.
               10  WS-B-SEP-2          PIC X(01).
               10  WS-B-YYYY           PIC X(04).
           05  WS-WORK-DATE-C          REDEFINES WS-WORK-DATE.
               10  WS-C-MM             PIC X(02).
               10  WS-C-MM-Z9          REDEFINES WS-C-MM
                                       PIC Z9.
               10  WS-C-SEP-1          PIC X(01).
               10  WS-C-DD             PIC X(02).
               10  WS-C-DD-Z9          REDEFINES WS-C-DD
                                       PIC Z9.
               10  WS-C-SEP-2          PIC X(01).
               10  WS-C-YYYY           PIC X(04).
           05  WS-WORK-DATE-D          REDEFINES WS-WORK-DATE.
               10  WS-D-YYYY           PIC X(04).
               10  WS-D-SEP-1          PIC X(01).
               10  WS-D-MM             PIC X(02).
               10  WS-D-MM-Z9          REDEFINES WS-D-MM
                                       PIC Z9.
               10  WS-D-SEP-2          PIC X(01).
               10  WS-D-DD             PIC X(02).
               10  WS-D-DD-Z9          REDEFINES WS-D-DD
                                       PIC Z9.
 
       01  WS-MMM-TABLE            PIC X(36) VALUE SPACES.
       01  WS-MMM-TABLE-R          REDEFINES WS-MMM-TABLE.
           03  WS-MMM              OCCURS 12
                                   PIC X(3).
 
       COPY XCWTDTTB.
 
       COPY XCWWWKDT.
 
      *****************
       LINKAGE SECTION.
      *****************
 
       COPY XCWLDTLK.
 
       COPY XCWL1640.
      /
       PROCEDURE DIVISION USING LDTLK-PARM-INFO
                                L1640-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET L1640-RETRN-OK          TO TRUE.
           SET L1640-VALID             TO TRUE.
           SET LDTLK-VALID             TO TRUE.
           SET WS-ALLOW-ZERO-YEAR-NOT  TO TRUE.
 
           PERFORM  1000-PROCESS-DATE
               THRU 1000-PROCESS-DATE-X.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /
      *------------------
       1000-PROCESS-DATE.
      *------------------
 
      *****************************************************************
      ** THIS PARAGRAPH WILL DETERMINE IF THIS PARAGRAPH WAS PERFORMED
      ** WITH THE PROPER TRANSLATE CODE AND IF VALID WILL THEN PERFORM
      ** THE CORRECT TRANSLATION ROUTINE.
      *****************************************************************
 
           PERFORM  1100-INITIAL-SETUP
              THRU  1100-INITIAL-SETUP-X.
 
           IF L1640-NOT-VALID
              GO TO 1000-PROCESS-DATE-X
           END-IF.
 
           EVALUATE TRUE
 
               WHEN L1640-INTERNAL-TO-EXTERNAL
MP310E         WHEN L1640-INTERNAL-TO-MIR
                    PERFORM  2000-INTERNAL-TO-EXT
                       THRU  2000-INTERNAL-TO-EXT-X
 
               WHEN L1640-INTERNAL-TO-EXTERNAL-S
                    SET WS-ALLOW-ZERO-YEAR  TO TRUE
                    PERFORM  2000-INTERNAL-TO-EXT
                       THRU  2000-INTERNAL-TO-EXT-X
 
               WHEN L1640-EXTERNAL-TO-INTERNAL
               WHEN L1640-EXTERNAL-TO-INTERNAL-S
               WHEN L1640-CTL-CARD-TO-INTERNAL
MP310E         WHEN L1640-MIR-TO-INTERNAL
                    PERFORM  3000-EXTERNAL-TO-INT
                       THRU  3000-EXTERNAL-TO-INT-X
 
               WHEN OTHER
                   SET L1640-NOT-VALID             TO TRUE
                   SET L1640-RETRN-INVALID-REQUEST TO TRUE
 
           END-EVALUATE.
 
       1000-PROCESS-DATE-X.
           EXIT.
      /
      *-------------------
       1100-INITIAL-SETUP.
      *-------------------
 
           MOVE L1640-MOS-ABBR-TXT     TO WS-MMM-TABLE.
 
           IF  NOT L1640-DT-FRMT-VALID
               SET L1640-NOT-VALID             TO TRUE
               SET L1640-RETRN-INVALID-REQUEST TO TRUE
               GO TO 1100-INITIAL-SETUP-X
           END-IF.
 
           IF  NOT L1640-DT-FRMT-DDMMMYYYY
               IF  L1640-DT-SEPARATOR-INVALID
               OR  NOT L1640-ZERO-SUPPRESS-VALID
                       SET L1640-NOT-VALID             TO TRUE
                       SET L1640-RETRN-INVALID-REQUEST TO TRUE
                       GO TO 1100-INITIAL-SETUP-X
               END-IF
           END-IF.
 
           IF  L1640-EXTERNAL-TO-INTERNAL
           AND NOT L1640-DT-FRMT-DDMMMYYYY
               MOVE  +10                 TO  WS-MAX-LEN
               MOVE  1                   TO  WS-I1
               MOVE  1                   TO  WS-O1
               PERFORM  5000-DATE-UNPACK
                  THRU  5000-DATE-UNPACK-X
           END-IF.
 
           IF  L1640-EXTERNAL-TO-INTERNAL-S
           AND NOT L1640-DT-FRMT-DDMMMYYYY
               MOVE  L1640-EXTERNAL-DATE TO  WS-DATE-IN-S
               IF  WS-DATE-IN-6-10 = SPACES
                   EVALUATE TRUE
                       WHEN  L1640-DT-FRMT-DMY
                       WHEN  L1640-DT-FRMT-MDY
                           MOVE  +5      TO  WS-MAX-LEN
                           MOVE  1       TO  WS-I1
                           MOVE  1       TO  WS-O1
                       WHEN  L1640-DT-FRMT-YMD
                           MOVE  +10     TO  WS-MAX-LEN
                           MOVE  1       TO  WS-I1
                           MOVE  6       TO  WS-O1
                   END-EVALUATE
               ELSE
                   MOVE  +10             TO  WS-MAX-LEN
                   MOVE  1               TO  WS-I1
                   MOVE  1               TO  WS-O1
               END-IF
               PERFORM  5000-DATE-UNPACK
                  THRU  5000-DATE-UNPACK-X
           END-IF.
 
       1100-INITIAL-SETUP-X.
           EXIT.
      /
      *---------------------
       2000-INTERNAL-TO-EXT.
      *---------------------
 
      ******************************************************************
      ** THIS PARAGRAPH WILL CONVERT A DATE FROM THE INTERNAL FORMAT
      ** INTO ONE OF THE EXTERNAL FORMATS, ACCORDING TO THE PARAMETERS.
      **                 INPUT FIELDS = L1640-INTERNAL-DATE
      **                              = L1640-DT-FRMT-CD
      **                              = L1640-DT-SEPARATOR-SYMBL
      **                              = L1640-DT-ZERO-SUPRES-IND
      **                 OUTPUT FIELD = L1640-EXTERNAL-DATE
      ******************************************************************
 
           MOVE  SPACES                TO L1640-EXTERNAL-DATE.
 
           IF L1640-INTERNAL-DATE = SPACES
               MOVE WWKDT-ZERO-DT  TO L1640-INTERNAL-DATE
           END-IF.
 
           IF  L1640-INTERNAL-DATE = WWKDT-ZERO-DT
               SET L1640-NOT-VALID TO TRUE
               GO TO 2000-INTERNAL-TO-EXT-X
           END-IF.
 
           MOVE L1640-INTERNAL-DATE    TO WS-EDIT-DATE.
 
           PERFORM  8000-EDIT-INTERNAL
               THRU 8000-EDIT-INTERNAL-X.
 
           IF  L1640-NOT-VALID
               MOVE SPACES         TO L1640-EXTERNAL-DATE
               GO TO 2000-INTERNAL-TO-EXT-X
           END-IF.
 
           MOVE  SPACES                TO  WS-WORK-DATE.
 
           EVALUATE  TRUE
               WHEN  L1640-DT-FRMT-DDMMMYYYY
                     PERFORM 2100-INT-TO-EXT-A
                        THRU 2100-INT-TO-EXT-A-X
               WHEN  L1640-DT-FRMT-DMY
                     PERFORM 2200-INT-TO-EXT-B
                        THRU 2200-INT-TO-EXT-B-X
               WHEN  L1640-DT-FRMT-MDY
                     PERFORM 2300-INT-TO-EXT-C
                        THRU 2300-INT-TO-EXT-C-X
               WHEN  L1640-DT-FRMT-YMD
                     PERFORM 2400-INT-TO-EXT-D
                        THRU 2400-INT-TO-EXT-D-X
           END-EVALUATE.
 
           MOVE WS-WORK-DATE       TO L1640-EXTERNAL-DATE.
 
           IF  NOT L1640-DT-FRMT-DDMMMYYYY
           AND ( L1640-USE-ZERO-SUPPRESS
              OR L1640-INTERNAL-TO-EXTERNAL-S)
               PERFORM  6000-DATE-PACK
                  THRU  6000-DATE-PACK-X
           END-IF.
 
       2000-INTERNAL-TO-EXT-X.
           EXIT.
      /
      *-------------------
       2100-INT-TO-EXT-A.
      *-------------------
 
           MOVE L1640-DD-1             TO WS-A-DD.
           MOVE WS-MMM(L1640-MM-1)     TO WS-A-MMM.
           IF  L1640-YYYY-1 NOT = ZEROS
               MOVE L1640-YYYY-1       TO WS-A-YYYY
           END-IF.
 
       2100-INT-TO-EXT-A-X.
           EXIT.
      /
      *-------------------
       2200-INT-TO-EXT-B.
      *-------------------
 
           MOVE L1640-DT-SEPARATOR-SYMBL TO WS-B-SEP-1.
           IF  L1640-USE-ZERO-SUPPRESS
               MOVE L1640-DD-1          TO WS-B-DD-Z9
               MOVE L1640-MM-1          TO WS-B-MM-Z9
           ELSE
               MOVE L1640-DD-1          TO WS-B-DD
               MOVE L1640-MM-1          TO WS-B-MM
           END-IF.
 
           IF  L1640-YYYY-1 NOT = ZEROS
               MOVE L1640-DT-SEPARATOR-SYMBL TO WS-B-SEP-2
               MOVE L1640-YYYY-1        TO WS-B-YYYY
           END-IF.
 
       2200-INT-TO-EXT-B-X.
           EXIT.
      /
      *-------------------
       2300-INT-TO-EXT-C.
      *-------------------
 
           MOVE L1640-DT-SEPARATOR-SYMBL TO WS-C-SEP-1.
           IF  L1640-USE-ZERO-SUPPRESS
               MOVE L1640-DD-1          TO WS-C-DD-Z9
               MOVE L1640-MM-1          TO WS-C-MM-Z9
           ELSE
               MOVE L1640-DD-1          TO WS-C-DD
               MOVE L1640-MM-1          TO WS-C-MM
           END-IF.
 
           IF  L1640-YYYY-1 NOT = ZEROS
               MOVE L1640-DT-SEPARATOR-SYMBL TO WS-C-SEP-2
               MOVE L1640-YYYY-1        TO WS-C-YYYY
           END-IF.
 
       2300-INT-TO-EXT-C-X.
           EXIT.
      /
      *-------------------
       2400-INT-TO-EXT-D.
      *-------------------
 
           MOVE L1640-DT-SEPARATOR-SYMBL TO WS-D-SEP-2.
           IF  L1640-USE-ZERO-SUPPRESS
               MOVE L1640-DD-1          TO WS-D-DD-Z9
               MOVE L1640-MM-1          TO WS-D-MM-Z9
           ELSE
               MOVE L1640-DD-1          TO WS-D-DD
               MOVE L1640-MM-1          TO WS-D-MM
           END-IF.
 
           IF  L1640-YYYY-1 NOT = ZEROS
               MOVE L1640-DT-SEPARATOR-SYMBL TO WS-D-SEP-1
               MOVE L1640-YYYY-1        TO WS-D-YYYY
           END-IF.
 
       2400-INT-TO-EXT-D-X.
           EXIT.
      /
      *---------------------
       3000-EXTERNAL-TO-INT.
      *---------------------
 
      ******************************************************************
      ** THIS PARAGRAPH WILL CONVERT A DATE FROM ONE OF THE EXTERNAL
      ** FORMATS INTO THE INTERNAL FORMAT, ACCORDING TO THE PARAMETERS.
      **                 INPUT FIELDS  = L1640-EXTERNAL-DATE
      **                               = L1640-DT-FRMT-CD
      **                               = L1640-DT-SEPARATOR-SYMBL
      **                               = L1640-DT-ZERO-SUPRES-IND
      **                 OUTPUT FIELDS = L1640-INTERNAL-DATE
      ******************************************************************
 
           MOVE WWKDT-ZERO-DT       TO L1640-INTERNAL-DATE.
 
           MOVE L1640-EXTERNAL-DATE TO WS-WORK-DATE.
 
           EVALUATE  TRUE
               WHEN  L1640-DT-FRMT-DDMMMYYYY
                     PERFORM
                       VARYING WS-EDIT-MM FROM 1 BY 1
                         UNTIL WS-EDIT-MM > 12
                            OR WS-MMM(WS-EDIT-MM) = WS-A-MMM
015543                   CONTINUE
                     END-PERFORM
                     IF  WS-EDIT-MM > 12
                         SET L1640-NOT-VALID TO TRUE
                         GO TO 3000-EXTERNAL-TO-INT-X
                     END-IF
                     MOVE WS-A-DD       TO  WS-EDIT-DD-X
                     IF  WS-A-YYYY = SPACES
                     AND L1640-EXTERNAL-TO-INTERNAL-S
                         MOVE ZEROS     TO  WS-EDIT-YYYY
                         SET WS-ALLOW-ZERO-YEAR TO TRUE
                     ELSE
                         MOVE WS-A-YYYY TO  WS-EDIT-YYYY-X
                     END-IF
               WHEN  L1640-DT-FRMT-DMY
                     MOVE WS-B-DD       TO  WS-EDIT-DD-X
                     MOVE WS-B-MM       TO  WS-EDIT-MM-X
                     IF  WS-B-YYYY = SPACES
                     AND L1640-EXTERNAL-TO-INTERNAL-S
                         MOVE ZEROS     TO  WS-EDIT-YYYY
                         SET WS-ALLOW-ZERO-YEAR TO TRUE
                     ELSE
                         MOVE WS-B-YYYY TO  WS-EDIT-YYYY-X
                     END-IF
               WHEN  L1640-DT-FRMT-MDY
                     MOVE WS-C-DD       TO  WS-EDIT-DD-X
                     MOVE WS-C-MM       TO  WS-EDIT-MM-X
                     IF  WS-C-YYYY = SPACES
                     AND L1640-EXTERNAL-TO-INTERNAL-S
                         MOVE ZEROS     TO  WS-EDIT-YYYY
                         SET WS-ALLOW-ZERO-YEAR TO TRUE
                     ELSE
                         MOVE WS-C-YYYY TO  WS-EDIT-YYYY-X
                     END-IF
               WHEN  L1640-DT-FRMT-YMD
                     MOVE WS-D-DD       TO  WS-EDIT-DD-X
                     MOVE WS-D-MM       TO  WS-EDIT-MM-X
                     IF  WS-D-YYYY = SPACES
                     AND L1640-EXTERNAL-TO-INTERNAL-S
                         MOVE ZEROS     TO  WS-EDIT-YYYY
                         SET WS-ALLOW-ZERO-YEAR TO TRUE
                     ELSE
                         MOVE WS-D-YYYY TO  WS-EDIT-YYYY-X
                     END-IF
           END-EVALUATE.
 
           IF  L1640-DT-FRMT-DDMMMYYYY AND
               WS-A-FILLER  NOT = SPACES
               SET L1640-NOT-VALID          TO TRUE
               GO TO 3000-EXTERNAL-TO-INT-X
           END-IF.
 
           PERFORM  8000-EDIT-INTERNAL
               THRU 8000-EDIT-INTERNAL-X.
 
           IF  L1640-NOT-VALID
               GO TO 3000-EXTERNAL-TO-INT-X
           END-IF.
 
           MOVE WS-EDIT-MM          TO L1640-MM-1.
           MOVE WS-EDIT-DD          TO L1640-DD-1.
           MOVE WS-EDIT-YYYY        TO L1640-YYYY-1.
 
       3000-EXTERNAL-TO-INT-X.
           EXIT.
      /
      *-----------------
       5000-DATE-UNPACK.
      *-----------------
 
           MOVE  ZEROS                 TO  WS-COUNT-DIGITS.
           MOVE  L1640-EXTERNAL-DATE   TO  WS-DATE-IN.
           MOVE  SPACES                TO  WS-DATE-OUT.
           PERFORM 5100-DATE-UNPACK-LOOP
              THRU 5100-DATE-UNPACK-LOOP-X
             UNTIL WS-I1 GREATER THAN WS-MAX-LEN
                OR WS-O1 GREATER THAN WS-MAX-LEN.
           PERFORM
             UNTIL WS-I1 GREATER THAN 10
               IF  WS-DT-IN (WS-I1) NOT = SPACE
                   SET L1640-NOT-VALID TO TRUE
               END-IF
               ADD  1                  TO WS-I1
           END-PERFORM.
 
           MOVE  WS-DATE-OUT           TO  L1640-EXTERNAL-DATE.
 
       5000-DATE-UNPACK-X.
           EXIT.
      /
      *----------------------
       5100-DATE-UNPACK-LOOP.
      *----------------------
 
           IF  WS-DT-IN (WS-I1) < '0'
           OR  WS-DT-IN (WS-I1) > '9'
           OR  WS-I1 = WS-MAX-LEN
               MOVE WS-DT-IN (WS-I1)     TO WS-DT-OUT(WS-O1)
               ADD  1                    TO WS-O1
               MOVE ZEROS                TO WS-COUNT-DIGITS
               IF  WS-DT-IN (WS-I1) NOT = L1640-DT-SEPARATOR-SYMBL
               AND WS-I1 NOT = WS-MAX-LEN
                   SET L1640-NOT-VALID             TO TRUE
               END-IF
           ELSE
               ADD  1                    TO WS-COUNT-DIGITS
               IF (WS-DT-IN (WS-I1 + 1) < '0'
               OR  WS-DT-IN (WS-I1 + 1) > '9')
               AND WS-COUNT-DIGITS = 1
                   IF  WS-O1 < WS-MAX-LEN
                       MOVE '0'              TO WS-DT-OUT(WS-O1)
                       MOVE WS-DT-IN (WS-I1) TO WS-DT-OUT(WS-O1 + 1)
                       ADD  2                TO WS-O1
                   ELSE
                       SET L1640-NOT-VALID             TO TRUE
                   END-IF
               ELSE
                   MOVE WS-DT-IN (WS-I1) TO WS-DT-OUT(WS-O1)
                   ADD  1                TO WS-O1
               END-IF
           END-IF.
 
           ADD  1                        TO WS-I1.
 
       5100-DATE-UNPACK-LOOP-X.
           EXIT.
      /
      *---------------
       6000-DATE-PACK.
      *---------------
 
           MOVE  1                     TO  WS-I1.
           MOVE  1                     TO  WS-O1.
           MOVE  +10                   TO  WS-MAX-LEN.
           MOVE  L1640-EXTERNAL-DATE   TO  WS-DATE-IN.
           MOVE  SPACES                TO  WS-DATE-OUT.
           PERFORM 6100-DATE-PACK-LOOP
              THRU 6100-DATE-PACK-LOOP-X
             UNTIL WS-I1 GREATER THAN WS-MAX-LEN.
           MOVE  WS-DATE-OUT           TO  L1640-EXTERNAL-DATE.
 
       6000-DATE-PACK-X.
           EXIT.
      /
      *--------------------
       6100-DATE-PACK-LOOP.
      *--------------------
 
           IF  WS-DT-IN (WS-I1) NOT = SPACES
               MOVE WS-DT-IN (WS-I1)     TO WS-DT-OUT(WS-O1)
               ADD  1                    TO WS-O1
           END-IF.
 
           ADD  1                        TO WS-I1.
 
       6100-DATE-PACK-LOOP-X.
           EXIT.
 
      *-------------------
       8000-EDIT-INTERNAL.
      *-------------------
 
           IF  WS-EDIT-DD-X    IS NOT NUMERIC
           OR  WS-EDIT-MM-X    IS NOT NUMERIC
           OR  WS-EDIT-YYYY-X  IS NOT NUMERIC
               SET L1640-NOT-VALID TO TRUE
               GO TO 8000-EDIT-INTERNAL-X
           END-IF.
 
           IF  NOT WS-EDIT-MM-VALID
           OR  NOT WS-EDIT-DD-VALID
               SET L1640-NOT-VALID TO TRUE
               GO TO 8000-EDIT-INTERNAL-X
           END-IF.
 
           IF  WS-EDIT-YYYY = ZEROS
           AND WS-ALLOW-ZERO-YEAR-NOT
               SET L1640-NOT-VALID TO TRUE
               GO TO 8000-EDIT-INTERNAL-X
           END-IF.
 
005409*    IF  L1640-LEAP-YEAR-VALID
005409*    AND WS-EDIT-YYYY NOT = ZERO
005409*        MOVE L1640-LEAP-YEAR-SW TO LDTLK-LEAP-YEAR-SW
005409*    ELSE
005409*        SET  LDTLK-DO-NOT-USE-LEAP-YEAR TO TRUE
005409*    END-IF.
 
005409*    IF  LDTLK-USE-LEAP-YEAR
005409*        MOVE WS-EDIT-YYYY TO LDTLK-LEAP-YEAR
005409*        PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409*            THRU LEAP-0100-EDIT-LEAP-YEAR-X
005409*        MOVE LDTLK-VALID-SW TO L1640-VALID-SW
005409*        IF  LDTLK-USE-LEAP-YEAR
005409*            MOVE  2         TO LDTLK-LEAP-SUB
005409*        ELSE
005409*            MOVE  1         TO LDTLK-LEAP-SUB
005409*        END-IF
005409*    ELSE
005409*        MOVE  1             TO LDTLK-LEAP-SUB
005409*    END-IF.
 
005409     MOVE WS-EDIT-YYYY TO LDTLK-LEAP-YEAR.
005409     PERFORM  LEAP-0100-EDIT-LEAP-YEAR
005409         THRU LEAP-0100-EDIT-LEAP-YEAR-X.
005409     MOVE LDTLK-VALID-SW TO L1640-VALID-SW.
005409     IF  LDTLK-IS-LEAP-YEAR
005409         MOVE  2         TO LDTLK-LEAP-SUB
005409     ELSE
005409         MOVE  1         TO LDTLK-LEAP-SUB
005409     END-IF.
 
 
           IF  WS-EDIT-DD >
               TDTTB-DAYS-IN-MONTH (WS-EDIT-MM, LDTLK-LEAP-SUB)
               EVALUATE TRUE
               WHEN L1640-EXTERNAL-TO-INTERNAL
               WHEN L1640-EXTERNAL-TO-INTERNAL-S
               WHEN L1640-CTL-CARD-TO-INTERNAL
MP310E         WHEN L1640-MIR-TO-INTERNAL
                    SET L1640-NOT-VALID TO TRUE
                    GO TO 8000-EDIT-INTERNAL-X
               WHEN L1640-INTERNAL-TO-EXTERNAL
               WHEN L1640-INTERNAL-TO-EXTERNAL-S
MP310E         WHEN L1640-INTERNAL-TO-MIR
                   MOVE TDTTB-DAYS-IN-MONTH
                        (WS-EDIT-MM, LDTLK-LEAP-SUB)
                                   TO L1640-DD-1
               END-EVALUATE
           END-IF.
 
       8000-EDIT-INTERNAL-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPPLEAP.
      *****************************************************************
      **                 END OF PROGRAM XSDU1640                     **
      *****************************************************************
