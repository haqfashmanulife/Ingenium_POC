      *****************************************************************
      **  MEMBER :  ZSBM7701                                         **
      **  REMARKS:  ZAP PROGRAM TO CORRECT THE JOURNAL DATE ON THE   **
      **            77 RECORDS IN THE HI TABLE AND THE MTD FILE      **
      **                                                             **
      **            THIS PROGRAM READS IN THE MTD FILE AND CREATES   **
      **            A NEW MTD FILE WITH THE REQUIRED RECORDS UPDATED.**
      **            ONCE THE NEW MTD IS VALIDATED, IT SHOULD REPLACE **
      **            THE OLD MTD FILE (MANUAL PROCEDURE)              **
      **                                                             **
      **            THE MTD AND HI RECORDS WILL ONLY BE UPDATED FOR  **
      **            SPECIFICALLY DEFINED POLICIES, AND ONLY IF THE   **
      **            JOURNAL DATE IS ZEROES                           **
      **                                                             **
      **            A LINE IS PRINTED FOR EACH MTD AND HI RECORD     **
      **            UPDATED.  RECORD COUNTS ARE INCLUDED AT THE END. **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
P00005**  09OCT01  JEB    NEW ZAP PROGRAM TO CORRECT JOURNAL DATE    **
P00005**  22OCT01  JEB    CORRECTED THE SETTING OF THE HI TYPE CD    **
P00125**  14NOV01  JEB    MOVE THE ATRN RECORD TO THE NEWM RECORD    **
P00125**                  LAYOUT WHEN 77 RECORD FOR SELECTED POLICY  **
P00125**                  WHEN THE JOURNAL DATE IS NOT A ZERO DATE   **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBM7701.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

      *****************************************************************
      *    FILE DESCRIPTIONS :                                        *
      *       MONTH-END-FILE :                                        *
      *         MONTH END TRANSACTION FILE CREATED IN CSBM0420        *
      *****************************************************************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM7701'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
           05  WS-JRNL-DT                   PIC X(10).
           05  WS-TOTAL-OLD-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL OLD MTD RECORDS READ              '.
               10  WS-OLD-MTD-RECS-READ     PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-TOTAL-NEW-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL NEW MTD RECORDS WRITTEN           '.
               10  WS-NEW-MTD-RECS-WRITTEN  PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-TOTAL-CHG-MTD-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL MTD RECORDS CHANGED               '.
               10  WS-MTD-RECS-CHANGED      PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-TOTAL-HI-RECS-CHG-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL HI RECORDS CHANGED                '.
               10  WS-HI-RECS-CHANGED       PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-CHANGED-MTD-LINE.
               10  FILLER                   PIC X(27)
               VALUE 'MTD RECORD CHANGED: POLICY '.
               10  WS-MTD-POL-ID            PIC X(10).
               10  FILLER                   PIC X(12)
               VALUE ' PROCESS DT '.
               10  WS-MTD-EFF-DT            PIC X(10).
               10  FILLER                   PIC X(09)
               VALUE ' ACCOUNT '.
               10  WS-MTD-ACCT-ID           PIC X(06).
               10  FILLER                   PIC X(17)
               VALUE ' OLD JOURNAL DT '.
               10  WS-MTD-OLD-JRNL-DT       PIC X(10).
               10  FILLER                   PIC X(17)
               VALUE ' NEW JOURNAL DT '.
               10  WS-MTD-NEW-JRNL-DT       PIC X(10).
               10  FILLER                   PIC X(04) VALUE SPACE.
           05  WS-CHANGED-HI-LINE.
               10  FILLER                   PIC X(27)
               VALUE ' HI RECORD CHANGED: POLICY '.
               10  WS-HI-POL-ID             PIC X(10).
               10  FILLER                   PIC X(12)
               VALUE ' PROCESS DT '.
               10  WS-HI-EFF-DT             PIC X(10).
               10  FILLER                   PIC X(09)
               VALUE ' ACCOUNT '.
               10  WS-HI-ACCT-ID            PIC X(06).
               10  FILLER                   PIC X(17)
               VALUE ' OLD JOURNAL DT '.
               10  WS-HI-OLD-JRNL-DT        PIC X(10).
               10  FILLER                   PIC X(17)
               VALUE ' NEW JOURNAL DT '.
               10  WS-HI-NEW-JRNL-DT        PIC X(10).
               10  FILLER                   PIC X(04) VALUE SPACE.
      /
P02229 COPY XCWL0035.

       COPY CCWWAT77.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY CCSWMNTH.
       COPY CCSRMNTH.
      /
       COPY ZCSWNEWM.
       COPY ZCSRNEWM.
      /
       COPY CCFRHI.
       COPY CCFWHI.
      /
       COPY CCFRATRN.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWTFCMD.
      /
       COPY XCWL0040.
      /
       COPY XCWL1670.
       COPY XCWL1680.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWCCC.
      /
       PROCEDURE DIVISION.

      *---------------------
       0000-MAIN-LINE-START.
      *---------------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.

           MOVE '            77 RECORD JOURNAL DATE UPDATE PROCESSING'
                                   TO L0040-HDG-LINE-3.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  1000-PROCESS-MNTH
               THRU 1000-PROCESS-MNTH-X.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAIN-LINE-START-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  MNTH-1000-OPEN-INPUT
               THRU MNTH-1000-OPEN-INPUT-X.

           PERFORM  NEWM-3000-OPEN-OUTPUT
               THRU NEWM-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *------------------
       1000-PROCESS-MNTH.
      *------------------

           PERFORM  2000-READ-WRITE-LOOP
               THRU 2000-READ-WRITE-LOOP-X
               UNTIL WMNTH-SEQ-IO-EOF.

       1000-PROCESS-MNTH-X.
           EXIT.
      /
      *---------------------
       2000-READ-WRITE-LOOP.
      *---------------------

           PERFORM  3000-READ-MTD-FILE
               THRU 3000-READ-MTD-FILE-X.

           IF  WMNTH-SEQ-IO-EOF
               GO TO 2000-READ-WRITE-LOOP-X
           END-IF.

           PERFORM  4000-WRITE-NEW-MTD-FILE
               THRU 4000-WRITE-NEW-MTD-FILE-X.

       2000-READ-WRITE-LOOP-X.
           EXIT.
      /
      *--------------------
       3000-READ-MTD-FILE.
      *--------------------

           PERFORM MNTH-1000-READ
               THRU MNTH-1000-READ-X.

           IF  WMNTH-SEQ-IO-EOF
               NEXT SENTENCE
           ELSE
               MOVE RMNTH-SEQ-REC-INFO  TO RATRN-REC-INFO
               MOVE RATRN-TRNXT-INFO    TO WAT77-REC-INFO
               ADD 1                    TO WS-OLD-MTD-RECS-READ
           END-IF.

       3000-READ-MTD-FILE-X.
           EXIT.
      /
      *------------------------
       4000-WRITE-NEW-MTD-FILE.
      *------------------------

           EVALUATE WAT77-POL-ID
               WHEN '3523955   '
               WHEN '3167919   '
               WHEN '2061708   '
               WHEN '2192221   '
               WHEN '2021403   '
               WHEN '3987099   '
                   PERFORM  5000-UPDATE-MTD-HI-RECS
                       THRU 5000-UPDATE-MTD-HI-RECS-X

               WHEN OTHER
                   MOVE RATRN-REC-INFO  TO  RNEWM-SEQ-REC-INFO

      * DISPLAY THE POLICY ID IF THE JOURNAL DATE IS ZERO
                   IF  WAT77-JRNL-DT = WWKDT-ZERO-DT
                       DISPLAY
               '*** BLANK JOURNAL DATE FOUND FOR POLICY ' WAT77-POL-ID
                   END-IF

           END-EVALUATE.

           ADD 1                TO  WS-NEW-MTD-RECS-WRITTEN.

           PERFORM  NEWM-1000-WRITE
               THRU NEWM-1000-WRITE-X.

       4000-WRITE-NEW-MTD-FILE-X.
           EXIT.
      /
      *------------------------
       5000-UPDATE-MTD-HI-RECS.
      *------------------------

           IF  WAT77-JRNL-DT NOT = WWKDT-ZERO-DT
P00125         MOVE RATRN-REC-INFO  TO  RNEWM-SEQ-REC-INFO
               GO TO 5000-UPDATE-MTD-HI-RECS-X
           END-IF.

           EVALUATE WAT77-POL-ID
               WHEN '3523955   '
               WHEN '3167919   '
                    MOVE '2001-10-03' TO WS-JRNL-DT

               WHEN '2061708   '
               WHEN '2192221   '
                    MOVE '2001-10-04' TO WS-JRNL-DT

               WHEN '2021403   '
               WHEN '3987099   '
                    MOVE '2001-10-09' TO WS-JRNL-DT

           END-EVALUATE.

           MOVE WAT77-POL-ID          TO WS-MTD-POL-ID.
           MOVE WAT77-DT              TO L1680-INTERNAL-1.
           MOVE ZERO                  TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                  TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                  TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2      TO WS-MTD-EFF-DT.
           MOVE WAT77-BASE-ID         TO WS-MTD-ACCT-ID.
           MOVE WAT77-JRNL-DT         TO WS-MTD-OLD-JRNL-DT.
           MOVE WS-JRNL-DT            TO WS-MTD-NEW-JRNL-DT.

           MOVE WS-JRNL-DT            TO WAT77-JRNL-DT.
           MOVE WAT77-REC-INFO        TO RATRN-TRNXT-INFO.
           MOVE RATRN-REC-INFO        TO RNEWM-SEQ-REC-INFO.
           ADD 1                      TO WS-MTD-RECS-CHANGED.

      *    PRINT LINE FOR THE MTD RECORD CHANGED
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CHANGED-MTD-LINE     TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.


      *    GET HI RECORD AND UPDATE JOURNAL DATE
           MOVE WAT77-POL-ID          TO WHI-POL-ID.
P00005     MOVE 'A'                   TO WHI-POL-HIST-TYP-CD.
P00005*    MOVE 'A'                   TO WHI-ENDBR-POL-HIST-TYP-CD.
           MOVE WAT77-DT              TO L1680-INTERNAL-1.
           MOVE ZERO                  TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                  TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                  TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2      TO WHI-POL-TRXN-EFF-DT.
           MOVE RATRN-TRNXT-DT        TO WHI-POL-TRXN-DT.
           MOVE RATRN-TRNXT-TIME-N    TO WHI-POL-TRXN-TIME.
           MOVE RATRN-TRNXT-TASK-ID   TO WHI-POL-TRXN-TASK-ID.
           MOVE RATRN-TRNXT-SEQ-NUM-N TO WHI-POL-TRXN-SEQ-NUM.

           PERFORM  HI-1000-READ-FOR-UPDATE
               THRU HI-1000-READ-FOR-UPDATE-X.

           IF  NOT WHI-IO-OK
               MOVE SPACES              TO L0040-INPUT-LINE
               MOVE
               'ERROR - HI RECORD NOT FOUND FOR ABOVE MTD RECORD'
                                        TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 5000-UPDATE-MTD-HI-RECS-X
           END-IF.

           MOVE RHI-POL-TRXN-INFO     TO WAT77-REC-INFO.
           MOVE WAT77-POL-ID          TO WS-HI-POL-ID.
           MOVE WHI-POL-TRXN-EFF-DT   TO WS-HI-EFF-DT.
           MOVE WAT77-BASE-ID         TO WS-HI-ACCT-ID.
           MOVE WAT77-JRNL-DT         TO WS-HI-OLD-JRNL-DT.
           MOVE WS-JRNL-DT            TO WS-HI-NEW-JRNL-DT.
           MOVE WS-JRNL-DT            TO WAT77-JRNL-DT.
           ADD 1                      TO WS-HI-RECS-CHANGED.
           MOVE WAT77-REC-INFO        TO RHI-POL-TRXN-INFO.

           PERFORM  HI-2000-REWRITE
               THRU HI-2000-REWRITE-X.

      *    PRINT LINE FOR THE HI RECORD CHANGED
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CHANGED-HI-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       5000-UPDATE-MTD-HI-RECS-X.
           EXIT.
      /
       8000-PRINT-STATS.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-TOTAL-OLD-RECS-LINE  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-TOTAL-NEW-RECS-LINE  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-TOTAL-CHG-MTD-RECS-LINE TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-TOTAL-HI-RECS-CHG-LINE TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       8000-PRINT-STATS-X.
           EXIT.
      /
       9999-CLOSE-FILES.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  MNTH-4000-CLOSE
               THRU MNTH-4000-CLOSE-X.

           PERFORM  NEWM-4000-CLOSE
               THRU NEWM-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
P02229 COPY XCPL0035.

       COPY CCPPCCC.
      /
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
       COPY CCPUHI.
      /
       COPY CCPLMNTH.
       COPY CCPOMNTH.
       COPY CCPNMNTH.
      /
       COPY ZCPLNEWM.
       COPY ZCPONEWM.
       COPY ZCPANEWM.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBM7701                     **
      *****************************************************************
