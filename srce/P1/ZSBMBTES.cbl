      *****************************************************************
      **  MEMBER :  ZSBMBTES                                         **
      **  REMARKS:  THIS ZAP PROGRAM WILL MOVE SPECIFIED INPUT       **
      **            AMOUNTS FROM MISCELLANEOUS SUSPENSE TO BANK      **
      **            TRANSFER SUSPENSE ON TPOL FOR SPECIFIED INPUT    **
      **            POLICIES. THE APPROPRIATE G/L ACCOUNTING ENTRIES **
      **            WILL BE GENERATED TO REVERSE MONEY OUT OF MISC   **
      **            SUSPENSE AND ADD MONEY TO BANK TRANSFER SUSPENSE.**
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
P00451**  08MAY02  MAW    BT SUSPENSE ZAP                            **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
NWLBCA**  25SEP09  CTS    ADDED COPYBOOKS FOR TRAD PAID TO DATE      **
NWLBCA**                  RECALCULATION FOR TRAD POLICIES            **
      *****************************************************************

       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    ZSBMBTES.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.
      *************************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMBTES'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
           05  WS-TEMP-AMT                  PIC 9(08).
           05  WS-POL-ERROR-IND             PIC X(01).
               88  WS-POL-ERROR-NO              VALUE 'N'.
               88  WS-POL-ERROR                 VALUE 'Y'.
           05  WS-POLICIES-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL POLICIES PROCESSED                '.
               10  WS-POLICIES-PRCES-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
      
       01  WS-CONTROL-CARD.
           05  WS-CTL-EDIT-ONLY             PIC X(10).
               88  WS-CTL-EDIT-TEXT         VALUE 'EDIT ONLY='.
           05  WS-CTL-EDIT-SW               PIC X(01).
               88 EDIT-ONLY                 VALUE 'Y'. 
               88 EDIT-ONLY-NO              VALUE 'N'.
                
       01  WS-HEADING-LINE.
           05  FILLER     VALUE SPACES      PIC X(24). 
           05  FILLER                       PIC X(31) 
                   VALUE 'MISC SUSPENSE AMOUNTS MOVED TO '.
           05  FILLER                       PIC X(22) 
                   VALUE 'BANK TRANSFER SUSPENSE'.
           05  FILLER                       PIC X(23) 
                   VALUE ' (DR 241700, CR 247030)'.
                
       01  WS-POL-PRINT-LINE.
           05  FILLER                       PIC X(08) 
                          VALUE 'POLICY: '.
           05  WS-POL-ID                    PIC X(10).
           05  FILLER                       PIC X(15) 
                          VALUE ' DEPOSIT DATE: '.
           05  WS-DEP-EFF-DT                PIC X(10).
           05  FILLER                       PIC X(29) 
               VALUE '; DEBITING MISC SUSP (241700)'.
           05  FILLER                       PIC X(43) 
               VALUE ' AND CREDITING BT SUSP (247030) FOR AMOUNT '.
           05  WS-BT-SUSP-AMT               PIC Z(07)9.
      
       01  WS-POL-PRINT-LINE2.
           05  FILLER                       PIC X(08) 
                          VALUE 'POLICY: '.
           05  WS-POL-ID2                   PIC X(10).
           05  FILLER                       PIC X(17) 
                          VALUE ' COLLECTION AMT: '.
           05  WS-COLCTN-AMT2               PIC Z(07)9.
           05  FILLER                       PIC X(20) 
                          VALUE '; MISC SUSP BEFORE: '.
           05  WS-POL-MISC-SUSP-AMT2        PIC Z(07)9.
           05  FILLER                       PIC X(28) 
                          VALUE '; MISC SUSP AMT IS LESS THAN'.
           05  FILLER                       PIC X(30) 
                          VALUE ' COLLECTION AMT. AMT NOT MOVED'.
      
       01  WS-POL-PRINT-LINE3.
           05  FILLER                       PIC X(08) 
                          VALUE 'POLICY: '.
           05  WS-POL-ID3                   PIC X(10).
           05  FILLER                       PIC X(30) 
                          VALUE ' POLICY NOT FOUND ON DATABASE '.
           05  FILLER                       PIC X(16) 
                          VALUE '-- AMT NOT MOVED'.
      
       01  WS-POL-PRINT-LINE4.
           05  FILLER                       PIC X(08) 
                          VALUE 'POLICY: '.
           05  WS-POL-ID4                   PIC X(10).
           05  FILLER                       PIC X(17) 
                          VALUE ' BT SUSP BEFORE: '.
           05  WS-BT-SUSP-BEFORE            PIC Z(07)9.
           05  FILLER                       PIC X(20) 
                          VALUE '; MISC SUSP BEFORE: '.
           05  WS-POL-MISC-SUSP-BEFORE      PIC Z(07)9.
           05  FILLER                       PIC X(17) 
                          VALUE '; BT SUSP AFTER: '.
           05  WS-BT-SUSP-AFTER             PIC Z(07)9.
           05  FILLER                       PIC X(19) 
                          VALUE '; MISC SUSP AFTER: '.
           05  WS-POL-MISC-SUSP-AFTER       PIC Z(07)9.
      
       01  WS-EOJ-LINE.
           05  FILLER     VALUE SPACES      PIC X(45). 
           05  FILLER                       PIC X(21) 
                   VALUE '*** END OF REPORT ***'.
                
      /
P02229 COPY XCWL0035.

       COPY CCWL0010.
       COPY CCWL0950.
      /
       COPY CCSREXTP.
       COPY CCSWEXTP.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCWL2120.
NWLBCA COPY CCWL9037.
       COPY CCWLACCT.
       COPY CCWWBTAX.
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
       PROCEDURE DIVISION.
      *************************

      *----------------
       0000-MAIN-LINE.
      *----------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE 'ZSBMBTES'         TO WGLOB-USER-ID.
           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.
           MOVE WS-HEADING-LINE    TO L0040-HDG-LINE-3.

           PERFORM BCF-1000-READ
              THRU BCF-1000-READ-X.
           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO  TO WS-CONTROL-CARD
           END-IF.
            
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  EXTP-1000-READ
               THRU EXTP-1000-READ-X.

           MOVE ZERO               TO LPGA-ATRN-SEQUENCE.
           MOVE ZERO               TO LPGA-TRAN-SEQUENCE.
           MOVE ZERO               TO LPGA-DALG-SEQUENCE.
           MOVE SPACES             TO LPGA-POLICY-NUMBER.
           SET  LPGA-EVNT-CD-DFLT  TO TRUE.
           MOVE SPACES             TO LPGA-OPER-CAT-CD.
           MOVE SPACES             TO LPGA-JRNL-DT.
           MOVE '0'                TO WGLOB-RETURN-CODE.
           MOVE ZERO               TO WGLOB-MSG-ERROR-SW.

           SET WPOL-IO-OK TO TRUE.
            
           PERFORM  1000-PROCESS-POLS
               THRU 1000-PROCESS-POLS-X
               UNTIL WEXTP-SEQ-IO-EOF
                  OR WPOL-IO-NOT-FOUND.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAIN-LINE-X.
           EXIT.

      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  EXTP-1000-OPEN-INPUT
               THRU EXTP-1000-OPEN-INPUT-X.
 
       0100-OPEN-FILES-X.
           EXIT.
 
      /
      *------------------
       1000-PROCESS-POLS.
      *------------------
           
           ADD 1                  TO WS-POLICIES-PRCES-CTR.
           SET WS-POL-ERROR-NO    TO TRUE.

           MOVE REXTP-POL-ID      TO LPGA-POLICY-NUMBER.
           
           MOVE LOW-VALUES        TO WPOL-KEY.
           MOVE SPACES            TO WPOL-POL-ID.
           MOVE REXTP-POL-ID      TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
      * OUTPUT AN ERROR MESSAGE IF THE POLICY IS NOT FOUND ON THE DATABASE 
           IF  NOT WPOL-IO-OK
               MOVE SPACES                  TO L0040-INPUT-LINE
               MOVE REXTP-POL-ID            TO WS-POL-ID3
               MOVE WS-POL-PRINT-LINE3      TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               SET WPOL-IO-OK TO TRUE
               PERFORM  EXTP-1000-READ
                   THRU EXTP-1000-READ-X
               GO TO 1000-PROCESS-POLS-X
           END-IF.
 
      * OUTPUT AN ERROR MESSAGE IF THE COLLECTION AMOUNT IS > MISC SUSP AMT, 
      * AND READ NEXT INPUT RECORD 

           IF  REXTP-COLCTD-AMT > RPOL-POL-MISC-SUSP-AMT
               MOVE SPACES                  TO L0040-INPUT-LINE
               MOVE RPOL-POL-ID             TO WS-POL-ID2
               MOVE REXTP-COLCTD-AMT        TO WS-COLCTN-AMT2
               MOVE RPOL-POL-MISC-SUSP-AMT  TO WS-POL-MISC-SUSP-AMT2
               MOVE WS-POL-PRINT-LINE2      TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               PERFORM  EXTP-1000-READ
                   THRU EXTP-1000-READ-X
               GO TO 1000-PROCESS-POLS-X
           END-IF.

      * IF EDIT-ONLY MODE, THEN OUTPUT THE DETAILS AND READ NEXT RECORD 

           IF  EDIT-ONLY
               MOVE RPOL-POL-ID             TO WS-POL-ID
               MOVE REXTP-DEP-EFF-DT        TO WS-DEP-EFF-DT
               MOVE REXTP-COLCTD-AMT        TO WS-BT-SUSP-AMT
               MOVE SPACES                  TO L0040-INPUT-LINE
               MOVE WS-POL-PRINT-LINE       TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               PERFORM  EXTP-1000-READ
                   THRU EXTP-1000-READ-X
               GO TO 1000-PROCESS-POLS-X
           END-IF.

      * READ THE POLICY FOR UPDATE PURPOSES 

           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.

           IF  WPOL-IO-NOT-FOUND
      *MSG: 'LOST RECORD (@1) IN MAINTAIN - CONTACT SYSTEMS'
               MOVE WPOL-POL-ID
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-PROCESS-POLS-X
           END-IF.

      * THE POLICY IS OKAY, SO MOVE THE MONEY AROUND FROM MISC SUSPENSE 
      * TO BT SUSPENSE AND GENERATE THE APPROPRIATE ACCOUNTING ENTRIES.

           MOVE RPOL-POL-BT-SUSP-AMT   TO WS-TEMP-AMT. 
           MOVE WS-TEMP-AMT            TO WS-BT-SUSP-BEFORE.
           MOVE RPOL-POL-MISC-SUSP-AMT TO WS-TEMP-AMT.
           MOVE WS-TEMP-AMT            TO WS-POL-MISC-SUSP-BEFORE.

           PERFORM  3000-GENERATE-ACCTG
               THRU 3000-GENERATE-ACCTG-X.

           MOVE RPOL-POL-ID            TO WS-POL-ID4.
           MOVE RPOL-POL-BT-SUSP-AMT   TO WS-TEMP-AMT. 
           MOVE WS-TEMP-AMT            TO WS-BT-SUSP-AFTER.
           MOVE RPOL-POL-MISC-SUSP-AMT TO WS-TEMP-AMT.
           MOVE WS-TEMP-AMT            TO WS-POL-MISC-SUSP-AFTER.
           MOVE SPACES                 TO L0040-INPUT-LINE.
           MOVE WS-POL-PRINT-LINE4     TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      * REWRITE THE POLICY AND READ THE NEXT INPUT RECORD

           PERFORM  POL-2000-REWRITE
               THRU POL-2000-REWRITE-X.
 
           PERFORM  EXTP-1000-READ
               THRU EXTP-1000-READ-X.
           
       1000-PROCESS-POLS-X.
           EXIT.
            
      /
      *---------------------
       3000-GENERATE-ACCTG.
      *---------------------
        
           PERFORM  ACCT-1000-BUILD-PARM-INFO
               THRU ACCT-1000-BUILD-PARM-INFO-X.
           IF  RPOL-POL-APPL-CTL-NBS
               MOVE 'S'  TO LACCT-SRC-CD
           ELSE
               MOVE 'P'  TO LACCT-SRC-CD
           END-IF.

      * REVERSE THE INPUT COLLECTION AMOUNT FROM THE MISC SUSP ACCOUNT
           PERFORM  2120-1000-BUILD-PARM-INFO
               THRU 2120-1000-BUILD-PARM-INFO-X.
           COMPUTE L2120-MISC-SUSP-AMT =
                   REXTP-COLCTD-AMT * -1.
           SET LPGA-EVNT-CD-SPREM-PAC TO TRUE.
           PERFORM  2120-1000-SUSP-ACCT
               THRU 2120-1000-SUSP-ACCT-X.
           PERFORM  2120-2000-UPDT-POL-SUSP-INFO
               THRU 2120-2000-UPDT-POL-SUSP-INFO-X.

      * ADD THE INPUT COLLECTION AMOUNT TO THE BT SUSP ACCOUNT
           PERFORM  2120-1000-BUILD-PARM-INFO
               THRU 2120-1000-BUILD-PARM-INFO-X.
           COMPUTE L2120-BT-SUSP-AMT =
                   REXTP-COLCTD-AMT.
           MOVE REXTP-DEP-EFF-DT      TO L2120-POL-BT-SUSP-DT.
           SET LPGA-EVNT-CD-SPREM-PAC TO TRUE.
           PERFORM  2120-5000-ERROR-SUSP-ACCT
               THRU 2120-5000-ERROR-SUSP-ACCT-X.
           MOVE L2120-POL-BT-SUSP-AMT TO RPOL-POL-BT-SUSP-AMT.
           MOVE REXTP-DEP-EFF-DT      TO RPOL-POL-BT-SUSP-DT.
            
       3000-GENERATE-ACCTG-X.
           EXIT.
      /
      *------------------
       8000-PRINT-STATS.
      *------------------

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-POLICIES-RECS-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-EOJ-LINE             TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.


       8000-PRINT-STATS-X.
           EXIT.
      /
      *------------------
       9999-CLOSE-FILES.
      *------------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

           PERFORM  EXTP-4000-CLOSE
               THRU EXTP-4000-CLOSE-X.
 
       9999-CLOSE-FILES-X.
           EXIT.
 
      /
P02229 COPY XCPL0035.

       COPY CCPLEXTP.
       COPY CCPNEXTP.
       COPY CCPOEXTP.
      /
       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPPCCC.
      /
       COPY CCPNPOL.
       COPY CCPTPOL.
       COPY CCPUPOL.
      /
       COPY CCPS2120.
NWLBCA COPY CCPS9037.
       COPY CCPSACCT.
       COPY CCPL2120.
NWLBCA COPY CCPL9037.
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
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMBTES                     **
      *****************************************************************
