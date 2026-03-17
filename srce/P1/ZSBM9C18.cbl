      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSBM9C18.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  ZSBM9C18                                         **
      **  REMARKS:  UPDATION OF CDSA AMOUNT FOR SA RIDER             **
      **            FUND WITHDRAWAL                                  **
      **                                                             **
      **  DOMAIN :  AG                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
R14135** 04JUL18   CTS    MODULE CREATED                             **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      
       INPUT-OUTPUT SECTION.
      
       FILE-CONTROL.
      /
      ***************
       DATA DIVISION.
      ***************
      
       FILE SECTION.
      
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9C18'.
      
       COPY SQLCA.
       
       01  WS-PGM-WORK-AREA.
           05  WS-RETRN-CD                       PIC X(01).
               88  WS-RETRN-ERROR                VALUE 'E'.
               88  WS-RETRN-OK                   VALUE 'S'.
           05  WS-NUMERIC-5                      PIC 9(05) VALUE 0.
           05  WS-NUMERIC-17                     PIC 9(17) VALUE 0.
           05  WS-TOT-WTHDL-AMT                  PIC X(17).
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWWCCC.
      /
       COPY XCWWHDG.
      /
       COPY XCWWTIME.
       COPY XCWWWKDT.
      /
       COPY XCWL0800.
       COPY XCWL1580.
       COPY CCWWBTAX.
       COPY XCWTFCMD.
       COPY XCWL1660.
       COPY XCWL0040.
       COPY XCWL0280.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    9C18
                                     ==':ID:'==  BY =='9C18'==.
       COPY ZCSR9C18.                                     
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      / 
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY CCFWCVG.
       COPY CCFRCVG.
      /
       COPY CCFHPOL.
       COPY XCWL2490.
      /
       COPY CCFWFBNK.
       COPY CCFRFBNK.
       COPY CCWLACCT.
       COPY NCFWTTAB.
       COPY NCFRTTAB.
       COPY CCFRCDSA.
       COPY CCFWCDSA.
      /  
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************

       COPY XCWL0035.
       COPY CCWL0010.
      /
       COPY CCWL0083.
      /
       COPY XCWLDTLK.
      /
       COPY CCWL0950.
       COPY CCWL4750.
      /  
       COPY CCWWAT88.
       COPY CCSWTP88.
       COPY CCSRTP88.
      /
       COPY CCWWCVGS.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY CCWLPGA.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      
      *--------------
       0000-MAINLINE.
      *--------------
      
           PERFORM  1000-OPEN-FILES
               THRU 1000-OPEN-FILES-X.
               
           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.
      
           PERFORM  3000-UPDT-CDSA-WTHDL
               THRU 3000-UPDT-CDSA-WTHDL-X
               UNTIL W9C18-SEQ-IO-EOF.
           
           PERFORM  9000-CLOSE-FILES
               THRU 9000-CLOSE-FILES-X.
               
           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.
      
           STOP RUN.
      
       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       1000-OPEN-FILES.
      *----------------
      
           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.
      
           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
      
           PERFORM  9C18-1000-OPEN-INPUT
               THRU 9C18-1000-OPEN-INPUT-X.
      
       1000-OPEN-FILES-X.
           EXIT.
      /
      *-----------------
       2000-INITIALIZE.
      *-----------------

           INITIALIZE  WS-PGM-WORK-AREA.
           SET WS-RETRN-OK                  TO TRUE.
      
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
         
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
          
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
        
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           
      * GET THE PROGRAM DESCRIPTION
      
           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.
            
           MOVE 'ZSBM9C18'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.
           MOVE '00001'                     TO L2490-TXT-SRC-REF-ID.
             
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
             
           MOVE L2490-TXT-STR-TXT           TO L0040-PROGRAM-DESC.           
         
           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.
           
           PERFORM  9C18-1000-READ
               THRU 9C18-1000-READ-X.
      
           IF NOT W9C18-SEQ-IO-OK
      *MSG: 'NO ELIGIBLE POLICY IN THE DATABASE HAS NO DIFFERENCE IN CDSA'
               MOVE 'ZS9C189001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
          
       2000-INITIALIZE-X. 
           EXIT.
      /     
      *---------------------
       2100-INIT-OCF-TITLES.
      *---------------------
           
           MOVE ZERO                        TO L0040-ERROR-CNT.
           MOVE 'CS00000056'                TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
               
      * GET THE SYSTEM ID           
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE 'ZS9C189002'                TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
               
      * GET PROGRAM DESCRIPTION          
           MOVE WGLOB-MSG-TXT               TO L0040-PROGRAM-DESC.
           MOVE 'ZS9C189003'                TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
               
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.
           
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
          
       2100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *-----------------------
       3000-UPDT-CDSA-WTHDL.
      *-----------------------
          
      * SET THE KEY TO READ CDSA
          
           INITIALIZE  WCDSA-KEY.
           
           MOVE R9C18-POL-ID                TO WCDSA-POL-ID.
           MOVE R9C18-CDA-TYP-CD            TO WCDSA-CDA-TYP-CD.
           MOVE R9C18-CDA-EFF-IDT-NUM       TO WCDSA-CDA-EFF-IDT-NUM.
     
      * EDIT POLICY PAYOUT 
     
           MOVE R9C18-POL-PAYO-NUM          TO L0280-INPUT-DATA.
          
           SET L0280-SIGN-NOT-PERMITTED     TO TRUE.
           MOVE LENGTH OF R9C18-POL-PAYO-NUM
                                            TO L0280-LENGTH.
           MOVE 0                           TO L0280-PRECISION.
           MOVE LENGTH OF R9C18-POL-PAYO-NUM
                                            TO L0280-INPUT-SIZE.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
                
           IF  L0280-OK
               MOVE L0280-OUTPUT            TO WS-NUMERIC-5
               MOVE WS-NUMERIC-5            TO WCDSA-POL-PAYO-NUM
           ELSE
               MOVE ZERO                    TO WCDSA-POL-PAYO-NUM
           END-IF.
                      
           
      * EDIT CDSA SEQUENCE NUMBER
            
           MOVE R9C18-CDA-SEQ-NUM           TO L0280-INPUT-DATA.
           
           SET L0280-SIGN-NOT-PERMITTED     TO TRUE.
           MOVE LENGTH OF R9C18-CDA-SEQ-NUM
                                            TO L0280-LENGTH.
           MOVE 0                           TO L0280-PRECISION.
           MOVE LENGTH OF R9C18-CDA-SEQ-NUM
                                            TO L0280-INPUT-SIZE.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
           IF  L0280-OK
               MOVE L0280-OUTPUT            TO WS-NUMERIC-5
               MOVE WS-NUMERIC-5            TO WCDSA-CDA-SEQ-NUM
           ELSE
               MOVE ZERO                    TO WCDSA-CDA-SEQ-NUM
           END-IF.      
                      
      * EDIT REMMITANCE AMOUNT
            
           MOVE R9C18-REMIT-AMT             TO L0280-INPUT-DATA.
            
           SET L0280-SIGN-NOT-PERMITTED     TO TRUE.
           MOVE LENGTH OF R9C18-REMIT-AMT
                                            TO L0280-LENGTH.
           MOVE 0                           TO L0280-PRECISION.
           MOVE LENGTH OF R9C18-REMIT-AMT
                                            TO L0280-INPUT-SIZE.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
           IF  L0280-OK
               MOVE L0280-OUTPUT            TO WS-NUMERIC-17
               MOVE WS-NUMERIC-17           TO WS-TOT-WTHDL-AMT
           ELSE
               MOVE ZERO                    TO WS-TOT-WTHDL-AMT
           END-IF.      
           
      * READ DEPOSIT CDSA FOR FORMATTED KEY
          
           PERFORM  CDSA-1000-READ-FOR-UPDATE
               THRU CDSA-1000-READ-FOR-UPDATE-X.                
            
           IF NOT WCDSA-IO-OK
      * MSG: CDSA FOR WITHDRAWAL/SURRENDER FOR POLICY (@1)NOT FOUND
               MOVE 'ZS9C189004'            TO WGLOB-MSG-REF-INFO
               MOVE R9C18-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-RETRN-ERROR           TO TRUE
               GO TO 3000-UPDT-CDSA-WTHDL-X
           END-IF.
           
      * CDSA TOTAL AMOUNT @1 NOT SAME AS FBNK REMITANCE AMOUNT @2 
      * SO UPDATE CDSA 
        
           MOVE 'ZS9C189005'                TO WGLOB-MSG-REF-INFO
           MOVE R9C18-CDA-TOT-TRXN-AMT      TO WGLOB-MSG-PARM (1)
           MOVE WS-TOT-WTHDL-AMT            TO WGLOB-MSG-PARM (2)
           MOVE R9C18-POL-ID                TO WGLOB-MSG-PARM (2)
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X     
      
           MOVE WS-TOT-WTHDL-AMT            TO RCDSA-CDA-TOT-TRXN-AMT.
                       
           PERFORM  CDSA-2000-REWRITE
               THRU CDSA-2000-REWRITE-X.
            
           IF NOT WCDSA-IO-OK
      * MSG: UNABLE TO UPDATE CDSA FOR WITHDRAWAL AMOUNT 
               MOVE 'ZS9C189006'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-RETRN-ERROR           TO TRUE
               GO TO 3000-UPDT-CDSA-WTHDL-X
           END-IF.
           
           PERFORM  9C18-1000-READ
               THRU 9C18-1000-READ-X.
                                
       3000-UPDT-CDSA-WTHDL-X.
           EXIT.
      /
      *-----------------
       9000-CLOSE-FILES.
      *-----------------
      
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
      
           PERFORM  9C18-4000-CLOSE
               THRU 9C18-4000-CLOSE-X.
               
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
      
       9000-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY XCPPTIME.
      /
       COPY XCPPHDG.
      /
       COPY CCPPCCC.
      /
       COPY CCPSPGA.
      /
       COPY CCPSACCT.
      /
       COPY CCPPTASK.
      /
       COPY XCPL0040.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
       COPY XCPL0035.
       COPY CCPS0010.
       COPY CCPL0010.
       COPY CCPS0950.
       COPY CCPL0950.
       COPY XCPL0260.
       COPY XCPS2490.
       COPY XCPL2490.
       COPY XCPL0280.
      /
      ****************************************************************
      *  FILE I/O PROCESS MODULE                                     *
      ****************************************************************
      
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY CCPBCDSA.
       COPY CCPUCDSA.
      /
       COPY CCPBFBNK.
       COPY CCPUFBNK.
       COPY CCPAFBNK.
       COPY CCPCFBNK.
       COPY NCPNTTAB.
      / 
       COPY XCSNSEQ REPLACING ==:ID:==  BY 9C18.
       
       COPY XCSLFILE REPLACING ==:ID:==  BY 9C18
                               ==':PGM:'== BY =='ZSRQ9C18'==.
      
       COPY XCSOFILE REPLACING ==:ID:==  BY 9C18.
       COPY XCSASEQ  REPLACING ==:ID:==  BY 9C18.
      /
      ****************************************************************
      *  ERROR HANDLING ROUTINES                                     *
      ****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBM9C18                     **
      ***************************************************************** 