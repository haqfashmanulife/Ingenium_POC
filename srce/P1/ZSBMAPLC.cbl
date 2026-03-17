      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMAPLC.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBMAPLC                                          **
      **  REMARKS: UPDATE TPOLL TABLE FIELDS                         **
      **                                                             **
      **                                                             **
      **  DOMAIN :  AC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  21JUL14  CTS    TPOLL TABLE UPDATE FOR APL COMMISSIONS     **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT APLC-DATA-FILE ASSIGN     TO ZSAPLC
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WAPLC-SEQ-FILE-STATUS.
      /
       CONFIGURATION SECTION.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       FD  APLC-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
           
        01  RAPLC-SEQ-REC-INFO.
            05 FILLER                       PIC  X(01).
            05 RAPLC-POL-ID                 PIC X(10).

      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMAPLC'.

       COPY SQLCA.

       01  WS-WORK-AREA.

           05  WSUM-QTY                PIC 9(02).
           05  WS-POL-ID               PIC X(10).
           05  WS-TOT-QTY              PIC 9(02).
           05  WS-TOTAL-QTY            PIC 9(02).
           05  WS-REPAY-TOTAL-AMT      PIC S9(13)V9(02) COMP-3.
           05  WS-FINAL-QTY            PIC X(01).
               88  WS-FINAL-QTY-Y      VALUE 'Y'.
               88  WS-FINAL-QTY        VALUE 'N'.

      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************

       COPY XCWWWKDT.
       COPY CCWWCCC.
       COPY CCWWINDX.
       COPY XCWTFCMD.
       COPY XCWWTIME.
       COPY CCWLPGA.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0035.
       COPY CCWWCVGS.
       COPY CCFHCVGS.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************

       COPY CCFWPOL.
       COPY CCFRPOL.
       
       COPY CCFWPOLL.
       COPY CCFRPOLL.

       COPY CCFWLHST.
       COPY CCFRLHST.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY APLC
                               ==':ID:'==  BY =='APLC'==.
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
      ****************************************************************
      * CALLED MODULE PARAMETER INFORMATION                          *
      ****************************************************************
       COPY XCWL1640.
       COPY XCWL1680.
       COPY XCWL1670.
       COPY XCWL0280.

       COPY CCWL9215.
       COPY CCWL0950.
       COPY CCWLTHS.
       
       COPY CCFHPOL.

       COPY XCWL0040.

       COPY XCWLDTLK.

       COPY XCSWOCF.
       COPY XCSROCF.

       COPY CCWL0010.
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

           PERFORM  2000-PROCESS-REC
               THRU 2000-PROCESS-REC-X
               UNTIL WAPLC-SEQ-IO-EOF.

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

           MOVE ZERO                        TO WAPLC-SEQ-IO-STATUS.

           OPEN INPUT APLC-DATA-FILE.

           IF WAPLC-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  2400-HANDLE-ERROR
                  THRU 2400-HANDLE-ERROR-X
           END-IF.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           INITIALIZE  WS-WORK-AREA.
           INITIALIZE  RAPLC-SEQ-REC-INFO.

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBMAPLC'                  TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  1100-INIT-OCF-TITLES
               THRU 1100-INIT-OCF-TITLES-X.

           PERFORM  1500-APLC-READ
               THRU 1500-APLC-READ-X.

       1000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       1100-INIT-OCF-TITLES.
      *---------------------
      *
      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT
      *

           MOVE ZERO                        TO L0040-ERROR-CNT.
      *
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       1100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *-----------------
       2000-PROCESS-REC.
      *-----------------

           MOVE RAPLC-POL-ID                TO WS-POL-ID
                                            WPOL-POL-ID.
           
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
           
           IF  WPOL-IO-OK
               CONTINUE
           ELSE
               PERFORM  1500-APLC-READ
                   THRU 1500-APLC-READ-X 
                   GO TO 2000-PROCESS-REC-X
           END-IF.

           MOVE LOW-VALUES                  TO WLHST-KEY.
           MOVE HIGH-VALUES                 TO WLHST-ENDBR-KEY.

           MOVE WS-POL-ID                TO WLHST-POL-ID.
           MOVE 'A'                         TO WLHST-POL-LOAN-ID.
           MOVE WWKDT-LOW-DT                TO WLHST-POL-LOAN-EFF-DT.
           MOVE ZEROES                      TO WLHST-POL-LOAN-SEQ-NUM.
           MOVE WS-POL-ID                TO WLHST-ENDBR-POL-ID.
           MOVE 'A'                         TO WLHST-ENDBR-POL-LOAN-ID.
           MOVE WWKDT-HIGH-DT               TO
                                       WLHST-ENDBR-POL-LOAN-EFF-DT.
           MOVE +999                        TO
                                       WLHST-ENDBR-POL-LOAN-SEQ-NUM.

           PERFORM  LHST-1000-BROWSE
               THRU LHST-1000-BROWSE-X.

           PERFORM  LHST-2000-READ-NEXT
               THRU LHST-2000-READ-NEXT-X.

           IF  WLHST-IO-OK
               CONTINUE
           ELSE
               PERFORM  LHST-3000-END-BROWSE
                   THRU LHST-3000-END-BROWSE-X

               PERFORM  1500-APLC-READ
                   THRU 1500-APLC-READ-X
                   GO TO 2000-PROCESS-REC-X
           END-IF.

           PERFORM  2100-PROCESS-LHST
               THRU 2100-PROCESS-LHST-X
               UNTIL WLHST-IO-EOF.

           PERFORM  LHST-3000-END-BROWSE
               THRU LHST-3000-END-BROWSE-X.

           PERFORM  2300-UPDATE-POLL
               THRU 2300-UPDATE-POLL-X.

           PERFORM  1500-APLC-READ
               THRU 1500-APLC-READ-X.

       2000-PROCESS-REC-X.
           EXIT.
      /
      *-------------------
       2100-PROCESS-LHST.
      *-------------------

           IF  RLHST-POL-LOAN-STAT-ACTIVE
               EVALUATE TRUE

                   WHEN RLHST-POL-LOAN-TRXN-NEW-APL
                        IF  RPOL-POL-BILL-MODE-MONTHLY
                            MOVE 06         TO WS-TOT-QTY
                        ELSE
                            MOVE 01         TO WS-TOT-QTY
                        END-IF

                   WHEN RLHST-POL-LOAN-TRXN-ADD-APL
                        IF  RPOL-POL-BILL-MODE-MONTHLY
                            ADD 06          TO WS-TOT-QTY
                        ELSE
                            ADD 01          TO WS-TOT-QTY
                        END-IF

                   WHEN RLHST-POL-LOAN-TRXN-PREPAY
                   WHEN RLHST-POL-LOAN-TRXN-POL-CHNG
                        PERFORM  2200-PROCESS-PREPAY-RECORD
                            THRU 2200-PROCESS-PREPAY-RECORD-X

                   WHEN RLHST-POL-LOAN-TRXN-FREPAY
                        MOVE ZEROES         TO WS-TOT-QTY

               END-EVALUATE
           END-IF.

           PERFORM  LHST-2000-READ-NEXT
               THRU LHST-2000-READ-NEXT-X.

       2100-PROCESS-LHST-X.
           EXIT.
      /
      *---------------------------
       2200-PROCESS-PREPAY-RECORD.
      *---------------------------

           COMPUTE WS-REPAY-TOTAL-AMT = WS-REPAY-TOTAL-AMT
                                + RLHST-POL-LOAN-TRXN-AMT

           DIVIDE WS-REPAY-TOTAL-AMT BY RPOL-POL-MPREM-AMT GIVING
                      WS-TOTAL-QTY REMAINDER WS-REPAY-TOTAL-AMT

           IF  WS-TOT-QTY > 1
               COMPUTE WS-TOT-QTY = WS-TOT-QTY - WS-TOTAL-QTY
           END-IF.

       2200-PROCESS-PREPAY-RECORD-X.
           EXIT.
      /
      *-----------------
       2300-UPDATE-POLL.
      *-----------------

           MOVE WS-POL-ID                   TO WPOLL-POL-ID.
           MOVE 'A'                         TO WPOLL-POL-LOAN-ID.

           PERFORM  POLL-1000-READ-FOR-UPDATE
               THRU POLL-1000-READ-FOR-UPDATE-X

           EVALUATE TRUE
               WHEN RPOL-POL-BILL-MODE-MONTHLY
                   MOVE WS-TOT-QTY          TO
                                                RPOLL-MTHLY-MODE-QTY
               WHEN RPOL-POL-BILL-MODE-SEMI-ANN
                   MOVE WS-TOT-QTY          TO
                                               RPOLL-SEMI-ANN-MODE-QTY
               WHEN RPOL-POL-BILL-MODE-ANNUALLY
                   MOVE WS-TOT-QTY          TO RPOLL-ANN-MODE-QTY
           END-EVALUATE.

           PERFORM  POLL-2000-REWRITE
               THRU POLL-2000-REWRITE-X.

       2300-UPDATE-POLL-X.
           EXIT.
      /
      *---------------
       1500-APLC-READ.
      *---------------

           MOVE ZEROES                      TO WS-REPAY-TOTAL-AMT
                                               WS-TOTAL-QTY.

           MOVE ZERO                        TO WAPLC-SEQ-IO-STATUS.

           READ APLC-DATA-FILE
                AT END
                  MOVE 8                    TO WAPLC-SEQ-IO-STATUS
                  GO TO 1500-APLC-READ-X.

           IF RAPLC-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                        TO WAPLC-SEQ-IO-STATUS
              GO TO 1500-APLC-READ-X
           END-IF.

           IF WAPLC-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  2400-HANDLE-ERROR
                  THRU 2400-HANDLE-ERROR-X
           END-IF.

       1500-APLC-READ-X.
           EXIT.
/           
      *------------------
       2400-HANDLE-ERROR.
      *------------------
           MOVE WAPLC-SEQ-FILE-NAME          TO WGLOB-TABLE-NAME.
           MOVE WAPLC-SEQ-FILE-STATUS        TO WGLOB-SEQ-FILE-STATUS.
           MOVE WAPLC-SEQ-IO-COMMAND         TO WGLOB-IO-COMMAND.
           PERFORM  0030-3000-QSAM-ERROR
               THRU 0030-3000-QSAM-ERROR-X.

       2400-HANDLE-ERROR-X.
           EXIT.
/           
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                        TO WAPLC-SEQ-IO-STATUS.

           CLOSE APLC-DATA-FILE.

           IF WAPLC-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  2400-HANDLE-ERROR
                  THRU 2400-HANDLE-ERROR-X
           END-IF.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************

       COPY XCPL0035.

       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
       COPY XCPL0260.
      /      
       COPY CCPPCCC.
      /
       COPY XCPL0040.
      /
       COPY CCPSPGA.
      /
      *****************************************************************
      * FILE HANDLING ROUTINES
      *****************************************************************
      * COPY XCSLFILE REPLACING ==:ID:==  BY APLC
      *                         ==':PGM:'== BY =='ZSRQAPLC'==.
      * COPY XCSOFILE REPLACING ==:ID:==  BY APLC.
      * COPY XCSASEQ  REPLACING ==:ID:==  BY APLC.
      * COPY XCSNSEQ  REPLACING ==:ID:==  BY APLC.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY CCPNPOL.
      /
       COPY CCPBLHST.
       COPY CCPVLHST.
      /
       COPY CCPAPOLL.
       COPY CCPUPOLL.
       COPY CCPNPOLL.
      /
      *****************************************************************
      *    ERROR HANDLING ROUTINES                                    *
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBMAPLC                     **
      *****************************************************************
