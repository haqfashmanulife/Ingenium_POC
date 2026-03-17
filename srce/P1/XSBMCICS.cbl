      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSBMCICS.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : XSBMCICS                                          **
      **  REMARKS: THIS PROGRAM READS IN CICS TRANSACTION INFO       **
      **           AND STORES IT IN A DB2 TABLE                      **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.   DESCRIPTION                               **
      **                                                             **
      **  24JAN02  WBP     INITIAL DESIGN                            **
      **                                                             **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT MON1-DATA-FILE ASSIGN TO CSMON1
                  ORGANIZATION   IS LINE SEQUENTIAL
                  FILE STATUS    IS WMON1-SEQ-FILE-STATUS.

      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
      /
       FD  MON1-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RMON1-SEQ-REC-INFO.
           05  FILLER                         PIC X(01).
           05  RMON1-TXN-DT                   PIC X(06).
           05  FILLER                         PIC X(01).
           05  RMON1-TXN-ID                   PIC X(04).
           05  FILLER                         PIC X(01).
           05  RMON1-TXN-CNT                  PIC X(06).
           05  FILLER                         PIC X(61).

      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSBMCICS'.


       COPY SQLCA.

P02229 COPY XCWL0035.

       COPY XCWWWKDT.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWTFCMD.
      /
       COPY XCFWCICS.
       COPY XCFRCICS.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       01  WMON1-SEQ-IO-WORK-AREA.
           05  WMON1-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'MON1'.
           05  WMON1-SEQ-IO-COMMAND             PIC X(02).
           05  WMON1-SEQ-FILE-STATUS            PIC X(02).
           05  WMON1-SEQ-IO-STATUS              PIC 9(01).
               88  WMON1-SEQ-IO-OK              VALUE 0.
               88  WMON1-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WMON1-SEQ-IO-EOF             VALUE 8.
               88  WMON1-SEQ-IO-ERROR           VALUE 9.


       01 WS-LINE-OUT.
           05  WS-DESC                PIC X(30)
               VALUE ' XSBMCICS - MON1 RECORDS READ '.
           05  WS-COUNT-OUT           PIC Z(6)9 VALUE ZEROS.
           05  FILLER                 PIC X(95) VALUE SPACES.

       01 WS-COUNTERS.
           05  WS-MON1-COUNT          PIC 9(07) VALUE 0.

       01 WS-WORK-FIELDS.
           05  WS-WORK-YYYY.
               10  WS-WORK-CC         PIC 9(02).
               10  WS-WORK-YY         PIC 9(02).
           05  WS-WORK-AMT            PIC X(6).
           05  WS-WORK-AMT-N          REDEFINES
               WS-WORK-AMT            PIC 9(6).
           05  WS-ERROR-IND           PIC X(1).
               88  WS-ERROR-NO            VALUE 'N'.
               88  WS-ERROR               VALUE 'Y'.

       01  WS-TEMP-DATE.
           05  WS-TEMP-DATE-C              PIC X(01).
           05  WS-TEMP-DATE-YY             PIC 9(02).
           05  WS-TEMP-DATE-DDD            PIC 9(03).
      /
       COPY XCWLDTLK.
      /
       COPY XCWL1670.

      ********************
       PROCEDURE DIVISION.
      ********************

       0000-MAINLINE.

           INITIALIZE WOCF-SEQ-IO-WORK-AREA.

           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.

           MOVE 0 TO WMON1-SEQ-IO-STATUS.

           PERFORM 3000-PROCESS-TRANSACTIONS
              THRU 3000-PROCESS-TRANSACTIONS-X
             UNTIL WMON1-SEQ-IO-EOF.

           PERFORM 8000-PRINT-TOTALS
              THRU 8000-PRINT-TOTALS-X.

           PERFORM 9000-CLOSE-FILES
              THRU 9000-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           OPEN INPUT MON1-DATA-FILE.

           IF  WMON1-SEQ-FILE-STATUS  NOT = ZERO
               MOVE TFCMD-OPEN-I-FILE TO WMON1-SEQ-IO-COMMAND
               PERFORM  9150-HANDLE-MON1-ERROR
                   THRU 9150-HANDLE-MON1-ERROR-X
           END-IF.


       0100-OPEN-FILES-X.
           EXIT.
      /
      *--------------------------
       3000-PROCESS-TRANSACTIONS.
      *--------------------------

           PERFORM 9100-MON1-READ
              THRU 9100-MON1-READ-X.

           IF NOT WMON1-SEQ-IO-OK
               GO TO 3000-PROCESS-TRANSACTIONS-X
           END-IF.

           MOVE RMON1-TXN-CNT         TO WS-WORK-AMT.
           INSPECT WS-WORK-AMT REPLACING ALL ' ' BY '0'.

           MOVE RMON1-TXN-DT          TO WS-TEMP-DATE.
           MOVE WS-TEMP-DATE-YY       TO WS-WORK-YY.
           IF WS-TEMP-DATE-C = '0'
               MOVE 19                TO WS-WORK-CC
           ELSE
               MOVE 20                TO WS-WORK-CC
           END-IF.
           MOVE WS-WORK-YYYY          TO L1670-YYYY-1.
           MOVE WS-TEMP-DATE-DDD      TO L1670-DDD-1.

           PERFORM 1670-6000-YYYYDDD-INTERNAL
              THRU 1670-6000-YYYYDDD-INTERNAL-X.

           MOVE L1670-INTERNAL-DATE   TO WCICS-TXN-DT.
           MOVE RMON1-TXN-ID          TO WCICS-TXN-ID.

           PERFORM CICS-1000-READ-FOR-UPDATE
              THRU CICS-1000-READ-FOR-UPDATE-X.

           IF WCICS-IO-OK
               ADD WS-WORK-AMT-N TO RCICS-TXN-CNT
               PERFORM CICS-2000-REWRITE
                  THRU CICS-2000-REWRITE-X
           ELSE
               MOVE L1670-INTERNAL-DATE   TO RCICS-TXN-DT
               MOVE RMON1-TXN-ID          TO RCICS-TXN-ID
               MOVE WS-WORK-AMT-N         TO RCICS-TXN-CNT
               PERFORM CICS-1000-WRITE
                  THRU CICS-1000-WRITE-X
           END-IF.

       3000-PROCESS-TRANSACTIONS-X.
           EXIT.

      *------------------
       8000-PRINT-TOTALS.
      *------------------

           MOVE WS-MON1-COUNT    TO  WS-COUNT-OUT.
           MOVE WS-LINE-OUT      TO  ROCF-REC-DETAIL.
           PERFORM OCF-1000-WRITE
              THRU OCF-1000-WRITE-X.

       8000-PRINT-TOTALS-X.
           EXIT.

      *-----------------
       9000-CLOSE-FILES.
      *-----------------

           CLOSE MON1-DATA-FILE.

           IF WMON1-SEQ-FILE-STATUS  NOT = ZERO
               MOVE TFCMD-CLOSE-FILE TO WMON1-SEQ-IO-COMMAND
               PERFORM 9150-HANDLE-MON1-ERROR
                  THRU 9150-HANDLE-MON1-ERROR-X
           END-IF.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9000-CLOSE-FILES-X.
           EXIT.

      *---------------
       9100-MON1-READ.
      *---------------

           MOVE ZERO                   TO WMON1-SEQ-IO-STATUS.
           MOVE SPACES                 TO RMON1-SEQ-REC-INFO.

           READ MON1-DATA-FILE
                AT END
                  MOVE 8               TO WMON1-SEQ-IO-STATUS
                  GO TO 9100-MON1-READ-X.

           IF WMON1-SEQ-FILE-STATUS  NOT = ZERO
               MOVE TFCMD-READ-RECORD  TO WMON1-SEQ-IO-COMMAND
               PERFORM 9150-HANDLE-MON1-ERROR
                  THRU 9150-HANDLE-MON1-ERROR-X
           END-IF.

           IF RMON1-TXN-DT = SPACES
               MOVE 8                  TO WMON1-SEQ-IO-STATUS
               GO TO 9100-MON1-READ-X
           END-IF.

           ADD 1 TO WS-MON1-COUNT.

       9100-MON1-READ-X.
           EXIT.
      /
      *-----------------------
       9150-HANDLE-MON1-ERROR.
      *-----------------------

           MOVE WMON1-SEQ-FILE-NAME      TO WGLOB-TABLE-NAME.
           MOVE WMON1-SEQ-FILE-STATUS    TO WGLOB-SEQ-FILE-STATUS.
           MOVE WMON1-SEQ-IO-COMMAND     TO WGLOB-IO-COMMAND.

           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9150-HANDLE-MON1-ERROR-X.
           EXIT.
      /
      *****************************************************************
      *  COPYBOOKS AND MISCELLANEOUS ROUTINES                         *
      *****************************************************************
      /
P02229 COPY XCPL0035.

       COPY XCPAOCF.
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPACICS.
       COPY XCPUCICS.
      /
       COPY XCPL1670.
      /
       COPY XCPL0030.
