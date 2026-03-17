
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
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMHIID'.
      
       COPY SQLCA.
      
       01 WS-PREV-BAL-AMT          PIC S9(13)V9(02).
       01 WS-PREV-ACUM-INT-LTD-AMT PIC S9(13)V9(02).
       01 WS-CURR-TRNX-AMT         PIC S9(13)V9(02).
       01 WS-CRNT-BAL-AMT          PIC S9(13)V9(02).
       01 WS-SEQ-NUM-N             PIC S9(13)V9(02).
       01 WS-CF-EFF-DT             PIC X(10).
       01 WS-ACUM-INT-LTD-AMT      PIC S9(13)V9(02).
       01 WS-COMMIT-MAX-COUNT      PIC 9(10).
       01  WS-KEY.
           05   WS-CO-ID                      PIC X(02).
           05   WS-POL-ID                     PIC X(10).
           05   WS-POL-HIST-TYP-CD            PIC X(01).
           05   WS-POL-TRXN-EFF-DT            PIC X(10).
           05   WS-POL-TRXN-DT                PIC X(10).
           05   WS-POL-TRXN-TIME              PIC S9(07) COMP-3.
           05   WS-POL-TRXN-TASK-ID           PIC X(04).
           05   WS-POL-TRXN-SEQ-NUM           PIC S9(03) COMP-3.
       01  WS-HOLD-AMT            PIC X(13).
       01  WS-HOLD-KEY            PIC X(200).
       01  WS-HOLD-REC-INFO       PIC X(800).
       01  WS-HOLD-ACCT-ID        PIC X(06).
      
      
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
       COPY CCFWHI.
       COPY CCFRHI.       
      /
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==HIFL==
                               ==':ID:'== BY =='HIFL'==.
                               
       COPY XCSWSEQ  REPLACING ==:ID:==  BY HIID
                               ==':ID:'==  BY =='HIID'==.
       COPY ZCSRHIID.
       COPY ZCSRHIFL.       
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
       COPY XCWL0290.       
       COPY NCWL0303.

      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.


      /
      ********************
       PROCEDURE DIVISION USING SQLCA.
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
              UNTIL WHIID-SEQ-IO-EOF.
 
      *    POLICY TABLE READ
      *MSGS: TOTAL PROCESSED HI RECORDS(@1)
            MOVE 'ZSHIID0006'                TO WGLOB-MSG-REF-INFO.
       
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
      
           PERFORM  HIID-1000-OPEN-INPUT
               THRU HIID-1000-OPEN-INPUT-X.

           PERFORM  HIFL-3000-OPEN-OUTPUT
               THRU HIFL-3000-OPEN-OUTPUT-X.               
      
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
      
           PERFORM  HIID-1000-READ
               THRU HIID-1000-READ-X.
      
           IF NOT WHIID-SEQ-IO-OK
      *    MSG:'INPUT FILE EMPTY'
               MOVE  'CSHIID0002'           TO  WGLOB-MSG-REF-INFO
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
           MOVE 'ZSHIID0001'                TO WGLOB-MSG-REF-INFO.
           MOVE RHIID-POL-ID                TO WGLOB-MSG-PARM (1).
      
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

      
           MOVE HIGH-VALUES                 TO WHI-KEY.
           MOVE RHIID-POL-ID                TO WHI-POL-ID.
           MOVE 'A'                         TO WHI-POL-HIST-TYP-CD.
           MOVE WWKDT-HIGH-DT               TO WHI-POL-TRXN-EFF-DT.
      
           MOVE WWKDT-HIGH-DT               TO WHI-POL-TRXN-DT.
           MOVE +9999999                    TO WHI-POL-TRXN-TIME.
           MOVE +999                        TO WHI-POL-TRXN-SEQ-NUM.
      
           MOVE LOW-VALUES                  TO WHI-ENDBR-KEY.
           MOVE RHIID-POL-ID                 TO WHI-ENDBR-POL-ID.
           MOVE 'A'                         TO
                                         WHI-ENDBR-POL-HIST-TYP-CD.
           MOVE '2015-06-26'                TO
                                         WHI-ENDBR-POL-TRXN-EFF-DT.
           MOVE WWKDT-LOW-DT                TO WHI-ENDBR-POL-TRXN-DT. 
           MOVE +0000000                    TO WHI-ENDBR-POL-TRXN-TIME.
           MOVE +000                        TO 
                                         WHI-ENDBR-POL-TRXN-SEQ-NUM.
      
           PERFORM  HI-1000-BROWSE-PREV
               THRU HI-1000-BROWSE-PREV-X.
      
           IF NOT WHI-IO-OK
               GO TO 3000-PROCESS-REPORT-X
           END-IF.
      
           PERFORM  HI-2000-READ-PREV
               THRU HI-2000-READ-PREV-X.
      * LOOP THRU THE HI RECORDS LOOKING FOR SPECIFIC HISTORY RECORDS
      
           PERFORM  4000-DELETE-HI-INT-REC
               THRU 4000-DELETE-HI-INT-REC-X
               UNTIL NOT WHI-IO-OK.
      
           PERFORM  HI-3000-END-BROWSE-PREV
               THRU HI-3000-END-BROWSE-PREV-X.

           PERFORM  HIID-1000-READ
               THRU HIID-1000-READ-X.

           COMPUTE WS-COMMIT-MAX-COUNT = WS-COMMIT-MAX-COUNT + 1 

           IF  WS-COMMIT-MAX-COUNT =1000
              PERFORM  0035-1000-COMMIT 
                  THRU 0035-1000-COMMIT-X
              MOVE ZEROES TO WS-COMMIT-MAX-COUNT
           END-IF.
      
       3000-PROCESS-REPORT-X.
           EXIT.
      /
      *------------------------
       4000-DELETE-HI-INT-REC.
      *------------------------
                 MOVE ZEROES TO         WS-HOLD-AMT.           
M265C4        MOVE SPACES                 TO RHIFL-SEQ-REC-INFO.               
              MOVE RHI-CO-ID              TO   WS-CO-ID           
              MOVE RHI-POL-ID             TO   WS-POL-ID          
              MOVE RHI-POL-HIST-TYP-CD    TO   WS-POL-HIST-TYP-CD 
              MOVE RHI-POL-TRXN-EFF-DT    TO   WS-POL-TRXN-EFF-DT 
             MOVE RHI-POL-TRXN-DT        TO   WS-POL-TRXN-DT     
              MOVE RHI-POL-TRXN-TIME      TO   WS-POL-TRXN-TIME   
              MOVE RHI-POL-TRXN-TASK-ID   TO   WS-POL-TRXN-TASK-ID
              MOVE RHI-POL-TRXN-SEQ-NUM   TO   WS-POL-TRXN-SEQ-NUM
              MOVE RHI-POL-TRXN-DTL-INFO(36:13) TO WS-HOLD-AMT
           IF  RHI-POL-TRXN-DTL-INFO(5:6) ='FX1EI0'
              MOVE RHI-KEY                TO WS-HOLD-KEY  
              MOVE RHI-REC-INFO           TO WS-HOLD-REC-INFO
              MOVE RHI-POL-TRXN-DTL-INFO(5:6) TO WS-HOLD-ACCT-ID
               PERFORM  HI-2000-READ-PREV
                   THRU HI-2000-READ-PREV-X           
              IF NOT WHI-IO-OK
                 MOVE 'ZSHIID0002'           TO WGLOB-MSG-REF-INFO
                 MOVE WS-KEY                 TO WGLOB-MSG-PARM (1)
      
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X
                  GO TO 4000-DELETE-HI-INT-REC-X
              END-IF
              MOVE WS-HOLD-REC-INFO       TO RHIFL-SEQ-REC-INFO
              PERFORM  HIFL-1000-WRITE
                  THRU HIFL-1000-WRITE-X
               MOVE WS-KEY                 TO    WHI-KEY               
               PERFORM  HI-2000-DELETE-WITH-KEY
                   THRU HI-2000-DELETE-WITH-KEY-X

                IF  RHI-POL-TRXN-DTL-INFO(5:6) ='FX1CC0'   
                    IF  RHI-POL-TRXN-DTL-INFO(36:13) = WS-HOLD-AMT
                   MOVE RHI-CO-ID            TO   WS-CO-ID           
                   MOVE RHI-POL-ID           TO   WS-POL-ID        
                   MOVE RHI-POL-HIST-TYP-CD  TO   WS-POL-HIST-TYP-CD 
                   MOVE RHI-POL-TRXN-EFF-DT  TO   WS-POL-TRXN-EFF-DT 
                  MOVE RHI-POL-TRXN-DT      TO   WS-POL-TRXN-DT     
                   MOVE RHI-POL-TRXN-TIME    TO   WS-POL-TRXN-TIME   
                   MOVE RHI-POL-TRXN-TASK-ID TO   WS-POL-TRXN-TASK-ID
                   MOVE RHI-POL-TRXN-SEQ-NUM TO   WS-POL-TRXN-SEQ-NUM
                   MOVE RHI-REC-INFO       TO RHIFL-SEQ-REC-INFO
                   PERFORM  HIFL-1000-WRITE
                       THRU HIFL-1000-WRITE-X                   
                   MOVE WS-KEY               TO    WHI-KEY               
                   PERFORM  HI-2000-DELETE-WITH-KEY
                       THRU HI-2000-DELETE-WITH-KEY-X 
                    
                       MOVE 'ZSHIID0003'          TO WGLOB-MSG-REF-INFO
                       MOVE WS-HOLD-KEY  
                                                 TO WGLOB-MSG-PARM (1)
                       MOVE WS-KEY               TO WGLOB-MSG-PARM (2)
                       MOVE WS-HOLD-AMT          TO WGLOB-MSG-PARM (3)
                       MOVE WS-HOLD-AMT          TO WGLOB-MSG-PARM (3)                       
      
                      PERFORM  0260-1000-GENERATE-MESSAGE
                          THRU 0260-1000-GENERATE-MESSAGE-X                                  
                   ELSE
                       MOVE 'ZSHIID0004'          TO WGLOB-MSG-REF-INFO
                       MOVE RHI-POL-TRXN-DTL-INFO(36:13)  
                                                 TO WGLOB-MSG-PARM (1)
                       MOVE WS-HOLD-AMT          TO WGLOB-MSG-PARM (2)
      
                      PERFORM  0260-1000-GENERATE-MESSAGE
                          THRU 0260-1000-GENERATE-MESSAGE-X
                     END-IF
                 ELSE
                       MOVE 'ZSHIID0005'          TO WGLOB-MSG-REF-INFO
                       MOVE RHI-POL-TRXN-DTL-INFO(3:6)  
                                                 TO WGLOB-MSG-PARM (1)
                      PERFORM  0260-1000-GENERATE-MESSAGE
                          THRU 0260-1000-GENERATE-MESSAGE-X
                                                 
                 END-IF
           END-IF.
               PERFORM  HI-2000-READ-PREV
                   THRU HI-2000-READ-PREV-X.              
      
       4000-DELETE-HI-INT-REC-X.
           EXIT.
            

      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
 
            PERFORM  HIFL-4000-CLOSE
                THRU HIFL-4000-CLOSE-X.
               
           PERFORM  HIID-4000-CLOSE
               THRU HIID-4000-CLOSE-X.
      
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
       COPY NCPL0303.
       COPY NCPS0303.
       COPY XCPS0290.
       COPY XCPL0290.
      
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
       COPY CCPVHI.         
       COPY CCPGHI.        
       COPY CCPNMAST.
      
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY OCF.
      /
       COPY XCSNSEQ REPLACING ==:ID:==  BY HIID.
       COPY XCSLFILE REPLACING ==:ID:==  BY HIID
                               ==':PGM:'== BY =='ZSRQHIID'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY HIID.
      /
      
       COPY XCSNSEQ  REPLACING ==:ID:==  BY HIFL.
       COPY XCSLFILE REPLACING ==:ID:==  BY HIFL
                               ==':PGM:'== BY =='ZSRQHIFL'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY HIFL.
       COPY XCSASEQ  REPLACING ==:ID:==  BY HIFL.

      
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBMXXXX                     **
      *****************************************************************
      