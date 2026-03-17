      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMULST.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMULST                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF BAD COLLECTION**
      **            METHOD MONTHLIVERSARIES FROM ZSBMCMBE AND WILL   **
      **            PRODUCE AN EXTRACT FILE FOR DOING UNDO/REDO      **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CMBE-DATA-FILE ASSIGN TO ZSCMBE
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBE-SEQ-FILE-STATUS.
      /
           SELECT ULST-DATA-FILE ASSIGN TO ZSULST
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WULST-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  CMBE-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBE-SEQ-REC-INFO.
           05  RCMBE-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-POL-TYP             PIC X(02).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-CEASE-DT            PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-MTHV-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-CBB-YEAR            PIC Z9(4).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-ERR-UH-CD           PIC X(01).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-NEW-UH-CD           PIC X(01).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-COI-AMT             PIC 9(13).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-CMB-ERR-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-CMB-NEW-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(15).

       FD  ULST-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RULST-SEQ-REC-INFO.
           05  RULST-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-POL-TYP             PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-UNDO-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-REDO-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-REDO-ANNV-IND       PIC X(01).                             
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMULST'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-ANNIV-SW               PIC X(1).
               88  WS-ANNIV-NOT-FOUND                VALUE 'N'.
               88  WS-ANNIV-FOUND                    VALUE 'Y'.                 

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(8) COMP.

       01  WORK-AREAS.
           05  WS-MAX-REDO-DT            PIC X(10) VALUE '2004-02-20'.          
           05  WS-MAX-FLEX-DT            PIC X(10) VALUE '2004-01-16'.          
           05  WS-ANNIV-DT               PIC X(10).                             
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

       01  WCMBE-SEQ-IO-WORK-AREA.
           05  WCMBE-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBE'.
           05  WCMBE-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBE-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBE-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBE-SEQ-IO-OK              VALUE 0.
               88  WCMBE-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBE-SEQ-IO-EOF             VALUE 8.
               88  WCMBE-SEQ-IO-ERROR           VALUE 9.

       01  WULST-SEQ-IO-WORK-AREA.
           05  WULST-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'ULST'.
           05  WULST-SEQ-IO-COMMAND             PIC X(02).
           05  WULST-SEQ-FILE-STATUS            PIC X(02).
           05  WULST-SEQ-IO-STATUS              PIC 9(01).
               88  WULST-SEQ-IO-OK              VALUE 0.
               88  WULST-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WULST-SEQ-IO-EOF             VALUE 8.
               88  WULST-SEQ-IO-ERROR           VALUE 9.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWL0010.
       COPY XCWL0040.
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
              UNTIL WCMBE-SEQ-IO-EOF                                            
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

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           OPEN OUTPUT ULST-DATA-FILE.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCMBE-SEQ-IO-STATUS.

           OPEN INPUT CMBE-DATA-FILE.

           IF WCMBE-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMULST'           TO WGLOB-MAIN-PGM-ID                       
                                        WGLOB-CRNT-PGM-ID.
      *    PERFORM 0010-0000-INIT-PARM-INFO
      *       THRU 0010-0000-INIT-PARM-INFO-X.
      *    PERFORM 0010-1000-INIT-DEFAULT
      *       THRU 0010-1000-INIT-DEFAULT-X.

           MOVE SPACES TO WS-PREV-POL-ID.    

           MOVE SPACES TO RULST-SEQ-REC-INFO.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9500-CMBE-READ                                              
               THRU 9500-CMBE-READ-X.                                           
           IF NOT WCMBE-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           IF  WS-PREV-POL-ID = SPACES                                          
               MOVE RCMBE-POL-ID       TO WS-PREV-POL-ID
               MOVE WS-MAX-REDO-DT     TO WS-OLDEST-BAD-DT
               MOVE SPACES             TO RULST-SEQ-REC-INFO                    
               MOVE RCMBE-POL-ID       TO RULST-POL-ID                          
               MOVE RCMBE-POL-STAT     TO RULST-POL-STAT                        
               MOVE RCMBE-POL-TYP      TO RULST-POL-TYP                         
               MOVE RCMBE-ISS-DT       TO RULST-ISS-DT                          
           END-IF.

           IF  RCMBE-POL-ID NOT = WS-PREV-POL-ID                                
               SET  WS-ANNIV-NOT-FOUND TO TRUE             
               MOVE RULST-ISS-DT       TO WS-ANNIV-DT       
               PERFORM  3000-FIND-ANNIV-DATE                                    
                   THRU 3000-FIND-ANNIV-DATE-X                                  
                   UNTIL WS-ANNIV-FOUND                                         
               IF WS-ANNIV-DT > WS-MAX-FLEX-DT
                   MOVE WS-MAX-REDO-DT TO WS-ANNIV-DT
               END-IF
               IF WS-ANNIV-DT < WS-MAX-REDO-DT                                  
                   MOVE 'Y'            TO RULST-REDO-ANNV-IND                   
               END-IF                                                           
               MOVE WS-OLDEST-BAD-DT   TO RULST-UNDO-DT                         
               MOVE WS-ANNIV-DT        TO RULST-REDO-DT                         
               PERFORM 9400-ULST-WRITE                                          
                  THRU 9400-ULST-WRITE-X                                        

               MOVE RCMBE-POL-ID       TO WS-PREV-POL-ID                        
               MOVE WS-MAX-REDO-DT     TO WS-OLDEST-BAD-DT
               MOVE SPACES             TO RULST-SEQ-REC-INFO                    
               MOVE RCMBE-POL-ID       TO RULST-POL-ID                          
               MOVE RCMBE-POL-STAT     TO RULST-POL-STAT                        
               MOVE RCMBE-POL-TYP      TO RULST-POL-TYP                         
               MOVE RCMBE-ISS-DT       TO RULST-ISS-DT                          
           END-IF.
       
           IF  RCMBE-MTHV-DT < WS-OLDEST-BAD-DT                                 
               MOVE RCMBE-MTHV-DT      TO WS-OLDEST-BAD-DT                      
           END-IF.
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *---------------------
       3000-FIND-ANNIV-DATE.
      *---------------------

           MOVE WS-ANNIV-DT        TO L1680-INTERNAL-1.                         
           MOVE 1                  TO L1680-NUMBER-OF-YEARS.                    
           MOVE ZERO               TO L1680-NUMBER-OF-MONTHS.                   
           MOVE ZERO               TO L1680-NUMBER-OF-DAYS.                     
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE                                 
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.                              
           MOVE L1680-INTERNAL-2   TO WS-ANNIV-DT.                              
       
           IF WS-OLDEST-BAD-DT < WS-ANNIV-DT                                    
               SET WS-ANNIV-FOUND  TO TRUE
           END-IF.
       
       3000-FIND-ANNIV-DATE-X.                                                  
           EXIT.

      *--------------
       9000-FINALIZE.
      *--------------

           SET  WS-ANNIV-NOT-FOUND TO TRUE.                                     
           MOVE RULST-ISS-DT       TO WS-ANNIV-DT.                              
           PERFORM  3000-FIND-ANNIV-DATE                                        
               THRU 3000-FIND-ANNIV-DATE-X                                      
               UNTIL WS-ANNIV-FOUND.                                            
           IF WS-ANNIV-DT > WS-MAX-FLEX-DT                                      
               MOVE WS-MAX-REDO-DT TO WS-ANNIV-DT                               
           END-IF.                                                              
           IF WS-ANNIV-DT < WS-MAX-REDO-DT                                      
               MOVE 'Y'            TO RULST-REDO-ANNV-IND                       
           END-IF.                                                              
           MOVE WS-OLDEST-BAD-DT   TO RULST-UNDO-DT.                            
           MOVE WS-ANNIV-DT        TO RULST-REDO-DT.                            
           PERFORM 9400-ULST-WRITE                                              
              THRU 9400-ULST-WRITE-X.                                           

       9000-FINALIZE-X.
           EXIT.

      *----------------
       9400-ULST-WRITE.
      *----------------

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           WRITE RULST-SEQ-REC-INFO.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9400-ULST-WRITE-X.
           EXIT.

      *---------------
       9500-CMBE-READ.
      *---------------

           MOVE ZERO                   TO WCMBE-SEQ-IO-STATUS.

           READ CMBE-DATA-FILE
                AT END
                  MOVE 8               TO WCMBE-SEQ-IO-STATUS
                  GO TO 9500-CMBE-READ-X.

           IF RCMBE-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WCMBE-SEQ-IO-STATUS
           END-IF.

           IF WCMBE-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       9500-CMBE-READ-X.
           EXIT.

      *-----------------------
       9600-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBE-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBE-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBE-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9600-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WULST-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WULST-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WULST-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WCMBE-SEQ-IO-STATUS.

           CLOSE CMBE-DATA-FILE.

           IF WCMBE-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           CLOSE ULST-DATA-FILE.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

54-001 COPY CCPL0010.
54-001 COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMULST                     **         
      *****************************************************************
