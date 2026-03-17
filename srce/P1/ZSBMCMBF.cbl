      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBF.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBF                                         **         
      **  REMARKS:  THIS WILL SCAN THE DATABASE LOOKING FOR POLICIES **
      **            THAT HAD THEIR CMB FIXED BY THE 1304 BUG FIX.    **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CMBF-DATA-FILE ASSIGN TO ZSCMBF
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBF-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  CMBF-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBF-SEQ-REC-INFO.
           05  RCMBF-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBF-CEASE-DT            PIC X(10).
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-OLD-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-OLD-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-NEW-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-NEW-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-CFLW-NUM       PIC 9(02).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-OLD-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-OLD-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-NEW-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-NEW-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-CFLW-NUM       PIC 9(02).                             
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBF'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-ANNIV-SW               PIC X(1).
               88  WS-ANNIV-NOT-DONE                 VALUE 'N'.
               88  WS-ANNIV-DONE                     VALUE 'Y'.                 
           05  WS-CFLW-SW                PIC X(1).
               88  WS-CFLW-NOT-FOUND                 VALUE 'N'.                 
               88  WS-CFLW-FOUND                     VALUE 'Y'.                 
           05  WS-CMB-DIFF-SW            PIC X(1).
               88  WS-CMB-DIFF-NOT-FOUND             VALUE 'N'.                 
               88  WS-CMB-DIFF-FOUND                 VALUE 'Y'.                 

       01  SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.
           05  J                         PIC S9(4) COMP.
           05  K                         PIC S9(4) COMP.
           05  L                         PIC S9(4) COMP.
           05  WS-BLD-CNT                PIC S9(4) COMP.

       01  WORK-AREAS.
           05  WS-MAX-DT                 PIC X(10) VALUE '2004-04-14'.          
           05  WS-ANNIV-DT               PIC X(10).                             
           05  WS-END-DT                 PIC X(10).                             
           05  WS-ISS-DT                 PIC X(10).                             
           05  WS-ISS-DT-R               REDEFINES                              
               WS-ISS-DT.                                                       
               10  WS-ISS-DT-YR          PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-ISS-DT-MO          PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-ISS-DT-DY          PIC 9(02).                             
           05  WS-TEST-DT                PIC X(10).                             
           05  WS-TEST-DT-R              REDEFINES                              
               WS-TEST-DT.                                                      
               10  WS-TEST-DT-YR         PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-MO         PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-DY         PIC 9(02).                             
           05  WS-OLDEST-BAD-DT          PIC X(10).                             
           05  WS-PREV-POL-ID            PIC X(10).                             
           05  WS-CMB-NEW-DT             PIC X(10).                             
           05  WS-CMB-NEW-AMT            PIC S9(13).                            
           05  WS-CFLW-CNT               PIC 9(02).                             

       01  WS-SAVE-UH-AREA.            
           05  WS-SAVE-UH-MAX            PIC S9(04) COMP.    
           05  WS-SAVE-UH-DATA           OCCURS 98 TIMES.
               10  WS-SAVE-UH-R-DT       PIC X(10).        
               10  WS-SAVE-UH-DT         PIC X(10).        
               10  WS-SAVE-UH-CD         PIC X(01).        

       01  WS-ERROR-LINE.                                                       
           05  WS-ERROR-POL-ID           PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATE             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATA             PIC X(01).                             
           05  FILLER                    PIC X(58).                             

       01  WCMBF-SEQ-IO-WORK-AREA.
           05  WCMBF-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBF'.
           05  WCMBF-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBF-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBF-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBF-SEQ-IO-OK              VALUE 0.
               88  WCMBF-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBF-SEQ-IO-EOF             VALUE 8.
               88  WCMBF-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWCFLW.
       COPY CCFRCFLW.

       COPY XCWWWKDT.
       COPY XCWWCVGM.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY XCWL0015.
       COPY XCWL0040.
       COPY XCWL0289.
       COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWLDTLK.
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

           MOVE ZERO                   TO WCMBF-SEQ-IO-STATUS.

           OPEN OUTPUT CMBF-DATA-FILE.

           IF WCMBF-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMCMBF'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMCMBF'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

           MOVE SPACES TO RCMBF-SEQ-REC-INFO.

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

           MOVE RPOL-POL-ID         TO LPGA-POLICY-NUMBER.                      

           MOVE SPACES              TO RCMBF-SEQ-REC-INFO.
           MOVE 0                   TO RCMBF-CMB1-OLD-AMT.                      
           MOVE 0                   TO RCMBF-CMB2-OLD-AMT.                      
           MOVE 0                   TO RCMBF-CMB1-NEW-AMT.                      
           MOVE 0                   TO RCMBF-CMB2-NEW-AMT.                      
           MOVE 0                   TO WS-BLD-CNT.                              
           MOVE RPOL-POL-ISS-EFF-DT TO WS-ANNIV-DT.                             
           SET  WS-ANNIV-NOT-DONE   TO TRUE.                                    
           PERFORM 2100-NEW-POL                                                 
              THRU 2100-NEW-POL-X                                               
              UNTIL WS-ANNIV-DONE.                                              

           IF WS-BLD-CNT = 0                                                    
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE RPOL-POL-ID         TO RCMBF-POL-ID.
           MOVE RPOL-POL-STAT-CD    TO RCMBF-POL-STAT.
           MOVE RPOL-POL-ISS-EFF-DT TO RCMBF-ISS-DT.
           MOVE RPOL-POL-CEAS-DT    TO RCMBF-CEASE-DT.

           PERFORM 9400-CMBF-WRITE                                              
              THRU 9400-CMBF-WRITE-X.                                           

      *    IF ((RCMBF-CMB1-OLD-AMT NOT = 0 OR
      *         RCMBF-CMB1-NEW-AMT NOT = 0) AND
      *         RCMBF-CMB1-OLD-AMT = RCMBF-CMB1-NEW-AMT)
      *    OR ((RCMBF-CMB2-OLD-AMT NOT = 0 OR
      *         RCMBF-CMB2-NEW-AMT NOT = 0) AND
      *         RCMBF-CMB2-OLD-AMT = RCMBF-CMB2-NEW-AMT)
           SET WS-CMB-DIFF-NOT-FOUND TO TRUE.               
           IF RCMBF-CMB1-OLD-AMT NOT = RCMBF-CMB1-NEW-AMT                       
           OR RCMBF-CMB2-OLD-AMT NOT = RCMBF-CMB2-NEW-AMT                       
               SET WS-CMB-DIFF-FOUND TO TRUE                                    
           END-IF.
           IF WS-CMB-DIFF-NOT-FOUND                                             
               MOVE SPACES                       TO WS-ERROR-LINE
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID
               MOVE '*** NO CMB AMOUNT CHANGE ***'
                                                 TO WS-ERROR-MESSAGE
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *-------------                                                            
       2100-NEW-POL.                                                            
      *-------------                                                            

           MOVE WS-ANNIV-DT        TO L1680-INTERNAL-1.
           MOVE 1                  TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO               TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO               TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2   TO WS-ANNIV-DT.

           IF WS-ANNIV-DT > WS-MAX-DT               
               SET WS-ANNIV-DONE   TO TRUE          
               GO TO 2100-NEW-POL-X                 
           END-IF.

           MOVE WS-ANNIV-DT        TO L1680-INTERNAL-1.
           MOVE 1                  TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO               TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO               TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2   TO WS-END-DT.                                

           MOVE WS-END-DT           TO L1680-INTERNAL-1.                        
           MOVE ZERO                TO L1680-NUMBER-OF-YEARS.                   
           MOVE 1                   TO L1680-NUMBER-OF-DAYS.                    
           MOVE ZERO                TO L1680-NUMBER-OF-MONTHS.                  
           PERFORM  1680-4000-SUB-YMD-FROM-DATE                                 
               THRU 1680-4000-SUB-YMD-FROM-DATE-X.                              
           MOVE L1680-INTERNAL-2    TO WS-END-DT.                               

           MOVE RPOL-POL-ID             TO WCFLW-POL-ID.
           MOVE 1                       TO WCFLW-CVG-NUM-N.
           MOVE 'D'                     TO WCFLW-CF-TYP-CD.
           MOVE WS-ANNIV-DT             TO WCFLW-CF-EFF-DT.
           MOVE 000                     TO WCFLW-CF-SEQ-NUM.

           MOVE WCFLW-KEY               TO WCFLW-ENDBR-KEY.
           MOVE WS-END-DT               TO WCFLW-ENDBR-CF-EFF-DT.
           MOVE 999                     TO WCFLW-ENDBR-CF-SEQ-NUM.

           SET WS-CFLW-NOT-FOUND        TO TRUE.

           PERFORM  CFLW-1000-BROWSE
               THRU CFLW-1000-BROWSE-X.

           PERFORM  3200-LOOP-THRU-CFLW
               THRU 3200-LOOP-THRU-CFLW-X
               UNTIL NOT WCFLW-IO-OK
                  OR WS-CFLW-FOUND.

           PERFORM  CFLW-3000-END-BROWSE
               THRU CFLW-3000-END-BROWSE-X.

           IF WS-CFLW-NOT-FOUND                    
               GO TO 2100-NEW-POL-X                 
           END-IF.

           IF RCFLW-CF-PRCES-DT < '2004-02-16'
               GO TO 2100-NEW-POL-X                 
           END-IF.

           MOVE RCFLW-CF-EFF-DT        TO WS-CMB-NEW-DT.                        
           MOVE RCFLW-CF-CLI-TRXN-AMT  TO WS-CMB-NEW-AMT.                       

           MOVE RCFLW-KEY           TO WCFLW-KEY.                               
           MOVE WCFLW-KEY           TO WCFLW-ENDBR-KEY.                         
           MOVE WS-ANNIV-DT         TO WCFLW-ENDBR-CF-EFF-DT.                   
           MOVE 000                 TO WCFLW-ENDBR-CF-SEQ-NUM.                  

           SET WS-CFLW-NOT-FOUND    TO TRUE.                                    
           MOVE 0                   TO WS-CFLW-CNT.                             

           PERFORM CFLW-1000-BROWSE-PREV                                        
              THRU CFLW-1000-BROWSE-PREV-X.                                     

           PERFORM 3300-LOOP-BACK-CFLW                                          
              THRU 3300-LOOP-BACK-CFLW-X                                        
              UNTIL NOT WCFLW-IO-OK                                             
                 OR WS-CFLW-FOUND.                                              

           PERFORM CFLW-3000-END-BROWSE-PREV                                    
              THRU CFLW-3000-END-BROWSE-PREV-X.                                 

           IF WS-CFLW-NOT-FOUND                                                 
               GO TO 2100-NEW-POL-X                 
           END-IF.

           ADD  1                       TO WS-BLD-CNT.

           IF WS-BLD-CNT = 1
               MOVE WS-CMB-NEW-DT          TO RCMBF-CMB1-NEW-DT
               MOVE WS-CMB-NEW-AMT         TO RCMBF-CMB1-NEW-AMT
               MOVE RCFLW-CF-EFF-DT        TO RCMBF-CMB1-OLD-DT
               MOVE RCFLW-CF-CLI-TRXN-AMT  TO RCMBF-CMB1-OLD-AMT
               MOVE WS-CFLW-CNT            TO RCMBF-CMB1-CFLW-NUM
           ELSE
               MOVE WS-CMB-NEW-DT          TO RCMBF-CMB2-NEW-DT
               MOVE WS-CMB-NEW-AMT         TO RCMBF-CMB2-NEW-AMT
               MOVE RCFLW-CF-EFF-DT        TO RCMBF-CMB2-OLD-DT
               MOVE RCFLW-CF-CLI-TRXN-AMT  TO RCMBF-CMB2-OLD-AMT
               MOVE WS-CFLW-CNT            TO RCMBF-CMB2-CFLW-NUM
           END-IF.
       
       2100-NEW-POL-X.                                                          
           EXIT.

      *--------------------                                                     
       3200-LOOP-THRU-CFLW.                                                     
      *--------------------                                                     

           PERFORM  CFLW-2000-READ-NEXT
               THRU CFLW-2000-READ-NEXT-X.
           IF NOT WCFLW-IO-OK                                                   
               GO TO 3200-LOOP-THRU-CFLW-X                                      
           END-IF.

           IF RCFLW-CF-TRXN-CD NOT = 'DEP'               
               GO TO 3200-LOOP-THRU-CFLW-X               
           END-IF.

           IF RCFLW-CF-REASN-CD NOT = 'CMB'                                     
               GO TO 3200-LOOP-THRU-CFLW-X               
           END-IF.

           SET WS-CFLW-FOUND  TO TRUE.                                          

       3200-LOOP-THRU-CFLW-X.                                                   
           EXIT.

      *--------------------                                                     
       3300-LOOP-BACK-CFLW.                                                     
      *--------------------                                                     

           PERFORM  CFLW-2000-READ-PREV
               THRU CFLW-2000-READ-PREV-X.
           IF NOT WCFLW-IO-OK                                                   
               GO TO 3300-LOOP-BACK-CFLW-X                                      
           END-IF.

           IF RCFLW-CF-TRXN-CD NOT = 'DRV'               
               GO TO 3300-LOOP-BACK-CFLW-X               
           END-IF.

           IF RCFLW-CF-REASN-CD NOT = 'CMB'                                     
               GO TO 3300-LOOP-BACK-CFLW-X               
           END-IF.

           IF  WS-ANNIV-DT < '2004-02-14'                                       
           AND RCFLW-CF-PRCES-DT >= '2004-02-16'                                
               ADD 1          TO WS-CFLW-CNT                                    
               GO TO 3300-LOOP-BACK-CFLW-X               
           END-IF.

           ADD 1              TO WS-CFLW-CNT.                                   
           SET WS-CFLW-FOUND  TO TRUE.                                          

       3300-LOOP-BACK-CFLW-X.                                                   
           EXIT.

      *--------------
       9000-FINALIZE.
      *--------------
           PERFORM POL-3000-TBL-END-BROWSE                                      
              THRU POL-3000-TBL-END-BROWSE-X.                                   

      *    DISPLAY 'AC RECORDS READ  ' AC-REC-READ.
      *    DISPLAY 'EXTRACTS WRITTEN ' AC-REP-WRITE.
       9000-FINALIZE-X.
           EXIT.

      *----------------
       9400-CMBF-WRITE.
      *----------------

           MOVE ZERO                   TO WCMBF-SEQ-IO-STATUS.

           WRITE RCMBF-SEQ-REC-INFO.

           IF WCMBF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9400-CMBF-WRITE-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBF-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBF-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBF-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WCMBF-SEQ-IO-STATUS.

           CLOSE CMBF-DATA-FILE.

           IF WCMBF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
 
      *******  I/O ROUTINES

       COPY CCPTPOL.
       COPY CCPBCFLW.
       COPY CCPVCFLW.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

54-001 COPY CCPL0010.
54-001 COPY CCPS0010.
      /
       COPY CCPSPGA.

       COPY XCPL0015.
       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL0289.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBF                     **         
      *****************************************************************
