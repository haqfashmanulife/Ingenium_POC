      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBZ.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBZ                                         **         
      **  REMARKS:  READ IN A LIST OF POLICY NUMBERS WITH BAD        **
      **            COLLECTION METHOD BONUS CODES AND ZAP IN THE     **
      **            CORRECT CODE ON THE UH RECORDS FOR THOSE POLICIES**
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       COPY CCSSPRT1.
      /
           SELECT CMBZ-DATA-FILE ASSIGN TO ZSCMBZ
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBZ-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       COPY CCSDPRT1.

       COPY CCSRPRT1.

       FD  CMBZ-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBZ-SEQ-REC-INFO.
           05  RCMBZ-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-POL-TYP             PIC X(02).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-CEASE-DT            PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-MTHV-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-CBB-YEAR            PIC Z9(4).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-ERR-UH-CD           PIC X(01).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-NEW-UH-CD           PIC X(01).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-COI-AMT             PIC 9(13).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-CMB-ERR-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(01).
           05  RCMBZ-CMB-NEW-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(15).

      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBZ'.

       COPY SQLCA.


       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-BAC-SW                 PIC X(1).                              
               88  WS-BAC-NOT-FOUND                  VALUE 'N'.
               88  WS-BAC-FOUND                      VALUE 'Y'.                 

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.

       01  WS-OUTPUT-REC.                                                       
           05  WS-OUTPUT-POL-ID          PIC X(10).
           05  FILLER                    PIC X(02).
           05  WS-OUTPUT-POL-STAT        PIC X(01).                             
           05  FILLER                    PIC X(03).
           05  WS-OUTPUT-ISS-DT          PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  WS-OUTPUT-MTHV-DT         PIC X(10).                             
           05  FILLER                    PIC X(03).
           05  WS-OUTPUT-OLD-UH-CD       PIC X(01).
           05  FILLER                    PIC X(07).
           05  WS-OUTPUT-NEW-UH-CD       PIC X(01).                             
           05  FILLER                    PIC X(83).

       01  WS-HDR-REC.                                                          
           05  WS-HDR-POL-ID             PIC X(10) VALUE 'POLICY    '.          
           05  FILLER                    PIC X(01) VALUE SPACE.
           05  WS-HDR-POL-STAT           PIC X(04) VALUE 'STAT'.                
           05  FILLER                    PIC X(01) VALUE SPACE.
           05  WS-HDR-ISS-DT             PIC X(10) VALUE 'POL_ISS_DT'.          
           05  FILLER                    PIC X(01) VALUE SPACE.
           05  WS-HDR-MTHV-DT            PIC X(10) VALUE 'MTHV_DT   '.          
           05  FILLER                    PIC X(01) VALUE SPACE.
           05  WS-HDR-OLD-UH-CD          PIC X(07) VALUE 'ORIG_CD'.             
           05  FILLER                    PIC X(01) VALUE SPACE.
           05  WS-HDR-NEW-UH-CD          PIC X(06) VALUE 'NEW_CD'.              
           05  FILLER                    PIC X(80) VALUE SPACES.

       01  WS-ERROR-LINE.                                                       
           05  WS-ERROR-POL-ID           PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATE             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATA             PIC X(01).                             
           05  FILLER                    PIC X(58).                             

       01  WORK-AREAS.
           05  WS-TEST-DT                PIC X(10).                             
           05  WS-TEST-DT-R              REDEFINES                              
               WS-TEST-DT.                                                      
               10  WS-TEST-DT-YR         PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-MO         PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-DY         PIC 9(02).                             
           05  WS-MTHV-EFF-DT            PIC X(10).                             
           05  WS-MTHV-EFF-DT-R          REDEFINES                              
               WS-MTHV-EFF-DT.                                                  
               10  WS-MTHV-EFF-DT-YR     PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-MTHV-EFF-DT-MO     PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-MTHV-EFF-DT-DY     PIC 9(02).                             
           05  WS-PREV-MTHV-DT           PIC X(10).                             
           05  WS-COI-AMT                PIC 9(13).                             
           05  WS-CMB-ERR-AMT            PIC 9(13).                             
           05  WS-CMB-NEW-AMT            PIC 9(13).                             
           05  WS-CMB-DIFF               PIC S9(13).                            

       COPY CCFWPOL.
       COPY CCFRPOL.

       COPY CCFWCVG.
       COPY CCFRCVG.
       COPY CCWWCVGS.

       COPY CCFWUH.                                                             
       COPY CCFRUH.                                                             

       COPY CCSWPRT1.

       01  WCMBZ-SEQ-IO-WORK-AREA.
           05  WCMBZ-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBZ'.
           05  WCMBZ-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBZ-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBZ-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBZ-SEQ-IO-OK              VALUE 0.
               88  WCMBZ-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBZ-SEQ-IO-EOF             VALUE 8.
               88  WCMBZ-SEQ-IO-ERROR           VALUE 9.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY CCWL9460.
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
              UNTIL WCMBZ-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

      *    PERFORM 9000-FINALIZE
      *       THRU 9000-FINALIZE-X.

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM PRT1-3000-OPEN-OUTPUT
              THRU PRT1-3000-OPEN-OUTPUT-X.

           MOVE ZERO                   TO WCMBZ-SEQ-IO-STATUS.

           OPEN INPUT CMBZ-DATA-FILE.

           IF WCMBZ-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMCMBZ'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMCMBZ'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

           MOVE SPACES TO RPRT1-SEQ-REC-INFO.

           MOVE WS-HDR-REC              TO RPRT1-REC-DETAIL.                    
           MOVE +1                      TO WPRT1-NUMBER-LINES.                  
           PERFORM PRT1-1000-WRITE
              THRU PRT1-1000-WRITE-X.

           MOVE SPACES                  TO WS-OUTPUT-REC.                       
           MOVE WS-OUTPUT-REC           TO RPRT1-REC-DETAIL.                    
           MOVE +1                      TO WPRT1-NUMBER-LINES.                  
           PERFORM PRT1-1000-WRITE
              THRU PRT1-1000-WRITE-X.

       1000-INITIALIZATION-X.
           EXIT.

      /
      *---------------------                                                    
       2000-PROCESS-IN-RECS.                                                    
      *---------------------                                                    

           PERFORM  9500-CMBZ-READ                                              
               THRU 9500-CMBZ-READ-X.                                           
           IF NOT WCMBZ-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE RCMBZ-POL-ID           TO WPOL-POL-ID.

           PERFORM  POL-1000-READ                                               
               THRU POL-1000-READ-X.                                            

           IF WPOL-IO-NOT-FOUND
               MOVE WPOL-KEY           TO  WGLOB-MSG-PARM (1)
               MOVE 'XS00000097'       TO  WGLOB-MSG-REF-INFO
      *MSG: (S) 'POLICY RECORD NOT FOUND'
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-PROCESS-IN-RECS-X                                     
           ELSE
               MOVE RPOL-POL-ID        TO  LPGA-POLICY-NUMBER
           END-IF.

      *    PERFORM CVGS-1000-LOAD-CVGS-ARRAY
      *       THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

      *    PERFORM  9460-0000-INIT-PARM-INFO
      *        THRU 9460-0000-INIT-PARM-INFO-X.
      
      *    MOVE RCMBZ-MTHV-DT      TO L9460-EFF-DT.                             
      *    PERFORM  9460-1000-SET-COLCT-MTHD
      *        THRU 9460-1000-SET-COLCT-MTHD-X.
      
      *    IF NOT L9460-RETRN-OK                                                
      *        MOVE SPACES                       TO WS-ERROR-LINE               
      *        MOVE RCMBZ-POL-ID                 TO WS-ERROR-POL-ID             
      *        MOVE RCMBZ-MTHV-DT                TO WS-ERROR-DATE               
      *        MOVE '*** SETTING OF NEW COLLECTION METHOD FAILED ***'           
      *                                          TO WS-ERROR-MESSAGE            
      *        MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
      *        PERFORM  0040-3000-WRITE-OTHER                                   
      *            THRU 0040-3000-WRITE-OTHER-X                                 
      *        GO TO 2000-PROCESS-IN-RECS-X                                     
      *    END-IF.

      *    IF (RCMBZ-NEW-UH-CD = 'C' AND
      *        L9460-POL-COLCT-MTHD-CD NOT = 'C')                               
      *    OR (RCMBZ-NEW-UH-CD = 'B' AND
      *        L9460-POL-COLCT-MTHD-CD NOT = 'B')                               
      *    OR (RCMBZ-NEW-UH-CD = 'L' AND
      *        L9460-POL-COLCT-MTHD-CD NOT = 'L')                               
      *    OR (RCMBZ-NEW-UH-CD = 'S' AND
      *        L9460-POL-COLCT-MTHD-CD NOT = 'S')                               
      *        MOVE SPACES                       TO WS-ERROR-LINE               
      *        MOVE RCMBZ-POL-ID                 TO WS-ERROR-POL-ID             
      *        MOVE RCMBZ-MTHV-DT                TO WS-ERROR-DATE               
      *        MOVE '*** UNEXPECTED NEW COLLECTION METHOD ***'                  
      *                                          TO WS-ERROR-MESSAGE            
      *        MOVE L9460-POL-COLCT-MTHD-CD      TO WS-ERROR-DATA               
      *        MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
      *        PERFORM  0040-3000-WRITE-OTHER                                   
      *            THRU 0040-3000-WRITE-OTHER-X                                 
      *        GO TO 2000-PROCESS-IN-RECS-X                                     
      *    END-IF.

           MOVE RCMBZ-POL-ID        TO WUH-POL-ID.                              
           MOVE RCMBZ-MTHV-DT       TO WUH-MTHV-EFF-DT-NUM.                     
           MOVE ZERO                TO WUH-MTHV-EFF-DT-NUM-DY.                  

           PERFORM UH-1000-READ-FOR-UPDATE                                      
              THRU UH-1000-READ-FOR-UPDATE-X.                                   

           IF NOT WUH-IO-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RCMBZ-POL-ID                 TO WS-ERROR-POL-ID             
               MOVE RCMBZ-MTHV-DT                TO WS-ERROR-DATE               
               MOVE '*** UH TABLE READ FAILED ***'                              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE SPACES                  TO WS-OUTPUT-REC.                       
           MOVE RUH-POL-COLCT-MTHD-CD   TO WS-OUTPUT-OLD-UH-CD.                 
       
           MOVE RCMBZ-NEW-UH-CD         TO RUH-POL-COLCT-MTHD-CD                
       
           PERFORM UH-2000-REWRITE                                              
              THRU UH-2000-REWRITE-X.                                           

           IF NOT WUH-IO-OK
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RCMBZ-POL-ID                 TO WS-ERROR-POL-ID             
               MOVE RCMBZ-MTHV-DT                TO WS-ERROR-DATE               
               MOVE '*** UH TABLE WRITE FAILED ***'                             
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               PERFORM UH-3000-UNLOCK                                           
                  THRU UH-3000-UNLOCK-X                                         
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE RPOL-POL-ID             TO WS-OUTPUT-POL-ID.                    
           MOVE RPOL-POL-STAT-CD        TO WS-OUTPUT-POL-STAT.                  
           MOVE RPOL-POL-ISS-EFF-DT     TO WS-OUTPUT-ISS-DT.                    
           MOVE RCMBZ-MTHV-DT           TO WS-OUTPUT-MTHV-DT.                   
           MOVE RUH-POL-COLCT-MTHD-CD   TO WS-OUTPUT-NEW-UH-CD.                 

           MOVE WS-OUTPUT-REC           TO RPRT1-REC-DETAIL.                    
           MOVE +1                      TO WPRT1-NUMBER-LINES.                  
           PERFORM PRT1-1000-WRITE
              THRU PRT1-1000-WRITE-X.
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *--------------
       9000-FINALIZE.
      *--------------

       9000-FINALIZE-X.
           EXIT.

      *---------------
       9500-CMBZ-READ.
      *---------------

           MOVE ZERO                   TO WCMBZ-SEQ-IO-STATUS.

           READ CMBZ-DATA-FILE
                AT END
                  MOVE 8               TO WCMBZ-SEQ-IO-STATUS
                  GO TO 9500-CMBZ-READ-X.

           IF RCMBZ-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WCMBZ-SEQ-IO-STATUS
           END-IF.

           IF WCMBZ-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       9500-CMBZ-READ-X.
           EXIT.

      *-----------------------
       9600-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBZ-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBZ-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBZ-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9600-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WCMBZ-SEQ-IO-STATUS.

           CLOSE CMBZ-DATA-FILE.

           IF WCMBZ-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM PRT1-4000-CLOSE
              THRU PRT1-4000-CLOSE-X.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  PERFORMED ROUTINES
       COPY NCPPCVGS.
       COPY CCPIPRT1.

      *******  I/O ROUTINES

       COPY CCPNPOL.
       COPY CCPNCVG.
       COPY CCPUUH.                                                             

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPS9460.
       COPY CCPL9460.

       COPY CCPSPGA.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBZ                     **         
      *****************************************************************
