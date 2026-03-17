      *****************************************************************
      **  MEMBER :  ZSBMREIS                                         **
      **  REMARKS:  THIS PROGRAM WILL UPDATE THE CVG-REINS-IND AND   **
      **            INSERT RECORD INTO TRINS TABLE FOR POST RENEWAL  **
      **            RIDER COVERAGE                                   **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
CR2754**  17MAR25  CTS    INTIAL VERSION                             **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMREIS.

      /
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMREIS'.

       COPY SQLCA.

       01  WS-MISC-WORK-AREA.
           05  WS-POL-ID                    PIC X(10).
           05  WS-CVG-NUM                   PIC X(02).
           05  WS-CVG-NUM-N                 REDEFINES
               WS-CVG-NUM                   PIC 9(02).
           05  WS-CONCAT-REINS-PLAN-CPY.
               10  WS-CONCAT-REINS-PLAN     PIC X(06).
               10  WS-CONCAT-REINS-CPY      PIC X(02).
           05  WS-REINS-TRTY-NUM            PIC X(03).
           05  WS-AUTO-REINS-CO-ID          PIC X(02).
           05  WS-REINS-CED-PCT             PIC S9(03) COMP-3.
           05  WS-POL-CNT                   PIC 9(03).
           05  WS-TRINS-CNT                 PIC 9(03).

      /
       COPY CCWL0010.
       COPY CCWL0950.
       COPY XCWL0035.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCWWCVGS.
      /
       COPY CCFRRINS.
       COPY CCFWRINS.
      /
       COPY CCFRPD.
       COPY CCFWPD.
      /
       COPY CCFREDIT.
       COPY CCFWEDIT.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY REIS
                               ==':ID:'==  BY =='REIS'==.
      /
       COPY ZCSRREIS.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWTFCMD.
      /
       COPY XCWL0040.
      /
       COPY XCWL1670.
       COPY XCWL1660.
       COPY XCWL1680.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWCCC.
      /
       COPY CCWLPGA.
      /
       COPY XCWL0280.
      /
       COPY CCWWINDX.
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

           MOVE 'BATCH'                     TO WGLOB-USER-ID.
           MOVE 'INGENIUM'                  TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.
           MOVE SPACES                      TO L0040-PROGRAM-DESC.
           MOVE 'RUN MESSAGES'              TO L0040-HDG-LINE-3.

           INITIALIZE WS-MISC-WORK-AREA.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  1000-PROCESS-POLS
               THRU 1000-PROCESS-POLS-X
              UNTIL NOT WREIS-SEQ-IO-OK.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

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

           PERFORM  REIS-1000-OPEN-INPUT
               THRU REIS-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *------------------
       1000-PROCESS-POLS.
      *------------------

           PERFORM  REIS-1000-READ
               THRU REIS-1000-READ-X.

           IF NOT WREIS-SEQ-IO-OK
      *    MSG:'END OF FILE REACHED'
               MOVE  'XS00000025'           TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-PROCESS-POLS-X
           END-IF.

           MOVE REIS-POL-ID                 TO WPOL-POL-ID
                                               WS-POL-ID.
           MOVE REIS-CVG-NUM                TO WS-CVG-NUM.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF NOT WPOL-IO-OK
      *    MSG: 'POLICY (@1) DOES NOT EXIST'
               MOVE 'XS00000070'            TO WGLOB-MSG-REF-INFO
               MOVE REIS-POL-ID             TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-PROCESS-POLS-X
           END-IF.

           PERFORM  2000-READ-REWRITE-LOOP
               THRU 2000-READ-REWRITE-LOOP-X.

       1000-PROCESS-POLS-X.
           EXIT.
      /
      *---------------------
       2000-READ-REWRITE-LOOP.
      *---------------------

      *    MSG: 'PROCESSING POLICY (@1) '
           MOVE 'ZSREIS0001'                TO WGLOB-MSG-REF-INFO
           MOVE REIS-POL-ID                 TO WGLOB-MSG-PARM (1)
           ADD +1                           TO WS-POL-CNT
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X

           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           PERFORM  3000-REWRITE-COVERAGE
               THRU 3000-REWRITE-COVERAGE-X.

       2000-READ-REWRITE-LOOP-X.
           EXIT.
      /
      *----------------------
       3000-REWRITE-COVERAGE.
      *----------------------

           IF  RPOL-PROD-APP-TYP-ARM2
           AND WCVGS-CVG-CONN-REASN-RENW (WS-CVG-NUM-N)
           AND WCVGS-CVG-PREV-STAT-PENDING (WS-CVG-NUM-N)
           AND WCVGS-CVG-STAT-IN-FORCE (WS-CVG-NUM-N)
           AND WCVGS-CVG-RENW-PLAN-ID (WS-CVG-NUM-N) = SPACES
           AND WCVGS-CONN-CVG-NUM (WS-CVG-NUM-N) <> SPACES
           AND WCVGS-CVG-REINS-YES (RPOL-POL-BASE-CVG-NUM)
               PERFORM  3100-AUTO-REINS-DFLTS
                   THRU 3100-AUTO-REINS-DFLTS-X
           END-IF.

       3000-REWRITE-COVERAGE-X.
           EXIT.
      /
      *----------------------------
       3100-AUTO-REINS-DFLTS.
      *----------------------------

           MOVE WCVGS-PLAN-ID (WS-CVG-NUM-N)
                                            TO WPD-PLAN-ID.

           PERFORM  PDIN-1000-PLAN-DEFAULTS-IN
               THRU PDIN-1000-PLAN-DEFAULTS-IN-X.

           IF  WPD-IO-OK
               CONTINUE
           ELSE
               GO TO 3100-AUTO-REINS-DFLTS-X
           END-IF.

           MOVE RPD-AUTO-REINS-CO-ID        TO
                                WCVGS-AUTO-REINS-CO-ID (WS-CVG-NUM-N)
                                WS-AUTO-REINS-CO-ID
                                WS-CONCAT-REINS-CPY.

           MOVE WCVGS-PLAN-ID (WS-CVG-NUM-N)
                                            TO WS-CONCAT-REINS-PLAN.

           MOVE LOW-VALUES                  TO WEDIT-KEY
           MOVE 'TRETY'                     TO WEDIT-ETBL-TYP-ID.
           MOVE WS-CONCAT-REINS-PLAN-CPY    TO WEDIT-ETBL-VALU-ID.
           MOVE WGLOB-USER-LANG             TO WEDIT-ETBL-LANG-CD.

           PERFORM  EDIT-1000-READ
               THRU EDIT-1000-READ-X.

           IF NOT WEDIT-IO-OK
              GO TO 3100-AUTO-REINS-DFLTS-X
           END-IF

           MOVE REDIT-ETBL-DESC-TXT         TO WS-REINS-TRTY-NUM

           MOVE LOW-VALUES                  TO WEDIT-KEY
           MOVE 'TRPCT'                     TO WEDIT-ETBL-TYP-ID
           MOVE WS-REINS-TRTY-NUM           TO WEDIT-ETBL-VALU-ID
           MOVE WGLOB-USER-LANG             TO WEDIT-ETBL-LANG-CD

           PERFORM  EDIT-1000-READ
               THRU EDIT-1000-READ-X

           IF NOT WEDIT-IO-OK
              GO TO 3100-AUTO-REINS-DFLTS-X
           END-IF

           MOVE REDIT-ETBL-DESC-TXT         TO L0280-INPUT-DATA
           SET  L0280-SIGN-PERMITTED        TO TRUE
           MOVE 0                           TO L0280-PRECISION
           MOVE 3                           TO L0280-LENGTH
           MOVE 3                           TO L0280-INPUT-SIZE

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X

           IF  L0280-OK
               MOVE L0280-OUTPUT           TO WS-REINS-CED-PCT
           END-IF.

           PERFORM  3150-WRITE-RINS
               THRU 3150-WRITE-RINS-X.

       3100-AUTO-REINS-DFLTS-X.
           EXIT.

      *---------------------------
       3150-WRITE-RINS.
      *---------------------------

           MOVE REIS-POL-ID                 TO WCVG-POL-ID.
           MOVE WS-CVG-NUM-N                TO WCVG-CVG-NUM-N.

           PERFORM  CVG-1000-READ-FOR-UPDATE
               THRU CVG-1000-READ-FOR-UPDATE-X.

           PERFORM  3155-BUILD-RINS-KEY
               THRU 3155-BUILD-RINS-KEY-X.

           PERFORM  RINS-1000-READ
               THRU RINS-1000-READ-X.

           IF  WRINS-IO-OK
               PERFORM  CVG-3000-UNLOCK
                   THRU CVG-3000-UNLOCK-X
      *        MSG: 'TRINS RECORD IS ALREADY PRESENT FOR POLICY (@1)
      *              WITH CVG (@2)'
               MOVE 'ZSREIS0002'            TO WGLOB-MSG-REF-INFO
               MOVE REIS-POL-ID             TO WGLOB-MSG-PARM (1)
               MOVE WS-CVG-NUM-N            TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3150-WRITE-RINS-X
           END-IF.

           PERFORM  RINS-1000-CREATE
               THRU RINS-1000-CREATE-X.

           MOVE WS-REINS-CED-PCT            TO RRINS-REINS-CED-PCT.

           SET RRINS-REINS-TYP-AUTO         TO TRUE.

           PERFORM  RINS-1000-WRITE
               THRU RINS-1000-WRITE-X.

           IF  WRINS-IO-OK
      *        MSG: 'TRINS RECORD SUCCESSFULLY INSERTED FOR
      *              POLICY (@1) WITH CVG (@2)'
               MOVE 'ZSREIS0003'            TO WGLOB-MSG-REF-INFO
               MOVE REIS-POL-ID             TO WGLOB-MSG-PARM (1)
               MOVE WS-CVG-NUM-N            TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               ADD +1                       TO WS-TRINS-CNT
           ELSE
               PERFORM  CVG-3000-UNLOCK
                   THRU CVG-3000-UNLOCK-X
      *        MSG: 'ERROR IN CREATING TRINS RECORD FOR
      *              POLICY (@1) WITH CVG (@2)'
               MOVE 'ZSREIS0004'            TO WGLOB-MSG-REF-INFO
               MOVE REIS-POL-ID             TO WGLOB-MSG-PARM (1)
               MOVE WS-CVG-NUM-N            TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3150-WRITE-RINS-X
           END-IF.

           SET WCVGS-CVG-REINS-YES (WS-CVG-NUM-N)
                                            TO TRUE.
           SET WCVGS-REINS-TYP-AUTO (WS-CVG-NUM-N)
                                            TO TRUE.

           MOVE WCVGS-CVG-INFO (WS-CVG-NUM-N)
                                            TO RCVG-CVG-INFO.

           PERFORM  CVG-2000-REWRITE
               THRU CVG-2000-REWRITE-X.

       3150-WRITE-RINS-X.
           EXIT.
      /
      *-------------------------
       3155-BUILD-RINS-KEY.
      *-------------------------

           MOVE LOW-VALUES                  TO WRINS-KEY.
           MOVE WS-POL-ID                   TO WRINS-POL-ID.
           MOVE WS-CVG-NUM                  TO WRINS-CVG-NUM.
           MOVE WS-REINS-TRTY-NUM           TO WRINS-REINS-TRTY-NUM.
           MOVE WS-AUTO-REINS-CO-ID         TO WRINS-REINS-CO-ID.

       3155-BUILD-RINS-KEY-X.
           EXIT.
      /
      *-------------------------
       8000-PRINT-STATS.
      *-------------------------

      *    MSG: 'NUMBER OF POLICIES PROCESSED (@1)'
           MOVE 'ZSREIS0005'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-POL-CNT                  TO WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           MOVE SPACES                      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X

      *    MSG: 'NUMBER OF SUCCESSFUL TRINS INSERTIONS (@1)'
           MOVE 'ZSREIS0006'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-TRINS-CNT                TO WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           MOVE SPACES                      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE '*** END OF REPORT ***'     TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       8000-PRINT-STATS-X.
           EXIT.
      /
      *-------------------------
       9999-CLOSE-FILES.
      *-------------------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

           PERFORM  REIS-4000-CLOSE
               THRU REIS-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPPCCC.
       COPY CCPPPDIN.
      /
       COPY CCPUCVG.
       COPY CCPNCVG.
       COPY NCPPCVGS.
      /
       COPY CCPTPOL.
       COPY CCPUPOL.
       COPY CCPNPOL.
      /
       COPY CCPNEDIT.
      /
       COPY CCPNPD.
      /
       COPY CCPNRINS.
       COPY CCPARINS.
       COPY CCPCRINS.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0035.
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      /
       COPY XCPL0280.
      /
       COPY XCSNSEQ  REPLACING ==:ID:==  BY REIS.
       COPY XCSLFILE REPLACING ==:ID:==  BY REIS
                               ==':PGM:'== BY =='ZSRQREIS'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY REIS.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBMREIS                     **
      *****************************************************************