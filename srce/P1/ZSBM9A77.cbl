      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSBM9A77.
      
       COPY XCWWCRHT.
       
      *****************************************************************
      **  MEMBER :  ZSBM9A77                                         **
      **  REMARKS:  PROGRAM FOR CBB TRANSITION                       **
      **                                                             **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP7304**  12SEP08  CTS    INITIAL VERSION.                           **
ADF094**  30SEP08  CTS    FIX FOR EFFECTIVE DATE AND SRC-CD          **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9A77'.

       COPY SQLCA.
       COPY XCWLDTLK.       
       COPY XCWTFCMD.
       COPY XCWWHDG.
       COPY CCWWINDX.
      /
       COPY XCWL0040.
       
       
       01  WS-PROGRAM-WORK-AREA.
           05  WS-HOLD-POL-ID               PIC X(07) VALUE SPACES.
           05  WS-BONUS-AMT                 PIC S9(16)V99 COMP-3.
           05  WS-REC-BONUS-AMT             PIC S9(16)V99 COMP-3.
           05  WS-IN-RECORD.
               10  WS-IN-PGM-ID             PIC X(08).
               10  FILLER                   PIC X(01).
               10  WS-IN-PRCES-DT.
                   15  WS-IN-PRCES-YR       PIC 9(04).
                   15  FILLER               PIC X.
                   15  WS-IN-PRCES-MO       PIC 9(02).
                   15  FILLER               PIC X.
                   15  WS-IN-PRCES-DY       PIC 9(02).
      *****************************************************************
      *    COMMON COPYBOOKS                                           *
      *****************************************************************
       COPY CCWWCCC.
       COPY CCWWBTAX.
      / 
      ****************************************************************
      *  FILE WORK AREA FOR EXTRACT/REPORT FILES                     *
      ****************************************************************
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9A77
                               ==':ID:'==  BY =='9A77'==.
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
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCWWCVGS.
       COPY ZCSR9A77.
      *****************************************************************
      *    CALLED MODULE PARAMETER INFORMATION                        *
      *****************************************************************
       COPY NCWL0960.
       COPY XCWL0035.
       COPY XCWL0290.
       COPY CCWL0950.
       COPY CCWL0010.
       COPY XCWL1680.
       COPY CCWL5277.
       COPY CCWLACCT.
       COPY CCWL2194.
       COPY CCWL9370.
       COPY XCWL1670.
       COPY XCWLPTR.
       COPY CCWLPGA.
       COPY XCWL0280.
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
               THRU 3000-PROCESS-TRANSACTION-X.
               
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           GOBACK.

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
               
           PERFORM  9A77-1000-OPEN-INPUT
               THRU 9A77-1000-OPEN-INPUT-X.
               
       0100-OPEN-FILES-X.
           EXIT.
      /

      *----------------
       2000-INITIALIZE.
      *----------------

           PERFORM 0960-0000-INIT-PARM-INFO
              THRU 0960-0000-INIT-PARM-INFO-X.
              
           MOVE WPGWS-CRNT-PGM-ID           TO L0960-PROGRAM-ID.
           
           PERFORM  0960-2000-INIT-DEFAULT
               THRU 0960-2000-INIT-DEFAULT-X.

           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.
                            
       2000-INITIALIZE-X.
           EXIT.
      /
      *-------------------------
       3000-PROCESS-TRANSACTION.
      *-------------------------

           PERFORM  3100-VALIDATE-PARM-CARD
               THRU 3100-VALIDATE-PARM-CARD-X.

           PERFORM  9A77-1000-READ
               THRU 9A77-1000-READ-X
               UNTIL R9A77-SEQ-REC-INFO (1:7) IS NUMERIC
               OR W9A77-SEQ-IO-EOF.
                
           MOVE R9A77-POL-ID                TO WS-HOLD-POL-ID.
           
           MOVE R9A77-BONUS-AMT             TO L0280-INPUT-DATA.
           MOVE 2                           TO L0280-PRECISION.
           SET L0280-SIGN-PERMITTED         TO TRUE.
           MOVE LENGTH OF R9A77-BONUS-AMT
                                            TO L0280-INPUT-SIZE.
           COMPUTE L0280-LENGTH = L0280-INPUT-SIZE -
                     L0280-PRECISION - 1.

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.           
           
           COMPUTE WS-REC-BONUS-AMT = L0280-OUTPUT-V02 * -1.
           MOVE WS-REC-BONUS-AMT            TO WS-BONUS-AMT.
           
           MOVE ZEROES                      TO LPGA-ATRN-SEQUENCE.
           SET LPGA-EVNT-CD-TERM-LAPSE      TO TRUE.
           MOVE 'N00056'                    TO LPGA-OPER-CAT-CD.
           MOVE WGLOB-PROCESS-DATE          TO LPGA-JRNL-DT.
ADF094     MOVE WGLOB-PROCESS-DATE          TO L5277-EFF-DT.
           MOVE 'ZAP-CBB 2008'              TO L5277-DESC-INFO.
           SET L2194-ZAP-CBB-TRANS          TO TRUE.
                    
           IF  W9A77-SEQ-IO-OK
               PERFORM  3150-TOTAL-BONUS-AMT
                   THRU 3150-TOTAL-BONUS-AMT-X
                   UNTIL W9A77-SEQ-IO-EOF
               
               IF W9A77-SEQ-IO-EOF    
                   PERFORM  3200-DR-AMT-PRCES
                       THRU 3200-DR-AMT-PRCES-X
                   
                   PERFORM  3201-CR-AMT-PRCES
                       THRU 3201-CR-AMT-PRCES-X
               END-IF    
           ELSE
      *MSG: FILE IS EMPTY.
               MOVE 'ZS9A770001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-2000-GET-MESSAGE
                   THRU 0260-2000-GET-MESSAGE-X
               MOVE WGLOB-MSG-TXT           TO L0040-INPUT-LINE
               PERFORM  0040-2000-WRITE-ERROR
                   THRU 0040-2000-WRITE-ERROR-X
           END-IF.
           
       3000-PROCESS-TRANSACTION-X.
           EXIT.
      /
      *------------------------
       3100-VALIDATE-PARM-CARD.
      *------------------------
      
      **   READ THE COMPANY CONTROL CARD
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
      *
      **** GET THE SYSTEM ID
           MOVE 'XS00000145'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-SYSTEM-ID.
      **** GET THE PROGRAM DESCRIPTION
           MOVE 'ZS9A770003'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-PROGRAM-DESC.
 
 
           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.
              
           MOVE RBCF-SEQ-REC-INFO           TO WS-IN-RECORD.
           MOVE WS-IN-RECORD                TO L0040-INPUT-LINE.
      *    
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
      *    
       3100-VALIDATE-PARM-CARD-X.
           EXIT.
      /
      *-------------------
       3150-TOTAL-BONUS-AMT.
      *-------------------
      
           MOVE SPACES                      TO R9A77-SEQ-REC-INFO.
           PERFORM  9A77-1000-READ
               THRU 9A77-1000-READ-X
               UNTIL R9A77-SEQ-REC-INFO (1:7) IS NUMERIC
               OR W9A77-SEQ-IO-EOF.
           
           MOVE R9A77-BONUS-AMT             TO L0280-INPUT-DATA.
           MOVE 2                           TO L0280-PRECISION.
           SET L0280-SIGN-PERMITTED         TO TRUE.
           MOVE LENGTH OF R9A77-BONUS-AMT
                                            TO L0280-INPUT-SIZE.
           COMPUTE L0280-LENGTH = L0280-INPUT-SIZE -
                     L0280-PRECISION - 1.

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.           
           
           COMPUTE WS-REC-BONUS-AMT = L0280-OUTPUT-V02 * -1.
                      
           IF W9A77-SEQ-IO-OK
              IF  R9A77-POL-ID NOT = WS-HOLD-POL-ID
                  PERFORM  3200-DR-AMT-PRCES
                      THRU 3200-DR-AMT-PRCES-X
                
                  PERFORM  3201-CR-AMT-PRCES
                      THRU 3201-CR-AMT-PRCES-X
               
                  MOVE R9A77-POL-ID         TO WS-HOLD-POL-ID
                  MOVE ZEROES               TO WS-BONUS-AMT
                  MOVE WS-REC-BONUS-AMT     TO WS-BONUS-AMT
              ELSE
                  ADD WS-REC-BONUS-AMT      TO WS-BONUS-AMT 
              END-IF 
           END-IF.
           
           MOVE SPACES                      TO R9A77-SEQ-REC-INFO.
           
       3150-TOTAL-BONUS-AMT-X.
           EXIT.
      /      
      *-------------------
       3200-DR-AMT-PRCES.
      *-------------------
           MOVE WS-HOLD-POL-ID              TO WPOL-POL-ID.
           MOVE WS-HOLD-POL-ID              TO LPGA-POLICY-NUMBER.
           
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
       
       	   PERFORM  ACCT-1000-BUILD-PARM-INFO
       	       THRU ACCT-1000-BUILD-PARM-INFO-X.
ADF094	   MOVE 'G'                       TO LACCT-SRC-CD.
                  
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
           
           MOVE '01'                        TO I.
           SET LPGA-EVNT-CD-TERM-LAPSE      TO TRUE.
           
           PERFORM  2194-1000-BUILD-PARM-INFO
               THRU 2194-1000-BUILD-PARM-INFO-X.
 
           SET L2194-USE-PPR-ACCT           TO TRUE.
           COMPUTE L2194-TRXN-AMT        = WS-BONUS-AMT * -1.    
           SET L2194-ZAP-CBB-TRANS          TO TRUE.
           
           PERFORM  2194-1000-SURR-PYMT-ACCT
               THRU 2194-1000-SURR-PYMT-ACCT-X.
              
       3200-DR-AMT-PRCES-X.
           EXIT.
      /
      *-------------------
       3201-CR-AMT-PRCES.
      *-------------------
      
           PERFORM  9370-1000-BUILD-PARM-INFO
               THRU 9370-1000-BUILD-PARM-INFO-X.
           
           MOVE WS-BONUS-AMT                 TO 
                                        L9370-POST-DISB-CHG-AMT.
           SET   L9370-ZAP-CBB-TRANS   TO  TRUE.
           PERFORM  9370-1000-POST-DISB-ACCT
               THRU 9370-1000-POST-DISB-ACCT-X.

      * MSG POLICY ID @1 PLS AMOUNT CHANGED FROM @2 TO @3.
           MOVE 'ZS9A770002'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-HOLD-POL-ID              TO WGLOB-MSG-PARM (1).
           
           COMPUTE  L0290-INPUT-NUMBER = RPOL-POST-LAPS-SURR-AMT.
           PERFORM  3300-FORMAT-AMOUNT
               THRU 3300-FORMAT-AMOUNT-X.
           MOVE L0290-OUTPUT-DATA           TO WGLOB-MSG-PARM (02).    
           
           COMPUTE  L0290-INPUT-NUMBER = L9370-POL-POST-DISB-AMT.
           PERFORM  3300-FORMAT-AMOUNT
               THRU 3300-FORMAT-AMOUNT-X.
           MOVE L0290-OUTPUT-DATA           TO WGLOB-MSG-PARM (03).    
           
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
               
           MOVE  WS-HOLD-POL-ID             TO WPOL-POL-ID.
           
           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.
           
           IF  WPOL-IO-OK    
               PERFORM  9370-2000-UPDT-POL-DISB-AREA
                   THRU 9370-2000-UPDT-POL-DISB-AREA-X
           
               PERFORM  POL-2000-REWRITE
                   THRU POL-2000-REWRITE-X
           END-IF.
           
       3201-CR-AMT-PRCES-X.
           EXIT.
      /
      *-----------------
       3300-FORMAT-AMOUNT.
      *-----------------      
      
           MOVE 2                           TO L0290-PRECISION.
           MOVE WGLOB-CRCY-SCALE-QTY        TO L0290-PRECISION.
           MOVE 17                          TO L0290-MAX-OUT-LEN.
           SET L0290-MESSAGE-FORMAT         TO TRUE
           SET L0290-SIGN-DISPLAY           TO TRUE
           SET L0290-SIGN-FLOAT             TO TRUE
       
           PERFORM  0290-1000-NUMERIC-FORMAT
               THRU 0290-1000-NUMERIC-FORMAT-X.
           
      
      
       3300-FORMAT-AMOUNT-X.
            EXIT.
      /      
      
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  9A77-4000-CLOSE
               THRU 9A77-4000-CLOSE-X.
                             
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
       COPY CCPL5277.
       COPY CCPS2194.
       COPY CCPL2194.
       COPY CCPS9370.
       COPY CCPL9370.
       COPY CCPS5277.
      /
       COPY CCPS0010.
       COPY CCPL0010.
      /
       COPY XCPS0290.
       COPY XCPL0290.
       COPY CCPSACCT.
       COPY XCPL0280.
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
       COPY CCPNPOL.
       COPY CCPUPOL.
       COPY CCPNCVG.
       COPY XCSLFILE REPLACING ==:ID:==  BY 9A77
                               ==':PGM:'== BY =='ZSRQ9A77'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9A77.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY ==9A77==.
      /
      *
      *****************************************************************
      **                 END OF PROGRAM ZSBM9A77                     **
      *****************************************************************


             
           
            

      
    