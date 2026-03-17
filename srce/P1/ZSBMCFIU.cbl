
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    ZSBMXXXX.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMXXXX                                         **
      **  REMARKS:  ONE SHOT BATCH PROGRAM                           **
      **  DOMAIN : BC                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      
       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
      
       FILE-CONTROL.
      
      /
      ***************
       DATA DIVISION.
      ***************
      
       FILE SECTION.
      
      /
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCFIU'.
      
       COPY SQLCA.
      
       01 WS-PREV-BAL-AMT          PIC S9(13)V9(02).
       01 WS-PREV-ACUM-INT-LTD-AMT PIC S9(13)V9(02).
       01 WS-CURR-TRNX-AMT         PIC S9(13)V9(02).
       01 WS-CRNT-BAL-AMT          PIC S9(13)V9(02).
       01 WS-SEQ-NUM-N             PIC S9(13)V9(02).
       01 WS-CF-EFF-DT             PIC X(10).
       01 WS-ACUM-INT-LTD-AMT      PIC S9(13)V9(02).
       01 WS-TOT-COUNT             PIC 9(10).
       01 WS-COMMIT-MAX-COUNT      PIC 9(10).

      
      
      /
       COPY XCWL0035.
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
      /
       COPY XCWWTIME.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
       COPY CCWTAKEY.       
      /
       COPY CCWWBTAX.       
      /
       COPY XCWWHDG.
      /
      *****************************************************************
      *     I/O COPYBOOKS                                             *
      *****************************************************************
      /
       COPY CCFWMAST.
       COPY CCFRMAST.
       COPY CCFWPOL.
       COPY CCFRPOL.       
       COPY CCFWCFLW.
       COPY CCFWCFLF.       
       COPY CCFRCFLW.       
      /
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY CFIU
                               ==':ID:'==  BY =='CFIU'==.
       COPY ZCSRCFIU.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************
      
       
       COPY XCWL0040.
       COPY XCWL0270.
       COPY XCWL2490.
       COPY CCWL0010.
       COPY CCWL0950.
       COPY CCWL0083.
       COPY CCWLPGA.
008455 COPY XCWL0290.       
MP9PHA COPY NCWL0303.

      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      
      *--------------
       0000-MAINLINE.
      *--------------
      
           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.
      
           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.
      
           PERFORM  3000-PROCESS-REPORT
               THRU 3000-PROCESS-REPORT-X
              UNTIL WCFIU-SEQ-IO-EOF.
 
      *    POLICY TABLE READ
      *MSGS: TOTAL PROCESSED CFLW RECORDS(@1)
            MOVE 'ZSCFIU0003'                TO WGLOB-MSG-REF-INFO.
            MOVE WS-TOT-COUNT                TO WGLOB-MSG-PARM (1).
       
            PERFORM  0260-1000-GENERATE-MESSAGE
                THRU 0260-1000-GENERATE-MESSAGE-X.
 
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
      
           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
      
           PERFORM  CFIU-1000-OPEN-INPUT
               THRU CFIU-1000-OPEN-INPUT-X.
      
       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       2000-INITIALIZE.
      *----------------
      
           MOVE     SPACES                  TO WGLOB-COMPANY-CODE.
      
      **   READ THE COMPANY CONTROL CARD
      
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
      
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
      
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
      
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE SPACES                      TO WHDG-LINE-1.
           MOVE SPACES                      TO WHDG-LINE-2.
           MOVE SPACES                      TO WHDG-LINE-3.
      
           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.
      
           IF  WMAST-IO-OK
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           ELSE
      *        MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'CS00000061'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.
      
      *  READ THE INPUT FILE
      
           PERFORM  CFIU-1000-READ
               THRU CFIU-1000-READ-X.
      
           IF NOT WCFIU-SEQ-IO-OK
      *    MSG:'INPUT FILE EMPTY'
               MOVE  'CSCFIU0002'           TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-INITIALIZE-X
           END-IF.
      
      *  INITIALIZE PARMATERS FOR TEXT RETRIEVAL MODULE
           PERFORM  PGA-1000-BUILD-PARMS
               THRU PGA-1000-BUILD-PARMS-X.
      
           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.
      
           MOVE WPGWS-CRNT-PGM-ID           TO L2490-TXT-SRC-ID.
      
           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.
      
      **   OUTPUT A BLANK LINE
      
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
      
           MOVE SPACES                      TO L0040-INPUT-LINE.
         
           MOVE ZEROES                      TO WS-TOT-COUNT.
           MOVE ZEROES                      TO WS-COMMIT-MAX-COUNT.      
      
       2000-INITIALIZE-X.
           EXIT.
      /
      *--------------------
       2100-INIT-OCF-TITLES.
      *--------------------
      
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
      
           MOVE L2490-TXT-STR-TXT           TO L0040-PROGRAM-DESC.
      
      **** MSGS: GET THE SYSTEM ID FOR THE HEADING
      
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
      
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
      
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
      
      **** MSGS: RUN MESSAGES
      
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
      
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
      
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.
      
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
      
       2100-INIT-OCF-TITLES-X.
           EXIT.
      /
      
      *--------------------
       3000-PROCESS-REPORT.
      *--------------------
      


      *    POLICY TABLE READ
      *MSGS: NOW PROCESSING POLICY(@1)
           MOVE 'ZSCFIU0001'                TO WGLOB-MSG-REF-INFO.
           MOVE RCFIU-POL-ID                TO WGLOB-MSG-PARM (1).
      
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE LOW-VALUES                  TO WCFLF-KEY.
           MOVE HIGH-VALUES                 TO WCFLF-ENDBR-KEY.
           MOVE RCFIU-POL-ID                TO WCFLF-POL-ID.
           MOVE RCFIU-POL-ID                TO WCFLF-ENDBR-POL-ID.
           MOVE '2015-08-01'                TO WCFLF-CF-PRCES-DT.
           MOVE WWKDT-LOW-DT                TO
                                             WCFLF-ENDBR-CF-PRCES-DT.
           MOVE ZEROES                      TO WS-PREV-BAL-AMT         
           				       WS-PREV-ACUM-INT-LTD-AMT
           				       WS-CURR-TRNX-AMT        
           				       WS-CRNT-BAL-AMT         
           				       WS-SEQ-NUM-N            
           				       WS-ACUM-INT-LTD-AMT.    
           
           PERFORM  CFLF-1000-BROWSE-PREV
               THRU CFLF-1000-BROWSE-PREV-X.
      
           IF NOT WCFLF-IO-OK
               PERFORM  CFIU-1000-READ
                   THRU CFIU-1000-READ-X                   
              GO TO 3000-PROCESS-REPORT-X           
           END-IF.

      
           PERFORM  CFLF-2000-READ-PREV
               THRU CFLF-2000-READ-PREV-X.
      
      
           IF NOT WCFLF-IO-OK
               PERFORM  CFLF-3000-END-BROWSE-PREV
                   THRU CFLF-3000-END-BROWSE-PREV-X
               PERFORM  CFIU-1000-READ
                   THRU CFIU-1000-READ-X                   
              GO TO 3000-PROCESS-REPORT-X           
           END-IF.
               PERFORM  
               UNTIL NOT WCFLF-IO-OK
               OR (RCFLW-CF-PRCES-DT < '2015-08-01'
               AND RCFLW-CF-REVRS-PRCES-DT  = WWKDT-ZERO-DT
               AND NOT RCFLW-CF-TRXN-INTEREST-RATE)
      	       
                   PERFORM  CFLF-2000-READ-PREV
                       THRU CFLF-2000-READ-PREV-X
      	       
               END-PERFORM.

               PERFORM  CFLF-3000-END-BROWSE-PREV
                   THRU CFLF-3000-END-BROWSE-PREV-X.
           MOVE RCFLW-CF-EFF-DT             TO WS-CF-EFF-DT.
           MOVE RCFLW-CF-SEQ-NUM            TO WS-SEQ-NUM-N
           MOVE RCFLW-CF-FND-BAL-AMT   TO WS-PREV-BAL-AMT.
           MOVE RCFLW-ACUM-INT-LTD-AMT TO WS-PREV-ACUM-INT-LTD-AMT.
           MOVE WS-SEQ-NUM-N           TO WCFLW-CF-SEQ-NUM-N.
           MOVE RCFIU-POL-ID            TO WCFLW-POL-ID
           MOVE WS-CF-EFF-DT           TO WCFLW-CF-EFF-DT
           MOVE 1                      TO WCFLW-CVG-NUM-N          
           SET WCFLW-CF-TYP-DIA        TO TRUE
           MOVE WCFLW-KEY              TO WCFLW-ENDBR-KEY.
           MOVE 999                    TO WCFLW-ENDBR-CF-SEQ-NUM          
           MOVE WWKDT-HIGH-DT          TO WCFLW-ENDBR-CF-EFF-DT.
      *
           PERFORM  CFLW-1000-BROWSE
               THRU CFLW-1000-BROWSE-X.

           PERFORM  CFLW-2000-READ-NEXT
               THRU CFLW-2000-READ-NEXT-X.
               
           IF NOT WCFLW-IO-OK    
               PERFORM  CFLW-3000-END-BROWSE
                   THRU CFLW-3000-END-BROWSE-X
               PERFORM  CFIU-1000-READ
                   THRU CFIU-1000-READ-X                   
               GO TO 3000-PROCESS-REPORT-X
           END-IF.               
               
           IF WCFLW-IO-OK
               PERFORM  CFLW-2000-READ-NEXT
                   THRU CFLW-2000-READ-NEXT-X
               PERFORM  4000-UPDT-CFLW-INT-AMT
                   THRU 4000-UPDT-CFLW-INT-AMT-X
                   UNTIL NOT WCFLW-IO-OK

               PERFORM  CFLW-3000-END-BROWSE
                   THRU CFLW-3000-END-BROWSE-X
           END-IF.               
           COMPUTE WS-COMMIT-MAX-COUNT = WS-COMMIT-MAX-COUNT + 1    
           IF  WS-COMMIT-MAX-COUNT =1000
              PERFORM  0035-1000-COMMIT 
                  THRU 0035-1000-COMMIT-X
              MOVE ZEROES TO WS-COMMIT-MAX-COUNT
           END-IF
           PERFORM  CFIU-1000-READ
               THRU CFIU-1000-READ-X.
      
       3000-PROCESS-REPORT-X.
           EXIT.
      /
      *------------------------
       4000-UPDT-CFLW-INT-AMT.
      *------------------------
      
               
           MOVE  RCFLW-CF-FND-TRXN-AMT  TO WS-CURR-TRNX-AMT.
           MOVE  RCFLW-CF-FND-BAL-AMT   TO WS-CRNT-BAL-AMT.
           COMPUTE WS-ACUM-INT-LTD-AMT = WS-CRNT-BAL-AMT
                                       - (WS-PREV-BAL-AMT
                                       + WS-CURR-TRNX-AMT)
           MOVE RCFLW-CF-SEQ-NUM TO WS-SEQ-NUM-N.
           MOVE RCFLW-CF-EFF-DT  TO WS-CF-EFF-DT.
           MOVE WS-SEQ-NUM-N TO WCFLW-CF-SEQ-NUM-N.
           MOVE WS-CF-EFF-DT TO WCFLW-CF-EFF-DT.

           PERFORM  CFLW-1000-READ-FOR-UPDATE
               THRU CFLW-1000-READ-FOR-UPDATE-X.
           
           IF NOT WCFLW-IO-OK    
               GO TO 4000-UPDT-CFLW-INT-AMT-X
           END-IF. 
           
           MOVE RCFLW-ACUM-INT-LTD-AMT      TO L0290-INPUT-NUMBER 
           MOVE WGLOB-CRCY-SCALE-QTY TO L0290-PRECISION.

           MOVE 40                      TO L0290-MAX-OUT-LEN.
           SET L0290-MESSAGE-FORMAT     TO TRUE.
           SET L0290-SIGN-DISPLAY       TO TRUE.
           SET L0290-SIGN-FLOAT         TO TRUE.
           PERFORM 0290-1000-NUMERIC-FORMAT
              THRU 0290-1000-NUMERIC-FORMAT-X.
           MOVE L0290-OUTPUT-DATA       TO WGLOB-MSG-PARM (2).
      *
           COMPUTE RCFLW-ACUM-INT-LTD-AMT = WS-ACUM-INT-LTD-AMT
                                       + WS-PREV-ACUM-INT-LTD-AMT
            MOVE 'C25532'                   TO RCFLW-PREV-UPDT-USER-ID                           
                                       
      *MSGS: FOR POLICY ID (@1) THE ACCUMULATED INTEREST AMOUNT IS UPDATED FROM (@2)
      *      TO (@3) ON EFFECTIVE DATE (@4)
           MOVE 'ZSCFIU0002'                TO WGLOB-MSG-REF-INFO.
           MOVE WCFLW-KEY                   TO WGLOB-MSG-PARM (1).
           MOVE RCFLW-ACUM-INT-LTD-AMT      TO L0290-INPUT-NUMBER           
           MOVE WGLOB-CRCY-SCALE-QTY TO L0290-PRECISION.

           MOVE 40                      TO L0290-MAX-OUT-LEN.
           SET L0290-MESSAGE-FORMAT     TO TRUE.
           SET L0290-SIGN-DISPLAY       TO TRUE.
           SET L0290-SIGN-FLOAT         TO TRUE.
           PERFORM 0290-1000-NUMERIC-FORMAT
              THRU 0290-1000-NUMERIC-FORMAT-X.
           MOVE L0290-OUTPUT-DATA       TO WGLOB-MSG-PARM (3).           
           MOVE RCFLW-CF-EFF-DT         TO WGLOB-MSG-PARM (4).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.                                       
           COMPUTE WS-TOT-COUNT = WS-TOT-COUNT + 1
       
           PERFORM  CFLW-2000-REWRITE
               THRU CFLW-2000-REWRITE-X. 
               
           MOVE  RCFLW-ACUM-INT-LTD-AMT TO  WS-PREV-ACUM-INT-LTD-AMT
           MOVE  RCFLW-CF-FND-BAL-AMT   TO  WS-PREV-BAL-AMT.           
               PERFORM  CFLW-2000-READ-NEXT
                   THRU CFLW-2000-READ-NEXT-X.               
      
       4000-UPDT-CFLW-INT-AMT-X.
           EXIT.
            

      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
      
           PERFORM  CFIU-4000-CLOSE
               THRU CFIU-4000-CLOSE-X.
      
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
      
       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      * LINK COPYBOOKS
      *****************************************************************
      
       COPY XCPL0035.
       COPY CCPS0010.
       COPY CCPL0010.
       COPY CCPS0950.
       COPY CCPL0950.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL0270.
       COPY XCPL0030.
       COPY CCPS0083.
       COPY CCPL0083.
       COPY XCPL2490.
       COPY XCPS2490.
MP9PHA COPY NCPL0303.
MP9PHA COPY NCPS0303.
008455 COPY XCPS0290.
008455 COPY XCPL0290.
      
       COPY CCPSPGA.
       
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************
       COPY CCPPCCC.
       COPY XCPPHDG.
       COPY XCPPTIME.
      /
      *****************************************************************
      *  FILE I/O COPYBOOKS
      *****************************************************************
      
       COPY CCPNPOL.
       COPY CCPNCFLW.
       COPY CCPBCFLW.
       COPY CCPUCFLW.       
       COPY CCPVCFLW.       
       COPY CCPVCFLF.       
       COPY CCPNMAST.
      
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY OCF.
      /
       COPY XCSNSEQ REPLACING ==:ID:==  BY CFIU.
       COPY XCSLFILE REPLACING ==:ID:==  BY CFIU
                               ==':PGM:'== BY =='ZSRQCFIU'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CFIU.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBMXXXX                     **
      *****************************************************************
      