      *****************************************************************
      **  MEMBER :  ZSBMCWAS                                         **
      **  REMARKS:  THIS PROGRAM WILL MOVE CASH WITH APP SUSPENSE    **
      **            BALANCE ON TPOL TO THE NEW CWA SUSPSENSE BALANCE **
      **            FOR ALL PENDING POLICIES. PRIOR TO UPDATING CWA  **
      **            SUSPENSE G/L WILL BE GENERATED TO REVERSE        **
      **            EXISTING G/L ENTRIES.                            **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30JUN02  DPK    CWA SUSPENSE ACCOUNT AND REFUND            **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
NWLBCA**  25SEP09  CTS    ADDED COPYBOOKS FOR TRAD PAID TO DATE      **
NWLBCA**                  RECALCULATION FOR TRAD POLICIES            **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMCWAS.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCWAS'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
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
                
       01  WS-POL-PRINT-LINE.
           05  FILLER                       PIC X(08) 
                                                VALUE 'POLICY: '.
           05  WS-POL-ID                    PIC X(10).
           05  FILLER                       PIC X(09) 
                                                VALUE ' STATUS: '.
           05  WS-POL-CSTAT-CD              PIC X(04).
           05  FILLER                       PIC X(26) 
                          VALUE ' DEBITING MISC SUSP 241700'.
           05  FILLER                       PIC X(35) 
                          VALUE ' AND CREDITING CWA SUSP 241600 FOR '.
           05  WS-POL-CWA-SUSP-AMT          PIC -9(15).9(02).
      
      /
P02229 COPY XCWL0035.

       COPY CCWL0010.
       COPY CCWL0950.
        
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFRSPOL.
       COPY CCFWSPOL.
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

           MOVE 'ZSBMCWAS'         TO WGLOB-USER-ID.
           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.
            
      * SETUP THE LPGA FOR THE CALLED PROGRAM

           MOVE ZERO              TO LPGA-ATRN-SEQUENCE.
           MOVE ZERO              TO LPGA-TRAN-SEQUENCE.
           MOVE ZERO              TO LPGA-DALG-SEQUENCE.

           MOVE RPOL-POL-ID       TO LPGA-POLICY-NUMBER.
           SET  LPGA-EVNT-CD-DFLT TO TRUE.
           MOVE SPACES            TO LPGA-OPER-CAT-CD.
           MOVE SPACES            TO LPGA-JRNL-DT.
           MOVE '0'               TO WGLOB-RETURN-CODE.
           MOVE ZERO              TO WGLOB-MSG-ERROR-SW.

           MOVE '            CWA SUSPENSE ACCOUNT AND REFUND        '
                                   TO L0040-HDG-LINE-3.

           PERFORM BCF-1000-READ
              THRU BCF-1000-READ-X.
           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO    TO WS-CONTROL-CARD
           END-IF.
            
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  1000-PROCESS-POLS
               THRU 1000-PROCESS-POLS-X.

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
       1000-PROCESS-POLS.
      *------------------
           
           MOVE LOW-VALUES        TO WPOL-KEY.
           MOVE HIGH-VALUES       TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.
           
           PERFORM  2000-READ-REWRITE-LOOP
               THRU 2000-READ-REWRITE-LOOP-X
              UNTIL WPOL-IO-EOF
                 OR NOT WPOL-IO-OK.

       1000-PROCESS-POLS-X.
           EXIT.
      /
      *---------------------
       2000-READ-REWRITE-LOOP.
      *---------------------

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           
           IF  NOT WPOL-IO-OK
               DISPLAY '*** END OF POLICIES - JOB COMPLETED NORMALLY***'
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
           
           IF  WPOL-IO-EOF           
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.

      * ONLY INCLUDE PENDING POLCIES
       
           IF RPOL-POL-STAT-PENDING
              CONTINUE
           ELSE
              GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
            
      * CHECK IF THE POLICY HAS A SUSPENDED POLICY RECORD.
       
           MOVE RPOL-POL-ID TO WSPOL-POL-ID.
            
           PERFORM SPOL-1000-READ
              THRU SPOL-1000-READ-X.
               
           IF WSPOL-IO-OK
              GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
            
           IF EDIT-ONLY
              MOVE RPOL-POL-ID              TO WS-POL-ID
              MOVE RPOL-POL-CSTAT-CD        TO WS-POL-CSTAT-CD
              MOVE RPOL-POL-MISC-SUSP-AMT   TO WS-POL-CWA-SUSP-AMT
              MOVE SPACES                   TO L0040-INPUT-LINE
              MOVE WS-POL-PRINT-LINE        TO L0040-INPUT-LINE
              PERFORM  0040-3000-WRITE-OTHER
                  THRU 0040-3000-WRITE-OTHER-X
           END-IF.

           ADD 1                        TO WS-POLICIES-PRCES-CTR.
           SET WS-POL-ERROR-NO          TO TRUE.
            
           IF EDIT-ONLY
              GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
            
      * NOW LETS READ THE POLICY RECORD FOR UPDATE BECAUSE WE WILL
      * BE UPDATING IT LATER ON.
       
           MOVE LOW-VALUES                     TO WPOL-KEY.
           MOVE RPOL-POL-ID                    TO WPOL-POL-ID.
       
           PERFORM POL-1000-READ-FOR-UPDATE
              THRU POL-1000-READ-FOR-UPDATE-X.
               
           IF  WPOL-IO-NOT-FOUND
      *MSG: 'LOST RECORD (@1) IN MAINTAIN - CONTACT SYSTEMS'
               MOVE WPOL-POL-ID
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
               
      * OKAY THE POLICY IS OKAY, LET'S MOVE THE MONEY AROUND FROM
      * MISC SUSPENSE TO CWA SUSPENSE AND GENERATE THE APPROPRIATE
      * G/L.
        
            
           PERFORM 3000-GENERATE-GL
              THRU 3000-GENERATE-GL-X.
               
           MOVE RPOL-POL-ID              TO WS-POL-ID.
           MOVE RPOL-POL-CSTAT-CD        TO WS-POL-CSTAT-CD.
           MOVE RPOL-POL-CWA-SUSP-AMT    TO WS-POL-CWA-SUSP-AMT.
           MOVE SPACES                   TO L0040-INPUT-LINE.
           MOVE WS-POL-PRINT-LINE        TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           PERFORM POL-2000-REWRITE 
              THRU POL-2000-REWRITE-X.
               
       
       2000-READ-REWRITE-LOOP-X.
           EXIT.
      /
       3000-GENERATE-GL.
        
           PERFORM  ACCT-1000-BUILD-PARM-INFO
              THRU  ACCT-1000-BUILD-PARM-INFO-X.
           IF  RPOL-POL-APPL-CTL-NBS
               MOVE 'S'                      TO LACCT-SRC-CD
           ELSE
               MOVE 'P'                      TO LACCT-SRC-CD
           END-IF.
           PERFORM  2120-1000-BUILD-PARM-INFO
              THRU  2120-1000-BUILD-PARM-INFO-X.
           COMPUTE L2120-MISC-SUSP-AMT =
                   RPOL-POL-MISC-SUSP-AMT * -1.
           COMPUTE L2120-CWA-SUSP-AMT =
                   RPOL-POL-MISC-SUSP-AMT.
           PERFORM  2120-1000-SUSP-ACCT
              THRU  2120-1000-SUSP-ACCT-X.
           PERFORM  2120-2000-UPDT-POL-SUSP-INFO
              THRU  2120-2000-UPDT-POL-SUSP-INFO-X.
           IF  NOT L2120-RETRN-OK
               GO TO 3000-GENERATE-GL-X
           END-IF.
            
       3000-GENERATE-GL-X.
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
           MOVE WS-POLICIES-RECS-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE '*** END OF REPORT ***' TO L0040-INPUT-LINE.
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

       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPPCCC.
      /
       COPY CCPTPOL.
       COPY CCPUPOL.
      /
       COPY CCPS2120.
NWLBCA COPY CCPS9037.
       COPY CCPSACCT.
       COPY CCPL2120.
NWLBCA COPY CCPL9037.
      /
       COPY CCPNSPOL.
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
      **                 END OF PROGRAM ZSBMCWAS                     **
      *****************************************************************
