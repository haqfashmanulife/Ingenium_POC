      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMETOT.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMETOT                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF BAD COLLECTION**
      **            METHOD MONTHLIVERSARIES FROM ZSBMCMBE AND WILL   **
      **            PRODUCE A FILE OF CMBE TOTAL BY POLICY RECORDS   **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CMBE-DATA-FILE ASSIGN TO ZSCMBE
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBE-SEQ-FILE-STATUS.
      /
           SELECT ETOT-DATA-FILE ASSIGN TO ZSETOT
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WETOT-SEQ-FILE-STATUS.
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

       FD  ETOT-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RETOT-SEQ-REC-INFO.
           05  RETOT-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RETOT-POL-TYP             PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  RETOT-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RETOT-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RETOT-CEASE-DT            PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RETOT-CMB-ERR-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RETOT-CMB-NEW-AMT         PIC 9(13).                             
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMETOT'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.
           05  WS-LAPSE-CNT              PIC S9(4) COMP.

       01  WORK-AREAS.
           05  WS-TEST-DT                PIC X(10).                             
           05  WS-TEST-DT-R              REDEFINES                              
               WS-TEST-DT.                                                      
               10  WS-TEST-DT-YR         PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-MO         PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-DY         PIC 9(02).                             
           05  WS-PREV-POL-ID            PIC X(10).                             
           05  WS-LAPSE-DATES            OCCURS 10 TIMES.                       
               10  WS-LAPSE-START        PIC X(10).                             
               10  WS-LAPSE-END          PIC X(10).                             

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

       01  WETOT-SEQ-IO-WORK-AREA.
           05  WETOT-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'ETOT'.
           05  WETOT-SEQ-IO-COMMAND             PIC X(02).
           05  WETOT-SEQ-FILE-STATUS            PIC X(02).
           05  WETOT-SEQ-IO-STATUS              PIC 9(01).
               88  WETOT-SEQ-IO-OK              VALUE 0.
               88  WETOT-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WETOT-SEQ-IO-EOF             VALUE 8.
               88  WETOT-SEQ-IO-ERROR           VALUE 9.
      /
       COPY CCFWPHST.
       COPY CCFRPHST.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWL0010.
       COPY XCWL0040.
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
              UNTIL WCMBE-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

           PERFORM 3000-WRITE-IT    
              THRU 3000-WRITE-IT-X.                                             

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                   TO WETOT-SEQ-IO-STATUS.

           OPEN OUTPUT ETOT-DATA-FILE.

           IF WETOT-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMETOT'           TO WGLOB-MAIN-PGM-ID                       
                                        WGLOB-CRNT-PGM-ID.
      *    PERFORM 0010-0000-INIT-PARM-INFO
      *       THRU 0010-0000-INIT-PARM-INFO-X.
      *    PERFORM 0010-1000-INIT-DEFAULT
      *       THRU 0010-1000-INIT-DEFAULT-X.

           MOVE SPACES TO WS-PREV-POL-ID.    

           MOVE SPACES TO RETOT-SEQ-REC-INFO.

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
               PERFORM 2100-NEW-POL                                             
                  THRU 2100-NEW-POL-X                                           
           END-IF.

           IF  RCMBE-POL-ID NOT = WS-PREV-POL-ID                                
               PERFORM 3000-WRITE-IT                                            
                  THRU 3000-WRITE-IT-X                                          

               PERFORM 2100-NEW-POL                                             
                  THRU 2100-NEW-POL-X                                           
           END-IF.
       
           IF RCMBE-POL-TYP = 'IN'                                              
           OR RCMBE-POL-TYP = 'ON'                                              
           OR RCMBE-POL-TYP = 'TN'                                              
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.
       
           PERFORM
              VARYING I FROM +1 BY +1                                           
                UNTIL I > WS-LAPSE-CNT                                          
                  IF  RCMBE-MTHV-DT >= WS-LAPSE-START (I)                       
                  AND RCMBE-MTHV-DT <  WS-LAPSE-END (I)                         
                      GO TO 2000-PROCESS-IN-RECS-X                              
                  END-IF                                                        
           END-PERFORM.
       
           ADD RCMBE-CMB-ERR-AMT       TO RETOT-CMB-ERR-AMT.                    
           ADD RCMBE-CMB-NEW-AMT       TO RETOT-CMB-NEW-AMT.                    
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *-------------                                                            
       2100-NEW-POL.                                                            
      *-------------                                                            

           MOVE RCMBE-POL-ID       TO WS-PREV-POL-ID.                           
           MOVE SPACES             TO RETOT-SEQ-REC-INFO.                       
           MOVE RCMBE-POL-ID       TO RETOT-POL-ID.                             
           MOVE RCMBE-POL-STAT     TO RETOT-POL-STAT.                           
           MOVE RCMBE-POL-TYP      TO RETOT-POL-TYP.                            
           MOVE RCMBE-ISS-DT       TO RETOT-ISS-DT.                             
           MOVE RCMBE-CEASE-DT     TO RETOT-CEASE-DT.                           
           MOVE 0                  TO RETOT-CMB-ERR-AMT.                        
           MOVE 0                  TO RETOT-CMB-NEW-AMT.                        
      *
      *  INITIALIZE LAPSE SAVE FIELDS                                           
      *
           PERFORM
              VARYING WS-LAPSE-CNT FROM +1 BY +1                                
                UNTIL WS-LAPSE-CNT > 10                                         
                  MOVE SPACES TO WS-LAPSE-DATES (WS-LAPSE-CNT)                  
           END-PERFORM.
           MOVE 0 TO WS-LAPSE-CNT.                                              
      *
      *  SCAN PHST LOOKING FOR LAPSES AND REINSTATEMENTS                        
      *
           MOVE RCMBE-POL-ID          TO WPHST-POL-ID.
           MOVE RCMBE-CEASE-DT        TO L1660-INTERNAL-DATE.                   
           PERFORM 1660-2000-CONVERT-INT-TO-INV                                 
              THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE   TO WPHST-PCHST-EFF-IDT-NUM.
           MOVE ZEROS                 TO WPHST-PCHST-SEQ-NUM.
           MOVE WPHST-KEY             TO WPHST-ENDBR-KEY.
           MOVE RCMBE-ISS-DT          TO L1660-INTERNAL-DATE.
           PERFORM 1660-2000-CONVERT-INT-TO-INV                                 
              THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE   TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.
           MOVE 999                   TO WPHST-ENDBR-PCHST-SEQ-NUM.

           PERFORM PHST-1000-BROWSE                                             
              THRU PHST-1000-BROWSE-X.                                          

           IF NOT WPHST-IO-OK                                                   
               GO TO 2100-NEW-POL-X                                             
           END-IF.
 
           PERFORM PHST-2000-READ-NEXT                                          
              THRU PHST-2000-READ-NEXT-X.                                       
           PERFORM 2150-SEARCH-PHST                                             
              THRU 2150-SEARCH-PHST-X                                           
              UNTIL NOT WPHST-IO-OK.                                            
           PERFORM PHST-3000-END-BROWSE                                         
              THRU PHST-3000-END-BROWSE-X.                                      

           IF WS-LAPSE-CNT = 0                                                  
               GO TO 2100-NEW-POL-X                                             
           END-IF.

           IF WS-LAPSE-START (WS-LAPSE-CNT) = SPACES                            
              MOVE RCMBE-ISS-DT TO WS-LAPSE-START (WS-LAPSE-CNT)                
           END-IF.

       2100-NEW-POL-X.                                                          
           EXIT.
      /
      *-----------------                                                        
       2150-SEARCH-PHST.                                                        
      *-----------------                                                        
 
      *
      *  WE ARE LOOKING FOR REINSTATED LAPSES.                                  
      *  A REINSTATED LAPSE WILL START WITH A 3003 RECORD WHERE THE             
      *  POLICY STATUS HAS CHANGED FROM B TO 1. THIS WILL GIVE US THE           
      *  START DATE FOR THE PERIOD THAT THE POLICY WAS LAPSED. THE END          
      *  DATE FOR THE LAPSE WILL BE A 3901 ACTIVITY TYPE PHST RECORD.           
      *  WE READ THE PHST FILE FROM THE PRESENT TO THE PAST SINCE IT            
      *  USES AN INVERTED DATE IN THE KEY, SO WE WILL ACTUALLY LOOK             
      *  FOR THE 3901 FIRST AND THEN TRY TO FIND A MATCHING 3003.               
      *
           IF RPHST-CVG-NUM NOT = '00'                                          
               PERFORM PHST-2000-READ-NEXT                                      
                  THRU PHST-2000-READ-NEXT-X                                    
               GO TO 2150-SEARCH-PHST-X                                         
           END-IF.
 
           IF RPHST-POL-ACTV-TYP-ID = '3901'                                    
               MOVE RPHST-PCHST-EFF-IDT-NUM TO L1660-INVERTED-DATE              
               PERFORM 1660-3000-CONVERT-INV-TO-INT                             
                  THRU 1660-3000-CONVERT-INV-TO-INT-X                           
               IF  WS-LAPSE-CNT > 0                                             
               AND WS-LAPSE-START (WS-LAPSE-CNT) = SPACES                       
                   MOVE L1660-INTERNAL-DATE                                     
                     TO WS-LAPSE-START (WS-LAPSE-CNT)                           
               END-IF                                                           
               ADD 1 TO WS-LAPSE-CNT
               MOVE L1660-INTERNAL-DATE                                         
                 TO WS-LAPSE-END (WS-LAPSE-CNT)                                 
               PERFORM PHST-2000-READ-NEXT                                      
                  THRU PHST-2000-READ-NEXT-X                                    
               GO TO 2150-SEARCH-PHST-X                                         
           END-IF.
 
           IF RPHST-POL-ACTV-TYP-ID = '3003' AND                                
              RPHST-PCHST-OLD-VALU-TXT = 'B' AND                                
              RPHST-PCHST-NEW-VALU-TXT = '1'                                    
               MOVE RPHST-PCHST-EFF-IDT-NUM TO L1660-INVERTED-DATE              
               PERFORM 1660-3000-CONVERT-INV-TO-INT                             
                  THRU 1660-3000-CONVERT-INV-TO-INT-X                           
               IF WS-LAPSE-CNT = 0                                              
                   ADD 1 TO WS-LAPSE-CNT                                        
                   MOVE RCMBE-CEASE-DT                                          
                     TO WS-LAPSE-END (WS-LAPSE-CNT)                             
               END-IF                                                           
               MOVE L1660-INTERNAL-DATE                                         
                 TO WS-LAPSE-START (WS-LAPSE-CNT)                               
           END-IF.
 
           PERFORM PHST-2000-READ-NEXT                                          
              THRU PHST-2000-READ-NEXT-X.                                       
 
       2150-SEARCH-PHST-X.                                                      
           EXIT.

      *--------------
       3000-WRITE-IT.
      *--------------

      *    IF  RETOT-CMB-ERR-AMT = 0                                            
      *    AND RETOT-CMB-NEW-AMT = 0                                            
      *        GO TO 3000-WRITE-IT-X                                            
      *    END-IF.                                                              

           PERFORM 9400-ETOT-WRITE                                              
              THRU 9400-ETOT-WRITE-X.                                           

       3000-WRITE-IT-X.
           EXIT.

      *----------------
       9400-ETOT-WRITE.
      *----------------

           MOVE ZERO                   TO WETOT-SEQ-IO-STATUS.

           WRITE RETOT-SEQ-REC-INFO.

           IF WETOT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9400-ETOT-WRITE-X.
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

           MOVE WETOT-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WETOT-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WETOT-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
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

           MOVE ZERO                   TO WETOT-SEQ-IO-STATUS.

           CLOSE ETOT-DATA-FILE.

           IF WETOT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY CCPBPHST.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

54-001 COPY CCPL0010.
54-001 COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMETOT                     **         
      *****************************************************************
