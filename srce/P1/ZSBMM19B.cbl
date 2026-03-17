      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMM19B.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMM19B                                         **         
      **  REMARKS:  THIS WILL BUILD AN EXTRACT FILE OF BANK TRANSFER **
      **            DATA.                                            **
UYS001**  20MAY16  CTS    CHANGES DONE AS PART OF UNISYS             **      
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT M19B-DATA-FILE ASSIGN TO ZSM19B
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WM19B-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  M19B-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RM19B-SEQ-REC-INFO.
           05  RM19B-POL-ID              PIC X(07).                             
           05  RM19B-BANK-ID             PIC X(04).                             
           05  RM19B-BANK-BRANCH-ID      PIC X(03).                             
           05  RM19B-ACCT-NUM            PIC X(09).                             
           05  RM19B-LRG-PROD-CD         PIC X(03).
           05  RM19B-SML-PROD-CD         PIC X(03).                             
           05  RM19B-POL-BILL-MODE-CD    PIC X(02).                             
           05  RM19B-POL-PAC-DRW-DT      PIC X(10).                             
           05  RM19B-POL-ISS-EFF-DT      PIC X(10).                             
           05  RM19B-REDRAW-NUM          PIC 9(02).                            
           05  RM19B-SUNDRY-AMT          PIC 9(08).                            
           05  RM19B-DRV-DUE-DT          PIC X(10).                             
           05  RM19B-PAYOR-NAME          PIC X(50).                             
           05  RM19B-OWNER-NAME-KA       PIC X(50).                             
           05  RM19B-BNK-ACCT-TYP-CD     PIC X(01).                             
           05  RM19B-NAY-POL-IND         PIC X(01).                             
           05  RM19B-INSRD-NAME-KA       PIC X(50).                             
           05  RM19B-SERV-AGT-ID         PIC X(06).                             
           05  RM19B-SERV-BR-ID          PIC X(03).                             
           05  RM19B-POL-CSTAT-CD        PIC X(01).                             
           05  FILLER                    PIC X(07).                             
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMM19B'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-BANK-ERR-SW            PIC X(1).
               88  WS-BANK-ERR-NO                    VALUE 'N'.
               88  WS-BANK-ERR-YES                   VALUE 'Y'.

       01  WS-SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.

       01  WS-COUNTERS.     
           05  WS-RECS-READ-CNT          PIC S9(7).
           05  WS-RECS-WRITTEN-CNT       PIC S9(7).
           05  WS-TERM-NOT-LAPS-CNT      PIC S9(7).
           05  WS-LAPS-SURR-CNT          PIC S9(7).
           05  WS-OLD-LAPS-CNT           PIC S9(7).
           05  WS-NOT-BT-CNT             PIC S9(7).
           05  WS-ERROR-CNT              PIC S9(7).

       01  WORK-AREAS.
           05  WS-BNK-ACCT-NUM.                                                 
               10  WS-BNK-ACCT-LEAD-ZERO PIC X(02).                             
               10  WS-BNK-ACCT-ING       PIC X(07).                             
           05  WS-COMB-BILL-IND          PIC X(01).                             

       01  WS-CONTROL-RECORD.                                                  
           05  WS-IN-PROGRAM-ID          PIC X(08).                             
           05  FILLER                    PIC X(01).                             
           05  WS-REDRAW-NUM             PIC 9(02).                             
           05  FILLER                    PIC X(01).                             
           05  WS-SUNDRY-AMT             PIC 9(08).                             
           05  FILLER                    PIC X(01).                             
           05  WS-CUT-OFF-POL-CEAS-DT    PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-DRV-DUE-DT             PIC X(10).                             
           05  FILLER                    PIC X(38).                             

       01  WS-COUNTER-LINE.                                                     
           05  WS-COUNTER-MSG            PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-COUNTER-AMT            PIC Z,ZZZ,ZZ9.                         
           05  FILLER                    PIC X(72).                             

       01  WS-ERROR-LINE.                                                       
           05  WS-ERROR-POL-ID           PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATA             PIC X(10).                             
           05  FILLER                    PIC X(60).                             

       01  WM19B-SEQ-IO-WORK-AREA.
           05  WM19B-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'M19B'.
           05  WM19B-SEQ-IO-COMMAND             PIC X(02).
           05  WM19B-SEQ-FILE-STATUS            PIC X(02).
           05  WM19B-SEQ-IO-STATUS              PIC 9(01).
               88  WM19B-SEQ-IO-OK              VALUE 0.
               88  WM19B-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WM19B-SEQ-IO-EOF             VALUE 8.
               88  WM19B-SEQ-IO-ERROR           VALUE 9.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.

       COPY NCFWTTAB.
       COPY NCFRTTAB.

       COPY XCWWWKDT.
       COPY XCWWCVGM.
UYS001 COPY CCFRETAB.
UYS001 COPY CCFWETAB.
UYS001/       

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY CCWL2430.
       COPY CCWL5020.
       COPY XCWL0015.
       COPY XCWL0040.
       COPY XCWLDTLK.
       COPY XCSWBCF.
       COPY XCSRBCF.
       COPY XCSWOCF.
       COPY XCSROCF.
UYS001 COPY XCWL1660.        
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.

           PERFORM 1000-INITIALIZATION
              THRU 1000-INITIALIZATION-X.

           PERFORM 2000-PROCESS-IN-RECS                                         
              THRU 2000-PROCESS-IN-RECS-X                                       
              UNTIL WPOL-IO-EOF                                                 
                 OR WS-ERRORS-FOUND.                                            

           PERFORM 9000-FINISH         
              THRU 9000-FINISH-X.

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM BCF-1000-OPEN-INPUT
              THRU BCF-1000-OPEN-INPUT-X.

           MOVE ZERO                   TO WM19B-SEQ-IO-STATUS.

           OPEN OUTPUT M19B-DATA-FILE.

           IF WM19B-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMM19B'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMM19B'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           MOVE ZERO                 TO L0040-ERROR-CNT.
           MOVE 'INGENIUM 6.1.2 J'   TO L0040-SYSTEM-ID.
           MOVE 'MP19-2 BT EXTRACTS' TO L0040-PROGRAM-DESC.
           MOVE 'MANULIFE'           TO  L0040-COMPANY-NAME.
           MOVE SPACES               TO  L0040-HDG-LINE-3.

           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.

      * READ BCF CARD & EDIT IT

           PERFORM BCF-1000-READ
              THRU BCF-1000-READ-X.

           IF NOT WBCF-SEQ-IO-OK                                                
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE '*** NO CONTROL CARD FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
               GO TO 1000-INITIALIZATION-X                                      
           END-IF.

           MOVE ZERO                 TO WS-RECS-READ-CNT.
           MOVE ZERO                 TO WS-RECS-WRITTEN-CNT.
           MOVE ZERO                 TO WS-TERM-NOT-LAPS-CNT.
           MOVE ZERO                 TO WS-LAPS-SURR-CNT.
           MOVE ZERO                 TO WS-OLD-LAPS-CNT.
           MOVE ZERO                 TO WS-NOT-BT-CNT.
           MOVE ZERO                 TO WS-ERROR-CNT.

           MOVE RBCF-SEQ-REC-INFO    TO WS-CONTROL-RECORD.

      *    PERFORM PGA-1000-BUILD-PARMS
      *       THRU PGA-1000-BUILD-PARMS-X.

           MOVE LOW-VALUES          TO WPOL-KEY.
           MOVE HIGH-VALUES         TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           IF NOT WPOL-IO-OK                                                    
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                    
           END-IF.

           ADD 1                     TO WS-RECS-READ-CNT.

      *    MOVE RPLST-POL-ID        TO LPGA-POLICY-NUMBER.

           IF  RPOL-POL-STAT-PREM-PAY-REG             
           OR  RPOL-POL-STAT-PENDING              
           OR  RPOL-POL-STAT-COMPLETE             
           OR  RPOL-POL-STAT-LAPSED               
               CONTINUE
           ELSE    
               ADD 1                 TO WS-TERM-NOT-LAPS-CNT 
               GO TO 2000-PROCESS-IN-RECS-X                                    
           END-IF.

           IF  RPOL-POL-STAT-LAPSED               
           AND RPOL-POL-SUB-STAT-SURR               
               ADD 1                 TO WS-LAPS-SURR-CNT 
               GO TO 2000-PROCESS-IN-RECS-X                                    
           END-IF.

           IF  RPOL-POL-STAT-LAPSED               
           AND RPOL-POL-CEAS-DT < WS-CUT-OFF-POL-CEAS-DT 
               ADD 1                 TO WS-OLD-LAPS-CNT 
               GO TO 2000-PROCESS-IN-RECS-X                                    
           END-IF.

           IF  NOT RPOL-POL-BILL-TYP-PAC          
               ADD 1                 TO WS-NOT-BT-CNT 
               GO TO 2000-PROCESS-IN-RECS-X                                    
           END-IF.

           MOVE SPACES TO RM19B-SEQ-REC-INFO.

           SET WS-BANK-ERR-NO TO TRUE.   

           PERFORM  2100-SET-UP-BNK-INFO
               THRU 2100-SET-UP-BNK-INFO-X.

           IF  WS-BANK-ERR-YES                    
           OR  WS-ERRORS-FOUND                    
               ADD 1                 TO WS-ERROR-CNT 
               GO TO 2000-PROCESS-IN-RECS-X                                    
           END-IF.

           PERFORM  2200-SET-UP-OWNER-INFO
               THRU 2200-SET-UP-OWNER-INFO-X.

           PERFORM  2300-SET-UP-INSRD-INFO
               THRU 2300-SET-UP-INSRD-INFO-X.

           PERFORM  2400-SET-UP-POL-INFO
               THRU 2400-SET-UP-POL-INFO-X.

           PERFORM 9400-M19B-WRITE
              THRU 9400-M19B-WRITE-X.

       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *---------------------                                                    
       2100-SET-UP-BNK-INFO.                                                    
      *---------------------                                                    

           MOVE ZERO                       TO I.

           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.

           PERFORM  2430-1000-BUILD-POL-REL-INFO
               THRU 2430-1000-BUILD-POL-REL-INFO-X.

           IF L2430-PAC-CLI-EXIST
               PERFORM  2430-2200-GET-PAYOR
                   THRU 2430-2200-GET-PAYOR-X

               IF  NOT L2430-RETRN-OK
                   MOVE SPACES                       TO WS-ERROR-LINE           
                   MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID         
                   MOVE '*** NO PAYOR INFO FOUND ***'              
                                                     TO WS-ERROR-MESSAGE        
                   MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
                   MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE        
    
                   PERFORM  0040-3000-WRITE-OTHER                               
    
                       THRU 0040-3000-WRITE-OTHER-X                             
    
                   SET WS-BANK-ERR-YES TO TRUE
                   GO TO 2100-SET-UP-BNK-INFO-X   
               END-IF
           ELSE
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE '*** NO PAYOR INFO FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               SET WS-BANK-ERR-YES TO TRUE
               GO TO 2100-SET-UP-BNK-INFO-X   
           END-IF.

           IF L2430-PAC-NUM = ZERO
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE '*** NO BANK INFO FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               SET WS-BANK-ERR-YES TO TRUE
               GO TO 2100-SET-UP-BNK-INFO-X   
           END-IF.

           PERFORM  5020-1000-BUILD-PARM-INFO
               THRU 5020-1000-BUILD-PARM-INFO-X.

           MOVE L2430-CLI-ID                 TO L5020-CLI-ID.
           MOVE L2430-PAC-NUM                TO L5020-PAC-NUM.

           PERFORM  5020-2000-GET-SPECIFIC-BANK
               THRU 5020-2000-GET-SPECIFIC-BANK-X.
  
           IF NOT L5020-RETRN-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE '*** NO BANK ACCOUNT INFO FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               SET WS-BANK-ERR-YES TO TRUE
               GO TO 2100-SET-UP-BNK-INFO-X   
           END-IF.
  
           IF L5020-BNK-ACCT-ID (1) = SPACES
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE '*** BANK ACCOUNT ID IS BLANK ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               SET WS-BANK-ERR-YES TO TRUE
               GO TO 2100-SET-UP-BNK-INFO-X   
           END-IF.

           MOVE '00'                TO WS-BNK-ACCT-LEAD-ZERO.

           MOVE L5020-BNK-ID (1)               TO RM19B-BANK-ID.
           MOVE L5020-BNK-BR-ID (1)            TO RM19B-BANK-BRANCH-ID.
           MOVE L5020-BNK-ACCT-HLDR-NM (1)     TO RM19B-PAYOR-NAME.
           MOVE L5020-BNK-ACCT-TYP-CD (1)      TO RM19B-BNK-ACCT-TYP-CD.
           MOVE L5020-BNK-ACCT-ID (1)          TO WS-BNK-ACCT-ING.
           MOVE WS-BNK-ACCT-NUM                TO RM19B-ACCT-NUM.

       2100-SET-UP-BNK-INFO-X.                                                  
           EXIT.

      *-----------------------
       2200-SET-UP-OWNER-INFO.
      *-----------------------

           MOVE ZERO                       TO I.

           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.

           PERFORM  2430-2100-GET-OWNER
               THRU 2430-2100-GET-OWNER-X.

           IF  NOT L2430-RETRN-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE '*** POLICY OWNER NOT FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2200-SET-UP-OWNER-INFO-X   
           END-IF.

           MOVE L2430-CLI-NM-COMPRESSED        TO RM19B-OWNER-NAME-KA.

       2200-SET-UP-OWNER-INFO-X.
           EXIT.

      *-----------------------
       2300-SET-UP-INSRD-INFO.
      *-----------------------

           MOVE ZERO                       TO I.

           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.

           PERFORM  2430-3100-GET-PRIM-INSRD
               THRU 2430-3100-GET-PRIM-INSRD-X.

           IF  NOT L2430-RETRN-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE '*** PRIMARY INSURED NOT FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2300-SET-UP-INSRD-INFO-X   
           END-IF.

           MOVE L2430-CLI-NM-COMPRESSED        TO RM19B-INSRD-NAME-KA.

       2300-SET-UP-INSRD-INFO-X.
           EXIT.

      *---------------------
       2400-SET-UP-POL-INFO.
      *---------------------

           MOVE RPOL-POL-ID                    TO RM19B-POL-ID.
           MOVE RPOL-POL-BILL-MODE-CD          TO RM19B-POL-BILL-MODE-CD.
           MOVE RPOL-POL-ISS-EFF-DT            TO RM19B-POL-ISS-EFF-DT.

           IF RPOL-COMB-BILL-IND = '2'
               MOVE '0'                        TO RM19B-NAY-POL-IND
           ELSE
               MOVE '1'                        TO RM19B-NAY-POL-IND
           END-IF.

           MOVE RPOL-SERV-AGT-ID               TO RM19B-SERV-AGT-ID.
           MOVE RPOL-SERV-BR-ID                TO RM19B-SERV-BR-ID.
           MOVE RPOL-POL-CSTAT-CD              TO RM19B-POL-CSTAT-CD.

           MOVE RPOL-PLAN-ID                   TO WTTAB-ETBL-VALU-ID.

           PERFORM  PRLG-1000-EDIT
               THRU PRLG-1000-EDIT-X.

           IF  NOT WTTAB-IO-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE '*** LARGE PRODUCT CODE NOT FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
           ELSE
               MOVE RTTAB-TTBL-VALU-TXT          TO RM19B-LRG-PROD-CD
           END-IF.

           MOVE RPOL-PLAN-ID                   TO WTTAB-ETBL-VALU-ID.

           PERFORM  PRSM-1000-EDIT
               THRU PRSM-1000-EDIT-X.

           IF  NOT WTTAB-IO-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE '*** SMALL PRODUCT CODE NOT FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA           
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
           ELSE
               MOVE RTTAB-TTBL-VALU-TXT          TO RM19B-SML-PROD-CD
           END-IF.

           MOVE WS-REDRAW-NUM                    TO RM19B-REDRAW-NUM.
           MOVE WS-SUNDRY-AMT                    TO RM19B-SUNDRY-AMT.
           MOVE RPOL-POL-PAC-DRW-DT              TO RM19B-POL-PAC-DRW-DT.
           MOVE WS-DRV-DUE-DT                    TO RM19B-DRV-DUE-DT.

       2400-SET-UP-POL-INFO-X.
           EXIT.

      *------------
       9000-FINISH.
      *------------

           PERFORM POL-3000-TBL-END-BROWSE
              THRU POL-3000-TBL-END-BROWSE-X.

           MOVE SPACES                       TO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.                                

           MOVE SPACES                       TO WS-COUNTER-LINE.            
           MOVE 'NUMBER OF RECORDS READ:'    TO WS-COUNTER-MSG.
           MOVE WS-RECS-READ-CNT             TO WS-COUNTER-AMT.         
           MOVE WS-COUNTER-LINE              TO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.                                

           MOVE SPACES                       TO WS-COUNTER-LINE.            
           MOVE 'NUMBER OF RECORDS WRITTEN:' TO WS-COUNTER-MSG.
           MOVE WS-RECS-WRITTEN-CNT          TO WS-COUNTER-AMT.         
           MOVE WS-COUNTER-LINE              TO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.                                

           MOVE SPACES                       TO WS-COUNTER-LINE.            
           MOVE 'NUMBER TERMINATED BUT NOT LAPSED:'                     
                                             TO WS-COUNTER-MSG.
           MOVE WS-TERM-NOT-LAPS-CNT         TO WS-COUNTER-AMT.         
           MOVE WS-COUNTER-LINE              TO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.                                

           MOVE SPACES                       TO WS-COUNTER-LINE.            
           MOVE 'NUMBER LAPSED AND SURRENDERED:'
                                             TO WS-COUNTER-MSG.
           MOVE WS-LAPS-SURR-CNT             TO WS-COUNTER-AMT.         
           MOVE WS-COUNTER-LINE              TO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.                                

           MOVE SPACES                       TO WS-COUNTER-LINE.            
           MOVE 'NUMBER OF OLD LAPSED:'      TO WS-COUNTER-MSG.
           MOVE WS-OLD-LAPS-CNT              TO WS-COUNTER-AMT.         
           MOVE WS-COUNTER-LINE              TO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.                                

           MOVE SPACES                       TO WS-COUNTER-LINE.            
           MOVE 'NUMBER NOT BANK TRANSFER:'  TO WS-COUNTER-MSG.
           MOVE WS-NOT-BT-CNT                TO WS-COUNTER-AMT.         
           MOVE WS-COUNTER-LINE              TO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.                                

           MOVE SPACES                       TO WS-COUNTER-LINE.            
           MOVE 'NUMBER REJECTED BECAUSE OF ERRORS:'
                                             TO WS-COUNTER-MSG.
           MOVE WS-ERROR-CNT                 TO WS-COUNTER-AMT.         
           MOVE WS-COUNTER-LINE              TO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.                                

       9000-FINISH-X.
           EXIT.

      *----------------
       9400-M19B-WRITE.
      *----------------

           MOVE ZERO                   TO WM19B-SEQ-IO-STATUS.

           WRITE RM19B-SEQ-REC-INFO.

           IF WM19B-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           ADD 1                       TO WS-RECS-WRITTEN-CNT.

       9400-M19B-WRITE-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WM19B-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WM19B-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WM19B-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           MOVE ZERO                   TO WM19B-SEQ-IO-STATUS.

           CLOSE M19B-DATA-FILE.

           IF WM19B-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

       COPY CCPEPRLG.
       COPY CCPEPRSM.
 
      *******  I/O ROUTINES

       COPY CCPTPOL.

       COPY XCPOOCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
UYS001 COPY CCPBETAB.       

       COPY NCPNTTAB.

      ******   LINKAGE ROUTINES

54-001 COPY CCPL0010.
54-001 COPY CCPS0010.
      /
      *COPY CCPSPGA.

       COPY CCPS2430.
       COPY CCPL2430.

       COPY CCPS5020.
       COPY CCPL5020.

       COPY XCPL0015.
       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPLBCF.
       COPY XCPLOCF.
UYS001 COPY XCPL1660.       

      *****************************************************************
      **                 END OF PROGRAM ZSBMM19B                     **         
      *****************************************************************
