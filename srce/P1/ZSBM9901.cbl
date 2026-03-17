      *****************************************************************
      **  MEMBER :  ZSBM9901                                         **
      **  REMARKS:  ZAP PROGRAM TO CORRECT THE MOVEMENT RECORDS      **
      **            IN THE HI TABLE THAT WERE CREATED INCORRECTLY    **
      **            WHEN POLICIES WERE REISSUED AND SETTLED          **
      **                                                             **
      **            THIS PROGRAM READS IN THE SPND TABLE AND UPDATES **
      **            HI RECORDS THAT WERE CREATED INCORRECTLY         **
      **                                                             **
      **            A LINE IS PRINTED FOR EACH HI RECORD UPDATED.    **
      **            RECORD COUNTS ARE INCLUDED AT THE END.           **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
P00349**  15FEB02  JEB    CORRECT REISSUE MOVEMENT RECORDS           **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBM9901.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9901'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
           05  WS-POLICY-REISSUED-IND       PIC 9(01).
               88 WS-POLICY-ISSUED                    VALUE 1.
               88 WS-POLICY-REISSUED-YES              VALUE 2.
               88 WS-POLICY-REISSUED-NO               VALUE ZERO.
           05  WS-CVG                       PIC S9(04)      COMP.
           05  WS-HOLD-ISS-HI               PIC X(519).
           05  WS-HOLD-NEXT-ISS-HI          PIC X(519).
           05  WS-HOLD-REISS-KEY            PIC X(43).
           05  WS-JRNL-DT                   PIC X(10).
           05  WS-TOTAL-SPND-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'NUMBER OF SPND RECORDS READ             '.
               10  WS-SPND-RECS-READ        PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-TOTAL-POLS-AFF-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'NUMBER OF POLICIES AFFECTED             '.
               10  WS-POLICIES-AFFECTED     PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-TOTAL-NEW-HI-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'NUMBER OF HI RECORDS CREATED            '.
               10  WS-HI-RECS-CREATED       PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-TOTAL-HI-RECS-CHG-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL HI RECORDS CHANGED                '.
               10  WS-HI-RECS-CHANGED       PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-ISS-HI-LINE.
               10  FILLER                   PIC X(26)
               VALUE 'HI RECORD ADDED:   POLICY '.
               10  WS-ISS-POL-ID            PIC X(10).
               10  FILLER                   PIC X(09)
               VALUE 'COVERAGE '.
               10  WS-ISS-CVG-NUM           PIC X(02).
               10  FILLER                   PIC X(11)
               VALUE '  TRANS DT '.
               10  WS-ISS-TRXN-DT           PIC X(10).
               10  FILLER                   PIC X(12)
               VALUE ' PROCESS DT '.
               10  WS-ISS-EFF-DT            PIC X(10).
               10  FILLER                   PIC X(11)
               VALUE '      LINE '.
               10  WS-ISS-SIGN              PIC X(01).
               10  WS-ISS-LN-NUM            PIC X(04).
               10  FILLER                   PIC X(04) VALUE SPACE.
           05  WS-REISS-HI-LINE.
               10  FILLER                   PIC X(26)
               VALUE 'HI RECORD CHANGED: POLICY '.
               10  WS-REISS-POL-ID          PIC X(10).
               10  FILLER                   PIC X(09)
               VALUE 'COVERAGE '.
               10  WS-REISS-CVG-NUM         PIC X(02).
               10  FILLER                   PIC X(11)
               VALUE '  TRANS DT '.
               10  WS-REISS-TRXN-DT         PIC X(10).
               10  FILLER                   PIC X(12)
               VALUE ' PROCESS DT '.
               10  WS-REISS-EFF-DT          PIC X(10).
               10  FILLER                   PIC X(11)
               VALUE ' PREV LINE '.
               10  WS-REISS-PRE-SIGN        PIC X(01).
               10  WS-REISS-PRE-LN-NUM      PIC X(04).
               10  FILLER                   PIC X(10)
               VALUE ' NEW LINE '.
               10  WS-REISS-NEW-SIGN        PIC X(01).
               10  WS-REISS-NEW-LN-NUM      PIC X(04).
               10  FILLER                   PIC X(04) VALUE SPACE.
      /
P02229 COPY XCWL0035.

       COPY CCWWAT99.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY CCFRHI.
       COPY CCFWHI.
       COPY CCFWHITD.
      /
       COPY CCFRSPND.
       COPY CCFWSPND.
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

           MOVE '            99 RECORD REISSUE UPDATE PROCESSING'
                                   TO L0040-HDG-LINE-3.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE LOW-VALUES         TO WSPND-KEY.
           MOVE HIGH-VALUES        TO WSPND-ENDBR-KEY.

           PERFORM  SPND-1000-BROWSE
               THRU SPND-1000-BROWSE-X.

           PERFORM  SPND-2000-READ-NEXT
               THRU SPND-2000-READ-NEXT-X.

           PERFORM  1000-PROCESS-SPND
               THRU 1000-PROCESS-SPND-X
               UNTIL WSPND-IO-EOF.

           PERFORM  SPND-3000-END-BROWSE
               THRU SPND-3000-END-BROWSE-X.

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

       0100-OPEN-FILES-X.
           EXIT.
      /
      *------------------
       1000-PROCESS-SPND.
      *------------------

           ADD 1       TO WS-SPND-RECS-READ.

           PERFORM  2000-LOOK-FOR-REISSUE
               THRU 2000-LOOK-FOR-REISSUE-X.

           PERFORM  SPND-2000-READ-NEXT
               THRU SPND-2000-READ-NEXT-X.

       1000-PROCESS-SPND-X.
           EXIT.
      /
      *---------------------
       2000-LOOK-FOR-REISSUE.
      *---------------------

      *  BROWSE ALL THE HISTORY ACCOUNTING RECORDS FOR THE POLICY
      *  TO ESTABLISH WHETHER THE POLICY WAS RE-ISSUED

           MOVE ZERO              TO WS-POLICY-REISSUED-IND.

           MOVE LOW-VALUES        TO WHITD-KEY.
           MOVE RSPND-POL-ID      TO WHITD-POL-ID.
           MOVE 'M'               TO WHITD-POL-HIST-TYP-CD
           MOVE WWKDT-LOW-DT      TO WHITD-POL-TRXN-DT.

           MOVE WHITD-KEY         TO WHITD-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT     TO WHITD-ENDBR-POL-TRXN-DT.

           PERFORM  HITD-1000-BROWSE
               THRU HITD-1000-BROWSE-X.

           PERFORM  HITD-2000-READ-NEXT
               THRU HITD-2000-READ-NEXT-X.

      *  LOOP THRU ALL THE HISTORY ACCOUNTING RECORDS LOOKING FOR
      *  2 '060' RECORDS FOR COVERAGE 01

           PERFORM
               UNTIL WHITD-IO-EOF
               OR    WS-POLICY-REISSUED-YES

                   MOVE RHI-POL-TRXN-INFO  TO WAT99-REC-INFO

                   IF  WAT99-CVG-NUM        = 01
                   AND WAT99-LN-NUM         = '060'

                       ADD 1               TO  WS-POLICY-REISSUED-IND

                   END-IF

                   PERFORM  HITD-2000-READ-NEXT
                       THRU HITD-2000-READ-NEXT-X

           END-PERFORM.

           PERFORM  HITD-3000-END-BROWSE
               THRU HITD-3000-END-BROWSE-X.

           IF WS-POLICY-REISSUED-YES

              ADD 1 TO WS-POLICIES-AFFECTED

              PERFORM  3000-PROCESS-REISSUED-CVGS
                  THRU 3000-PROCESS-REISSUED-CVGS-X
               VARYING WS-CVG FROM 1 BY 1
               UNTIL   WS-CVG > 99

           END-IF.


       2000-LOOK-FOR-REISSUE-X.
           EXIT.
      /
      *---------------------------
       3000-PROCESS-REISSUED-CVGS.
      *---------------------------

      *
           MOVE ZERO              TO WS-POLICY-REISSUED-IND.

           MOVE LOW-VALUES        TO WHITD-KEY.
           MOVE RSPND-POL-ID      TO WHITD-POL-ID.
           MOVE 'M'               TO WHITD-POL-HIST-TYP-CD.
           MOVE WWKDT-LOW-DT      TO WHITD-POL-TRXN-DT.

           MOVE WHITD-KEY         TO WHITD-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT     TO WHITD-ENDBR-POL-TRXN-DT.

           PERFORM  HITD-1000-BROWSE
               THRU HITD-1000-BROWSE-X.

           PERFORM  HITD-2000-READ-NEXT
               THRU HITD-2000-READ-NEXT-X.

           PERFORM
               UNTIL WHITD-IO-EOF

                   MOVE RHI-POL-TRXN-INFO  TO WAT99-REC-INFO

                   IF  WAT99-CVG-NUM        = WS-CVG
                   AND WAT99-LN-NUM         = '060'
                       ADD 1               TO WS-POLICY-REISSUED-IND
                       IF  WS-POLICY-ISSUED
                           MOVE RHI-REC-INFO
                                           TO WS-HOLD-ISS-HI
                       ELSE

                           MOVE RHI-REC-INFO
                                           TO WS-HOLD-NEXT-ISS-HI

                           PERFORM  4000-PROCESS-A-REISSUED-CVG
                               THRU 4000-PROCESS-A-REISSUED-CVG-X

                           MOVE WS-HOLD-NEXT-ISS-HI
                                           TO WS-HOLD-ISS-HI

                       END-IF

                   END-IF

                   PERFORM  HITD-2000-READ-NEXT
                       THRU HITD-2000-READ-NEXT-X

           END-PERFORM.

           IF WS-POLICY-REISSUED-IND       =  ZERO
              MOVE 100                     TO WS-CVG
           END-IF.

           PERFORM  HITD-3000-END-BROWSE
               THRU HITD-3000-END-BROWSE-X.


       3000-PROCESS-REISSUED-CVGS-X.
           EXIT.
      /
      *----------------------------
       4000-PROCESS-A-REISSUED-CVG.
      *----------------------------

           PERFORM  5000-UPDATE-REISS-HI
               THRU 5000-UPDATE-REISS-HI-X.

           PERFORM  6000-CREATE-NEW-ISS-HI
               THRU 6000-CREATE-NEW-ISS-HI-X.

       4000-PROCESS-A-REISSUED-CVG-X.
           EXIT.
      /
      *------------------------
       5000-UPDATE-REISS-HI.
      *------------------------

      *    GET HI RECORD AND UPDATE THE RECORD
           MOVE RHI-POL-ID             TO WHI-POL-ID.
           MOVE 'M'                    TO WHI-POL-HIST-TYP-CD.
           MOVE RHI-POL-TRXN-EFF-DT    TO WHI-POL-TRXN-EFF-DT.
           MOVE RHI-POL-TRXN-DT        TO WHI-POL-TRXN-DT.
           MOVE RHI-POL-TRXN-TIME      TO WHI-POL-TRXN-TIME.
           MOVE RHI-POL-TRXN-TASK-ID   TO WHI-POL-TRXN-TASK-ID.
           MOVE RHI-POL-TRXN-SEQ-NUM   TO WHI-POL-TRXN-SEQ-NUM.

           PERFORM  HI-1000-READ-FOR-UPDATE
               THRU HI-1000-READ-FOR-UPDATE-X.

           IF  NOT WHI-IO-OK
               MOVE SPACES              TO L0040-INPUT-LINE
               MOVE
               'ERROR - HI RECORD NOT FOUND FOR ABOVE MTD RECORD'
                                        TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 5000-UPDATE-REISS-HI-X
           END-IF.

           MOVE RHI-POL-TRXN-INFO       TO WAT99-REC-INFO.

      *  MOVE PREVIOUS VALUES TO THE PRINT LINE
           MOVE WAT99-LN-NUM            TO  WS-REISS-PRE-LN-NUM.
           IF   WAT99-ON-OFF-IND        =   -1
                MOVE '-'                TO  WS-REISS-PRE-SIGN
           ELSE
                MOVE '+'                TO  WS-REISS-PRE-SIGN
           END-IF.

      *  UPDATE THE MOVEMENT CODE
           MOVE '140'                   TO WAT99-LN-NUM.
           MOVE +1                      TO WAT99-ON-OFF-IND.

           MOVE WAT99-REC-INFO          TO RHI-POL-TRXN-INFO.

           PERFORM  HI-2000-REWRITE
               THRU HI-2000-REWRITE-X.

           ADD 1                        TO WS-HI-RECS-CHANGED.

      *  HOLD THE REISSUE RECORD KEY FOR USE WHEN CREATING THE
      *  NEW ISSUE RECORD
           MOVE RHI-KEY                 TO WS-HOLD-REISS-KEY.

      *    PRINT LINE FOR THE HI RECORD CHANGED
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           PERFORM  5200-SET-UP-REISS-HI-PRINT
               THRU 5200-SET-UP-REISS-HI-PRINT-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-REISS-HI-LINE        TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       5000-UPDATE-REISS-HI-X.
           EXIT.
      /
      *---------------------------
       5200-SET-UP-REISS-HI-PRINT.
      *---------------------------

           MOVE RHI-POL-ID         TO  WS-REISS-POL-ID.
           MOVE WAT99-CVG-NUM      TO  WS-REISS-CVG-NUM.
           MOVE WAT99-PRCES-DT     TO  WS-REISS-EFF-DT.
           MOVE WAT99-LN-NUM       TO  WS-REISS-NEW-LN-NUM.
           IF   WAT99-ON-OFF-IND   =   -1
                MOVE '-'           TO  WS-REISS-NEW-SIGN
           ELSE
                MOVE '+'           TO  WS-REISS-NEW-SIGN
           END-IF.
           MOVE WHI-POL-TRXN-DT    TO  WS-REISS-TRXN-DT.


       5200-SET-UP-REISS-HI-PRINT-X.
           EXIT.
      /
      *------------------------
       6000-CREATE-NEW-ISS-HI.
      *------------------------

      *    NO NEED TO PERFORM THE CSIC, WE HAVE THE RECORD ALREADY
      *    FORMATTED
      *      WE USE THE RE-ISSUE RECORD KEY WITH THE ISSUE RECORD
      *      TRANSACTION INFO

           MOVE WS-HOLD-ISS-HI          TO RHI-REC-INFO.
           MOVE WS-HOLD-REISS-KEY       TO WHI-KEY.

      *    UPDATE THE PROCESSING DATE TO MATCH THE RE-ISSUE DATE
           MOVE RHI-POL-TRXN-INFO       TO WAT99-REC-INFO.

           MOVE WHI-POL-TRXN-EFF-DT     TO L1680-INTERNAL-1.
           MOVE ZERO                    TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                    TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2        TO WAT99-PRCES-DT.


      *    SET THE LINE NUMBER TO -140
           MOVE '140'                   TO WAT99-LN-NUM.
           MOVE -1                      TO WAT99-ON-OFF-IND.

           MOVE WAT99-REC-INFO          TO RHI-POL-TRXN-INFO.

      *    ENSURE THAT THE KEY FOR THIS NEW RE-ISS RECORD IS UNIQUE
           MOVE 'REIS'                  TO WHI-POL-TRXN-TASK-ID.
           ADD 900                      TO WHI-POL-TRXN-SEQ-NUM.
           ADD +1                       TO WHI-POL-TRXN-TIME.

           PERFORM  HI-1000-WRITE
               THRU HI-1000-WRITE-X.

           ADD 1                        TO WS-HI-RECS-CREATED.

      *    PRINT LINE FOR THE NEW HI RECORD ADDED
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           PERFORM  6200-SET-UP-NEW-ISS-HI-PRINT
               THRU 6200-SET-UP-NEW-ISS-HI-PRINT-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-ISS-HI-LINE          TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       6000-CREATE-NEW-ISS-HI-X.
           EXIT.
      /
      *---------------------------
       6200-SET-UP-NEW-ISS-HI-PRINT.
      *---------------------------


           MOVE WHI-POL-ID         TO  WS-ISS-POL-ID.
           MOVE WAT99-CVG-NUM      TO  WS-ISS-CVG-NUM.
           MOVE WAT99-PRCES-DT     TO  WS-ISS-EFF-DT.
           MOVE WAT99-LN-NUM       TO  WS-ISS-LN-NUM.

           IF   WAT99-ON-OFF-IND   =   -1
                MOVE '-'           TO  WS-ISS-SIGN
           ELSE
                MOVE '+'           TO  WS-ISS-SIGN
           END-IF.

           MOVE  WHI-POL-TRXN-DT   TO  WS-ISS-TRXN-DT.

       6200-SET-UP-NEW-ISS-HI-PRINT-X.
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
           MOVE WS-TOTAL-SPND-RECS-LINE TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-TOTAL-POLS-AFF-LINE  TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-TOTAL-NEW-HI-RECS-LINE
                                        TO L0040-INPUT-LINE.
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
       COPY CCPBSPND.
      /
       COPY CCPAHI.
       COPY CCPBHITD.
       COPY CCPUHI.
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
      **                 END OF PROGRAM ZSBM9901                     **
      *****************************************************************
