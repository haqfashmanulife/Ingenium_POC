      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBX.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBX                                         **         
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
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WULST-SEQ-FILE-STATUS.

           SELECT CMBX-DATA-FILE ASSIGN TO ZSCMBX
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBX-SEQ-FILE-STATUS.
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

       FD  CMBX-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBX-SEQ-REC-INFO.
           05  FILLER                    PIC X(100).                            
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBX'.

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
557973     05  WS-CF-FND-BAL-AMT         PIC S9(13)V9(02) COMP-3.
557973     05  WS-COI                    PIC S9(13)V9(02) COMP-3.
           05  WS-MAX-REDO-DT            PIC X(10) VALUE '2004-02-20'.          
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
           05  WS-PHST-ACTV-CD           PIC X(04).                             
               88  WS-PHST-PROC-ACTV     VALUES                                 
                   '4001'.
      *            '3003' '4001' '1003' '1011' '2010' '4009'.
               88  WS-PHST-SKIP-ACTV     VALUES                                 
                   '1901' '1902' '1903' '1904' '1906' '1907' '1908'
                   '3001' '3005' '3901'                
                   '4901' '4902' '4903'.       
      *            '1011' '1003'.        
               88  WS-PHST-INC-ACTV      VALUES                                 
                   '1003'.
           05  WS-SKIP-POL-SW            PIC X.
               88  WS-SKIP-POL-YES       VALUE 'Y'.
               88  WS-SKIP-POL-NO        VALUE 'N'.
           05  WS-3003-DT                PIC X(10)
               OCCURS 10 TIMES.
           05  WS-3003-CNT               PIC S9(3) COMP-3.
           05  WS-3003-IX                PIC S9(3) COMP-3.
           05  WS-4001-DT                PIC X(10)
               OCCURS 10 TIMES.
           05  WS-4001-CNT               PIC S9(3) COMP-3.
           05  WS-4001-IX                PIC S9(3) COMP-3.


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

       01  WCMBX-SEQ-IO-WORK-AREA.
           05  WCMBX-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBX'.
           05  WCMBX-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBX-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBX-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBX-SEQ-IO-OK              VALUE 0.
               88  WCMBX-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBX-SEQ-IO-EOF             VALUE 8.
               88  WCMBX-SEQ-IO-ERROR           VALUE 9.
       01  WCMBX-WORK-AREA.
           05  WCMBX-PREV-POL-ID         PIC X(10).
           05  WCMBX-PREV-POL-BILL-TYP   PIC X(01).
           05  WCMBX-1003-CNT            PIC S9(3) COMP-3.
           05  WCMBX-1011-CNT            PIC S9(3) COMP-3.
           05  WCMBX-3003-CNT            PIC S9(3) COMP-3.
           05  WCMBX-3003B-CNT           PIC S9(3) COMP-3.
           05  WCMBX-4001-CNT            PIC S9(3) COMP-3.
           05  WCMBX-OTHR-CNT            PIC S9(3) COMP-3.
           05  WCMBX-SKIP-CNT            PIC S9(3) COMP-3.
           05  WCMBX-REC-CNT             PIC S9(3) COMP-3.
           05  WCMBX-REC-IX              PIC S9(3) COMP-3.
       01  WCMBX-REC-AREA.
           05  WCMBX-REC                 PIC X(100)
               OCCURS 200 TIMES.
       01  WCMBX-SEQ-REC-INFO.
           05  WCMBX-POL-ID              PIC X(10).                             
           05  FILLER-1                  PIC X(01).                 
           05  FILLER-QUOTE-1            PIC X(01).
           05  WCMBX-PHST-EFF-DT         PIC X(10).
           05  FILLER-QUOTE-2            PIC X(01).
           05  FILLER-2                  PIC X(01).
           05  WCMBX-PHST-SEQ-NUM        PIC 9(03).                             
           05  FILLER-3                  PIC X(01).
           05  WCMBX-PHST-STAT-CD        PIC X(01).           
           05  FILLER-4                  PIC X(01).
           05  WCMBX-PHST-ACTV-TYP       PIC X(04).                             
           05  FILLER-5                  PIC X(01).
           05  WCMBX-CVG-NUM             PIC X(02).                             
           05  FILLER-6                  PIC X(01).                  
           05  WCMBX-PHST-OLD-VAL        PIC X(20).                             
           05  FILLER  REDEFINES WCMBX-PHST-OLD-VAL.                
               10  FILLER                PIC X(7).
               10  WCMBX-PHST-OLD-VAL-N  PIC 9(13).                        
           05  FILLER-7                  PIC X(01).
           05  WCMBX-PHST-NEW-VAL        PIC X(20).                             
           05  FILLER  REDEFINES WCMBX-PHST-NEW-VAL.                
               10  FILLER                PIC X(7).
               10  WCMBX-PHST-NEW-VAL-N  PIC 9(13).                        
           05  FILLER-8                  PIC X(01).
           05  FILLER-QUOTE-3            PIC X(01).                  
           05  WCMBX-BAD-MV-DT           PIC X(10).                             
           05  FILLER-QUOTE-4            PIC X(01).                  
           05  FILLER-9                  PIC X(01).
           05  WCMBX-CF-REASN-CD         PIC X(04).

       COPY CCFWPHST.
       COPY CCFRPHST.

       COPY CCFWCFLW.
       COPY CCFRCFLW.

       COPY CCFWPOL. 
       COPY CCFRPOL. 

       COPY CCFWCVG.
       COPY CCFRCVG.
       COPY CCWWCVGS.
 
       COPY CCFWPTAB.
       COPY CCFRPTAB.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
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

      *    PERFORM 9400-CMBX-WRITE
      *           THRU 9400-CMBX-WRITE-X.
                   
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

           MOVE ZERO                   TO WCMBX-SEQ-IO-STATUS.

           OPEN OUTPUT CMBX-DATA-FILE.

           IF WCMBX-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMCMBX'           TO WGLOB-MAIN-PGM-ID                       
                                        WGLOB-CRNT-PGM-ID.
      *    PERFORM 0010-0000-INIT-PARM-INFO
      *       THRU 0010-0000-INIT-PARM-INFO-X.
      *    PERFORM 0010-1000-INIT-DEFAULT
      *       THRU 0010-1000-INIT-DEFAULT-X.
           MOVE SPACES               TO WCMBX-PREV-POL-ID.
           MOVE +0                   TO WCMBX-1003-CNT
                                        WCMBX-1011-CNT          
                                        WCMBX-3003-CNT          
                                        WCMBX-3003B-CNT          
                                        WCMBX-4001-CNT          
                                        WCMBX-OTHR-CNT          
                                        WCMBX-SKIP-CNT          
                                        WCMBX-REC-CNT          
                                        WS-3003-CNT          
                                        WS-4001-CNT.          
           SET  WS-SKIP-POL-NO  TO TRUE.

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

           MOVE RULST-POL-ID       TO WPOL-POL-ID.                              

           PERFORM POL-1000-READ                                                
              THRU POL-1000-READ-X.                                             

           IF WPOL-IO-NOT-FOUND    
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF
           MOVE RPOL-POL-ID        TO  LPGA-POLICY-NUMBER

           PERFORM CVGS-1000-LOAD-CVGS-ARRAY
              THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
               
           IF NOT RPOL-POL-STAT-PREM-PAYING
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF
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

      *
      *    IF  WCMBX-PREV-POL-ID NOT = RULST-POL-ID                    
      *        IF  WCMBX-PREV-POL-ID NOT = SPACES                    
      *            PERFORM 9400-CMBX-WRITE
      *               THRU 9400-CMBX-WRITE-X
      *        END-IF
      *        MOVE RULST-POL-ID         TO WCMBX-PREV-POL-ID
      *        MOVE RPOL-POL-BILL-TYP-CD TO WCMBX-PREV-POL-BILL-TYP
      *    END-IF.
            
           IF RPHST-PCHST-STAT-ERROR                                            
           OR RPHST-PCHST-STAT-HISTORY                                          
               GO TO 2700-FIND-PHST-X                                           
           END-IF.

           MOVE RPHST-POL-ACTV-TYP-ID       TO WS-PHST-ACTV-CD.                 
      *    IF WS-PHST-SKIP-ACTV                                                 
           IF NOT WS-PHST-PROC-ACTV                                             
               GO TO 2700-FIND-PHST-X                                           
           END-IF.

           MOVE SPACES                      TO WCMBX-SEQ-REC-INFO.              
           MOVE RULST-POL-ID                TO WCMBX-POL-ID.                    
           MOVE RPHST-CVG-NUM               TO WCMBX-CVG-NUM.
           MOVE RPHST-POL-ACTV-TYP-ID       TO WCMBX-PHST-ACTV-TYP.             
           MOVE RPHST-PCHST-SEQ-NUM         TO WCMBX-PHST-SEQ-NUM.              
           MOVE RPHST-PCHST-STAT-CD         TO WCMBX-PHST-STAT-CD.              
           MOVE RPHST-PCHST-EFF-DT          TO WCMBX-PHST-EFF-DT.               
           MOVE RPHST-PCHST-OLD-VALU-TXT    TO WCMBX-PHST-OLD-VAL.              
           MOVE RPHST-PCHST-NEW-VALU-TXT    TO WCMBX-PHST-NEW-VAL.              
           MOVE RULST-UNDO-DT               TO WCMBX-BAD-MV-DT.
      *
           PERFORM 4000-FIND-SURR-AMT                                      
              THRU 4000-FIND-SURR-AMT-X.                                    

           MOVE ','                         TO FILLER-1               
                                               FILLER-2           
                                               FILLER-3          
                                               FILLER-4          
                                               FILLER-5         
                                               FILLER-6        
                                               FILLER-7        
                                               FILLER-8        
                                               FILLER-9.      
           MOVE '"'                         TO FILLER-QUOTE-1               
                                               FILLER-QUOTE-2    
                                               FILLER-QUOTE-3    
                                               FILLER-QUOTE-4.    

      *
557973*    IF  WS-CF-FND-BAL-AMT >= WS-COI
      *        GO TO 2700-FIND-PHST-X                                           
      *    END-IF.
557973     MOVE  WS-CF-FND-BAL-AMT TO WCMBX-PHST-NEW-VAL-N.
557973     MOVE  WS-COI            TO WCMBX-PHST-OLD-VAL-N.
557973         
           ADD +1                  TO WCMBX-REC-CNT.
      *    MOVE WCMBX-SEQ-REC-INFO TO WCMBX-REC (WCMBX-REC-CNT).
           MOVE WCMBX-SEQ-REC-INFO TO RCMBX-SEQ-REC-INFO.
           WRITE RCMBX-SEQ-REC-INFO.
            
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

      *-------------------
       4000-FIND-SURR-AMT.                                     
      *-------------------
      *  START BROWSE TO FIND MOST ACTIVE CASHFLOW RECORD
      *
           MOVE -1                         TO WS-CF-FND-BAL-AMT
           MOVE LOW-VALUES                 TO WCFLW-KEY.
           MOVE RULST-POL-ID               TO WCFLW-POL-ID.
           MOVE '01'                       TO WCFLW-CVG-NUM.
           MOVE 'D'                        TO WCFLW-CF-TYP-CD.
           MOVE RPHST-PCHST-EFF-DT         TO WCFLW-CF-EFF-DT
           MOVE WCFLW-KEY                  TO WCFLW-ENDBR-KEY.
           MOVE HIGH-VALUES                TO WCFLW-ENDBR-CF-SEQ-NUM.

           PERFORM  CFLW-1000-BROWSE
               THRU CFLW-1000-BROWSE-X.

           IF  WCFLW-IO-OK
               PERFORM  4100-CFLW-SURR-TRANS
                   THRU 4100-CFLW-SURR-TRANS-X
                   UNTIL NOT WCFLW-IO-OK
               PERFORM  CFLW-3000-END-BROWSE
                   THRU CFLW-3000-END-BROWSE-X
               IF  WS-CF-FND-BAL-AMT NOT = -1
                   PERFORM  4500-CFLW-COI-TRANS
                       THRU 4500-CFLW-COI-TRANS-X
               END-IF
           ELSE
               GO TO 4000-FIND-SURR-AMT-X
           END-IF.
       4000-FIND-SURR-AMT-X.                                    
           EXIT.
      *--------------------
       4100-CFLW-SURR-TRANS.
           PERFORM  CFLW-2000-READ-NEXT
               THRU CFLW-2000-READ-NEXT-X.

           IF  WCFLW-IO-OK
           AND RCFLW-CF-STAT-ACTIVE
           AND RCFLW-CF-TRXN-SURRENDER
               MOVE SPACES                TO WCMBX-PHST-OLD-VAL
                                             WCMBX-PHST-NEW-VAL
               MOVE RCFLW-CF-FND-TRXN-AMT TO WCMBX-PHST-NEW-VAL-N
               MOVE RCFLW-CF-CLI-TRXN-AMT TO WCMBX-PHST-OLD-VAL-N
               MOVE RCFLW-CF-FND-BAL-AMT  TO WS-CF-FND-BAL-AMT
               MOVE RCFLW-CF-REASN-CD     TO WCMBX-CF-REASN-CD
               SET WCFLW-IO-EOF TO TRUE
           ELSE
               GO TO 4100-CFLW-SURR-TRANS-X
           END-IF.

       4100-CFLW-SURR-TRANS-X.
           EXIT.
      *--------------------
       4500-CFLW-COI-TRANS.
      *--------------------
           MOVE +0                         TO WS-COI
           MOVE LOW-VALUES                 TO WCFLW-KEY.
           MOVE RULST-POL-ID               TO WCFLW-POL-ID.
           MOVE '01'                       TO WCFLW-CVG-NUM.
           MOVE 'D'                        TO WCFLW-CF-TYP-CD.
           MOVE RPHST-PCHST-EFF-DT         TO WCFLW-CF-EFF-DT
           MOVE WCFLW-KEY                  TO WCFLW-ENDBR-KEY.
           MOVE WCFLW-CF-EFF-DT            TO L1680-INTERNAL-1.                 
           MOVE ZERO                       TO L1680-NUMBER-OF-YEARS.            
           MOVE 1                          TO L1680-NUMBER-OF-MONTHS.           
           MOVE ZERO                       TO L1680-NUMBER-OF-DAYS.             
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE                                 
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.                              
           MOVE L1680-INTERNAL-2           TO WCFLW-ENDBR-CF-EFF-DT.            
           MOVE HIGH-VALUES                TO WCFLW-ENDBR-CF-SEQ-NUM.

           PERFORM  CFLW-1000-BROWSE
               THRU CFLW-1000-BROWSE-X.

           IF  WCFLW-IO-OK
               PERFORM  4550-CFLW-COI-TRANS
                   THRU 4550-CFLW-COI-TRANS-X
                   UNTIL NOT WCFLW-IO-OK
               PERFORM  CFLW-3000-END-BROWSE
                   THRU CFLW-3000-END-BROWSE-X
           ELSE
               GO TO 4500-CFLW-COI-TRANS-X
           END-IF.
       4500-CFLW-COI-TRANS-X.
           EXIT.
      *--------------------
       4550-CFLW-COI-TRANS.
      *--------------------
           PERFORM  CFLW-2000-READ-NEXT
               THRU CFLW-2000-READ-NEXT-X.

           IF  WCFLW-IO-OK
           AND RCFLW-CF-STAT-ACTIVE
           AND RCFLW-CF-TRXN-ADMIN-FEE 
               MOVE RCFLW-CF-FND-TRXN-AMT TO WS-COI
               SET WCFLW-IO-EOF TO TRUE
           ELSE
               GO TO 4550-CFLW-COI-TRANS-X
           END-IF.
       4550-CFLW-COI-TRANS-X.
           EXIT.
      *----------------
       9400-CMBX-WRITE.
      *----------------
           IF  WS-SKIP-POL-YES
           OR  WCMBX-REC-CNT = +0
              GO TO 9400-CMBX-WRITE-X
           END-IF.
            
           PERFORM 

           PERFORM VARYING WCMBX-REC-IX FROM 1 BY 1
                     UNTIL WCMBX-REC-IX > WCMBX-REC-CNT
               MOVE WCMBX-REC (WCMBX-REC-IX) TO RCMBX-SEQ-REC-INFO
                                                WCMBX-SEQ-REC-INFO
               EVALUATE WCMBX-PHST-ACTV-TYP
                   WHEN '2010' 
                     PERFORM VARYING WS-4001-IX FROM 1 BY 1
                     UNTIL WS-4001-IX > WS-4001-CNT
                       IF  WCMBX-PHST-EFF-DT = WS-4001-DT ( WS-4001-IX )
                           WRITE RCMBX-SEQ-REC-INFO
                           GO TO 9400-CMBX-WRITE-X
                       END-IF
                     END-PERFORM
                     PERFORM VARYING WS-3003-IX FROM 1 BY 1
                     UNTIL WS-3003-IX > WS-3003-CNT
                       IF  WCMBX-PHST-EFF-DT = WS-3003-DT ( WS-3003-IX )
                           WRITE RCMBX-SEQ-REC-INFO
                           GO TO 9400-CMBX-WRITE-X
                       END-IF
                     END-PERFORM
                   WHEN '4009' 
                     PERFORM VARYING WS-4001-IX FROM 1 BY 1
                     UNTIL WS-4001-IX > WS-4001-CNT
                       IF  WCMBX-PHST-EFF-DT = WS-4001-DT ( WS-4001-IX )
                           WRITE RCMBX-SEQ-REC-INFO
                           MOVE WS-4001-CNT TO WS-4001-IX
                       END-IF
                     END-PERFORM
                   WHEN '3003' 
                     IF  WCMBX-PHST-OLD-VAL = 'B' AND
                       ( WCMBX-4001-CNT > +0 OR 
                         WCMBX-3003-CNT > +0 OR 
                         WCMBX-OTHR-CNT > +0    )
                       CONTINUE
                     ELSE
                       WRITE RCMBX-SEQ-REC-INFO
                     END-IF
                   WHEN '4001' 
                       WRITE RCMBX-SEQ-REC-INFO
               END-EVALUATE
           END-PERFORM.
            
       9400-CMBX-WRITE-X.
           MOVE +0                       TO WCMBX-REC-CNT
                                            WCMBX-1003-CNT
                                            WCMBX-1011-CNT
                                            WCMBX-3003-CNT
                                            WCMBX-3003B-CNT
                                            WCMBX-4001-CNT
                                            WCMBX-SKIP-CNT
                                            WCMBX-OTHR-CNT
                                            WS-3003-CNT
                                            WS-4001-CNT.
           SET WS-SKIP-POL-NO TO TRUE.
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

           MOVE WCMBX-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBX-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBX-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
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

           MOVE ZERO                   TO WCMBX-SEQ-IO-STATUS.

           CLOSE CMBX-DATA-FILE.

           IF WCMBX-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR                                         
                 THRU 9800-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY NCPPCVGS. 
       COPY CCPNPOL. 
       COPY CCPNCVG. 
       COPY CCPNPTAB.
       COPY CCPBPHST.
       COPY CCPBCFLW.

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
      **                 END OF PROGRAM ZSBMCMBX                     **         
      *****************************************************************
