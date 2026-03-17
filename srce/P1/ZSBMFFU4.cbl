      *************************
       IDENTIFICATION DIVISION.
      *************************
      *
       PROGRAM-ID.  ZSBMFFU4.
      *
       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMFFU4                                         **
      **  REMARKS:  UPDATE UWMX & UWMF TABLES                        **
      **                                                             **
      **            ONE TIME RUN ONLY TO UPDATE FOR UW CHANGES       **
      **            NEEDED FOR THE FUNDS PROJECT                     **
      **                                                             **
      **  DOMAIN :  AC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MFFFU4**  30MAY05  ACR    CREATED FOR UW CHANGES FOR FUNDS PROJECT   **
      *****************************************************************

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

      /
      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.

      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMFFU4'.

       COPY SQLCA.

       COPY XCWL0035.

       COPY XCWWWKDT.
       COPY CCWWINDX.

       COPY CCWWCCC.

       01  HOLD-AREAS.
           05  END-PAGE                  PIC S9(3) VALUE +50 COMP-3.
           05  LINE-COUNT                PIC S9(3) VALUE +0  COMP-3.
           05  PAGE-COUNT                PIC S9(3) VALUE +0  COMP-3.
           05  WS-UWMX-IN-CTR            PIC S9(11)V99.
           05  WS-UWMX-SKIP-CTR          PIC S9(11)V99.
           05  WS-UWMX-UPDT-CTR          PIC S9(11)V99.
           05  WS-UWMF-NEW-CTR           PIC S9(11)V99.
           05  WS-ERROR-SW               PIC X(01) VALUE 'N'.
               88  WS-ERRORS-FOUND                 VALUE 'Y'.

       01  WS-CONTROL-RECORD.
           05  IN-PROGRAM-ID                PIC X(08).
           05  IN-FILLER                    PIC X(01).
           05  IN-UPDT-SW                   PIC X(04).
               88  IN-UPDT-NO               VALUE 'NONU'.
               88  IN-UPDT-YES              VALUE 'UPDT'.
           05  FILLER                       PIC X(67).

       COPY NCFWUWMX.
       COPY NCFRUWMX.

       COPY NCFWUWMF.
       COPY NCFRUWMF.

       01  PRINT-LINE.
           05  FILLER                       PIC X(46) VALUE SPACES.
           05  PL-TEXT                      PIC X(25).
           05  FILLER                       PIC X(05) VALUE SPACES.
           05  PL-CTR                       PIC ZZZ,ZZ9.99-.
           05  FILLER                       PIC X(45) VALUE SPACES.

       COPY CCWL0010.
       COPY CCWL0950.
       COPY XCWL0040.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
       COPY XCSWBCF.
       COPY XCSRBCF.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.
      /
       COPY XCWL1640.
       COPY XCWLDTLK.
       COPY XCWWTIME.
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INITIALIZATION
               THRU 1000-INITIALIZATION-X.
           
           IF  WUWMX-IO-OK
           AND NOT WUWMX-IO-EOF
               PERFORM 2000-PROCESS-TRANS
                  THRU 2000-PROCESS-TRANS-X
                    UNTIL WUWMX-IO-EOF
                     OR WS-ERRORS-FOUND
               PERFORM UWMX-3000-TBL-END-BROWSE
                  THRU UWMX-3000-TBL-END-BROWSE-X
           END-IF.

           PERFORM 9000-FINALIZE
              THRU 9000-FINALIZE-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

       0000-MAINLINE-X.
           STOP RUN.
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
      *--------------------
       1000-INITIALIZATION.
      *--------------------

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE 'XS00000145'           TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-SYSTEM-ID.

           MOVE L0950-COMPANY-NAME     TO L0040-COMPANY-NAME.
           MOVE ZERO                   TO L0040-ERROR-CNT.
           MOVE 'UWMX & UWMF DATA FIX PROGRAM'
                                       TO L0040-PROGRAM-DESC.
           MOVE 'PROCESSING CONTROL REPORT'   
                                       TO L0040-HDG-LINE-3.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF WBCF-SEQ-IO-EOF
      *MSG:   'ZSBMFFU4 NO RUN CONTROL CARD'
              MOVE 'ZSFFU49001'        TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM  0030-4000-CTL-CARD-ERROR
                  THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.

           MOVE RBCF-SEQ-REC-INFO      TO WS-CONTROL-RECORD.
           IF IN-PROGRAM-ID NOT = WPGWS-CRNT-PGM-ID
      *MSG:   '@1 - INVALID PROGRAM-ID'
              MOVE 'ZSFFU49002'        TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              MOVE 'Y'                 TO WS-ERROR-SW
           END-IF.

           IF  IN-UPDT-SW <> 'UPDT'
           AND IN-UPDT-SW <> 'NONU'
      *MSG:   '@1 - INVALID INPUT SWITCH'
              MOVE 'ZSFFU49003'        TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              MOVE 'Y'                 TO WS-ERROR-SW
           END-IF.

           IF WS-ERRORS-FOUND
              PERFORM  0030-4000-CTL-CARD-ERROR
                  THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.

           MOVE ZEROES             TO WS-UWMX-IN-CTR
                                      WS-UWMX-SKIP-CTR
                                      WS-UWMX-UPDT-CTR
                                      WS-UWMF-NEW-CTR.
      *
      * GET INPUT RECORDS
      *
           MOVE LOW-VALUES         TO WUWMX-KEY.
           MOVE HIGH-VALUES        TO WUWMX-ENDBR-KEY.

           PERFORM  UWMX-1000-TBL-BROWSE
               THRU UWMX-1000-TBL-BROWSE-X.

           IF NOT WUWMX-IO-OK
      *MSG:   'INPUT FILE EMPTY - NO DATA TO PROCESS'
              MOVE 'ZSFFU49004'        TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM  0030-5000-LOGIC-ERROR
                  THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *---------------------------
       2000-PROCESS-TRANS.
      *---------------------------
           PERFORM UWMX-2000-TBL-READ-NEXT
              THRU UWMX-2000-TBL-READ-NEXT-X.

           IF  WUWMX-IO-EOF
               GO TO 2000-PROCESS-TRANS-X
           END-IF.

           IF NOT WUWMX-IO-OK
               SET WS-ERRORS-FOUND     TO TRUE
               GO TO 2000-PROCESS-TRANS-X
           END-IF.

           ADD +1                 TO WS-UWMX-IN-CTR.

      *** clear case test '9730' is not to be changed.
      *** only update the records where the form code is 'A' for all

           IF  RUWMX-CCAS-TST-ID  = '9730'
           OR  RUWMX-CCAS-TST-FORM-CD <> 'A'
               ADD +1             TO WS-UWMX-SKIP-CTR
               GO TO 2000-PROCESS-TRANS-X
           END-IF.

           MOVE RUWMX-KEY         TO WUWMX-KEY.
           IF  IN-UPDT-YES
               PERFORM UWMX-1000-READ-FOR-UPDATE
                  THRU UWMX-1000-READ-FOR-UPDATE-X
           ELSE
               PERFORM UWMX-1000-READ
                  THRU UWMX-1000-READ-X
           END-IF.
           IF NOT WUWMX-IO-OK
               SET WS-ERRORS-FOUND     TO TRUE
               GO TO 2000-PROCESS-TRANS-X
           END-IF.

      *** change the form code to 'I' (include)

           MOVE 'I'               TO RUWMX-CCAS-TST-FORM-CD.

      *** the UWMF records list all form types to be either included
      *** or excluded.  Create a new record for 'L' (life) form type

           MOVE RUWMX-KEY         TO WUWMF-KEY.
           PERFORM UWMF-1000-CREATE
              THRU UWMF-1000-CREATE-X.
           MOVE 'L'               TO RUWMF-APP-FORM-TYP-ID.
           MOVE RUWMF-KEY         TO WUWMF-KEY.

           IF  IN-UPDT-YES
               PERFORM UWMF-1000-WRITE
                  THRU UWMF-1000-WRITE-X
           END-IF.

           ADD +1                 TO WS-UWMF-NEW-CTR.

           IF  IN-UPDT-YES
               PERFORM UWMX-2000-REWRITE
                  THRU UWMX-2000-REWRITE-X
           END-IF.

           ADD +1                 TO WS-UWMX-UPDT-CTR.

       2000-PROCESS-TRANS-X.
           EXIT.
      /
      *---------------------------
       9000-FINALIZE.
      *---------------------------
           MOVE SPACES            TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES            TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES            TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

           MOVE 'UWMX RECORDS - INPUT'         TO  PL-TEXT.
           MOVE WS-UWMX-IN-CTR                 TO  PL-CTR.
           MOVE PRINT-LINE                     TO  L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.
         
           MOVE SPACES            TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES            TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

           MOVE 'UWMX RECORDS - SKIPPED'       TO  PL-TEXT.
           MOVE WS-UWMX-SKIP-CTR               TO  PL-CTR.
           MOVE PRINT-LINE                     TO  L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.
         
           MOVE SPACES            TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

           MOVE 'UWMX RECORDS - UPDATED'       TO  PL-TEXT.
           MOVE WS-UWMX-UPDT-CTR               TO  PL-CTR.
           MOVE PRINT-LINE                     TO  L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.
         
           MOVE SPACES            TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.
         
           MOVE SPACES            TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

           MOVE 'UWMF RECORDS - CREATED'       TO  PL-TEXT.
           MOVE WS-UWMF-NEW-CTR                TO  PL-CTR.
           MOVE PRINT-LINE                     TO  L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

       9000-FINALIZE-X.
           EXIT.
      /

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.


       COPY XCPL0030.
       COPY XCPL0035.
       COPY XCPL0040.

       COPY CCPPCCC.

       COPY CCPL0010.
       COPY CCPS0010.

       COPY CCPL0950.
       COPY CCPS0950.
       COPY XCPL0260.
       COPY XCPLOCF.
       COPY XCPLBCF.

       COPY XCPOOCF.
       COPY XCPOBCF.
       COPY XCPNBCF.

       COPY NCPAUWMF.
       COPY NCPCUWMF.

       COPY NCPNUWMX.
       COPY NCPTUWMX.
       COPY NCPUUWMX.
      *
      *****************************************************************
      **                 END OF PROGRAM ZSBMFFU4                     **
      *****************************************************************
