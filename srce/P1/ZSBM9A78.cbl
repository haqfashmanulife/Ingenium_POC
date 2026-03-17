      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSBM9A78.
      
       COPY XCWWCRHT.
       
      *****************************************************************
      **  MEMBER :  ZSBM9A78                                         **
      **  REMARKS:  PROGRAM FOR CBB TRANSITION                       **
      **                                                             **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
EN9652**  28JUN10  CTS    INITIAL VERSION.                           **
MP171F**  20JAN12  CTS    LOGICAL LOCKING CHANGES                    **
      *****************************************************************

      *
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
      *
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9A78'.

       COPY SQLCA.
       COPY XCWLDTLK.
       COPY XCWTFCMD.
       COPY XCWWHDG.
       COPY CCWWINDX.
MP171F COPY CCWWLOCK.
MP171F COPY XCWL8090.
      /
       COPY XCWL0040.
       
       01  WS-PROGRAM-WORK-AREA.
           05  WS-HOLD-POL-ID               PIC X(07) VALUE SPACES.
           05  WS-BONUS-AMT                 PIC S9(16)V99 COMP-3.
           05  WS-TOTAL-CMB-PAID            PIC S9(16)V99 COMP-3.
           05  WS-IN-RECORD.
               10  WS-IN-PGM-ID             PIC X(08).
               10  FILLER                   PIC X(01).
           05  WS-CFLW-REC-FOUND            PIC X(01).
               88  WS-CFLW-REC-FOUND-YES    VALUE 'Y'.
               88  WS-CFLW-REC-FOUND-NO     VALUE 'N'.
           05  WS-UNDO-PRCES-STAT           PIC X(01).
               88  WS-UNDO-PRCES-YES        VALUE 'Y'.
               88  WS-UNDO-PRCES-NO         VALUE 'N'.

      ****************************************************************
      *    COMMON COPYBOOKS                                          *
      ****************************************************************
       COPY CCWWCCC.
       COPY CCWWBTAX.
      / 
      ****************************************************************
      *  FILE WORK AREA FOR EXTRACT/REPORT FILES                     *
      ****************************************************************
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9A78
                               ==':ID:'==  BY =='9A78'==.
       COPY ZCSR9A78.
      ****************************************************************
      *  TABLE LAYOUT & WORK AREAS FOR EXTRACT/REPORT TABLES         *
      ****************************************************************

       COPY XCSRBCF.
       COPY XCSWBCF.
      /
       COPY XCSROCF.
       COPY XCSWOCF.
      /
       COPY CCFRPOL.
       COPY CCFWPOL.
       COPY CCFHPOL.
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCWWCVGS.
       COPY CCFRCFLW.
       COPY CCFHCFLW.
       COPY CCFWCFLW.
      *****************************************************************
      *    CALLED MODULE PARAMETER INFORMATION                        *
      *****************************************************************
       COPY CCWL5277.
       COPY CCWL2194.
       COPY CCWL9370.
       COPY CCWL0201.
       COPY CCWL4750.
       COPY NCWL0960.
       COPY XCWL0035.
       COPY XCWL0290.
       COPY CCWL0950.
       COPY CCWL0010.
       COPY XCWL1680.
       COPY CCWL1021.
       COPY CCWLACCT.
       COPY XCWL1670.
       COPY XCWLPTR.
       COPY CCWLPGA.
       COPY XCWL0280.
       COPY CCWL1651.
       COPY CCWL2120.
       COPY XCWWWKDT.
       COPY CCFRMAST.
       COPY CCFWMAST.
      /
       01   WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       PROCEDURE DIVISION.
      *
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.

           PERFORM  3000-PROCESS-TRANSACTION
               THRU 3000-PROCESS-TRANSACTION-X
               UNTIL W9A78-SEQ-IO-EOF.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           STOP RUN..

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-5000-OPEN-EXTEND
               THRU OCF-5000-OPEN-EXTEND-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  9A78-1000-OPEN-INPUT
               THRU 9A78-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       2000-INITIALIZE.
      *----------------

           PERFORM  2100-VALIDATE-DATA-CARD
               THRU 2100-VALIDATE-DATA-CARD-X.

           PERFORM  PGA-1000-BUILD-PARMS
               THRU PGA-1000-BUILD-PARMS-X.

           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.

           SET WS-CFLW-REC-FOUND-NO         TO TRUE.
           MOVE ZEROES                      TO LPGA-ATRN-SEQUENCE.

           MOVE SPACES                      TO RMAST-KEY.
           MOVE WGLOB-COMPANY-CODE          TO WMAST-CO-ID.

           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.

           MOVE RMAST-APPL-CTL-PRCES-DT     TO WGLOB-PROCESS-DATE.

           PERFORM  9A78-1000-READ
               THRU 9A78-1000-READ-X.

           IF  W9A78-SEQ-IO-EOF
      *MSG: INPUT FILE IS EMPTY
               MOVE 'ZS9A780001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2000-INITIALIZE-X.
           EXIT.
      /
      *------------------------
       2100-VALIDATE-DATA-CARD.
      *------------------------

      **   READ THE COMPANY CONTROL CARD
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

      **** GET THE SYSTEM ID
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.

           MOVE RBCF-SEQ-REC-INFO           TO WS-IN-RECORD.
           MOVE WS-IN-RECORD                TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           IF  WS-IN-PGM-ID NOT = WPGWS-CRNT-PGM-ID
      **** MESSAGE (S) 'INVALID PROGRAM ID CONTROL CARD'
               MOVE 'XS00000121'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.

       2100-VALIDATE-DATA-CARD-X.
           EXIT.
      /
      *-------------------------
       3000-PROCESS-TRANSACTION.
      *-------------------------

           INITIALIZE WS-HOLD-POL-ID
                      WS-BONUS-AMT
                      WS-TOTAL-CMB-PAID.
           SET WS-CFLW-REC-FOUND-NO         TO TRUE.
           SET WS-UNDO-PRCES-NO             TO TRUE.

      *MSG: PROCESSING POLICY @1
           MOVE 'ZS9A780002'                TO WGLOB-MSG-REF-INFO.
           MOVE R9A78-POL-ID                TO WGLOB-MSG-PARM (1)
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE R9A78-POL-ID                TO WS-HOLD-POL-ID.
           MOVE R9A78-BONUS-AMT             TO L0280-INPUT-DATA.
           MOVE 2                           TO L0280-PRECISION.
           SET L0280-SIGN-PERMITTED         TO TRUE.
           MOVE LENGTH OF R9A78-BONUS-AMT   TO L0280-INPUT-SIZE.
           COMPUTE L0280-LENGTH = L0280-INPUT-SIZE -
                     L0280-PRECISION - 1.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.

      * VALIDATION OF BONUS AMT FIELD IN INPUT FILE
           IF  NOT L0280-RETRN-OK
           OR  L0280-OUTPUT-V02 = ZEROS
      *MSG: INVALID BONUS AMOUNT FOR POLICY @1
               MOVE 'ZS9A780003'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9A78-1000-READ
                   THRU 9A78-1000-READ-X
               GO TO 3000-PROCESS-TRANSACTION-X
           END-IF.

           MOVE L0280-OUTPUT-V02            TO WS-BONUS-AMT.

           MOVE WS-HOLD-POL-ID              TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

      * VALIDATION OF POLICY ID
           IF  NOT WPOL-IO-OK
      *MSG POLICY ID @1 NOT FOUND
               MOVE 'ZS9A780004'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9A78-1000-READ
                   THRU 9A78-1000-READ-X
               GO TO 3000-PROCESS-TRANSACTION-X
           END-IF.
           
           IF  RPOL-POL-INS-TYP-TRAD
      *MSG POLICY @1 NOT UL, SO NOT APPLICABLE
               MOVE 'ZS9A780014'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9A78-1000-READ
                   THRU 9A78-1000-READ-X
               GO TO 3000-PROCESS-TRANSACTION-X
           END-IF.

           IF  RPOL-POL-STAT-LAPSED
      *MSG POLICY ID @1 IS LAPSED, PLSA DEPOSIT TO BE DONE
               MOVE 'ZS9A780009'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  3500-LAPSED-POL-DEPOSIT
                   THRU 3500-LAPSED-POL-DEPOSIT-X
               PERFORM  0035-1000-COMMIT
                   THRU 0035-1000-COMMIT-X
               PERFORM  9A78-1000-READ
                   THRU 9A78-1000-READ-X
               GO TO 3000-PROCESS-TRANSACTION-X
           END-IF.

           IF  NOT RPOL-POL-STAT-IN-FORCE
      *MSG: POLICY @1 NEITHER LAPSED NOR PREMIUM PAYING, SO NOT APPLICABLE
               MOVE 'ZS9A780005'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9A78-1000-READ
                   THRU 9A78-1000-READ-X
               GO TO 3000-PROCESS-TRANSACTION-X
           END-IF.

           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           MOVE 'N00003'                    TO LPGA-OPER-CAT-CD.

           PERFORM  1651-0000-INIT-PARM-INFO
               THRU 1651-0000-INIT-PARM-INFO-X.

           PERFORM  1651-1000-BUILD-PARM-INFO
               THRU 1651-1000-BUILD-PARM-INFO-X.

           SET L1651-BALANCE-BYPASS         TO TRUE.
           MOVE WGLOB-PROCESS-DATE          TO L1651-SA-XFER-EFF-DT.
           SET  L1651-COLCTD-TYP-DIRECT     TO TRUE.
           MOVE ' '                         TO L1651-CDI-TYP-CD.
           MOVE WS-BONUS-AMT                TO L1651-DEPOSIT-AMT
                                               L1651-SA-XFER-AMT
                                               L1651-CASH-AMT.
           SET L1651-UNDO-BYPASS            TO TRUE.
           SET L1651-SA-XFER-SRCE-COLCT     TO TRUE.
           INITIALIZE L1651-ERR-TOTAL.
           INITIALIZE L1651-CAIN-CDI-EFF-DT.

      * CHECK FOR POLICIES IN GRACE
           IF  RPOL-POL-STAT-IN-FORCE
           AND RPOL-UL-LAPS-STRT-DT NOT = WWKDT-ZERO-DT
           AND RPOL-UL-LAPS-STRT-DT NOT = SPACES
      * POLICIES IN GRACE ARE UNDONE TILL LSD -1 DAY
      * DEPOSIT IS DONE ON LSD-1 DAY
      *
      *MSG: POLICY @1 IS IN GRACE,
               MOVE 'ZS9A780010'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE RPOL-UL-LAPS-STRT-DT    TO L1680-INTERNAL-1
               MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
               MOVE 1                       TO L1680-NUMBER-OF-DAYS
               MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X
               MOVE L1680-INTERNAL-2        TO L1651-EFF-DT
               MOVE 'BATCH'                 TO WGLOB-USER-ID
               PERFORM  4750-1000-BUILD-PARM-INFO
                   THRU 4750-1000-BUILD-PARM-INFO-X
               SET L4750-TCNTRCT-PREM-REVRS-BPSS   TO TRUE
               SET L4750-FCN-DRVR-SECONDARY TO TRUE
               SET L4750-PRCES-EXCLUSIVE    TO TRUE
               MOVE L1651-EFF-DT            TO L4750-EFF-DT
      * THE LPGA PARMS ARE SETUP BEFORE CALLING CSRF4750, 
      * IN A WAY SIMILAR TO 1651 MODULE
               MOVE RPOL-POL-ID             TO LPGA-POLICY-NUMBER
               SET LPGA-EVNT-CD-SPREM-DIR   TO TRUE
               PERFORM  4750-1000-UNDO-PROCESSING
                   THRU 4750-1000-UNDO-PROCESSING-X
               IF  NOT L4750-RETRN-OK
      *MSG POLICY @1 ENCOUNTERED ERROR IN UNDO PROCESSING, DEPOSIT SKIPPED
                   MOVE 'ZS9A780006'        TO WGLOB-MSG-REF-INFO
                   MOVE R9A78-POL-ID        TO WGLOB-MSG-PARM (1)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   PERFORM  9A78-1000-READ
                       THRU 9A78-1000-READ-X
                   GO TO 3000-PROCESS-TRANSACTION-X
               END-IF
               IF  L4750-POL-UPDATE-REQD
                   MOVE RPOL-REC-INFO       TO HPOL-REC-INFO
                   MOVE RPOL-KEY            TO WPOL-KEY
                   PERFORM  POL-1000-READ-FOR-UPDATE
                       THRU POL-1000-READ-FOR-UPDATE-X
                   MOVE HPOL-REC-INFO       TO RPOL-REC-INFO
                   PERFORM  POL-2000-REWRITE
                       THRU POL-2000-REWRITE-X
                   PERFORM  CVGR-1000-REWRITE-CVGS-ARRAY
                       THRU CVGR-1000-REWRITE-CVGS-ARRAY-X
               END-IF
               SET WS-UNDO-PRCES-YES        TO TRUE
               SET L1651-UNDO-BYPASS        TO TRUE
           ELSE
      * FOR PREMIUM POLICIES, DEPOSIT IS DONE ON SYSTEM DATE
      *MSG POLICY ID @1 IS PREMIUM PAYING, DEPOSIT PROCESSING STARTS
               MOVE 'ZS9A780011'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE RMAST-APPL-CTL-PRCES-DT TO L1651-EFF-DT
           END-IF.

           MOVE WPGWS-CRNT-PGM-ID           TO WGLOB-USER-ID.

           PERFORM  1651-1000-POL-PAYMENT
               THRU 1651-1000-POL-PAYMENT-X.

           IF  L1651-RETRN-OK
      * THE DEPSOIT AMT IS ADDED TO THE COLLCTN MTHD BON TOT PAID AMT
      * FIELD IN POL TABLE
      *MSG POLICY ID @1 TOT COLL MTHD BONUS CHANGED FROM @2 TO @3.
               MOVE 'ZS9A780013'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               COMPUTE  L0290-INPUT-NUMBER = RPOL-CBB-CMB-LTD-PD-AMT
               PERFORM  8000-FORMAT-AMOUNT
                   THRU 8000-FORMAT-AMOUNT-X
               MOVE L0290-OUTPUT-DATA       TO WGLOB-MSG-PARM (02)
               COMPUTE RPOL-CBB-CMB-LTD-PD-AMT 
                   = RPOL-CBB-CMB-LTD-PD-AMT + WS-BONUS-AMT
               COMPUTE  L0290-INPUT-NUMBER = RPOL-CBB-CMB-LTD-PD-AMT
               PERFORM  8000-FORMAT-AMOUNT
                   THRU 8000-FORMAT-AMOUNT-X
               MOVE L0290-OUTPUT-DATA       TO WGLOB-MSG-PARM (03)
               PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               IF  WS-UNDO-PRCES-YES
                   PERFORM  4000-REDO-PROCESS
                       THRU 4000-REDO-PROCESS-X
               END-IF
               MOVE RPOL-REC-INFO           TO HPOL-REC-INFO
               MOVE RPOL-KEY                TO  WPOL-KEY
               PERFORM  POL-1000-READ-FOR-UPDATE
                   THRU POL-1000-READ-FOR-UPDATE-X
               MOVE HPOL-REC-INFO  TO  RPOL-REC-INFO
               PERFORM  POL-2000-REWRITE
                   THRU POL-2000-REWRITE-X
               PERFORM  CVGR-1000-REWRITE-CVGS-ARRAY
                   THRU CVGR-1000-REWRITE-CVGS-ARRAY-X
               PERFORM  3200-UPDATE-CFLW-REC
                   THRU 3200-UPDATE-CFLW-REC-X
           END-IF.
           
           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           MOVE SPACES                      TO LPGA-JRNL-DT.

           PERFORM  9A78-1000-READ
               THRU 9A78-1000-READ-X.

       3000-PROCESS-TRANSACTION-X.
           EXIT.
      /
      *---------------------
       3200-UPDATE-CFLW-REC.
      *---------------------
      
      * THE CFLW TABLE IS BROWSED IN DESCENDING ORDER
      * THE DEPOSIT MADE IN THE CURRENT PROG WOULD BE THE LATEST DEPOSIT
           MOVE HIGH-VALUES                 TO WCFLW-KEY.
           MOVE LOW-VALUES                  TO WCFLW-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WCFLW-POL-ID
                                               WCFLW-ENDBR-POL-ID.
           MOVE '01'                        TO WCFLW-CVG-NUM
                                               WCFLW-ENDBR-CVG-NUM.
           SET WCFLW-CF-TYP-DIA             TO TRUE.
           MOVE WCFLW-CF-TYP-CD             TO WCFLW-ENDBR-CF-TYP-CD.
           MOVE L1651-EFF-DT                TO WCFLW-CF-EFF-DT
                                               WCFLW-ENDBR-CF-EFF-DT.
           PERFORM  CFLW-1000-BROWSE-PREV
               THRU CFLW-1000-BROWSE-PREV-X.
           IF  NOT WCFLW-IO-OK
               GO TO 3200-UPDATE-CFLW-REC-X
           END-IF.
           PERFORM
               UNTIL WCFLW-IO-EOF
                  OR WS-CFLW-REC-FOUND-YES
                  PERFORM  CFLW-2000-READ-PREV
                      THRU CFLW-2000-READ-PREV-X
                  IF  RCFLW-CF-TRXN-DEPOSIT
                  AND RCFLW-CF-PRCES-DT = RMAST-APPL-CTL-PRCES-DT
                  AND RCFLW-CF-REASN-CD = SPACES
                  AND RCFLW-CF-CLI-TRXN-AMT = WS-BONUS-AMT
                      SET WS-CFLW-REC-FOUND-YES 
                                            TO TRUE
                      MOVE RCFLW-REC-INFO   TO HCFLW-REC-INFO
                  END-IF
           END-PERFORM.
           
           PERFORM  CFLW-3000-END-BROWSE-PREV
               THRU CFLW-3000-END-BROWSE-PREV-X.
      * ON THE DEPOSIT RECORD, THE CF-REASN-CD FIELD IS UPDATED WITH "ZAP"
           MOVE HCFLW-KEY                   TO RCFLW-KEY.
           PERFORM  CFLW-1000-READ-FOR-UPDATE
               THRU CFLW-1000-READ-FOR-UPDATE-X.
           MOVE 'ZAP'                       TO RCFLW-CF-REASN-CD
           PERFORM  CFLW-2000-REWRITE
               THRU CFLW-2000-REWRITE-X.

       3200-UPDATE-CFLW-REC-X.
           EXIT.
      /
      *------------------------
       3500-LAPSED-POL-DEPOSIT.
      *------------------------

           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
           MOVE 'BATCH'                     TO WGLOB-USER-ID.
           SET LPGA-EVNT-CD-TERM-LAPSE      TO TRUE.
           MOVE 'N00056'                    TO LPGA-OPER-CAT-CD.
           MOVE WGLOB-PROCESS-DATE          TO LPGA-JRNL-DT.
           MOVE WGLOB-PROCESS-DATE          TO L5277-EFF-DT.
           MOVE 'ZAP-CMB 2010'              TO L5277-DESC-INFO.
           SET L2194-ZAP-CBB-TRANS          TO TRUE.

           PERFORM  3550-DR-AMT-PRCES
               THRU 3550-DR-AMT-PRCES-X.

           PERFORM  3560-CR-AMT-PRCES
               THRU 3560-CR-AMT-PRCES-X.

       3500-LAPSED-POL-DEPOSIT-X.
           EXIT.
      /
      *------------------
       3550-DR-AMT-PRCES.
      *------------------

           MOVE RPOL-POL-ID                 TO LPGA-POLICY-NUMBER.

           PERFORM  ACCT-1000-BUILD-PARM-INFO
               THRU ACCT-1000-BUILD-PARM-INFO-X.
           MOVE 'G'                       TO LACCT-SRC-CD.

           MOVE '01'                        TO I.
           SET LPGA-EVNT-CD-TERM-LAPSE      TO TRUE.

           PERFORM  2194-1000-BUILD-PARM-INFO
               THRU 2194-1000-BUILD-PARM-INFO-X.

           SET L2194-USE-PPR-ACCT-NO        TO TRUE.
           COMPUTE L2194-TRXN-AMT  = WS-BONUS-AMT * -1.
           SET L9370-ZAP-CBB-TRANS          TO TRUE.

           PERFORM  2194-1000-SURR-PYMT-ACCT
               THRU 2194-1000-SURR-PYMT-ACCT-X.

       3550-DR-AMT-PRCES-X.
           EXIT.
      /
      *------------------
       3560-CR-AMT-PRCES.
      *------------------

           PERFORM  9370-1000-BUILD-PARM-INFO
               THRU 9370-1000-BUILD-PARM-INFO-X.

           MOVE WS-BONUS-AMT                TO L9370-POST-DISB-CHG-AMT.
           SET L9370-ZAP-CBB-TRANS          TO  TRUE.
           PERFORM  9370-1000-POST-DISB-ACCT
               THRU 9370-1000-POST-DISB-ACCT-X.

      * MSG POLICY ID @1 PLS AMOUNT CHANGED FROM @2 TO @3.
           MOVE 'ZS9A780012'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-HOLD-POL-ID              TO WGLOB-MSG-PARM (1).

           COMPUTE  L0290-INPUT-NUMBER = RPOL-POST-LAPS-SURR-AMT.
           PERFORM  8000-FORMAT-AMOUNT
               THRU 8000-FORMAT-AMOUNT-X.
           MOVE L0290-OUTPUT-DATA           TO WGLOB-MSG-PARM (02).

           COMPUTE  L0290-INPUT-NUMBER = L9370-POL-POST-DISB-AMT.
           PERFORM  8000-FORMAT-AMOUNT
               THRU 8000-FORMAT-AMOUNT-X.
           MOVE L0290-OUTPUT-DATA           TO WGLOB-MSG-PARM (03).

           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           MOVE  RPOL-POL-ID                TO WPOL-POL-ID.

           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.

           IF  WPOL-IO-OK
               PERFORM  9370-2000-UPDT-POL-DISB-AREA
                   THRU 9370-2000-UPDT-POL-DISB-AREA-X

               PERFORM  POL-2000-REWRITE
                   THRU POL-2000-REWRITE-X
           END-IF.

       3560-CR-AMT-PRCES-X.
           EXIT.
      /
      *------------------
       4000-REDO-PROCESS.
      *------------------

           MOVE RMAST-APPL-CTL-PRCES-DT     TO L0201-EFF-DT.
           MOVE 'BATCH'                     TO WGLOB-USER-ID.
           MOVE 'CSBM9988'                  TO WGLOB-MAIN-PGM-ID.

           PERFORM  0201-1000-AUTO-PROCESSING
               THRU 0201-1000-AUTO-PROCESSING-X.

           IF  NOT L0201-RETRN-OK
      *MSG REDO PROCESSING FAILED FOR POLICY @1
               MOVE 'ZS9A780007'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
      *MSG REDO PROCESSING COMPLETED FOR POLICY @1
               MOVE 'ZS9A780008'            TO WGLOB-MSG-REF-INFO
               MOVE R9A78-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       4000-REDO-PROCESS-X.
           EXIT.
      /
      *-------------------
       8000-FORMAT-AMOUNT.
      *-------------------

           MOVE 2                           TO L0290-PRECISION.
           MOVE WGLOB-CRCY-SCALE-QTY        TO L0290-PRECISION.
           MOVE 17                          TO L0290-MAX-OUT-LEN.
           SET L0290-MESSAGE-FORMAT         TO TRUE
           SET L0290-SIGN-DISPLAY           TO TRUE
           SET L0290-SIGN-FLOAT             TO TRUE

           PERFORM  0290-1000-NUMERIC-FORMAT
               THRU 0290-1000-NUMERIC-FORMAT-X.

       8000-FORMAT-AMOUNT-X.
            EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  9A78-4000-CLOSE
               THRU 9A78-4000-CLOSE-X.
                             
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *    PROCESSING COPYBOOKS                                       *
      *****************************************************************
      *
       COPY CCPPCCC.
       COPY NCPPCVGS.
      /
      *****************************************************************
      *    LINKAGE COPYBOOKS                                          *
      *****************************************************************
      /
       COPY NCPS0960.
       COPY NCPL0960.
       COPY XCPL0260.
       COPY XCPL1680.
      /
       COPY XCPL0040.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPL0030.
       COPY XCPL0035.
      /
       COPY CCPSPGA.
      /
       COPY CCPS0010.
       COPY CCPL0010.
      /
       COPY XCPS0290.
       COPY XCPL0290.
       COPY CCPSACCT.
       COPY XCPL0280.
       COPY CCPS1651.
       COPY CCPL1651.
       COPY CCPL2120.
       COPY CCPS4750.
       COPY CCPL4750.
       COPY CCPL0201.
       COPY CCPL5277.
       COPY CCPS2194.
       COPY CCPL2194.
       COPY CCPS9370.
       COPY CCPL9370.
       COPY CCPS5277.
MP171F COPY XCPL8090.
MP171F COPY XCPS8090.
      /
      ****************************************************************
      *  FILE I/O PROCESS MODULE                                     *
      ****************************************************************
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
      *****************************************************************
      *    FILE I/O LINKAGE & PROCESS MODULES                         *
      *****************************************************************
      /
       COPY CCPNMAST.
       COPY CCPNPOL.
       COPY CCPUPOL.
       COPY NCPPCVGR.
       COPY CCPUCVG.
       COPY CCPNCVG.
       COPY CCPVCFLW.
       COPY CCPUCFLW.
       COPY XCSLFILE REPLACING ==:ID:==  BY 9A78
                               ==':PGM:'== BY =='ZSRQ9A78'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9A78.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY ==9A78==.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBM9A78                     **
      *****************************************************************


             
           
            

      
    