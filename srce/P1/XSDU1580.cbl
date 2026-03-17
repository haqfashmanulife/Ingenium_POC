      **************************
       IDENTIFICATION DIVISION.
      **************************

       PROGRAM-ID. XSDU1580.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSDU1580                                         **
      **  REMARKS:  COMPUTATION ROUTINES FOR TIME CONVERSION UTILITY **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30OCT98  56    CREATED FOR CALCULATION OF DURATION TIME    **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
SESCAP**  13OCR04  AC    FIXED TIME SUBTRACTION PROBLEM              **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU1580'.
 
       COPY SQLCA.
       COPY XCWWWKDT.
 
       01  WS-WORK-AREA.
           05  WS-INT-TIME-1            PIC 9(11)V9(06) COMP-3 VALUE 0.
           05  WS-IO-TIME-2             PIC 9(11)V9(06) COMP-3 VALUE 0.
           05  WS-24HOUR-IN-SEC         PIC 9(05) VALUE 86400.
           05  WS-TIME-INSEC-MILSEC     PIC 9(11)V9(06) COMP-3 VALUE 0.
           05  WS-DUR-TIME-SEC          PIC 9(11) COMP VALUE 0.
           05  WS-IN-DAYS               PIC 9(05) COMP VALUE 0.
           05  WS-IN-HOURS              PIC 9(11) COMP VALUE 0.
           05  WS-IN-MIN                PIC 9(11) COMP VALUE 0.
           05  WS-IN-SEC                PIC 9(11) COMP VALUE 0.
           05  WS-IN-MS                 PIC 9(06) COMP VALUE 0.
           05  WS-MILISEC               PIC V9(06) COMP VALUE 0.
      /
014590*COPY XCWL0030.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWLDTLK.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWL1580.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L1580-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------

           INITIALIZE L1580-OUTPUT-PARM-INFO.
           INITIALIZE L1680-PARM-INFO.
 
           SET L1580-RETRN-OK                 TO TRUE.
 
 
           PERFORM  1000-CONVERT-INPUT-TO-SEC
               THRU 1000-CONVERT-INPUT-TO-SEC-X.
 
           EVALUATE TRUE
 
              WHEN L1580-RQST-TIME-DUR
                   PERFORM  2000-CALC-TIME-DUR
                       THRU 2000-CALC-TIME-DUR-X
 
              WHEN L1580-RQST-ADD
                   PERFORM  3000-TIME-ADDITION
                       THRU 3000-TIME-ADDITION-X
 
              WHEN L1580-RQST-SUBTRACT
                   PERFORM  4000-TIME-SUBTRACTION
                       THRU 4000-TIME-SUBTRACTION-X
 
 
              WHEN OTHER
                 SET L1580-RETRN-INVALID-REQUEST TO TRUE
 
           END-EVALUATE.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *--------------------------
       1000-CONVERT-INPUT-TO-SEC.
      *--------------------------
           MULTIPLY .000001 BY L1580-INT-TS-MS GIVING WS-MILISEC.
           COMPUTE WS-INT-TIME-1 =
                              ( L1580-INT-TS-HR * 3600 ) +
                              ( L1580-INT-TS-MI * 60 ) +
                                L1580-INT-TS-SEC + WS-MILISEC.
SESCAP* ONLY L1580-RQST-TIME-DUR NEEDS THE WS-IO-TIME-2
           IF  L1580-RQST-TIME-DUR
               MULTIPLY .000001 BY L1580-IO-TS-MS  GIVING WS-MILISEC
               COMPUTE WS-IO-TIME-2 =
                              ( L1580-IO-TS-HR * 3600 ) +
                              ( L1580-IO-TS-MI * 60 ) +
                                L1580-IO-TS-SEC + WS-MILISEC
           END-IF.
            
           MULTIPLY .000001 BY L1580-INT-TIME-MS GIVING WS-MILISEC.
           COMPUTE WS-TIME-INSEC-MILSEC =
                              ( L1580-INT-TIME-HR * 3600 ) +
                              ( L1580-INT-TIME-MI * 60 ) +
                                L1580-INT-TIME-SEC + WS-MILISEC.
 
       1000-CONVERT-INPUT-TO-SEC-X.
           EXIT.
      /
      ************************************************************
      * THIS PROCEDURE SUBTRACTS TWO DATES TO CALCULATE A DURATION
      * IN DAYS, HOURS, MIN, SEC, MILISECONDS.
      ************************************************************
      *-------------------
       2000-CALC-TIME-DUR.
      *-------------------
           MOVE L1580-INT-TS-YR             TO L1680-INT-YYYY-1.
           MOVE L1580-INT-TS-MO             TO L1680-INT-MM-1.
           MOVE L1580-INT-TS-DY             TO L1680-INT-DD-1.

           MOVE L1580-IO-TS-YR              TO L1680-INT-YYYY-2.
           MOVE L1580-IO-TS-MO              TO L1680-INT-MM-2.
           MOVE L1580-IO-TS-DY              TO L1680-INT-DD-2.

           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.

           IF L1680-TOTAL-DAYS = 0
               IF WS-INT-TIME-1 > WS-IO-TIME-2
                   COMPUTE L1580-DUR-TIME-IN-SEC =
                        WS-INT-TIME-1 - WS-IO-TIME-2
               ELSE
                   COMPUTE L1580-DUR-TIME-IN-SEC =
                        WS-IO-TIME-2 - WS-INT-TIME-1
               END-IF
           ELSE
               IF L1580-INT-TS < L1580-IO-INT-TS
                   COMPUTE L1580-DUR-TIME-IN-SEC =
                        WS-IO-TIME-2 +
                      ( WS-24HOUR-IN-SEC - WS-INT-TIME-1 ) +
                      ( WS-24HOUR-IN-SEC *  (L1680-TOTAL-DAYS - 1))
               ELSE
                   COMPUTE L1580-DUR-TIME-IN-SEC =
                        WS-INT-TIME-1 +
                      ( WS-24HOUR-IN-SEC - WS-IO-TIME-2 ) +
                      ( WS-24HOUR-IN-SEC *  (L1680-TOTAL-DAYS - 1))
               END-IF
           END-IF.
 
           PERFORM  2100-EXCH-SEC-TO-DD-HH-MM-SS
               THRU 2100-EXCH-SEC-TO-DD-HH-MM-SS-X.
 
       2000-CALC-TIME-DUR-X.
           EXIT.
 
 
      *******************************************************
      * THIS PROCEDURE CONVERTS CALCULATED DURATION TIME INTO
      * DAYS, HOURS, MIN, SEC, MILISECONDS.
      *******************************************************
      *------------------------------
       2100-EXCH-SEC-TO-DD-HH-MM-SS.
      *------------------------------
           MOVE L1580-DUR-TIME-IN-SEC TO WS-MILISEC.
           MULTIPLY WS-MILISEC BY 1000000 GIVING L1580-MI-DUR-MS.
           DIVIDE L1580-DUR-TIME-IN-SEC BY 60 GIVING L1580-MI-DUR-MI
                                            REMAINDER L1580-MI-DUR-SEC.
           DIVIDE L1580-MI-DUR-MI BY 60 GIVING L1580-HR-DUR-HR
                                            REMAINDER L1580-HR-DUR-MI.
           DIVIDE L1580-HR-DUR-HR BY 24 GIVING L1580-DY-DUR-DY
                                            REMAINDER L1580-DY-DUR-HR.
 
           MOVE L1580-HR-DUR-MI           TO L1580-DY-DUR-MI.
           MOVE L1580-MI-DUR-SEC          TO L1580-HR-DUR-SEC
                                          L1580-DY-DUR-SEC.
           MOVE L1580-MI-DUR-MS           TO L1580-HR-DUR-MS
                                          L1580-DY-DUR-MS.
 
       2100-EXCH-SEC-TO-DD-HH-MM-SS-X.
           EXIT.
 
      *********************************************************
      * THIS PROCEDURE ADDS A PERIOD OF TIME TO A POINT IN TIME
      * IN DAYS, HOURS, MIN, SEC, MILISECONDS.
      *********************************************************
      *-------------------
       3000-TIME-ADDITION.
      *-------------------
           COMPUTE L1580-DUR-TIME-IN-SEC =
                      WS-INT-TIME-1 + WS-TIME-INSEC-MILSEC.
 
           PERFORM  2100-EXCH-SEC-TO-DD-HH-MM-SS
               THRU 2100-EXCH-SEC-TO-DD-HH-MM-SS-X.
 
           IF L1580-DY-DUR-DY > 0
              MOVE ZEROS                     TO L1680-NUMBER-OF-YEARS
              MOVE ZEROS                     TO L1680-NUMBER-OF-MONTHS
              MOVE L1580-INT-TS-YR           TO L1680-INT-YYYY-1
              MOVE L1580-INT-TS-MO           TO L1680-INT-MM-1
              MOVE L1580-INT-TS-DY           TO L1680-INT-DD-1
              MOVE L1580-DY-DUR-DY           TO L1680-NUMBER-OF-DAYS
              PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                  THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
              MOVE L1680-INT-YYYY-2          TO L1580-IO-TS-YR
              MOVE L1680-INT-MM-2            TO L1580-IO-TS-MO
              MOVE L1680-INT-DD-2            TO L1580-IO-TS-DY
           ELSE
              MOVE L1680-INT-YYYY-1          TO L1580-IO-TS-YR
              MOVE L1680-INT-MM-1            TO L1580-IO-TS-MO
              MOVE L1680-INT-DD-1            TO L1580-IO-TS-DY
           END-IF.
 
           MOVE L1580-DY-DUR-HR              TO L1580-IO-TS-HR.
           MOVE L1580-HR-DUR-MI              TO L1580-IO-TS-MI.
           MOVE L1580-MI-DUR-SEC             TO L1580-IO-TS-SEC.
           MOVE L1580-MI-DUR-MS              TO L1580-IO-TS-MS.
 
       3000-TIME-ADDITION-X.
           EXIT.
      /
 
      ****************************************************************
      * THIS PROCEDURE SUBTRACTS A PERIOD OF TIME FROM A POINT IN TIME
      * IN DAYS, HOURS, MIN, SEC, MILISECONDS.
      ****************************************************************
      *----------------------
       4000-TIME-SUBTRACTION.
      *----------------------
SESCAP* COMMENT OUT THE WRONG 'IF' CONDITION  
SESCAP*
SESCAP*    IF WS-INT-TIME-1 >= WS-TIME-INSEC-MILSEC
SESCAP*        COMPUTE L1580-DUR-TIME-IN-SEC =
SESCAP*                WS-INT-TIME-1 - WS-TIME-INSEC-MILSEC
SESCAP*        MOVE L1580-INT-TS-YR       TO L1580-IO-TS-YR
SESCAP*        MOVE L1580-INT-TS-MO       TO L1580-IO-TS-MO
SESCAP*        MOVE L1580-INT-TS-DY       TO L1580-IO-TS-DY
SESCAP*    ELSE
           PERFORM  4100-CONVERT-TIME-TO-DAYS
               THRU 4100-CONVERT-TIME-TO-DAYS-X.
           IF WS-TIME-INSEC-MILSEC > WS-INT-TIME-1
              ADD +1     TO WS-IN-DAYS GIVING L1580-DY-DUR-DY
              COMPUTE L1580-DUR-TIME-IN-SEC =
                   ( L1580-DY-DUR-DY * WS-24HOUR-IN-SEC ) +
                   ( WS-24HOUR-IN-SEC - ( WS-TIME-INSEC-MILSEC -
                     WS-INT-TIME-1 ))
           ELSE
              MOVE WS-IN-DAYS          TO L1580-DY-DUR-DY
              COMPUTE L1580-DUR-TIME-IN-SEC =
                    ( L1580-DY-DUR-DY * WS-24HOUR-IN-SEC ) +
                    ( WS-INT-TIME-1 - WS-TIME-INSEC-MILSEC )
           END-IF.
           MOVE L1580-INT-TS-YR        TO L1680-INT-YYYY-1.
           MOVE L1580-INT-TS-MO        TO L1680-INT-MM-1.
           MOVE L1580-INT-TS-DY        TO L1680-INT-DD-1.
           MOVE L1580-DY-DUR-DY        TO L1680-NUMBER-OF-DAYS.
           MOVE ZEROS                  TO L1680-NUMBER-OF-YEARS.
           MOVE ZEROS                  TO L1680-NUMBER-OF-MONTHS.
           PERFORM  1680-4000-SUB-YMD-FROM-DATE
               THRU 1680-4000-SUB-YMD-FROM-DATE-X.
           MOVE L1680-INT-YYYY-2       TO L1580-IO-TS-YR
           MOVE L1680-INT-MM-2         TO L1580-IO-TS-MO
           MOVE L1680-INT-DD-2         TO L1580-IO-TS-DY
 
SESCAP*    END-IF.
 
           PERFORM  2100-EXCH-SEC-TO-DD-HH-MM-SS
               THRU 2100-EXCH-SEC-TO-DD-HH-MM-SS-X.
 
           MOVE L1580-DY-DUR-HR        TO L1580-IO-TS-HR.
           MOVE L1580-HR-DUR-MI        TO L1580-IO-TS-MI.
           MOVE L1580-MI-DUR-SEC       TO L1580-IO-TS-SEC.
           MOVE L1580-MI-DUR-MS        TO L1580-IO-TS-MS.
 
       4000-TIME-SUBTRACTION-X.
           EXIT.
      /
      *-------------------------
       4100-CONVERT-TIME-TO-DAYS.
      *-------------------------
           MOVE ZEROS TO WS-MILISEC.
           MOVE WS-TIME-INSEC-MILSEC TO WS-MILISEC.
           MULTIPLY WS-MILISEC BY 1000000 GIVING WS-IN-MS.
           DIVIDE WS-TIME-INSEC-MILSEC BY 60 GIVING WS-IN-MIN
                                          REMAINDER WS-IN-SEC.
           DIVIDE WS-IN-MIN BY 60 GIVING WS-IN-HOURS
                                          REMAINDER WS-IN-MIN.
           DIVIDE WS-IN-HOURS          BY 24 GIVING WS-IN-DAYS
                                          REMAINDER WS-IN-HOURS.
           COMPUTE WS-TIME-INSEC-MILSEC = WS-TIME-INSEC-MILSEC -
                               ( WS-IN-DAYS * WS-24HOUR-IN-SEC ).
 
       4100-CONVERT-TIME-TO-DAYS-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCPL1680.
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM XSDU1580                     **
      *****************************************************************
