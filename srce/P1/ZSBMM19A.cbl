      *****************************************************************
      **  MEMBER :  ZSBMM19A                                         **         
      **  REMARKS:  THIS PROGRAM WIIL GENERATE AN EXTRACT FILE FOR   **
      **            NOTIFICATION OF BT OUTSOURCING PROCESS           **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  18APR06  SW     CREATED FOR MP19-1                         **
6-0002**  25APR06  SW     FIX                                        **
6-0003**  09MAY06  SW     BANK ACCOUNT ID FIX                        **
      *****************************************************************
       
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMM19A.

       COPY XCWWCRHT.

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT M19A-DATA-FILE ASSIGN TO ZSM19A
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WM19A-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  M19A-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
            
       01  RM19A-SEQ-REC-INFO.
           05  RM19A-POL-ID              PIC X(07).
           05  RM19A-LRG-PROD-CD         PIC X(03).
           05  RM19A-POL-ISS-EFF-DT      PIC X(10).
           05  RM19A-CWAR-RECPT-DT       PIC X(10).
           05  RM19A-RO-ID               PIC X(03).
           05  RM19A-SO-ID               PIC X(03).
           05  RM19A-SERV-AGT-ID         PIC X(07).
           05  RM19A-OWN-CLI-NM-KA       PIC X(32).
           05  RM19A-OWN-CLI-NM-KJ       PIC X(32).
           05  RM19A-BNK-ID              PIC X(04).
           05  RM19A-BNK-BR-ID           PIC X(03).
           05  RM19A-BNK-ACCT-TYP-CD     PIC X(01).
           05  RM19A-BNK-ACCT-ID         PIC X(07).
6-0002*    05  RM19A-POL-PAC-DRW-DY      PIC X(07).
           05  RM19A-POL-PAC-DRW-DY      PIC X(02).
           05  RM19A-CLI-ADDR-LOC-CD     PIC X(10).
           05  RM19A-CLI-ADDR-ADDL-TXT   PIC X(72).
           05  RM19A-CLI-PSTL-CD         PIC X(08).
           05  RM19A-CLI-ADDR-KJ-TXT     PIC X(50).
           05  RM19A-CLI-ADDR-KA-TXT     PIC X(50).
6-0002     05  RM19A-END-OF-REC          PIC X(01).
      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMM19A'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(01).
               88  WS-NO-ERRORS          VALUE 'N'.
               88  WS-ERRORS-FOUND       VALUE 'Y'.
           05  WS-CWAA-ERR-SW            PIC X(01).
               88  WS-CWAA-ERR-NO        VALUE 'N'.
               88  WS-CWAA-ERR-YES       VALUE 'Y'.

       01  SUBS-AND-THINGS.
           05  I                         PIC S9(04) COMP.
            
       01  WORK-AREAS.
6-0003*    05  WS-BNK-ACCT-NUM.                                          
6-0003*        10  WS-BNK-ACCT-LEAD-ZERO PIC X(02).                      
6-0003*        10  WS-BNK-ACCT-ING       PIC X(07).
6-0002     05  WS-SERV-AGT-ID.                                                 
6-0002         10  WS-SERV-AGT-ID-LEAD   PIC X(01).                       
6-0002         10  WS-SERV-AGT-ID-TXT    PIC X(06).
6-0002     05  WS-CLI-ADDR-LOC-CD.                                              
6-0002         10  WS-CLI-ADDR-LOC-CD-LEAD PIC X(02).                       
6-0002         10  WS-CLI-ADDR-LOC-CD-TXT  PIC X(08).
6-0002     05  WS-POL-PAC-DRW-DY          PIC 9(04).
6-0002     05  WS-POL-PAC-DRW-DY-1 REDEFINES
6-0002         WS-POL-PAC-DRW-DY.                                              
6-0002         10  FILLER                 PIC X(02).                       
6-0002         10  WS-POL-PAC-DRW-DY-TXT  PIC X(02).
           05  WS-CWAR-RECPT-DT          PIC X(10).
           05  WS-HOLD-CLI-ADDR-TXT      PIC X(50).
           05  WS-HOLD-PREFCT            PIC X(10).
           05  WS-HOLD-CITY-NM           PIC X(20).
           05  WS-HOLD-ADDR-LN1          PIC X(20).
6-0002     05  WS-OWN-CLI-NM-KJ          PIC X(32).
6-0002*     05  WS-SPACE-FOUND-IND        PIC X(01).
6-0002*         88  WS-SPACE-FOUND-NO     VALUE 'N'.
6-0002*         88  WS-SPACE-FOUND-YES    VALUE 'Y'.
            
       01  WS-CTR-AREA.
           05  WS-TOTAL-READ-CTR         PIC S9(08) COMP.
           05  WS-TOTAL-WRITTEN-CTR      PIC S9(08) COMP.
           05  WS-PREM-PAY-NO-CTR        PIC S9(08) COMP.
           05  WS-PAC-NO-CTR             PIC S9(08) COMP.
           05  WS-BILL-RESTRICT-CTR      PIC S9(08) COMP.
           05  WS-CUT-OFF-FAIL-CTR       PIC S9(08) COMP.
           05  WS-SECOND-EXT-FAIL-CTR    PIC S9(08) COMP.
           05  WS-THIRD-EXT-FAIL-CTR     PIC S9(08) COMP.
           05  WS-TOTAL-FAIL-COND-CTR    PIC S9(08) COMP-3.
6-0002     05  WS-CHAR-CTR               PIC S9(04) COMP.
            
6-0002     01  WS-SB-CHAR1               PIC 9(02) COMP.
6-0002     01  WS-SB-CHAR1-R  REDEFINES WS-SB-CHAR1.
6-0002         05  FILLER                PIC X(01).
6-0002         05  WS-THE-SB-CHAR1       PIC X(01).
 
6-0002 01  WS-HEX-81                     PIC 9(01) BINARY VALUE 129.
6-0002 01  WS-HEX-40                     PIC 9(01) BINARY VALUE 64. 
 
       01  WS-ERROR-LINE.                                                       
           05  WS-ERROR-POL-ID           PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATA             PIC X(10).                             
           05  FILLER                    PIC X(60).
            
       01  WS-ERROR-CTR-LINE.
           05  WS-ERROR-CTR-LABEL        PIC X(40).
           05  FILLER                    PIC X(01).
           05  WS-ERROR-CTR-NUM          PIC ZZ,ZZZ,ZZ9..
           05  FILLER                    PIC X(83).
            
       01  WS-CONTROL-RECORD.
           05  WS-IN-PROGRAM-ID          PIC X(08).
           05  FILLER                    PIC X(01).
           05  WS-CUT-OFF-DT             PIC X(10).
           05  FILLER                    PIC X(01).
           05  WS-FIRST-EXTRACT-DT       PIC X(10).
           05  FILLER                    PIC X(01).
           05  WS-SECOND-EXTRACT-DT      PIC X(10).
           05  FILLER                    PIC X(01).
           05  WS-THIRD-EXTRACT-DT       PIC X(10).
           05  FILLER                    PIC X(01).
           05  WS-EFF-DT                 PIC X(10).
 
       01  WMP19A-SEQ-IO-WORK-AREA.
           05  WM19A-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'M19A'.
           05  WM19A-SEQ-IO-COMMAND             PIC X(02).
           05  WM19A-SEQ-FILE-STATUS            PIC X(02).
           05  WM19A-SEQ-IO-STATUS              PIC 9(01).
               88  WM19A-SEQ-IO-OK              VALUE 0.
               88  WM19A-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WM19A-SEQ-IO-EOF             VALUE 8.
               88  WM19A-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWRSTB.
       COPY CCFRRSTB.
      /
       COPY CCFWCWAA.
       COPY CCFRCWAR.
      /
       COPY XCWWWKDT.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWL0010.
       COPY XCWL0040.
       COPY CCWL2430.
       COPY CCWL2435.
       COPY CCWL2440.
       COPY CCWL0083.
       COPY CCWL5020.
       COPY XCWLDTLK.
       COPY XCWLPTR.
       COPY XCSWBCF.
       COPY XCSRBCF.
       COPY XCSWOCF.
       COPY XCSROCF.
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

           PERFORM 9000-FINALIZE
              THRU 9000-FINALIZE-X.
 
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

           OPEN OUTPUT M19A-DATA-FILE.

           IF WM19A-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           SET WS-NO-ERRORS          TO TRUE.
           MOVE SPACES               TO WS-ERROR-LINE.
           INITIALIZE                WS-CTR-AREA.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMM19A'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMM19A'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          
                                         
           MOVE ZERO                 TO L0040-ERROR-CNT.
           MOVE 'INGENIUM 6.1.2 J'   TO L0040-SYSTEM-ID.
           MOVE 'MP19-1 BT EXTRACTS FOR NOTIFICATION'
                                     TO L0040-PROGRAM-DESC.
           MOVE 'MANULIFE'           TO L0040-COMPANY-NAME.
           MOVE SPACES               TO L0040-HDG-LINE-3.

           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.
 
      * READ BCF CARD & EDIT IT

           PERFORM BCF-1000-READ
              THRU BCF-1000-READ-X.

           IF NOT WBCF-SEQ-IO-OK                                                
               MOVE SPACES                      TO WS-ERROR-LINE               
               MOVE '*** NO CONTROL CARD FOUND ***'              
                                                TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE               TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
               GO TO 1000-INITIALIZATION-X                                      
           END-IF.
 
           MOVE RBCF-SEQ-REC-INFO    TO WS-CONTROL-RECORD.
 
           MOVE LOW-VALUES          TO WPOL-KEY.
           MOVE HIGH-VALUES         TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *---------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *---------------------                                                   

           SET WS-CWAA-ERR-NO        TO TRUE.
           INITIALIZE WORK-AREAS.
            
           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           IF NOT WPOL-IO-OK                                                    
               SET WS-ERRORS-FOUND   TO TRUE
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.
            
           ADD +1                    TO WS-TOTAL-READ-CTR.
            
           IF  NOT RPOL-POL-STAT-PREM-PAY-REG
               ADD +1                TO WS-PREM-PAY-NO-CTR
               GO TO 2000-PROCESS-IN-RECS-X
           END-IF.
 
           IF  NOT RPOL-POL-BILL-TYP-PAC
               ADD +1                TO WS-PAC-NO-CTR
               GO TO 2000-PROCESS-IN-RECS-X
           END-IF.

           MOVE RPOL-POL-ID TO WRSTB-POL-ID.

           PERFORM  RSTB-1000-READ
               THRU RSTB-1000-READ-X.

           IF  WRSTB-IO-OK
           AND RRSTB-RBILL-EFF-DT NOT = WWKDT-ZERO-DT
               ADD +1                TO WS-BILL-RESTRICT-CTR
               GO TO 2000-PROCESS-IN-RECS-X
           END-IF.

           PERFORM  2100-CHECK-PREV-CWAA
               THRU 2100-CHECK-PREV-CWAA-X.
                
           IF  WS-CWAR-RECPT-DT > WS-CUT-OFF-DT
           OR  WS-CWAA-ERR-YES
               ADD +1                TO WS-CUT-OFF-FAIL-CTR
               GO TO 2000-PROCESS-IN-RECS-X
           END-IF.
     
      * FOR THE SECOND TIME EXTRACT, ADD THE FOLLOWING CRITERION. 

           IF  WS-EFF-DT = WS-SECOND-EXTRACT-DT
               IF  RPOL-POL-INFC-DT <= WS-FIRST-EXTRACT-DT
                   ADD +1            TO WS-SECOND-EXT-FAIL-CTR
                   GO TO 2000-PROCESS-IN-RECS-X
               END-IF
           END-IF.

      * FOR THE THIRD TIME EXTRACT, ADD THE FOLLOWING CRITERION. 

           IF  WS-EFF-DT = WS-THIRD-EXTRACT-DT
               IF  RPOL-POL-INFC-DT <= WS-SECOND-EXTRACT-DT
                   ADD +1            TO WS-THIRD-EXT-FAIL-CTR
                   GO TO 2000-PROCESS-IN-RECS-X
               END-IF
           END-IF.

           MOVE SPACES               TO RM19A-SEQ-REC-INFO.

           MOVE RPOL-POL-ID          TO RM19A-POL-ID.
           MOVE '500'                TO RM19A-LRG-PROD-CD.
           MOVE RPOL-POL-ISS-EFF-DT  TO RM19A-POL-ISS-EFF-DT.
6-0002*    MOVE RPOL-POL-PAC-DRW-DY  TO RM19A-POL-PAC-DRW-DY.
6-0002     MOVE RPOL-POL-PAC-DRW-DY  TO WS-POL-PAC-DRW-DY.
6-0002     MOVE WS-POL-PAC-DRW-DY-TXT TO RM19A-POL-PAC-DRW-DY.
           MOVE WS-CWAR-RECPT-DT     TO RM19A-CWAR-RECPT-DT.
                                       
6-0002*    MOVE RPOL-SERV-AGT-ID     TO RM19A-SERV-AGT-ID.
6-0002
6-0002     MOVE SPACE                TO WS-SERV-AGT-ID-LEAD.
6-0002     MOVE RPOL-SERV-AGT-ID     TO WS-SERV-AGT-ID-TXT.
6-0002     MOVE WS-SERV-AGT-ID       TO RM19A-SERV-AGT-ID.
           MOVE RPOL-SERV-BR-ID      TO RM19A-RO-ID. 
6-0002     MOVE '*'                  TO RM19A-END-OF-REC.
           
           PERFORM  2200-SET-UP-SO-ID
               THRU 2200-SET-UP-SO-ID-X.
 
           PERFORM  2300-SET-UP-OWNER-NAME
               THRU 2300-SET-UP-OWNER-NAME-X.
                
           PERFORM  2400-SET-OWNER-ADDR-INFO
               THRU 2400-SET-OWNER-ADDR-INFO-X.
                
           PERFORM  2500-SET-UP-BNK-INFO
               THRU 2500-SET-UP-BNK-INFO-X.
  
           PERFORM  9100-M19A-WRITE                                             
               THRU 9100-M19A-WRITE-X.                                          

       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *---------------------
       2100-CHECK-PREV-CWAA.
      *---------------------
       
           MOVE HIGH-VALUES            TO WCWAA-KEY.
           MOVE RPOL-POL-ID            TO WCWAA-POL-ID.
           MOVE WWKDT-HIGH-DT          TO WCWAA-RECPT-DT.

           MOVE WCWAA-KEY              TO WCWAA-ENDBR-KEY.
           MOVE WWKDT-LOW-DT           TO WCWAA-ENDBR-RECPT-DT.

           PERFORM  CWAA-1000-BROWSE-PREV
               THRU CWAA-1000-BROWSE-PREV-X.
  
           PERFORM  CWAA-2000-READ-PREV
               THRU CWAA-2000-READ-PREV-X
                    
           IF  WCWAA-IO-EOF
               PERFORM  CWAA-3000-END-BROWSE-PREV
                   THRU CWAA-3000-END-BROWSE-PREV-X
               SET WS-CWAA-ERR-YES TO TRUE
               GO TO 2100-CHECK-PREV-CWAA-X
           END-IF.
            
           MOVE RCWAR-RECPT-DT TO WS-CWAR-RECPT-DT.
            
           PERFORM  CWAA-3000-END-BROWSE-PREV
               THRU CWAA-3000-END-BROWSE-PREV-X.
 
       2100-CHECK-PREV-CWAA-X.                                                  
           EXIT.
 
      *------------------
       2200-SET-UP-SO-ID.
      *------------------
       
           IF  RPOL-SERV-AGT-ID NOT = SPACES           
               PERFORM  0083-0000-INIT-PARM-INFO
                   THRU 0083-0000-INIT-PARM-INFO-X
               MOVE RPOL-SERV-AGT-ID       TO L0083-AGENT-ID
               PERFORM  0083-1000-RETRIEVE-AGT-INFO
                   THRU 0083-1000-RETRIEVE-AGT-INFO-X
               IF  L0083-RETRN-OK
                   MOVE L0083-AGT-SO-ID    TO RM19A-SO-ID  
               ELSE
                   MOVE SPACES             TO WS-ERROR-LINE           
                   MOVE RPOL-POL-ID        TO WS-ERROR-POL-ID             
                   MOVE RPOL-POL-CSTAT-CD  TO WS-ERROR-DATA
  
                   MOVE '*** SO ID NOT FOUND ***'              
                                           TO WS-ERROR-MESSAGE            
                   MOVE WS-ERROR-LINE      TO L0040-INPUT-LINE            
                   PERFORM  0040-3000-WRITE-OTHER                              
                       THRU 0040-3000-WRITE-OTHER-X
               END-IF
           END-IF.

       2200-SET-UP-SO-ID-X.
           EXIT.
 
      *-----------------------
       2300-SET-UP-OWNER-NAME.
      *-----------------------
 
           MOVE ZERO                       TO I.
            
           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.

           PERFORM  2430-2100-GET-OWNER
               THRU 2430-2100-GET-OWNER-X.
            
           IF  NOT L2430-RETRN-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA
  
               MOVE '*** POLICY OWNER NOT FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2300-SET-UP-OWNER-NAME-X   
           END-IF
                   
           MOVE L2430-CLI-ID TO L2435-CLI-ID.
            
           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.
                
           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.

           IF  L2435-RETRN-OK
               MOVE L2435-CLI-NM-COMPRESSED TO RM19A-OWN-CLI-NM-KA
6-0002*        MOVE L2435-CLI-KJ-NM-COMPRESSED TO RM19A-OWN-CLI-NM-KJ
               MOVE L2435-CLI-KJ-NM-COMPRESSED TO WS-OWN-CLI-NM-KJ
6-0002         PERFORM  2350-OWNER-NAME-EDIT
6-0002             THRU 2350-OWNER-NAME-EDIT-X
           ELSE
               MOVE SPACES             TO WS-ERROR-LINE           
               MOVE RPOL-POL-ID        TO WS-ERROR-POL-ID             
               MOVE RPOL-POL-CSTAT-CD  TO WS-ERROR-DATA
  
               MOVE '*** POLICY OWNER NAME NOT FOUND ***'              
                                       TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE      TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                              
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.
 
       2300-SET-UP-OWNER-NAME-X.
           EXIT.
 
6-0002*---------------------
6-0002 2350-OWNER-NAME-EDIT.
6-0002*---------------------
6-0002 
6-0002*     SET WS-SPACE-FOUND-NO       TO TRUE.
6-0002
6-0002     PERFORM
6-0002         VARYING  WS-CHAR-CTR  FROM +1 BY +1
6-0002         UNTIL    WS-CHAR-CTR  > 33
6-0002*         OR       WS-SPACE-FOUND-YES
6-0002    
6-0002         IF  WS-OWN-CLI-NM-KJ (WS-CHAR-CTR:2) = '  '
6-0002*             SET WS-SPACE-FOUND-YES  TO TRUE
6-0002             MOVE WS-HEX-81          TO WS-SB-CHAR1
6-0002             MOVE WS-THE-SB-CHAR1
6-0002                     TO WS-OWN-CLI-NM-KJ (WS-CHAR-CTR:1)
6-0002             ADD +1                  TO WS-CHAR-CTR
6-0002             MOVE WS-HEX-40          TO WS-SB-CHAR1
6-0002             MOVE WS-THE-SB-CHAR1
6-0002                     TO WS-OWN-CLI-NM-KJ (WS-CHAR-CTR:1)
6-0002         END-IF
6-0002
6-0002     END-PERFORM.
6-0002
6-0002     MOVE WS-OWN-CLI-NM-KJ           TO RM19A-OWN-CLI-NM-KJ.
6-0002
6-0002 2350-OWNER-NAME-EDIT-X.
6-0002     EXIT.
 
      *-------------------------
       2400-SET-OWNER-ADDR-INFO.
      *-------------------------
 
           SET L2440-CLI-ADDR-GR-KANJI TO TRUE.
            
           MOVE L2430-CLI-ADDR-TYP-CD TO L2440-CLI-ADDR-TYP-CD.
           MOVE L2430-CLI-ID          TO L2440-CLI-ID.
 
           PERFORM  2440-1000-PRIMARY-ADDRESS
               THRU 2440-1000-PRIMARY-ADDRESS-X.
               
           IF  L2440-RETRN-OK
6-0002*        MOVE L2440-CLI-ADDR-LOC-CD TO RM19A-CLI-ADDR-LOC-CD
6-0002         MOVE SPACES               TO WS-CLI-ADDR-LOC-CD-LEAD
6-0002         MOVE L2440-CLI-ADDR-LOC-CD TO WS-CLI-ADDR-LOC-CD-TXT
6-0002         MOVE WS-CLI-ADDR-LOC-CD    TO RM19A-CLI-ADDR-LOC-CD
               MOVE L2440-CLI-ADDR-ADDL-TXT TO RM19A-CLI-ADDR-ADDL-TXT
               MOVE L2440-CLI-PSTL-CD TO RM19A-CLI-PSTL-CD
               MOVE L2440-CLI-PREFCT-TXT TO WS-HOLD-PREFCT
               MOVE L2440-CLI-CITY-NM-TXT TO WS-HOLD-CITY-NM
               MOVE L2440-CLI-ADDR-LN-1-TXT TO WS-HOLD-ADDR-LN1
                
               PERFORM  2410-STRING-ADDR
                   THRU 2410-STRING-ADDR-X
                    
               MOVE WS-HOLD-CLI-ADDR-TXT   TO RM19A-CLI-ADDR-KA-TXT
                
           ELSE
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA
  
               MOVE '*** POLICY OWNER ADDRESS (KANA) IS NOT FOUND***'
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
           END-IF.
            
           MOVE SPACES                      TO WS-HOLD-PREFCT.
           MOVE SPACES                      TO WS-HOLD-CITY-NM.
           MOVE SPACES                      TO WS-HOLD-ADDR-LN1.
           MOVE SPACES                      TO WS-HOLD-CLI-ADDR-TXT.
            
           SET L2440-CLI-ADDR-GR-KANJI TO TRUE.
            
           PERFORM  2440-1000-PRIMARY-ADDRESS
               THRU 2440-1000-PRIMARY-ADDRESS-X.
                
           IF  L2440-RETRN-OK
               MOVE L2440-CLI-PREFCT-TXT TO WS-HOLD-PREFCT
               MOVE L2440-CLI-CITY-NM-TXT TO WS-HOLD-CITY-NM
               MOVE L2440-CLI-ADDR-LN-1-TXT TO WS-HOLD-ADDR-LN1
                
               PERFORM  2410-STRING-ADDR
                   THRU 2410-STRING-ADDR-X
                    
               MOVE WS-HOLD-CLI-ADDR-TXT    TO RM19A-CLI-ADDR-KJ-TXT
                
           ELSE
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA
  
               MOVE '*** POLICY OWNER ADDRESS (KANJI) IS NOT FOUND***'
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
           END-IF.
 
       2400-SET-OWNER-ADDR-INFO-X.
           EXIT.
 
      *-----------------
       2410-STRING-ADDR.
      *-----------------
 
           STRING WS-HOLD-PREFCT, WS-HOLD-CITY-NM, WS-HOLD-ADDR-LN1  
              DELIMITED BY ' ' INTO WS-HOLD-CLI-ADDR-TXT.
 
       2410-STRING-ADDR-X.
           EXIT.
            
      *---------------------
       2500-SET-UP-BNK-INFO.
      *---------------------
       
           MOVE ZERO                       TO I.

           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.
           
           PERFORM  2430-1000-BUILD-POL-REL-INFO
               THRU 2430-1000-BUILD-POL-REL-INFO-X.

           IF  L2430-PAC-CLI-EXIST
               PERFORM  2430-2200-GET-PAYOR
                   THRU 2430-2200-GET-PAYOR-X

               IF  NOT L2430-RETRN-OK
                   MOVE SPACES                   TO WS-ERROR-LINE           
                   MOVE RPOL-POL-ID              TO WS-ERROR-POL-ID         
                   MOVE RPOL-POL-CSTAT-CD        TO WS-ERROR-DATA
      
                   MOVE '*** NO PAYOR INFO FOUND ***'              
                                                 TO WS-ERROR-MESSAGE        
    
                   MOVE WS-ERROR-LINE            TO L0040-INPUT-LINE        
    
                   PERFORM  0040-3000-WRITE-OTHER                               
                       THRU 0040-3000-WRITE-OTHER-X
                   GO TO 2500-SET-UP-BNK-INFO-X
                    
               END-IF
           ELSE
               MOVE SPACES                       TO WS-ERROR-LINE              
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA
  
               MOVE '*** NO PAYOR INFO FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2500-SET-UP-BNK-INFO-X
           END-IF.
               
           IF  L2430-PAC-NUM = ZERO
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA
  
               MOVE '*** NO BANK INFO FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2500-SET-UP-BNK-INFO-X   
           END-IF.
 
           PERFORM  5020-1000-BUILD-PARM-INFO
               THRU 5020-1000-BUILD-PARM-INFO-X.

           MOVE L2430-CLI-ID                 TO L5020-CLI-ID.
           MOVE L2430-PAC-NUM                TO L5020-PAC-NUM.

           PERFORM  5020-2000-GET-SPECIFIC-BANK
               THRU 5020-2000-GET-SPECIFIC-BANK-X.
                
           IF  NOT L5020-RETRN-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA
  
               MOVE '*** NO BANK ACCOUNT INFO FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2500-SET-UP-BNK-INFO-X   
           END-IF.

           IF L5020-BNK-ACCT-ID (1) = SPACES
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE RPOL-POL-CSTAT-CD            TO WS-ERROR-DATA
  
               MOVE '*** BANK ACCOUNT ID IS BLANK ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2500-SET-UP-BNK-INFO-X   
           END-IF.
            
6-0003*    MOVE '00'                       TO WS-BNK-ACCT-LEAD-ZERO.
 
           MOVE L5020-BNK-ID (1)             TO RM19A-BNK-ID.
           MOVE L5020-BNK-BR-ID (1)          TO RM19A-BNK-BR-ID.
           MOVE L5020-BNK-ACCT-TYP-CD (1)    TO RM19A-BNK-ACCT-TYP-CD.
6-0003*    MOVE L5020-BNK-ACCT-ID (1)        TO WS-BNK-ACCT-ING.
6-0003*    MOVE WS-BNK-ACCT-NUM              TO RM19A-BNK-ACCT-ID.
6-0003     MOVE L5020-BNK-ACCT-ID (1)        TO RM19A-BNK-ACCT-ID.
 
       2500-SET-UP-BNK-INFO-X.
           EXIT.
 
      *--------------
       9000-FINALIZE.
      *--------------
       
           PERFORM POL-3000-TBL-END-BROWSE                                      
              THRU POL-3000-TBL-END-BROWSE-X.                                   
               
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'TOTAL POLICIES READ--->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-TOTAL-READ-CTR           TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.
    
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'TOTAL POLICIES WITTEN--->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-TOTAL-WRITTEN-CTR        TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'PREMIUM PAYING POLICY FAILED--->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-PREM-PAY-NO-CTR          TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.
 
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'BT POLICY FAILED--->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-PAC-NO-CTR               TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.
  
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'NOT BILLING RESTRICT FAILED --->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-BILL-RESTRICT-CTR        TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'CWAR RECPT DT FAILED --->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-CUT-OFF-FAIL-CTR         TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'SECOND EXTRACT CONDITION FAILED --->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-SECOND-EXT-FAIL-CTR      TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.
 
 
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'THIRD EXTRACT CONDITION FAILED --->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-THIRD-EXT-FAIL-CTR       TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'TOTAL FAILED --->'
                                            TO WS-ERROR-CTR-LABEL.           
           COMPUTE WS-TOTAL-FAIL-COND-CTR
                   = WS-PREM-PAY-NO-CTR
                   + WS-PAC-NO-CTR
                   + WS-BILL-RESTRICT-CTR
                   + WS-CUT-OFF-FAIL-CTR
                   + WS-SECOND-EXT-FAIL-CTR
                   + WS-THIRD-EXT-FAIL-CTR.
                   
           MOVE WS-TOTAL-FAIL-COND-CTR      TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.

       9000-FINALIZE-X.
           EXIT.
 
      *----------------
       9100-M19A-WRITE.
      *----------------

           MOVE ZERO                   TO WM19A-SEQ-IO-STATUS.

           WRITE RM19A-SEQ-REC-INFO.
            
           ADD +1                      TO WS-TOTAL-WRITTEN-CTR.

           IF WM19A-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9100-M19A-WRITE-X.
           EXIT.
            
      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WM19A-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WM19A-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WM19A-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
            
           MOVE ZERO                   TO WM19A-SEQ-IO-STATUS.

           CLOSE M19A-DATA-FILE.

           IF WM19A-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
 
      *******  I/O ROUTINES

       COPY CCPTPOL.
       COPY CCPNRSTB.
       COPY CCPVCWAA.
       COPY XCPOBCF.
       COPY XCPNBCF.
       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.
       COPY XCPL0040.
       COPY CCPL2430.
       COPY CCPS2430.
       COPY CCPL2435.
       COPY CCPS2435.
       COPY CCPL2440.
       COPY CCPS0083.
       COPY CCPL0083.
       COPY CCPS5020.
       COPY CCPL5020.
       COPY XCPL0030.
       COPY XCPL0260.
       
       COPY XCPLBCF.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBF                     **         
      *****************************************************************
