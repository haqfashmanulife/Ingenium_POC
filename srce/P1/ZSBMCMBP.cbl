      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBP.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBP                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF POLICY NUMBERS**
      **            AND UNDO DATES AND WILL SCAN PHST LOOKING FOR    **
      **            ACTIVITY THAT WILL PREVENT AN UNDO FROM WORKING  **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ULST-DATA-FILE ASSIGN TO ZSULST
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WULST-SEQ-FILE-STATUS.

           SELECT CMBP-DATA-FILE ASSIGN TO ZSCMBP
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBP-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

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

       FD  CMBP-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBP-SEQ-REC-INFO.
           05  RCMBP-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBP-PHST-ACTV-TYP       PIC X(04).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBP-PHST-STAT-CD        PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBP-PHST-EFF-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBP-PHST-OLD-VAL        PIC X(20).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBP-PHST-NEW-VAL        PIC X(20).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBP-PTAB-PRCES-CD       PIC X(01).                             
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBP'.

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
           05  WS-MAX-REDO-DT            PIC X(10) VALUE '2004-04-02'.          
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
           05  WS-PHST-ACTV-CD           PIC X(04).                             
               88  WS-PHST-SKIP-ACTV     VALUES                                 
                   '1901' '1902' '1903' '1904'
                   '3001' '3005' '3901'                                         
                   '4901' '4902' '4903'.        
               88  WS-PHST-ESC-ACTV      VALUES                                 
                   '3902' '3903' '3904' '3905' '1003'.

       01  WS-OUTPUT-LINE.         
           05  WS-OUTPUT-POL-ID                 PIC X(10).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-MESSAGE                PIC X(40).
           05  FILLER                           PIC X(81).

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

       01  WCMBP-SEQ-IO-WORK-AREA.
           05  WCMBP-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBP'.
           05  WCMBP-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBP-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBP-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBP-SEQ-IO-OK              VALUE 0.
               88  WCMBP-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBP-SEQ-IO-EOF             VALUE 8.
               88  WCMBP-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPHST.
       COPY CCFRPHST.

       COPY CCFWPTAB.
       COPY CCFRPTAB.

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
              UNTIL WULST-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

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

           OPEN INPUT ULST-DATA-FILE.                                           

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCMBP-SEQ-IO-STATUS.

           OPEN OUTPUT CMBP-DATA-FILE.

           IF WCMBP-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR                                         
                 THRU 9800-HANDLE-ERROR-X                                       
           END-IF.


       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMCMBP'           TO WGLOB-MAIN-PGM-ID                       
                                        WGLOB-CRNT-PGM-ID.
      *    PERFORM 0010-0000-INIT-PARM-INFO
      *       THRU 0010-0000-INIT-PARM-INFO-X.
      *    PERFORM 0010-1000-INIT-DEFAULT
      *       THRU 0010-1000-INIT-DEFAULT-X.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9500-ULST-READ                                              
               THRU 9500-ULST-READ-X.                                           
           IF NOT WULST-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           SET  WS-ANNIV-NOT-FOUND TO TRUE.                                     
           MOVE RULST-ISS-DT       TO WS-ANNIV-DT.                              
           PERFORM  3000-FIND-ANNIV-DATE                                        
               THRU 3000-FIND-ANNIV-DATE-X                                      
               UNTIL WS-ANNIV-FOUND.                                            
           IF WS-ANNIV-DT > WS-MAX-REDO-DT                                      
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE RULST-POL-ID              TO WPHST-POL-ID.                      
           MOVE WWKDT-HIGH-DT             TO L1660-INTERNAL-DATE.               
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE ZEROES                    TO WPHST-PCHST-SEQ-NUM.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.
           MOVE WPHST-KEY                 TO WPHST-ENDBR-KEY.
           MOVE RULST-UNDO-DT             TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE  TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.          
           MOVE 999                  TO WPHST-ENDBR-PCHST-SEQ-NUM.              
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           IF WPHST-IO-OK
               PERFORM  2700-FIND-PHST                                          
                   THRU 2700-FIND-PHST-X                                        
                   UNTIL NOT WPHST-IO-OK                                        
               PERFORM  PHST-3000-END-BROWSE
                   THRU PHST-3000-END-BROWSE-X
           END-IF.

       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *---------------                                                          
       2700-FIND-PHST.                                                          
      *---------------                                                          

           PERFORM  PHST-2000-READ-NEXT                                         
               THRU PHST-2000-READ-NEXT-X.                                      
           IF NOT WPHST-IO-OK                                                   
               GO TO 2700-FIND-PHST-X                                           
           END-IF.                                                              

           IF RPHST-PCHST-STAT-ERROR                                            
           OR RPHST-PCHST-STAT-HISTORY                                          
               GO TO 2700-FIND-PHST-X                                           
           END-IF.

           MOVE RPHST-POL-ACTV-TYP-ID       TO WS-PHST-ACTV-CD.                 
           IF WS-PHST-SKIP-ACTV                                                 
               GO TO 2700-FIND-PHST-X                                           
           END-IF.

           IF  RPHST-POL-ACTV-TYP-ID = '3003'                                   
               IF  RPHST-PCHST-OLD-VALU-TXT = 'PCC'                             
                   GO TO 2700-FIND-PHST-X                                       
               END-IF                                                           
           END-IF.

           MOVE RPHST-POL-ACTV-TYP-ID       TO WPTAB-POL-ACTV-TYP-ID.

           PERFORM  PTAB-1000-READ
               THRU PTAB-1000-READ-X.

           IF NOT WPTAB-IO-OK                                                   
               MOVE SPACES                       TO WS-OUTPUT-LINE
               MOVE RULST-POL-ID                 TO WS-OUTPUT-POL-ID
               MOVE '***** PTAB FAILED *****'
                                                 TO WS-OUTPUT-MESSAGE
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 2700-FIND-PHST-X                                           
           END-IF.

           IF RPTAB-POL-ACTV-PRCES-BOTH     
           AND NOT WS-PHST-ESC-ACTV                                             
               GO TO 2700-FIND-PHST-X                                           
           END-IF.

           MOVE SPACES                      TO RCMBP-SEQ-REC-INFO.              
           MOVE RULST-POL-ID                TO RCMBP-POL-ID.                    
           MOVE RPHST-POL-ACTV-TYP-ID       TO RCMBP-PHST-ACTV-TYP.             
           MOVE RPHST-PCHST-STAT-CD         TO RCMBP-PHST-STAT-CD.              
           MOVE RPHST-PCHST-EFF-DT          TO RCMBP-PHST-EFF-DT.               
           MOVE RPHST-PCHST-OLD-VALU-TXT    TO RCMBP-PHST-OLD-VAL.              
           MOVE RPHST-PCHST-NEW-VALU-TXT    TO RCMBP-PHST-NEW-VAL.              
           MOVE RPTAB-POL-ACTV-PRCES-CD     TO RCMBP-PTAB-PRCES-CD.             

           PERFORM 9400-CMBP-WRITE                                              
              THRU 9400-CMBP-WRITE-X.                                           

       2700-FIND-PHST-X.                                                        
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
       
           IF RULST-UNDO-DT < WS-ANNIV-DT                                       
               SET WS-ANNIV-FOUND  TO TRUE
           END-IF.
       
       3000-FIND-ANNIV-DATE-X.                                                  
           EXIT.

      *----------------
       9400-CMBP-WRITE.
      *----------------

           MOVE ZERO                   TO WCMBP-SEQ-IO-STATUS.

           WRITE RCMBP-SEQ-REC-INFO.

           IF WCMBP-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR                                         
                 THRU 9800-HANDLE-ERROR-X                                       
           END-IF.

       9400-CMBP-WRITE-X.
           EXIT.

      *---------------
       9500-ULST-READ.
      *---------------

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           READ ULST-DATA-FILE
                AT END
                  MOVE 8               TO WULST-SEQ-IO-STATUS
                  GO TO 9500-ULST-READ-X.

           IF RULST-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WULST-SEQ-IO-STATUS
           END-IF.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9500-ULST-READ-X.
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

      *-----------------------
       9800-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBP-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBP-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBP-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9800-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           CLOSE ULST-DATA-FILE.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCMBP-SEQ-IO-STATUS.

           CLOSE CMBP-DATA-FILE.

           IF WCMBP-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR                                         
                 THRU 9800-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY CCPNPTAB.
       COPY CCPBPHST.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBP                     **         
      *****************************************************************
