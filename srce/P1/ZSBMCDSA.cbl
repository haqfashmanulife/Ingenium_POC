      *****************************************************************
      **  MEMBER :  ZSBMCDSA                                         **
      **  REMARKS:  CREATES CSV AMOUNT RECORD IN CDSA TABLE          **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
M142S2**  09DEC11  CTS    INITIAL VERSION                            **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMCDSA.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.


           SELECT CDSA-DATA-FILE ASSIGN TO ZSCDSA
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCDSA-SEQ-FILE-STATUS.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       FD  CDSA-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCDSA-SEQ-REC-INFO.
           05  FILLER                    PIC X(01).
           05  RCDSA-POL-ID              PIC X(10).
           05  FILLER                    PIC X(01).
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCDSA'.
      /
       COPY SQLCA.
      /

       01  WS-MISC-AREA.
           05  WS-POL-ID                             PIC X(10).
           05  WS-FA-REDC-REC-IND                    PIC X(01).
               88  WS-FA-REDC-REC-YES                VALUE 'Y'.
               88  WS-FA-REDC-REC-NO                 VALUE 'N'.
           05  WS-SURR-REC-IND                       PIC X(01).
               88  WS-SURR-REC-YES                   VALUE 'Y'.
               88  WS-SURR-REC-NO                    VALUE 'N'.
           05  WS-CDA-TYP-CD                         PIC X(01).
               88  WS-CDA-TYP-WITHDRAWAL             VALUE 'W'.
               88  WS-CDA-TYP-SURR-TRMN              VALUE 'S'.
               88  WS-CDA-TYP-LAPS-TRMN              VALUE 'K'.
           05  WS-TH-REC-FIND-IND                    PIC X(01).
               88  WS-TH-REC-FIND                    VALUE 'Y'.
               88  WS-TH-REC-NFIND                   VALUE 'N'.
           05  WS-CSV-PAYO-AMT                       PIC S9(13)V9(02)
                                                     COMP-3.
           05  WS-CALC-CSV-AMT                       PIC S9(13)V9(02)
                                                     COMP-3.
           05  WS-OLD-FA-CSV-AMT                     PIC S9(13)V9(02)
                                                     COMP-3.
           05  WS-NEW-FA-CSV-AMT                     PIC S9(13)V9(02)
                                                     COMP-3.
           05  WS-CVG-FACE-AMT                       PIC S9(13)V9(02)
                                                     COMP-3.
           05  WS-POL-MPREM-AMT                      PIC S9(13)V9(02)
                                                     COMP-3.
           05  WS-ISS-EFF-DT.
               10  WS-ISS-EFF-DT-YR                  PIC 9(04).
               10  FILLER                            PIC X(01).
               10  WS-ISS-EFF-DT-MO                  PIC 9(02).
               10  FILLER                            PIC X(01).
               10  WS-ISS-EFF-DT-DY                  PIC 9(02).
           05  WS-EFF-DT.
               10  WS-EFF-DT-YR                      PIC 9(04).
               10  FILLER                            PIC X(01).
               10  WS-EFF-DT-MO                      PIC 9(02).
               10  FILLER                            PIC X(01).
               10  WS-EFF-DT-DY                      PIC 9(02).
           05  WS-TEMP-DT.
               10  WS-TEMP-DT-YR                     PIC 9(04).
               10  FILLER                            PIC X(01).
               10  WS-TEMP-DT-MO                     PIC 9(02).
               10  FILLER                            PIC X(01).
               10  WS-TEMP-DT-DY                     PIC 9(02).
           05  WS-PREV-ANN-DT                        PIC X(10).
           05  WS-NXT-ANN-DT                         PIC X(10).
           05  WS-NUMBER-OF-YEARS                    PIC 9(04).
           05  WS-INPUT-POL-COUNT                    PIC 9(08) VALUE 0.
           05  WS-FA-REDC-PHST-COUNT                 PIC 9(08) VALUE 0.
           05  WS-FA-REDC-CDSA-COUNT                 PIC 9(08) VALUE 0.
           05  WS-SURR-PHST-COUNT                    PIC 9(08) VALUE 0.
           05  WS-SURR-CDSA-COUNT                    PIC 9(08) VALUE 0.
           05  WS-COMMIT-POL-COUNT                   PIC 9(08) VALUE 0.

       01  WCDSA-SEQ-IO-WORK-AREA.
           05  WCDSA-SEQ-FILE-NAME                   PIC X(04)
                                                     VALUE 'CDSA'.
           05  WCDSA-SEQ-IO-COMMAND                  PIC X(02).
           05  WCDSA-SEQ-FILE-STATUS                 PIC X(02).
           05  WCDSA-SEQ-IO-STATUS                   PIC 9(01).
               88  WCDSA-SEQ-IO-OK                   VALUE 0.
               88  WCDSA-SEQ-IO-NOT-FOUND            VALUE 7.
               88  WCDSA-SEQ-IO-EOF                  VALUE 8.
               88  WCDSA-SEQ-IO-ERROR                VALUE 9.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       COPY XCWWWKDT.
      /
       COPY CCWWINDX.
      /
       COPY CCWWFRMT.
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFRPHST.
       COPY CCFWPHS3.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWPH.
       COPY CCFRPH.
      /
       COPY CCFWTH.
       COPY CCFRTH.
      /
       COPY SCFWFA.
       COPY SCFRFA.
      /
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCWWCVGS.
      /
       COPY XCSWOCF.
       COPY XCSROCF.

      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0035.
      /
       COPY XCWL0040.
      /
       COPY XCWL1680.
      /
       COPY XCWL1670.
      /
       COPY XCWL0280.
      /
       COPY XCWL1660.
      /
       COPY CCWL2600.
      /
       COPY CCWL0182.
      /
       COPY CCWL9300.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
       COPY CCWLPGA.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

           PERFORM  2000-PRCES-INPUT-RECORDS
               THRU 2000-PRCES-INPUT-RECORDS-X
               UNTIL WCDSA-SEQ-IO-EOF.

           PERFORM  4000-DISPLAY-TOTALS
               THRU 4000-DISPLAY-TOTALS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                        TO WCDSA-SEQ-IO-STATUS.

           OPEN INPUT CDSA-DATA-FILE.

           IF  WCDSA-SEQ-FILE-STATUS  NOT = ZERO
               PERFORM  9700-HANDLE-ERROR
                   THRU 9700-HANDLE-ERROR-X
           END-IF.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE WPGWS-CRNT-PGM-ID           TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.


           INITIALIZE WS-MISC-AREA.

           PERFORM  0010-0000-INIT-PARM-INFO
               THRU 0010-0000-INIT-PARM-INFO-X.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

      ***  GET THE SYSTEM ID ***
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

      *** GET THE PROGRAM DESCRIPTION ***
           MOVE 'ZSCDSA0001'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-PROGRAM-DESC.

           MOVE ZERO                        TO L0040-ERROR-CNT.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE 'ZSBMCDSA'                  TO WGLOB-USER-ID.

           INITIALIZE WS-INPUT-POL-COUNT.

           PERFORM  9500-CDSA-READ
               THRU 9500-CDSA-READ-X.

           IF NOT WCDSA-SEQ-IO-OK
      *MSG: NO RECORDS TO PROCESS
               MOVE 'ZSCDSA0002'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       1000-INITIALIZE-X.
           EXIT.
      /
      *-------------------------
       2000-PRCES-INPUT-RECORDS.
      *-------------------------

           ADD +1                           TO WS-INPUT-POL-COUNT.
           ADD +1                           TO WS-COMMIT-POL-COUNT.

           MOVE RCDSA-POL-ID                TO WS-POL-ID.
           MOVE WS-POL-ID                   TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF  NOT WPOL-IO-OK
               PERFORM  9500-CDSA-READ
                   THRU 9500-CDSA-READ-X
               GO TO 2000-PRCES-INPUT-RECORDS-X
           END-IF.

           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

      *MSG: PROCESSING POLICY NO (@1)
           MOVE 'ZSCDSA0003'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-POL-ID                   TO WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.


           SET WS-FA-REDC-REC-NO            TO TRUE.
           SET WS-SURR-REC-NO               TO TRUE.

           PERFORM
               VARYING I FROM 1 BY 1
               UNTIL I > RPOL-POL-CVG-REC-CTR-N
               IF  WCVGS-FACE-CHNG-EFF-DT (I) NOT = WWKDT-ZERO-DT
                   SET WS-FA-REDC-REC-YES   TO TRUE
               END-IF
               IF  WCVGS-CVG-STAT-SURRENDERED (I)
               OR  WCVGS-CVG-STAT-LAPSED (I)
               OR  (WCVGS-CVG-STAT-EXPIRED (I)
               AND (WCVGS-MAT-XPRY-REASN-SW-HOSP (I)
               OR  WCVGS-MAT-XPRY-REASN-SW-TRMN (I) ))
                   SET WS-SURR-REC-YES      TO TRUE
               END-IF
           END-PERFORM.

           IF  WS-FA-REDC-REC-YES
               PERFORM  2100-FA-REDC-PHST-BROWSE
                   THRU 2100-FA-REDC-PHST-BROWSE-X
               PERFORM  3500-SW-REDC-PHST-BROWSE
                   THRU 3500-SW-REDC-PHST-BROWSE-X
           END-IF.

           IF  WS-SURR-REC-YES
               PERFORM  2900-SURR-PHST-BROWSE
                   THRU 2900-SURR-PHST-BROWSE-X
           END-IF.

           IF  WS-COMMIT-POL-COUNT >= 5000
               MOVE ZEROES                  TO WS-COMMIT-POL-COUNT
               PERFORM  0035-1000-COMMIT
                   THRU 0035-1000-COMMIT-X
      *MSG: LAST COMMITED POLICY NO (@1)
               MOVE 'ZSCDSA0012'            TO WGLOB-MSG-REF-INFO
               MOVE WS-POL-ID               TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  9500-CDSA-READ
               THRU 9500-CDSA-READ-X.

       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *-------------------------
       2100-FA-REDC-PHST-BROWSE.
      *-------------------------

      * BROWSE & FETCH FA REDUCTION & SURRENDER RECORD IN PHST TABLE
           MOVE LOW-VALUES                  TO WPHS3-KEY.
           MOVE HIGH-VALUES                 TO WPHS3-ENDBR-KEY.
           MOVE WS-POL-ID                   TO WPHS3-POL-ID.
           MOVE '2010'                      TO WPHS3-POL-ACTV-TYP-ID.
           MOVE 'A'                         TO WPHS3-PCHST-STAT-CD.
           MOVE WWKDT-HIGH-DT               TO WPHS3-PCHST-EFF-DT.
           MOVE WPHS3-KEY                   TO WPHS3-ENDBR-KEY.
           MOVE WWKDT-LOW-DT                TO WPHS3-ENDBR-PCHST-EFF-DT.

           PERFORM  PHS3-1000-BROWSE-PREV
               THRU PHS3-1000-BROWSE-PREV-X.

           IF NOT WPHS3-IO-OK
      *MSG: ERROR WHILE BROWSING POLICY CHANGE HISTORY
               MOVE 'ZSCDSA0004'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2100-FA-REDC-PHST-BROWSE-X
           END-IF.

           PERFORM  PHS3-2000-READ-PREV
               THRU PHS3-2000-READ-PREV-X.

           PERFORM  2200-GET-FA-REDC-PHST
               THRU 2200-GET-FA-REDC-PHST-X
               UNTIL NOT WPHS3-IO-OK.

           PERFORM  PHS3-3000-END-BROWSE-PREV
               THRU PHS3-3000-END-BROWSE-PREV-X.

       2100-FA-REDC-PHST-BROWSE-X.
           EXIT.
      /
      *----------------------
       2200-GET-FA-REDC-PHST.
      *----------------------

           ADD +1                           TO WS-FA-REDC-PHST-COUNT.

           MOVE RPHST-CVG-NUM-N             TO I.

           PERFORM  PLIN-1000-PLAN-HEADER-IN
               THRU PLIN-1000-PLAN-HEADER-IN-X.

           IF  NOT WPH-IO-OK
               PERFORM  PHS3-2000-READ-PREV
                   THRU PHS3-2000-READ-PREV-X
               GO TO 2200-GET-FA-REDC-PHST-X
           END-IF.

           IF  RPH-CSV-CALC-MTHD-GCSV
               PERFORM  2300-FA-REDC-CSV
                   THRU 2300-FA-REDC-CSV-X
           END-IF.

           PERFORM  PHS3-2000-READ-PREV
               THRU PHS3-2000-READ-PREV-X.

       2200-GET-FA-REDC-PHST-X.
           EXIT.
      /
      *-----------------
       2300-FA-REDC-CSV.
      *-----------------

           MOVE ZEROES                      TO WS-CALC-CSV-AMT.
           MOVE ZEROES                      TO WS-CSV-PAYO-AMT.
           MOVE ZEROES                      TO WS-OLD-FA-CSV-AMT.
           MOVE ZEROES                      TO WS-NEW-FA-CSV-AMT.

           PERFORM  2400-CALC-ANNV-DATES
               THRU 2400-CALC-ANNV-DATES-X.

           PERFORM  2600-CALC-OLD-FA-CSV
               THRU 2600-CALC-OLD-FA-CSV-X.

           PERFORM  2700-CALC-NEW-FA-CSV
               THRU 2700-CALC-NEW-FA-CSV-X.

           COMPUTE WS-CSV-PAYO-AMT = WS-OLD-FA-CSV-AMT
                                   - WS-NEW-FA-CSV-AMT.

           IF  WS-CSV-PAYO-AMT > ZEROES
               SET WS-CDA-TYP-WITHDRAWAL    TO TRUE
               PERFORM  2800-WRITE-CDSA-REC
                   THRU 2800-WRITE-CDSA-REC-X

      *MSG: WITHDRAWAL RECORD CREATED FOR CVG(@1) WITH EFF. DATE (@2)
               MOVE 'ZSCDSA0005'            TO WGLOB-MSG-REF-INFO
               MOVE RPHST-CVG-NUM           TO WGLOB-MSG-PARM (1)
               MOVE RPHST-PCHST-EFF-DT      TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               ADD +1                       TO WS-FA-REDC-CDSA-COUNT

           END-IF.

       2300-FA-REDC-CSV-X.
           EXIT.
      /
      *---------------------
       2400-CALC-ANNV-DATES.
      *---------------------

           MOVE WCVGS-CVG-ISS-EFF-DT (I)    TO WS-ISS-EFF-DT.
           MOVE RPHST-PCHST-EFF-DT          TO WS-EFF-DT.
           MOVE WS-EFF-DT                   TO WS-TEMP-DT.

           IF  RPOL-POL-INS-TYP-TRAD
               PERFORM  3300-GET-PD-TO-DT
                   THRU 3300-GET-PD-TO-DT-X
           END-IF.

           IF  RPOL-POL-INS-TYP-UL
               MOVE RPOL-POL-ISS-EFF-DT-DY  TO WS-TEMP-DT-DY
           END-IF.

           IF  WS-EFF-DT > WS-TEMP-DT
               MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
               MOVE +1                      TO L1680-NUMBER-OF-MONTHS
               MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
               MOVE WS-TEMP-DT              TO L1680-INTERNAL-1

               PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                   THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
               MOVE L1680-INTERNAL-2        TO WS-EFF-DT
           ELSE
               MOVE WS-TEMP-DT              TO WS-EFF-DT
           END-IF.


           COMPUTE WS-NUMBER-OF-YEARS
                     = WS-EFF-DT-YR - WS-ISS-EFF-DT-YR.
           MOVE WS-NUMBER-OF-YEARS          TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                        TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.
           MOVE WS-ISS-EFF-DT               TO L1680-INTERNAL-1.

           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2            TO L1680-INTERNAL-1.
           MOVE L1680-INTERNAL-2            TO WS-PREV-ANN-DT.

           MOVE WS-EFF-DT                   TO L1680-INTERNAL-2.

           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.

           IF  L1680-TOTAL-DAYS < ZERO
               COMPUTE WS-NUMBER-OF-YEARS
                         = WS-NUMBER-OF-YEARS - 1
               MOVE WS-NUMBER-OF-YEARS      TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
               MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
               MOVE WS-ISS-EFF-DT           TO L1680-INTERNAL-1
               PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                   THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
               MOVE L1680-INTERNAL-2        TO L1680-INTERNAL-1
               MOVE L1680-INTERNAL-2        TO WS-PREV-ANN-DT
           END-IF.

           COMPUTE WS-NUMBER-OF-YEARS
                     = WS-NUMBER-OF-YEARS + 1
           MOVE WS-NUMBER-OF-YEARS          TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                        TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.
           MOVE WS-ISS-EFF-DT               TO L1680-INTERNAL-1.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.

           MOVE L1680-INTERNAL-2            TO WS-NXT-ANN-DT.

       2400-CALC-ANNV-DATES-X.
           EXIT.
      /
      *----------------------
       2500-PERFORM-CSV-CALC.
      *----------------------

           MOVE ZEROES                      TO WS-CALC-CSV-AMT.

           PERFORM  9300-1000-BUILD-PARM-INFO
               THRU 9300-1000-BUILD-PARM-INFO-X.

           MOVE I                           TO  L9300-CVG.
           MOVE WS-EFF-DT                   TO  L9300-EFF-DT.
           MOVE WS-PREV-ANN-DT              TO  L9300-CVG-PREV-ANN-DT.
           MOVE WS-NXT-ANN-DT               TO  L9300-CVG-NXT-ANN-DT.
           MOVE ZEROES                      TO  L9300-LOW-DUR.


           IF  WCVGS-CVG-UNIT-VALU-AMT (I) = ZEROES
               MOVE ZEROES                  TO L9300-UNIT-QTY
           ELSE
               COMPUTE L9300-UNIT-QTY = WS-CVG-FACE-AMT
                                      / WCVGS-CVG-UNIT-VALU-AMT (I)
           END-IF.
           PERFORM  9300-1000-CALC-TBL-GCSV
               THRU 9300-1000-CALC-TBL-GCSV-X.

           IF  NOT L9300-RETRN-OK
               GO TO 2500-PERFORM-CSV-CALC-X
           END-IF.

           IF  (L9300-CVG-CV-AMT + L9300-CVG-PURE-CV-AMT) > 0
               COMPUTE WS-CALC-CSV-AMT =  L9300-CVG-CV-AMT
                                       + L9300-CVG-PURE-CV-AMT

           END-IF.

       2500-PERFORM-CSV-CALC-X.
           EXIT.
      /
      *---------------------
       2600-CALC-OLD-FA-CSV.
      *---------------------

           MOVE RPHST-PCHST-OLD-VALU-TXT    TO L0280-INPUT-DATA

           MOVE 2                           TO L0280-PRECISION
           MOVE 'N'                         TO L0280-SIGN-IND
           MOVE LENGTH OF WFRMT-2010-D1
                                            TO L0280-INPUT-SIZE
           COMPUTE L0280-LENGTH = L0280-INPUT-SIZE
                                - L0280-PRECISION
                                -  1
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X
           IF  L0280-OK
               MOVE L0280-OUTPUT-DOLLAR     TO WS-CVG-FACE-AMT
           ELSE
               MOVE ZEROES                  TO WS-CVG-FACE-AMT
           END-IF.

           PERFORM  2500-PERFORM-CSV-CALC
               THRU 2500-PERFORM-CSV-CALC-X.

           MOVE WS-CALC-CSV-AMT             TO WS-OLD-FA-CSV-AMT.

       2600-CALC-OLD-FA-CSV-X.
           EXIT.
      /
      *---------------------
       2700-CALC-NEW-FA-CSV.
      *---------------------

           MOVE RPHST-PCHST-NEW-VALU-TXT    TO L0280-INPUT-DATA

           MOVE 2                           TO L0280-PRECISION
           MOVE 'N'                         TO L0280-SIGN-IND
           MOVE LENGTH OF WFRMT-2010-D1
                                            TO L0280-INPUT-SIZE
           COMPUTE L0280-LENGTH = L0280-INPUT-SIZE
                                - L0280-PRECISION
                                -  1
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X
           IF  L0280-OK
               MOVE L0280-OUTPUT-DOLLAR     TO WS-CVG-FACE-AMT
           ELSE
               MOVE ZEROES                  TO WS-CVG-FACE-AMT
           END-IF.

           PERFORM  2500-PERFORM-CSV-CALC
               THRU 2500-PERFORM-CSV-CALC-X.

           MOVE WS-CALC-CSV-AMT             TO WS-NEW-FA-CSV-AMT.

       2700-CALC-NEW-FA-CSV-X.
           EXIT.
      /
      *--------------------
       2800-WRITE-CDSA-REC.
      *--------------------

      * CALL CSLU2600 TO WRITE CDSA FOR THE WITHDRAWAL

           PERFORM  2600-1000-BUILD-PARM-INFO
               THRU 2600-1000-BUILD-PARM-INFO-X.

           MOVE RPOL-POL-ID                 TO L2600-POL-ID.
           MOVE RPHST-CVG-NUM-N             TO L2600-CVG-NUM-N.
           MOVE WS-CDA-TYP-CD               TO L2600-CDA-TYP-CD.
           MOVE RPHST-PCHST-EFF-DT          TO L2600-CDA-EFF-DT.
           SET L2600-CDA-STAT-ACTIVE        TO TRUE.
           SET L2600-CDA-CREAT-BY-SYSTEM    TO TRUE.
           MOVE WS-CSV-PAYO-AMT             TO L2600-CDA-TOT-TRXN-AMT.

           PERFORM  2600-1000-WRITE-CDSA
               THRU 2600-1000-WRITE-CDSA-X.

       2800-WRITE-CDSA-REC-X.
           EXIT.
      /
      *----------------------
       2900-SURR-PHST-BROWSE.
      *----------------------

      * BROWSE & FETCH FA REDUCTION & SURRENDER RECORD IN PHST TABLE
           MOVE LOW-VALUES                  TO WPHS3-KEY.
           MOVE HIGH-VALUES                 TO WPHS3-ENDBR-KEY.
           MOVE WS-POL-ID                   TO WPHS3-POL-ID.
           MOVE '3003'                      TO WPHS3-POL-ACTV-TYP-ID.
           MOVE 'O'                         TO WPHS3-PCHST-STAT-CD.
           MOVE WWKDT-HIGH-DT               TO WPHS3-PCHST-EFF-DT.
           MOVE WPHS3-KEY                   TO WPHS3-ENDBR-KEY.
           MOVE WWKDT-LOW-DT                TO WPHS3-ENDBR-PCHST-EFF-DT.

           PERFORM  PHS3-1000-BROWSE-PREV
               THRU PHS3-1000-BROWSE-PREV-X.

           IF NOT WPHS3-IO-OK
      *MSG: ERROR WHILE BROWSING POLICY CHANGE HISTORY
               MOVE 'ZSCDSA0004'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2900-SURR-PHST-BROWSE-X
           END-IF.

           PERFORM  PHS3-2000-READ-PREV
               THRU PHS3-2000-READ-PREV-X.

           PERFORM  3000-GET-SURR-PHST
               THRU 3000-GET-SURR-PHST-X
               UNTIL NOT WPHS3-IO-OK.

           PERFORM  PHS3-3000-END-BROWSE-PREV
               THRU PHS3-3000-END-BROWSE-PREV-X.

       2900-SURR-PHST-BROWSE-X.
           EXIT.
      /
      *-------------------
       3000-GET-SURR-PHST.
      *-------------------

           ADD +1                           TO WS-SURR-PHST-COUNT.
           MOVE ZEROES                      TO WS-CALC-CSV-AMT.
           MOVE ZEROES                      TO WS-CSV-PAYO-AMT.

           MOVE RPHST-CVG-NUM-N             TO I.

           IF  I = ZEROES
               PERFORM  PHS3-2000-READ-PREV
                   THRU PHS3-2000-READ-PREV-X
               GO TO 3000-GET-SURR-PHST-X
           END-IF.

           IF  RPHST-PCHST-OLD-VALU-TXT = '1'

           AND ((WCVGS-CVG-STAT-SURRENDERED (I)
           AND RPHST-PCHST-NEW-VALU-TXT = 'E')

           OR  (WCVGS-CVG-STAT-LAPSED (I)
           AND RPHST-PCHST-NEW-VALU-TXT = 'B')

           OR  (WCVGS-CVG-STAT-EXPIRED (I)
           AND RPHST-PCHST-NEW-VALU-TXT = 'H'
           AND (WCVGS-MAT-XPRY-REASN-SW-HOSP (I)
           OR  WCVGS-MAT-XPRY-REASN-SW-TRMN (I)) ))

               CONTINUE
           ELSE
               PERFORM  PHS3-2000-READ-PREV
                   THRU PHS3-2000-READ-PREV-X
               GO TO 3000-GET-SURR-PHST-X
           END-IF.

           IF  (RPOL-POL-BASE-CVG-NUM = I
           AND NOT RPOL-POL-INS-TYP-TRAD)
               PERFORM  3100-BASE-CVG-SURR-CSV
                   THRU 3100-BASE-CVG-SURR-CSV-X
           ELSE

               PERFORM  PLIN-1000-PLAN-HEADER-IN
                   THRU PLIN-1000-PLAN-HEADER-IN-X

               IF  NOT WPH-IO-OK
                   PERFORM  PHS3-2000-READ-PREV
                       THRU PHS3-2000-READ-PREV-X
                   GO TO 3000-GET-SURR-PHST-X
               END-IF

               IF  RPH-CSV-CALC-MTHD-GCSV
                   PERFORM  3200-UL-CVG-SURR-CSV
                       THRU 3200-UL-CVG-SURR-CSV-X
               END-IF
           END-IF.

           IF  WCVGS-CVG-INS-TYP-SEG-FUND (I)
               PERFORM  3400-CALC-SEG-FUND-CSV
                   THRU 3400-CALC-SEG-FUND-CSV-X
           END-IF.

           MOVE WS-CALC-CSV-AMT             TO WS-CSV-PAYO-AMT.

           IF  WS-CSV-PAYO-AMT > ZEROES
               SET WS-CDA-TYP-SURR-TRMN     TO TRUE
               IF  WCVGS-CVG-STAT-LAPSED (I)
               OR  RPOL-POL-STAT-LAPSED
                   SET WS-CDA-TYP-LAPS-TRMN TO TRUE
               END-IF
               PERFORM  2800-WRITE-CDSA-REC
                   THRU 2800-WRITE-CDSA-REC-X

      *MSG: SURRENDER RECORD CREATED FOR CVG(@1) WITH EFF. DATE (@2)
               MOVE 'ZSCDSA0006'            TO WGLOB-MSG-REF-INFO
               MOVE RPHST-CVG-NUM           TO WGLOB-MSG-PARM (1)
               MOVE RPHST-PCHST-EFF-DT      TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               ADD +1                       TO WS-SURR-CDSA-COUNT
           END-IF.

           PERFORM  PHS3-2000-READ-PREV
               THRU PHS3-2000-READ-PREV-X.

       3000-GET-SURR-PHST-X.
           EXIT.
      /
      *-----------------------
       3100-BASE-CVG-SURR-CSV.
      *-----------------------

           MOVE ZEROES                      TO WS-CALC-CSV-AMT.

           PERFORM  0182-1000-BUILD-PARM-INFO
               THRU 0182-1000-BUILD-PARM-INFO-X.

           MOVE RPHST-PCHST-EFF-DT          TO L0182-EFF-DT.
           SET L0182-CALC-IF-TERMINATED     TO TRUE.
           SET L0182-CALC-RESERVE           TO TRUE.
           SET L0182-PRCES-PLGR-EDITS-YES   TO TRUE.
           MOVE 'N'                         TO L0182-TRMNL-DIV-CALC-IND.
           MOVE ZEROES                      TO WS-POL-MPREM-AMT.

           IF  RPOL-POL-UL-PRCES-DT = L0182-EFF-DT
               PERFORM  3600-CHK-GRACE-POL
                   THRU 3600-CHK-GRACE-POL-X
           END-IF.

           IF  WCVGS-MAT-XPRY-REASN-JOINT (I)
               SET L0182-CALC-ESC-NO        TO TRUE
           END-IF.

           MOVE I                           TO L0182-CVG.

           PERFORM  0182-2000-CALC-CSV-CVG
               THRU 0182-2000-CALC-CSV-CVG-X.

           IF  NOT L0182-RETRN-OK
               GO TO 3100-BASE-CVG-SURR-CSV-X
           END-IF.

           IF  (L0182-CVG-ACUM-VALU-AMT (I) < WS-POL-MPREM-AMT
           AND WS-POL-MPREM-AMT NOT = ZEROES )
           OR  WCVGS-MAT-XPRY-REASN-JOINT (I)
               COMPUTE WS-CALC-CSV-AMT =  L0182-CVG-ACUM-VALU-AMT (I)
                                       -  L0182-CVG-SURR-CHRG-AMT (I)
           ELSE
               MOVE L0182-CVG-CSV-AMT (I)   TO WS-CALC-CSV-AMT
           END-IF.

           IF  RPOL-POL-STAT-LAPSED
               MOVE L0182-CVG-ACUM-VALU-AMT (I)
                                            TO WS-CALC-CSV-AMT
           END-IF.

       3100-BASE-CVG-SURR-CSV-X.
           EXIT.
      /
      *---------------------
       3200-UL-CVG-SURR-CSV.
      *---------------------

           PERFORM  2400-CALC-ANNV-DATES
               THRU 2400-CALC-ANNV-DATES-X.

           MOVE WCVGS-CVG-FACE-AMT (I)      TO WS-CVG-FACE-AMT.

           PERFORM  2500-PERFORM-CSV-CALC
               THRU 2500-PERFORM-CSV-CALC-X.

       3200-UL-CVG-SURR-CSV-X.
           EXIT.
      /
      *------------------
       3300-GET-PD-TO-DT.
      *------------------

           MOVE HIGH-VALUES                 TO WTH-KEY.
           MOVE LOW-VALUES                  TO WTH-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WTH-POL-ID.
           MOVE WS-EFF-DT                   TO WTH-PREM-PD-DT-NUM.
           MOVE ZEROES                      TO WTH-PREM-PD-DT-NUM-DY.
           MOVE RPOL-POL-ID                 TO WTH-ENDBR-POL-ID.
           MOVE WWKDT-LOW-DT                TO WTH-ENDBR-PREM-PD-DT-NUM.

           PERFORM  TH-1000-BROWSE-PREV
               THRU TH-1000-BROWSE-PREV-X.

           IF  NOT WTH-IO-OK
               GO TO 3300-GET-PD-TO-DT-X
           END-IF.

           PERFORM  TH-2000-READ-PREV
               THRU TH-2000-READ-PREV-X.

           IF  NOT WTH-IO-OK
               PERFORM  TH-3000-END-BROWSE-PREV
                   THRU TH-3000-END-BROWSE-PREV-X
               GO TO 3300-GET-PD-TO-DT-X
           END-IF.

           SET WS-TH-REC-NFIND              TO TRUE.

           PERFORM
               UNTIL NOT WTH-IO-OK
               OR WS-TH-REC-FIND

               IF  RTH-CVG-STAT-IN-FORCE
               AND RTH-CVG-NUM-N = I
               AND RTH-CVG-STD-PREM-AMT NOT = ZEROES
                   SET WS-TH-REC-FIND       TO TRUE
                   MOVE RTH-PREM-PD-DT-NUM  TO L1680-INTERNAL-1
                   MOVE WCVGS-CVG-ISS-EFF-DT-DY (I)
                                            TO L1680-INT-DD-1
                   MOVE ZEROES              TO L1680-NUMBER-OF-YEARS
                   MOVE RTH-POL-BILL-MODE-CD
                                            TO L1680-NUMBER-OF-MONTHS
                   MOVE ZEROES              TO L1680-NUMBER-OF-DAYS

                   PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                       THRU 1680-3000-ADD-Y-M-D-TO-DATE-X

                  MOVE L1680-INTERNAL-2     TO WS-TEMP-DT
               END-IF

               PERFORM  TH-2000-READ-PREV
                   THRU TH-2000-READ-PREV-X
           END-PERFORM.


           PERFORM  TH-3000-END-BROWSE-PREV
               THRU TH-3000-END-BROWSE-PREV-X.

       3300-GET-PD-TO-DT-X.
           EXIT.
      /
      *-----------------------
       3400-CALC-SEG-FUND-CSV.
      *-----------------------

           MOVE LOW-VALUES                  TO WFA-KEY.
           MOVE HIGH-VALUES                 TO WFA-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WFA-POL-ID.
           MOVE I                           TO WFA-CVG-NUM-N.
           MOVE RPHST-PCHST-EFF-DT          TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE         TO WFA-CIA-IDT-NUM-N.
           MOVE ZEROES                      TO WFA-CIA-SEQ-NUM.
           MOVE WFA-KEY                     TO WFA-ENDBR-KEY.
           MOVE 999                         TO WFA-ENDBR-CIA-SEQ-NUM.

           PERFORM  FA-1000-BROWSE
               THRU FA-1000-BROWSE-X.

           IF  NOT WFA-IO-OK
               GO TO 3400-CALC-SEG-FUND-CSV-X
           END-IF.

           PERFORM  FA-2000-READ-NEXT
               THRU FA-2000-READ-NEXT-X.

           PERFORM
               UNTIL NOT WFA-IO-OK
               OR (RFA-CIA-TYP-SURR
               AND RFA-CIA-REVRS-PRCES-DT = WWKDT-ZERO-DT)

               PERFORM  FA-2000-READ-NEXT
                   THRU FA-2000-READ-NEXT-X
           END-PERFORM.

           IF  WFA-IO-OK
               COMPUTE WS-CALC-CSV-AMT = RFA-CIA-CLI-TRXN-AMT
                                       * -1
           END-IF.

           PERFORM  FA-3000-END-BROWSE
               THRU FA-3000-END-BROWSE-X.

       3400-CALC-SEG-FUND-CSV-X.
           EXIT.
      /
      *-------------------------
       3500-SW-REDC-PHST-BROWSE.
      *-------------------------

      * BROWSE & FETCH FA REDUCTION & SURRENDER RECORD IN PHST TABLE
           MOVE LOW-VALUES                  TO WPHS3-KEY.
           MOVE HIGH-VALUES                 TO WPHS3-ENDBR-KEY.
           MOVE WS-POL-ID                   TO WPHS3-POL-ID.
           MOVE '2035'                      TO WPHS3-POL-ACTV-TYP-ID.
           MOVE 'A'                         TO WPHS3-PCHST-STAT-CD.
           MOVE WWKDT-HIGH-DT               TO WPHS3-PCHST-EFF-DT.
           MOVE WPHS3-KEY                   TO WPHS3-ENDBR-KEY.
           MOVE WWKDT-LOW-DT                TO WPHS3-ENDBR-PCHST-EFF-DT.

           PERFORM  PHS3-1000-BROWSE-PREV
               THRU PHS3-1000-BROWSE-PREV-X.

           IF NOT WPHS3-IO-OK
      *MSG: ERROR WHILE BROWSING POLICY CHANGE HISTORY
               MOVE 'ZSCDSA0004'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3500-SW-REDC-PHST-BROWSE-X
           END-IF.

           PERFORM  PHS3-2000-READ-PREV
               THRU PHS3-2000-READ-PREV-X.

           PERFORM  2200-GET-FA-REDC-PHST
               THRU 2200-GET-FA-REDC-PHST-X
               UNTIL NOT WPHS3-IO-OK.

           PERFORM  PHS3-3000-END-BROWSE-PREV
               THRU PHS3-3000-END-BROWSE-PREV-X.

       3500-SW-REDC-PHST-BROWSE-X.
           EXIT.
      /
      *-------------------
       3600-CHK-GRACE-POL.
      *-------------------

           PERFORM
               VARYING J FROM 1 BY 1
               UNTIL J > RPOL-POL-CVG-REC-CTR-N
               IF  WCVGS-CVG-MAT-XPRY-DT (J) = L0182-EFF-DT
                   COMPUTE WS-POL-MPREM-AMT = WS-POL-MPREM-AMT
                                            + WCVGS-CVG-MPREM-AMT (J)
               END-IF
           END-PERFORM.

           COMPUTE WS-POL-MPREM-AMT  = WS-POL-MPREM-AMT
                                     / RPOL-POL-BILL-MODE-CD-N.

       3600-CHK-GRACE-POL-X.
           EXIT.
      /
      *--------------------
       4000-DISPLAY-TOTALS.
      *--------------------

      * TOTAL NO OF INPUT POLICIES PROCESSED: @1
           MOVE WS-INPUT-POL-COUNT          TO WGLOB-MSG-PARM (1).
           MOVE 'ZSCDSA0007'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      * TOTAL NO OF FA REDUCTION PHST RECORD READ: @1
           MOVE WS-FA-REDC-PHST-COUNT       TO WGLOB-MSG-PARM (1).
           MOVE 'ZSCDSA0008'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      * TOTAL NO OF FA REDUCTION PHST RECORD WRITTEN TO CDSA: @1
           MOVE WS-FA-REDC-CDSA-COUNT       TO WGLOB-MSG-PARM (1).
           MOVE 'ZSCDSA0009'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      * TOTAL NO OF SURRENDER PHST RECORD READ: @1
           MOVE WS-SURR-PHST-COUNT          TO WGLOB-MSG-PARM (1).
           MOVE 'ZSCDSA0010'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      * TOTAL NO OF SURRENDER PHST RECORD WRITTEN TO CDSA: @1
           MOVE WS-SURR-CDSA-COUNT          TO WGLOB-MSG-PARM (1).
           MOVE 'ZSCDSA0011'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       4000-DISPLAY-TOTALS-X.
           EXIT.
      /
      *---------------
       9500-CDSA-READ.
      *---------------

           MOVE ZERO                        TO WCDSA-SEQ-IO-STATUS.

           READ CDSA-DATA-FILE
                AT END
                  MOVE 8                    TO WCDSA-SEQ-IO-STATUS
                  GO TO 9500-CDSA-READ-X.

           IF  RCDSA-SEQ-REC-INFO EQUAL HIGH-VALUES
               MOVE 8                       TO WCDSA-SEQ-IO-STATUS
           END-IF.

           IF  WCDSA-SEQ-FILE-STATUS  NOT = ZERO
               PERFORM  9700-HANDLE-ERROR
                   THRU 9700-HANDLE-ERROR-X
           END-IF.

       9500-CDSA-READ-X.
           EXIT.
      /
      *-----------------------
       9700-HANDLE-ERROR.
      *-----------------------

           MOVE WCDSA-SEQ-FILE-NAME         TO WGLOB-TABLE-NAME.
           MOVE WCDSA-SEQ-FILE-STATUS       TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCDSA-SEQ-IO-COMMAND        TO WGLOB-IO-COMMAND.
           PERFORM  0030-3000-QSAM-ERROR
               THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                        TO WCDSA-SEQ-IO-STATUS.

           CLOSE CDSA-DATA-FILE.

           IF  WCDSA-SEQ-FILE-STATUS  NOT = ZERO
               PERFORM  9700-HANDLE-ERROR
                   THRU 9700-HANDLE-ERROR-X
           END-IF.


           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *               PROCESSING COPYBOOKS                            *
      *****************************************************************
       COPY NCPPCVGS.
       COPY CCPPPLIN.
      /
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
       COPY CCPVPHS3.
      /
       COPY CCPNPOL.
      /
       COPY CCPNCVG.
      /
       COPY CCPNPH.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY CCPVTH.
      /
       COPY SCPBFA.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPL0030.
      /
       COPY XCPL0035.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY CCPL2600.
       COPY CCPS2600.
      /
       COPY CCPL0182.
       COPY CCPS0182.
      /
       COPY CCPL9300.
       COPY CCPS9300.
      /
       COPY XCPL1660.
      /
       COPY XCPL1680.
      /
       COPY XCPL0280.
      *****************************************************************
      *                END OF PROGRAM ZSBMCDSA                        *
      *****************************************************************
