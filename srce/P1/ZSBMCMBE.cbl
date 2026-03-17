      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBE.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBE                                         **         
      **  REMARKS:  COMPARE COLLECTION METHOD CODES FROM CCPP9460 TO **         
      **            VALUES ON UH AND PRINT OUT DIFFERENCES.          **
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
           05  FILLER                    PIC X(01).
           05  RCMBE-CMB-DIFF            PIC -9(13).                            
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBE'.

       COPY SQLCA.


       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-ANNIV-SW               PIC X(1).
               88  WS-ANNIV-NOT-FOUND                VALUE 'N'.
               88  WS-ANNIV-FOUND                    VALUE 'Y'.                 
           05  WS-CMPOL-SW               PIC X(1).
               88  WS-CMPOL-NO                       VALUE 'N'.
               88  WS-CMPOL-YES                      VALUE 'Y'.                 

       01  SUBS-AND-THINGS.
           05  I                         PIC S9(8) COMP.

       01  WORK-AREAS.
           05  WS-MAX-REDO-DT            PIC X(10) VALUE '2004-05-04'.          
           05  WS-ANNIV-DT               PIC X(10).                             
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
           05  WS-SAVE-BILL-METHOD       PIC X(01).                             
           05  WS-SAVE-BILL-MODE         PIC X(02).                             
           05  WS-CALC-IDT               PIC 9(07).                             
           05  WS-SAVE-KEY               PIC X(25).                             

       01  WS-ERROR-LINE.                                                       
           05  WS-ERROR-POL-ID           PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATE             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATA             PIC X(01).                             
           05  FILLER                    PIC X(58).                             

       COPY CCFWPOL.
       COPY CCFRPOL.

       COPY CCFWCVG.
       COPY CCFRCVG.
       COPY CCWWCVGS.

       COPY CCFWUH.                                                             
       COPY CCFRUH.                                                             

       COPY CCFWUHCO.                                                           
       COPY CCFRUHCO.                                                           

BP9460 COPY CCFWBAC.
BP9460 COPY CCFRBAC.
BP9460 COPY CCFWBAA4.
BP9460/
BP9460 COPY CCFWPHST.
BP9460 COPY CCFRPHST.
BP9460/
BP9460 COPY CCFWCFLW.
BP9460 COPY CCFRCFLW.

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

       COPY CCWW9460.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
BP9460 COPY CCWL9460.
       COPY XCWL0040.
BP9460 COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
BP9460 COPY CCWL2430.
BP9460 COPY CCWL9105.
       COPY XCWLDTLK.
       COPY XCWWWKDT.
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

           PERFORM 2000-PROCESS-POL-RECS   
              THRU 2000-PROCESS-POL-RECS-X                                      
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

           MOVE ZERO                   TO WCMBE-SEQ-IO-STATUS.

           OPEN OUTPUT CMBE-DATA-FILE.

           IF WCMBE-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMCMBE'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMCMBE'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

           MOVE SPACES TO RCMBE-SEQ-REC-INFO.

           MOVE LOW-VALUES          TO WPOL-KEY.
           MOVE HIGH-VALUES         TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

       1000-INITIALIZATION-X.
           EXIT.

      /
      *----------------------                                                   
       2000-PROCESS-POL-RECS.                                                   
      *----------------------                                                   

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           IF NOT WPOL-IO-OK                                                    
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-POL-RECS-X                                    
           END-IF.

           MOVE RPOL-POL-ID         TO  LPGA-POLICY-NUMBER.                     

           PERFORM CVGS-1000-LOAD-CVGS-ARRAY
              THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           MOVE LOW-VALUES          TO WUH-KEY.                                 
           MOVE RPOL-POL-ID         TO WUH-POL-ID.                              
           MOVE HIGH-VALUES         TO WUH-ENDBR-KEY.
           MOVE RPOL-POL-ID         TO WUH-ENDBR-POL-ID.                        
 
           PERFORM UH-1000-BROWSE                                               
              THRU UH-1000-BROWSE-X.                                            

           IF NOT WUH-IO-OK
               GO TO 2000-PROCESS-POL-RECS-X                                    
           END-IF.
       
           PERFORM 2100-SEARCH-UH                                               
              THRU 2100-SEARCH-UH-X                                             
                UNTIL NOT WUH-IO-OK.                                            
       
           PERFORM UH-3000-END-BROWSE                                           
              THRU UH-3000-END-BROWSE-X.
       
       2000-PROCESS-POL-RECS-X.                                                 
           EXIT.

      *---------------                                                          
       2100-SEARCH-UH.                                                          
      *---------------                                                          

           PERFORM UH-2000-READ-NEXT                                            
              THRU UH-2000-READ-NEXT-X.

           IF NOT WUH-IO-OK
               GO TO 2100-SEARCH-UH-X                                           
           END-IF.

           IF RUH-POL-COLCT-MTHD-NO-DPOS                                        
           OR RUH-POL-COLCT-MTHD-WAV-COST                                       
           OR RUH-POL-COLCT-MTHD-POUR-IN                                        
               GO TO 2100-SEARCH-UH-X                                           
           END-IF.

           MOVE RUH-MTHV-EFF-DT-NUM     TO WS-TEST-DT.                          
           MOVE RPOL-POL-ISS-EFF-DT-DY  TO WS-TEST-DT-DY.                       
           PERFORM 8000-CHECK-DATE                                              
              THRU 8000-CHECK-DATE-X.                                           
           MOVE WS-TEST-DT              TO WS-MTHV-EFF-DT.                      


           PERFORM  9460-0000-INIT-PARM-INFO
               THRU 9460-0000-INIT-PARM-INFO-X.
      
           SET  WS-CMPOL-NO             TO TRUE.                                
           MOVE WS-MTHV-EFF-DT          TO L9460-EFF-DT.                        
BP9460     SET  L9460-RQST-SET-COLCT-MTHD TO TRUE.
BP9460*    PERFORM  9460-1000-SET-COLCT-MTHD
BP9460*        THRU 9460-1000-SET-COLCT-MTHD-X.
BP9460     PERFORM  9460-0000-MAINLINE       
BP9460         THRU 9460-0000-MAINLINE-X.                                       
      
           IF NOT L9460-RETRN-OK                                                
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE WS-MTHV-EFF-DT               TO WS-ERROR-DATE               
               MOVE '*** GETTING NEW COLLECTION METHOD FAILED ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2100-SEARCH-UH-X                                           
           END-IF.

           IF  L9460-POL-COLCT-MTHD-CD = RUH-POL-COLCT-MTHD-CD                  
               GO TO 2100-SEARCH-UH-X                                           
           END-IF.

           IF  WS-CMPOL-YES
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RPOL-POL-ID                  TO WS-ERROR-POL-ID             
               MOVE WS-MTHV-EFF-DT               TO WS-ERROR-DATE               
               MOVE '*** COLLECTION METHOD SET FROM POL TABLE ***'              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
           END-IF.
           MOVE SPACES                TO RCMBE-SEQ-REC-INFO.
           MOVE RPOL-POL-ID           TO RCMBE-POL-ID.
           MOVE RPOL-POL-STAT-CD      TO RCMBE-POL-STAT.
           MOVE RPOL-POL-ISS-EFF-DT   TO RCMBE-ISS-DT.
           MOVE RPOL-POL-CEAS-DT      TO RCMBE-CEASE-DT.                        
           MOVE RPOL-CBB-LST-PD-YR    TO RCMBE-CBB-YEAR.                        
           MOVE WS-MTHV-EFF-DT        TO RCMBE-MTHV-DT.
           MOVE RUH-POL-COLCT-MTHD-CD TO RCMBE-ERR-UH-CD.
           MOVE L9460-POL-COLCT-MTHD-CD TO RCMBE-NEW-UH-CD.                     

           SET  WS-ANNIV-NOT-FOUND TO TRUE.
           MOVE RCMBE-ISS-DT       TO WS-ANNIV-DT.
           PERFORM  3000-FIND-ANNIV-DATE
               THRU 3000-FIND-ANNIV-DATE-X
               UNTIL WS-ANNIV-FOUND.

           IF  RPOL-POL-STAT-TERMINATED
               IF WS-ANNIV-DT > RPOL-POL-CEAS-DT
               OR  RPOL-CBB-LST-PD-YR = 0
                   MOVE 'TN'          TO RCMBE-POL-TYP
               ELSE
                   MOVE 'TB'          TO RCMBE-POL-TYP
               END-IF
           END-IF.

           IF  RPOL-POL-STAT-IN-FORCE
               IF WS-ANNIV-DT > WS-MAX-REDO-DT
               OR  RPOL-CBB-LST-PD-YR = 0
                   MOVE 'IN'          TO RCMBE-POL-TYP
               ELSE
                   MOVE 'IB'          TO RCMBE-POL-TYP
               END-IF
           END-IF.

           IF  NOT RPOL-POL-STAT-IN-FORCE
           AND NOT RPOL-POL-STAT-TERMINATED
               IF WS-ANNIV-DT > WS-MAX-REDO-DT
               OR  RPOL-CBB-LST-PD-YR = 0
                   MOVE 'ON'          TO RCMBE-POL-TYP
               ELSE
                   MOVE 'OB'          TO RCMBE-POL-TYP
               END-IF
           END-IF.

           MOVE RPOL-CO-ID             TO WUHCO-CO-ID.
           MOVE RPOL-POL-ID            TO WUHCO-POL-ID.
           MOVE RUH-MTHV-EFF-DT-NUM    TO WUHCO-MTHV-EFF-DT-NUM.
           MOVE '00'                   TO WUHCO-CVG-NUM.
           MOVE WUHCO-KEY              TO WUHCO-ENDBR-KEY.
           MOVE '99'                   TO WUHCO-ENDBR-CVG-NUM.

           PERFORM UHCO-1000-BROWSE
              THRU UHCO-1000-BROWSE-X.

           MOVE 0                      TO WS-COI-AMT.
           IF WUHCO-IO-OK
               PERFORM 2115-SEARCH-UHCO
                  THRU 2115-SEARCH-UHCO-X
                   UNTIL NOT WUHCO-IO-OK
               PERFORM UHCO-3000-END-BROWSE
                  THRU UHCO-3000-END-BROWSE-X
           END-IF.

           MOVE WS-COI-AMT            TO RCMBE-COI-AMT.

           IF RCMBE-ERR-UH-CD = 'C'
               MOVE 0                 TO WS-CMB-ERR-AMT
           END-IF.

           IF RCMBE-ERR-UH-CD = 'B'
               COMPUTE WS-CMB-ERR-AMT ROUNDED = WS-COI-AMT * .0155
           END-IF.

           IF RCMBE-ERR-UH-CD = 'S'
               COMPUTE WS-CMB-ERR-AMT ROUNDED = WS-COI-AMT * .0155
           END-IF.

           IF RCMBE-ERR-UH-CD = 'L'
               COMPUTE WS-CMB-ERR-AMT ROUNDED = WS-COI-AMT * .033
           END-IF.
           MOVE WS-CMB-ERR-AMT        TO RCMBE-CMB-ERR-AMT.

           IF RCMBE-NEW-UH-CD = 'C'
               MOVE 0                 TO WS-CMB-NEW-AMT
           END-IF.

           IF RCMBE-NEW-UH-CD = 'B'
               COMPUTE WS-CMB-NEW-AMT ROUNDED = WS-COI-AMT * .0155
           END-IF.

           IF  RCMBE-NEW-UH-CD = 'S'
               COMPUTE WS-CMB-NEW-AMT ROUNDED = WS-COI-AMT * .0155
           END-IF.

           IF  RCMBE-NEW-UH-CD = 'L'
               COMPUTE WS-CMB-NEW-AMT ROUNDED = WS-COI-AMT * .033
           END-IF.
           MOVE WS-CMB-NEW-AMT        TO RCMBE-CMB-NEW-AMT.

           COMPUTE WS-CMB-DIFF = WS-CMB-NEW-AMT - WS-CMB-ERR-AMT.
           MOVE WS-CMB-DIFF           TO RCMBE-CMB-DIFF.

           PERFORM 9400-CMBE-WRITE
              THRU 9400-CMBE-WRITE-X.

       2100-SEARCH-UH-X.                                                        
           EXIT.

      *-----------------                                                        
       2115-SEARCH-UHCO.                                                        
      *-----------------                                                        
 
           PERFORM UHCO-2000-READ-NEXT
              THRU UHCO-2000-READ-NEXT-X.

           IF NOT WUHCO-IO-OK                                                   
               GO TO 2115-SEARCH-UHCO-X                                         
           END-IF.

           ADD RUHCO-CVG-TOT-DED-AMT TO WS-COI-AMT.                             

       2115-SEARCH-UHCO-X.                                                      
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
       
           IF RCMBE-MTHV-DT < WS-ANNIV-DT                                       
               SET WS-ANNIV-FOUND  TO TRUE
           END-IF.
       
       3000-FIND-ANNIV-DATE-X.                                                  
           EXIT.

      *----------------
       8000-CHECK-DATE.
      *----------------
           IF  WS-TEST-DT-MO = 02                                               
           AND WS-TEST-DT-DY > 28                                               
               MOVE 28 TO WS-TEST-DT-DY                                         
               GO TO 8000-CHECK-DATE-X                                          
           END-IF.

           IF (WS-TEST-DT-MO = 04 OR                                            
               WS-TEST-DT-MO = 06 OR                                            
               WS-TEST-DT-MO = 09 OR                                            
               WS-TEST-DT-MO = 11)                                              
           AND WS-TEST-DT-DY > 30                                               
               MOVE 30 TO WS-TEST-DT-DY                                         
               GO TO 8000-CHECK-DATE-X                                          
           END-IF.

       8000-CHECK-DATE-X.
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
       9400-CMBE-WRITE.
      *----------------

           MOVE ZERO                   TO WCMBE-SEQ-IO-STATUS.

           WRITE RCMBE-SEQ-REC-INFO.

           IF WCMBE-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9400-CMBE-WRITE-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBE-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBE-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBE-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
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
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *****************************************************************
      **  MEMBER :  CCPP9460                                         **
      **  REMARKS:  DETERMINE THE POLICY COLLECTION METHOD CODE IN   **
      **            EFFECT AT THE MONTHIVERSARY.  THIS WILL BE USED  **
      **            AT ANNIVERSARY TO CALCULATE THE CASH BACK BONUS. **
      **                                                             **
      **            THE COLLECTION METHOD CODE IS EFFECTED BY THE    **
      **            FOLLOWING:                                       **
      **            1) WHETHER OR NOT THE POLICY IS ON WAIVER        **
      **            2) WHETHER OR NOT BILLING IS SUSPENDED           **
      **            3) WHETHER OR NOT FIT IS A REGULAR SCHEDULED     **
      **               BILLING MONTH                                 **
      **            4) WHETHER OR NOT THERE WAS A POUR-IN WITHIN THE **
      **               LAST MONTH                                    **
      **            5) THE BILLING METHOD IN EFFECT AT THE           **
      **               MONTHIVERSARY                                 **
      **            6) FOR PAYROLL DEDUCTION, THE SIZE OF THE GROUP  **
      **                                                             **
      **  DOMAIN :  PO                                               **
      *****************************************************************
      **  DATE     AUTH.    DESCRIPTION                              **
      **                                                             **
01PR17**  01AUG01  TMC      INITIAL LOGIC                            **
01PR17**  01AUG01  TMC      FIX BAC TABLE PROCESSING                 **
B00229**  01AUG01  EKM      FIX POUR-IN LOGIC                        **
02PR17**  30JUN02  WBP      NEW CASH FLOW REASON CODES               **         
PR006E**  26JUN03  CSS      ADD NEW CASH FLOW REASON CODE            **         
P01304**  21JAN04  FB       CHANGE SET OF L9460-POL-COLCT-MTHD-CD    **
      *****************************************************************

      *-------------------
       9460-0000-MAINLINE.
      *-------------------

           INITIALIZE L9460-OUTPUT-PARM-INFO.
           SET L9460-RETRN-OK TO TRUE.

           EVALUATE TRUE

           WHEN L9460-RQST-SET-COLCT-MTHD
                PERFORM  9460-1000-SET-COLCT-MTHD
                    THRU 9460-1000-SET-COLCT-MTHD-X

           WHEN OTHER

                SET L9460-RETRN-INVALID-REQUEST TO TRUE
                MOVE L9460-RETRN-CD TO WGLOB-ERR-RETRN-CD
                PERFORM  0030-5000-LOGIC-ERROR
                    THRU 0030-5000-LOGIC-ERROR-X

           END-EVALUATE.

       9460-0000-MAINLINE-X.
           EXIT.

      *--------------------------
       9460-1000-SET-COLCT-MTHD.
      *--------------------------

      *  CALCULATE THE PREVIOUS MONTHIVERSARY DATE

           IF  L9460-EFF-DT = RPOL-POL-ISS-EFF-DT
               MOVE RPOL-POL-ISS-EFF-DT TO W9460-PREV-MTHV-DT
           ELSE
               MOVE L9460-EFF-DT        TO L1680-INTERNAL-1
               MOVE ZERO                TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                TO L1680-NUMBER-OF-DAYS
               MOVE 1                   TO L1680-NUMBER-OF-MONTHS
               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X
               MOVE L1680-INTERNAL-2    TO W9460-PREV-MTHV-DT
           END-IF.

           SET W9460-POLICY-WAIVER TO TRUE.
           PERFORM  9460-2000-CHECK-FOR-WAIVER
               THRU 9460-2000-CHECK-FOR-WAIVER-X
               VARYING I FROM 1 BY 1
               UNTIL I > RPOL-POL-CVG-REC-CTR-N
               OR W9460-POLICY-WAIVER-NO.

           IF  W9460-POLICY-WAIVER
               SET L9460-POL-COLCT-MTHD-WAV-COST TO TRUE
               GO TO 9460-1000-SET-COLCT-MTHD-X
           END-IF.

           PERFORM  9460-3000-CHECK-BILLING-SPND
               THRU 9460-3000-CHECK-BILLING-SPND-X.
           IF  W9460-BILLING-SPND-NO
               PERFORM  9460-4000-CHECK-BILL-MONTH
                   THRU 9460-4000-CHECK-BILL-MONTH-X
               IF  W9460-RSBM
                   PERFORM  9460-6000-CHECK-BILL-MTHD
                       THRU 9460-6000-CHECK-BILL-MTHD-X
               ELSE
                   PERFORM  9460-5000-CHECK-POUR-IN
                       THRU 9460-5000-CHECK-POUR-IN-X
               END-IF
           ELSE
               PERFORM  9460-5000-CHECK-POUR-IN
                   THRU 9460-5000-CHECK-POUR-IN-X
           END-IF.

       9460-1000-SET-COLCT-MTHD-X.
           EXIT.

      *---------------------------
       9460-2000-CHECK-FOR-WAIVER.
      *---------------------------
      *  DON'T CHECK FUND COVERAGES
           IF  WCVGS-CVG-INS-TYP-FPA (I)
               GO TO 9460-2000-CHECK-FOR-WAIVER-X
           END-IF.

           IF  NOT WCVGS-CVG-STAT-PREM-PAY-WAV (I)
               SET W9460-POLICY-WAIVER-NO TO TRUE
           END-IF.

       9460-2000-CHECK-FOR-WAIVER-X.
           EXIT.

      *-----------------------------
       9460-3000-CHECK-BILLING-SPND.
      *-----------------------------

      *  BUILD PHST KEY

           MOVE RPOL-POL-ID            TO WPHST-POL-ID.

           MOVE L9460-EFF-DT           TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE    TO WPHST-PCHST-EFF-IDT-NUM.

      *  THE SEQUENCE NUMBER IS STORED IN INVERTED FORMAT.
      *  A VALUE OF ZERO WILL POSITION THE BROWSE AT THE MOST RECENT
      *  RECORD FOR THE GIVEN DATE.

           MOVE ZEROES                 TO WPHST-PCHST-SEQ-NUM.

           MOVE WPHST-KEY              TO WPHST-ENDBR-KEY.
           MOVE HIGH-VALUES            TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.
           MOVE 999                    TO WPHST-ENDBR-PCHST-SEQ-NUM.

      *  POSITION AT AND READ FIRST RECORD

           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.

           INITIALIZE W9460-PHST-RBILL-INFO.
           SET W9460-PHST-SEARCH-NOT-DONE TO TRUE.
           PERFORM  9460-3100-CHECK-PHST
               THRU 9460-3100-CHECK-PHST-X
               UNTIL W9460-PHST-SEARCH-DONE
               OR NOT WPHST-IO-OK.

           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.

           PERFORM  9460-3300-SET-SPND-IND
               THRU 9460-3300-SET-SPND-IND-X.

       9460-3000-CHECK-BILLING-SPND-X.
           EXIT.

      *---------------------
       9460-3100-CHECK-PHST.
      *---------------------

           IF  NOT RPHST-PCHST-STAT-OVERRIDE
               PERFORM  PHST-2000-READ-NEXT
                   THRU PHST-2000-READ-NEXT-X
               GO TO 9460-3100-CHECK-PHST-X
           END-IF.

      *  CHECK FOR RESTRICT BILLING CHANGES
           IF  RPHST-POL-ACTV-TYP-ID NOT = '1902'
           AND RPHST-POL-ACTV-TYP-ID NOT = '1903'
           AND RPHST-POL-ACTV-TYP-ID NOT = '1904'
               PERFORM  PHST-2000-READ-NEXT
                   THRU PHST-2000-READ-NEXT-X
               GO TO 9460-3100-CHECK-PHST-X
           END-IF.

           PERFORM  9460-3200-SAVE-PHST
               THRU 9460-3200-SAVE-PHST-X.

      *  IF WE HAVE FOUND PHST RECORDS FOR ALL THREE FIELDS
      *  THEN WE CAN STOP LOOKING
           IF  W9460-RBILL-CD     NOT = SPACES
           AND W9460-RBILL-EFF-DT NOT = SPACES
           AND W9460-RBILL-END-DT NOT = SPACES
               SET W9460-PHST-SEARCH-DONE TO TRUE
               GO TO 9460-3100-CHECK-PHST-X
           END-IF.

           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.

       9460-3100-CHECK-PHST-X.
           EXIT.

      *--------------------
       9460-3200-SAVE-PHST.
      *--------------------

           IF  RPHST-POL-ACTV-TYP-ID = '1902'
           AND W9460-RBILL-EFF-DT = SPACES
               MOVE RPHST-PCHST-OLD-VALU-TXT
                                        TO W9460-OLD-EFF-DT
               MOVE RPHST-PCHST-NEW-VALU-TXT
                                        TO W9460-NEW-EFF-DT
               GO TO 9460-3200-SAVE-PHST-X
           END-IF.

           IF  RPHST-POL-ACTV-TYP-ID = '1903'
           AND W9460-RBILL-END-DT = SPACES
               MOVE RPHST-PCHST-OLD-VALU-TXT
                                        TO W9460-OLD-END-DT
               MOVE RPHST-PCHST-NEW-VALU-TXT
                                        TO W9460-NEW-END-DT
               GO TO 9460-3200-SAVE-PHST-X
           END-IF.

           IF  RPHST-POL-ACTV-TYP-ID = '1904'
           AND W9460-RBILL-CD = SPACES
               MOVE RPHST-PCHST-OLD-VALU-TXT
                                        TO W9460-OLD-RBILL-CD
               MOVE RPHST-PCHST-NEW-VALU-TXT
                                        TO W9460-NEW-RBILL-CD
               GO TO 9460-3200-SAVE-PHST-X
           END-IF.

       9460-3200-SAVE-PHST-X.
           EXIT.

      *-----------------------
       9460-3300-SET-SPND-IND.
      *-----------------------

      *  IF THE EFF DATE DOES NOT EXIST, OR IS SOME TIME IN THE FUTURE
      *  THEN THE POLICY IS NOT CURRENTLY ON BILLING RESTRICT
           IF  W9460-NEW-EFF-DT = SPACES
           OR  W9460-NEW-EFF-DT = WWKDT-ZERO-DT
           OR  W9460-NEW-EFF-DT > L9460-EFF-DT
               SET W9460-BILLING-SPND-NO TO TRUE
               GO TO 9460-3300-SET-SPND-IND-X
           END-IF.

      *  AT THIS POINT, THE EFF DATE MUST BE LESS THAN OR EQUAL TO
      *  THE MONTHIVERSARY, SO NOW WE CHECK THE END DATE
      *  IF THERE IS NO END DATE, THEN RESTRICT BILLING IS ON 
      *  INDEFINITELY
           IF  W9460-NEW-END-DT = SPACES
           OR  W9460-NEW-END-DT = WWKDT-ZERO-DT
           OR  W9460-NEW-END-DT > L9460-EFF-DT
               MOVE W9460-NEW-RBILL-CD  TO W9460-POL-RBILL-CD
               IF  W9460-POL-RBILL-RESTRICTED
                   SET W9460-BILLING-SPND TO TRUE
               ELSE
                   SET W9460-BILLING-SPND-NO TO TRUE
               END-IF
               GO TO 9460-3300-SET-SPND-IND-X
           END-IF.

      *  AT THIS POINT, THE END DATE IS A VALID DATE LESS THAN OR 
      *  EQUAL TO THE MONTHIVERSARY DATE, SO THE POLICY CAN'T BE ON
      *  BILLING RESTRICT.
           SET W9460-BILLING-SPND-NO TO TRUE.

       9460-3300-SET-SPND-IND-X.
           EXIT.

      *---------------------------
       9460-4000-CHECK-BILL-MONTH.
      *---------------------------

      *  CHECK IF THIS IS A REGULAR SCHEDULED BILL MONTH
           MOVE SPACES          TO WS-SAVE-BILL-MODE.                           

           MOVE RPOL-POL-ID     TO WPHST-POL-ID.                                
           MOVE LOW-VALUES      TO WPHST-PCHST-EFF-IDT-NUM.                     
           MOVE ZEROES          TO WPHST-PCHST-SEQ-NUM.                         

           MOVE WPHST-KEY       TO WPHST-ENDBR-KEY.                             
           MOVE L9460-EFF-DT    TO L1660-INTERNAL-DATE.                         
           PERFORM  1660-2000-CONVERT-INT-TO-INV                                
               THRU 1660-2000-CONVERT-INT-TO-INV-X.                             
           MOVE L1660-INVERTED-DATE TO WS-CALC-IDT.                             
           SUBTRACT 1           FROM WS-CALC-IDT.                               
           MOVE WS-CALC-IDT     TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.               
      *    MOVE L1660-INVERTED-DATE                                             
      *                         TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.               
           MOVE 999             TO WPHST-ENDBR-PCHST-SEQ-NUM.                   

           PERFORM  PHST-1000-BROWSE                                            
               THRU PHST-1000-BROWSE-X.                                         
           PERFORM  PHST-2000-READ-NEXT                                         
               THRU PHST-2000-READ-NEXT-X.                                      
         
           PERFORM                                                              
               UNTIL NOT WPHST-IO-OK                                            
      *           OR WS-SAVE-BILL-MODE NOT = SPACES                             
                                                                                
               IF  RPHST-POL-ACTV-TYP-ID = '1004'                               
               AND RPHST-PCHST-STAT-ACTIVE                                      
                   MOVE RPHST-PCHST-OLD-VALU-TXT                                
                                TO WS-SAVE-BILL-MODE                            
               END-IF                                                           
       
               PERFORM  PHST-2000-READ-NEXT                                     
                   THRU PHST-2000-READ-NEXT-X                                   
      
           END-PERFORM.                                                         
      
           PERFORM  PHST-3000-END-BROWSE                                        
               THRU PHST-3000-END-BROWSE-X.                                     
      
           SET W9460-RSBM-NO TO TRUE.

           IF  WS-SAVE-BILL-MODE = SPACES 
               MOVE RPOL-POL-BILL-MODE-CD TO WS-SAVE-BILL-MODE                  
           END-IF.

           IF  WS-SAVE-BILL-MODE = '01'                                         
               SET W9460-RSBM TO TRUE
               GO TO 9460-4000-CHECK-BILL-MONTH-X
           END-IF.

           IF  WS-SAVE-BILL-MODE = '12'                                         
               IF  RPOL-POL-ISS-EFF-DT-MO = L9460-EFF-DT-MO
                   SET W9460-RSBM TO TRUE
               END-IF
               GO TO 9460-4000-CHECK-BILL-MONTH-X
           END-IF.

           IF  WS-SAVE-BILL-MODE = '06'    
           AND RPOL-POL-ISS-EFF-DT-MO = L9460-EFF-DT-MO
               SET W9460-RSBM TO TRUE
               GO TO 9460-4000-CHECK-BILL-MONTH-X
           END-IF.

           IF  WS-SAVE-BILL-MODE = '06'                                         
           AND RPOL-POL-ISS-EFF-DT-MO NOT = L9460-EFF-DT-MO
               MOVE RPOL-POL-ISS-EFF-DT TO L1680-INTERNAL-1
               MOVE ZERO                TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                TO L1680-NUMBER-OF-DAYS
               MOVE 6                   TO L1680-NUMBER-OF-MONTHS
               PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                   THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
               IF  L1680-INT-MM-2 = L9460-EFF-DT-MO
                   SET W9460-RSBM TO TRUE
               END-IF
               GO TO 9460-4000-CHECK-BILL-MONTH-X
           END-IF.

       9460-4000-CHECK-BILL-MONTH-X.
           EXIT.

      *-------------------------
       9460-5000-CHECK-POUR-IN.
      *-------------------------

           SET L9460-POL-COLCT-MTHD-NO-DPOS TO TRUE.

           MOVE LOW-VALUES              TO WBAA4-KEY.

           MOVE RPOL-POL-ID             TO WBAA4-POL-ID.
           MOVE W9460-PREV-MTHV-DT      TO WBAA4-RECV-DT.

           MOVE WBAA4-KEY               TO WBAA4-ENDBR-KEY.
           IF  L9460-EFF-DT = RPOL-POL-ISS-EFF-DT
               MOVE L9460-EFF-DT        TO WBAA4-ENDBR-RECV-DT
           ELSE
               MOVE L9460-EFF-DT        TO L1680-INTERNAL-1
               MOVE ZERO                TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                TO L1680-NUMBER-OF-MONTHS
               MOVE 1                   TO L1680-NUMBER-OF-DAYS
               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X
               MOVE L1680-INTERNAL-2    TO WBAA4-ENDBR-RECV-DT
           END-IF.

           PERFORM  BAA4-1000-BROWSE
               THRU BAA4-1000-BROWSE-X.

           PERFORM  BAA4-2000-READ-NEXT
               THRU BAA4-2000-READ-NEXT-X.

           IF  NOT WBAA4-IO-OK
               PERFORM  BAA4-3000-END-BROWSE
                   THRU BAA4-3000-END-BROWSE-X
               GO TO 9460-5000-CHECK-POUR-IN-X
           END-IF.

           PERFORM  9460-5100-CHECK-FOR-B-RECPT
               THRU 9460-5100-CHECK-FOR-B-RECPT-X
               UNTIL NOT WBAA4-IO-OK
               OR L9460-POL-COLCT-MTHD-POUR-IN.

           PERFORM  BAA4-3000-END-BROWSE
               THRU BAA4-3000-END-BROWSE-X.

       9460-5000-CHECK-POUR-IN-X.
           EXIT.

      *----------------------------
       9460-5100-CHECK-FOR-B-RECPT.
      *----------------------------

           IF  RBAC-DRW-STAT-PAID
           AND RBAC-FND-SRC-B-RECPT
               CONTINUE
           ELSE
               PERFORM  BAA4-2000-READ-NEXT
                   THRU BAA4-2000-READ-NEXT-X
               GO TO 9460-5100-CHECK-FOR-B-RECPT-X
           END-IF.

      *  IF A 'B' RECEIPT IS FOUND, WE STILL HAVE TO ENSURE THE
      *  CASHFLOW IS ACTIVE.
           SET W9460-POUR-IN-NO TO TRUE.
           PERFORM  9460-5200-LOOP-THRU-CVGS
               THRU 9460-5200-LOOP-THRU-CVGS-X
               VARYING I FROM 1 BY 1
               UNTIL I > RPOL-POL-CVG-REC-CTR-N
               OR W9460-POUR-IN.

           IF  W9460-POUR-IN
               SET L9460-POL-COLCT-MTHD-POUR-IN TO TRUE
           ELSE
               PERFORM  BAA4-2000-READ-NEXT
                   THRU BAA4-2000-READ-NEXT-X
           END-IF.

       9460-5100-CHECK-FOR-B-RECPT-X.
           EXIT.

      *-------------------------
       9460-5200-LOOP-THRU-CVGS.
      *-------------------------

           IF  WCVGS-CVG-CF-REC-CTR-N (I) NOT > ZERO
               GO TO 9460-5200-LOOP-THRU-CVGS-X
           END-IF.

           MOVE RPOL-POL-ID             TO WCFLW-POL-ID.
           MOVE I                       TO WCFLW-CVG-NUM-N.
           MOVE WCVGS-CVG-CF-TYP-CD (I) TO WCFLW-CF-TYP-CD.
           MOVE W9460-PREV-MTHV-DT      TO WCFLW-CF-EFF-DT.
           MOVE 000                     TO WCFLW-CF-SEQ-NUM.

           MOVE WCFLW-KEY               TO WCFLW-ENDBR-KEY.
           IF  L9460-EFF-DT = RPOL-POL-ISS-EFF-DT
               MOVE L9460-EFF-DT        TO WCFLW-ENDBR-CF-EFF-DT
           ELSE
               MOVE L9460-EFF-DT        TO L1680-INTERNAL-1
               MOVE ZERO                TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                TO L1680-NUMBER-OF-MONTHS
               MOVE 1                   TO L1680-NUMBER-OF-DAYS
               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X
               MOVE L1680-INTERNAL-2    TO WCFLW-ENDBR-CF-EFF-DT
           END-IF.
           MOVE 999                     TO WCFLW-ENDBR-CF-SEQ-NUM.

           PERFORM  CFLW-1000-BROWSE
               THRU CFLW-1000-BROWSE-X.
           PERFORM  CFLW-2000-READ-NEXT
               THRU CFLW-2000-READ-NEXT-X.

           PERFORM  9460-5300-LOOP-THRU-CFLW
               THRU 9460-5300-LOOP-THRU-CFLW-X
               UNTIL NOT WCFLW-IO-OK
               OR W9460-POUR-IN.

           PERFORM  CFLW-3000-END-BROWSE
               THRU CFLW-3000-END-BROWSE-X.

       9460-5200-LOOP-THRU-CVGS-X.
           EXIT.

      *-------------------------
       9460-5300-LOOP-THRU-CFLW.
      *-------------------------

           IF  RCFLW-CF-STAT-ACTIVE
           AND RCFLW-CF-TRXN-DEPOSIT
B00229*        IF  RCFLW-CF-REASN-POUR-IN-NO-LOAD
B00229*        OR  RCFLW-CF-REASN-POUR-IN-LOAD
B00229*        IF  NOT RCFLW-CF-REASN-POL-CBB
02PR17         IF  NOT (RCFLW-CF-REASN-POL-CBB-RB                               
PR006E             OR   RCFLW-CF-REASN-POL-CBB-MR                           
02PR17             OR   RCFLW-CF-REASN-POL-CBB-CM)                              
                   SET W9460-POUR-IN TO TRUE
                   GO TO 9460-5300-LOOP-THRU-CFLW-X
               END-IF
           END-IF.

           PERFORM  CFLW-2000-READ-NEXT
               THRU CFLW-2000-READ-NEXT-X.

       9460-5300-LOOP-THRU-CFLW-X.
           EXIT.

      *--------------------------
       9460-6000-CHECK-BILL-MTHD.
      *--------------------------

P01304* WE WILL BE LOOKING FOR BILLS ON BAC RECORDS IN THE LAST PREMIUM
P01304* PERIOD (1 MONTH, 6 MONTHS OR 1 YEAR) READING BACKWARDS FROM THE         
P01304* DAY BEFORE THE EFFECTIVE DATE.                                          
P01304* AN EXCEPTION TO THIS IS WHEN THE EFFECTIVE DATE IS THE POLICY           
P01304* ISSUE DATE. IN THAT CASE WE WANT TO SCAN THE WHOLE BAC TABLE            
P01304* LOOKING FOR THE LATEST CWA RECORD. THE CWA BAC RECORD IS ONLY           
P01304* PRODUCED ON OR BEFORE ISSUE, HOWEVER, IF THE POLICY IS BACKDATED        
P01304* WE CAN GET CWA RECORDS DATED AFTER THE ISSUE DATE.                      
           MOVE RPOL-POL-ID          TO WBAC-POL-ID.                            
P01304*    MOVE L9460-EFF-DT         TO WBAC-APPL-CTL-PRCES-DT.
P01304     IF L9460-EFF-DT = RPOL-POL-ISS-EFF-DT                                
P01304         MOVE WWKDT-HIGH-DT    TO WBAC-APPL-CTL-PRCES-DT                  
P01304     ELSE
P01304         MOVE L9460-EFF-DT        TO L1680-INTERNAL-1
P01304         MOVE ZERO                TO L1680-NUMBER-OF-YEARS
P01304         MOVE ZERO                TO L1680-NUMBER-OF-MONTHS
P01304         MOVE 1                   TO L1680-NUMBER-OF-DAYS
P01304         PERFORM  1680-4000-SUB-YMD-FROM-DATE
P01304             THRU 1680-4000-SUB-YMD-FROM-DATE-X
P01304         MOVE L1680-INTERNAL-2    TO WBAC-APPL-CTL-PRCES-DT               
P01304     END-IF.
           MOVE HIGH-VALUES          TO WBAC-SEQ-NUM.                           

           MOVE WBAC-KEY             TO WBAC-ENDBR-KEY.                         
P01304*    MOVE WWKDT-LOW-DT         TO WBAC-ENDBR-APPL-CTL-PRCES-DT.           
           MOVE LOW-VALUES           TO WBAC-ENDBR-SEQ-NUM.                     

P01304     MOVE L9460-EFF-DT         TO L1680-INTERNAL-1.                       
P01304*    IF  RPOL-POL-BILL-MODE-MONTHLY
P01304     IF  WS-SAVE-BILL-MODE = '01'                                         
P01304         MOVE 1                TO L1680-NUMBER-OF-MONTHS                  
P01304     END-IF.
P01304*    IF  RPOL-POL-BILL-MODE-SEMI-ANN
P01304     IF  WS-SAVE-BILL-MODE = '06'                                         
P01304         MOVE 6                TO L1680-NUMBER-OF-MONTHS                  
P01304     END-IF.
P01304*    IF  RPOL-POL-BILL-MODE-ANNUALLY
P01304     IF  WS-SAVE-BILL-MODE = '12'                                         
P01304         MOVE 12               TO L1680-NUMBER-OF-MONTHS                  
P01304     END-IF.
P01304     MOVE ZERO                 TO L1680-NUMBER-OF-YEARS.                  
P01304     MOVE ZERO                 TO L1680-NUMBER-OF-DAYS.                   
P01304     PERFORM  1680-4000-SUB-YMD-FROM-DATE
P01304         THRU 1680-4000-SUB-YMD-FROM-DATE-X.
P01304     MOVE L1680-INTERNAL-2     TO WBAC-ENDBR-APPL-CTL-PRCES-DT.           
P01304
           PERFORM  BAC-1000-BROWSE-PREV
               THRU BAC-1000-BROWSE-PREV-X.

           PERFORM  BAC-2000-READ-PREV
               THRU BAC-2000-READ-PREV-X.

P01304*    IF  WBAC-IO-OK
P01304*
P01304*         EVALUATE TRUE
P01304*
P01304*            WHEN RBAC-POL-BILL-TYP-PAC
P01304*                 SET L9460-POL-COLCT-MTHD-BT TO TRUE
P01304*
P01304*            WHEN RBAC-POL-BILL-TYP-DIRECT
P01304*                 SET L9460-POL-COLCT-MTHD-CASH TO TRUE
P01304*
P01304*            WHEN RBAC-POL-BILL-TYP-OTHER-LIST
P01304*                 PERFORM  9460-6100-RBAC-GROUP-SIZE
P01304*                     THRU 9460-6100-RBAC-GROUP-SIZE-X
P01304*
P01304*            WHEN OTHER
P01304*                 SET L9460-POL-COLCT-MTHD-CASH TO TRUE
P01304*MSG: COLLECTION METHOD HAS BEEN DEFAULTED TO CASH FOR @1
P01304*                 MOVE 'CC94600001' TO WGLOB-MSG-REF-INFO
P01304*                 MOVE RPOL-POL-ID  TO WGLOB-MSG-PARM (1)
P01304*                 PERFORM  0260-1000-GENERATE-MESSAGE
P01304*                     THRU 0260-1000-GENERATE-MESSAGE-X
P01304*        END-EVALUATE
P01304*
P01304*        PERFORM  BAC-3000-END-BROWSE-PREV
P01304*            THRU BAC-3000-END-BROWSE-PREV-X
P01304*        GO TO 9460-6000-CHECK-BILL-MTHD-X
P01304*
P01304*    END-IF.
      
P01304*    TBAC CAN HAVE MORE THAN ONE RECORD FOR THIS MONTH WITH
P01304*    DIFFERENT RBAC-POL-BILL-TYP-CD. WE NEED TO CHOOSE THE
P01304*    RECORD THAT WAS THE LAST BILL (RBAC-PREM-AMT NOT = ZERO)             
P01304*    LOOP THRU ALL RECORDS FOR THE LAST MONTH TO FIND IT.
P01304
P01304     IF  WBAC-IO-OK
P01304
P01304         PERFORM  
P01304             UNTIL NOT WBAC-IO-OK
P01304             
P01304             IF (L9460-EFF-DT NOT = RPOL-POL-ISS-EFF-DT AND               
P01304                 RBAC-PREM-AMT NOT = ZERO)                                
P01304             OR (L9460-EFF-DT = RPOL-POL-ISS-EFF-DT AND                   
P01304                 RBAC-FND-SRC-CWA)                                        
P01304
P01304                 EVALUATE TRUE
P01304
P01304                     WHEN RBAC-POL-BILL-TYP-PAC
P01304                          SET L9460-POL-COLCT-MTHD-BT   TO TRUE
P01304
P01304                     WHEN RBAC-POL-BILL-TYP-DIRECT
P01304                          SET L9460-POL-COLCT-MTHD-CASH TO TRUE
P01304
P01304                     WHEN RBAC-POL-BILL-TYP-OTHER-LIST
P01304                          PERFORM  9460-6100-RBAC-GROUP-SIZE
P01304                              THRU 9460-6100-RBAC-GROUP-SIZE-X
BPTEMP                          GO TO 9460-6000-CHECK-BILL-MTHD-X               
P01304
P01304                     WHEN OTHER
P01304                         SET L9460-POL-COLCT-MTHD-CASH TO TRUE
P01304*MSG: COLLECTION METHOD HAS BEEN DEFAULTED TO CASH FOR @1
P01304                         MOVE 'CC94600001' TO WGLOB-MSG-REF-INFO          
P01304                         MOVE RPOL-POL-ID  TO WGLOB-MSG-PARM (1)          
P01304                         PERFORM  0260-1000-GENERATE-MESSAGE              
P01304                             THRU 0260-1000-GENERATE-MESSAGE-X            
P01304                 END-EVALUATE
P01304
P01304                 PERFORM  BAC-3000-END-BROWSE-PREV
P01304                     THRU BAC-3000-END-BROWSE-PREV-X
P01304                 GO TO 9460-6000-CHECK-BILL-MTHD-X
P01304
P01304             END-IF
P01304
P01304             PERFORM  BAC-2000-READ-PREV
P01304                 THRU BAC-2000-READ-PREV-X
P01304
P01304         END-PERFORM
P01304
P01304     END-IF.

           PERFORM  BAC-3000-END-BROWSE-PREV
               THRU BAC-3000-END-BROWSE-PREV-X.

           MOVE SPACES          TO WS-SAVE-BILL-METHOD.                         

           MOVE RPOL-POL-ID     TO WPHST-POL-ID.                                
           MOVE LOW-VALUES      TO WPHST-PCHST-EFF-IDT-NUM.                     
           MOVE ZEROES          TO WPHST-PCHST-SEQ-NUM.                         

           MOVE WPHST-KEY       TO WPHST-ENDBR-KEY.                             
           MOVE WS-MTHV-EFF-DT  TO L1660-INTERNAL-DATE.                         
           PERFORM  1660-2000-CONVERT-INT-TO-INV                                
               THRU 1660-2000-CONVERT-INT-TO-INV-X.                             
           MOVE L1660-INVERTED-DATE TO WS-CALC-IDT.                             
           SUBTRACT 1           FROM WS-CALC-IDT.                               
           MOVE WS-CALC-IDT     TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.               
      *    MOVE L1660-INVERTED-DATE                                             
      *                         TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.               
           MOVE 999             TO WPHST-ENDBR-PCHST-SEQ-NUM.                   

           PERFORM  PHST-1000-BROWSE                                            
               THRU PHST-1000-BROWSE-X.                                         
           PERFORM  PHST-2000-READ-NEXT                                         
               THRU PHST-2000-READ-NEXT-X.                                      

           PERFORM                                                              
               UNTIL NOT WPHST-IO-OK                                            
      *           OR WS-SAVE-BILL-METHOD NOT = SPACE                            
                                                                                
               IF  RPHST-POL-ACTV-TYP-ID = '1003'                               
               AND RPHST-PCHST-STAT-ACTIVE                                      
                   MOVE RPHST-PCHST-OLD-VALU-TXT                                
                                TO WS-SAVE-BILL-METHOD                          
               END-IF                                                           

               PERFORM  PHST-2000-READ-NEXT                                     
                   THRU PHST-2000-READ-NEXT-X                                   

           END-PERFORM.                                                         

           PERFORM  PHST-3000-END-BROWSE                                        
               THRU PHST-3000-END-BROWSE-X.                                     

           IF WS-SAVE-BILL-METHOD NOT = SPACE                                   
               IF  WS-SAVE-BILL-METHOD = '1'
                    SET L9460-POL-COLCT-MTHD-CASH TO TRUE
               END-IF

               IF  WS-SAVE-BILL-METHOD = '4'
                    SET L9460-POL-COLCT-MTHD-BT TO TRUE
               END-IF

               IF  WS-SAVE-BILL-METHOD = 'G'
P01361              PERFORM  9460-6500-GROUP-SIZE                               
P01361                  THRU 9460-6500-GROUP-SIZE-X                             
P01361*             PERFORM  9460-6200-CLIG-GROUP-SIZE
P01361*                 THRU 9460-6200-CLIG-GROUP-SIZE-X
               END-IF

               GO TO 9460-6000-CHECK-BILL-MTHD-X                                
           END-IF.

BPTEMP     SET  WS-CMPOL-YES            TO TRUE.

      *  NO BILLING ACTIVITY RECORD, SO USE THE POLICY BILLING METHOD
           EVALUATE TRUE

               WHEN RPOL-POL-BILL-TYP-PAC
                    SET L9460-POL-COLCT-MTHD-BT TO TRUE

               WHEN RPOL-POL-BILL-TYP-DIRECT
                    SET L9460-POL-COLCT-MTHD-CASH TO TRUE

               WHEN RPOL-POL-BILL-TYP-OTHER-LIST
P01361              PERFORM  9460-6500-GROUP-SIZE                               
P01361                  THRU 9460-6500-GROUP-SIZE-X                             
P01361*             PERFORM  9460-6200-CLIG-GROUP-SIZE
P01361*                 THRU 9460-6200-CLIG-GROUP-SIZE-X

               WHEN OTHER
                    SET L9460-POL-COLCT-MTHD-CASH TO TRUE
      *MSG: COLLECTION METHOD HAS BEEN DEFAULTED TO CASH FOR @1
                    MOVE 'CC94600001' TO WGLOB-MSG-REF-INFO
                    MOVE RPOL-POL-ID  TO WGLOB-MSG-PARM (1)
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
           END-EVALUATE.

       9460-6000-CHECK-BILL-MTHD-X.
           EXIT.

      *--------------------------
       9460-6100-RBAC-GROUP-SIZE.
      *--------------------------

           EVALUATE TRUE

               WHEN RBAC-PAYRL-SIZ-LARGE
                    SET L9460-POL-COLCT-MTHD-GRP-LARGE TO TRUE

               WHEN RBAC-PAYRL-SIZ-SMALL
                    SET L9460-POL-COLCT-MTHD-GRP-SMALL TO TRUE

               WHEN OTHER
BPTEMP              PERFORM  9460-6150-NEXT-BAC-SIZE                            
BPTEMP                  THRU 9460-6150-NEXT-BAC-SIZE-X                          
BPTEMP              GO TO 9460-6100-RBAC-GROUP-SIZE-X                           
BPTEMP*             PERFORM  9460-6200-CLIG-GROUP-SIZE
BPTEMP*                 THRU 9460-6200-CLIG-GROUP-SIZE-X
P01304*             SET L9460-POL-COLCT-MTHD-GRP-SMALL TO TRUE
P01304*MSG: COLLECTION METHOD HAS BEEN DEFAULTED TO SMALL GROUP FOR @1
P01304*             MOVE 'CC94600002' TO WGLOB-MSG-REF-INFO
P01304*             MOVE RPOL-POL-ID  TO WGLOB-MSG-PARM (1)
P01304*             PERFORM  0260-1000-GENERATE-MESSAGE
P01304*                 THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.

BPTEMP     PERFORM  BAC-3000-END-BROWSE-PREV
BPTEMP         THRU BAC-3000-END-BROWSE-PREV-X.

       9460-6100-RBAC-GROUP-SIZE-X.
           EXIT.

BPTEMP*------------------------                                                 
BPTEMP 9460-6150-NEXT-BAC-SIZE.                                                 
BPTEMP*------------------------                                                 
BPTEMP* IF WE HAVE COME HERE THEN WE FOUND A 'G' BAC RECORD WITH A
BPTEMP* BLANK GROUP SIZE. IN THIS CASE WE WILL READ AHEAD LOOKING 
BPTEMP* FOR THE NEXT BILL, AND IF WE FIND ONE WE WILL USE THE GROUP             
BPTEMP* SIZE FROM THAT RECORD.                                                  
BPTEMP
BPTEMP     MOVE RBAC-KEY             TO WS-SAVE-KEY.                            
BPTEMP
BPTEMP     PERFORM  BAC-3000-END-BROWSE-PREV                                    
BPTEMP         THRU BAC-3000-END-BROWSE-PREV-X.                                 
BPTEMP
BPTEMP     MOVE WS-SAVE-KEY          TO WBAC-KEY.
BPTEMP     ADD  1                    TO WBAC-SEQ-NUM-N.
BPTEMP
BPTEMP     MOVE WBAC-KEY             TO WBAC-ENDBR-KEY.                         
BPTEMP     MOVE WWKDT-HIGH-DT        TO WBAC-ENDBR-APPL-CTL-PRCES-DT.           
BPTEMP     MOVE HIGH-VALUES          TO WBAC-ENDBR-SEQ-NUM.                     
BPTEMP
BPTEMP     PERFORM  BAC-1000-BROWSE                                             
BPTEMP         THRU BAC-1000-BROWSE-X.                                          
BPTEMP
BPTEMP     PERFORM  BAC-2000-READ-NEXT
BPTEMP         THRU BAC-2000-READ-NEXT-X.
BPTEMP
BPTEMP     IF  WBAC-IO-OK
BPTEMP
BPTEMP         PERFORM  
BPTEMP             UNTIL NOT WBAC-IO-OK
BPTEMP             
BPTEMP             IF  RBAC-PREM-AMT NOT = ZERO                                 
BPTEMP
BPTEMP                 EVALUATE TRUE
BPTEMP 
BPTEMP                     WHEN RBAC-PAYRL-SIZ-LARGE                            
BPTEMP                          SET L9460-POL-COLCT-MTHD-GRP-LARGE              
BPTEMP                                                     TO TRUE              
BPTEMP
BPTEMP                     WHEN RBAC-PAYRL-SIZ-SMALL                            
BPTEMP                          SET L9460-POL-COLCT-MTHD-GRP-SMALL              
BPTEMP                                                     TO TRUE              
BPTEMP
BPTEMP                     WHEN OTHER
BPTEMP                          PERFORM  9460-6200-CLIG-GROUP-SIZE              
BPTEMP                              THRU 9460-6200-CLIG-GROUP-SIZE-X            
BPTEMP                 END-EVALUATE
BPTEMP
BPTEMP                 PERFORM  BAC-3000-END-BROWSE                             
BPTEMP                     THRU BAC-3000-END-BROWSE-X                           
BPTEMP                 GO TO 9460-6150-NEXT-BAC-SIZE-X                          
BPTEMP             END-IF
BPTEMP
BPTEMP             PERFORM  BAC-2000-READ-NEXT                                  
BPTEMP                 THRU BAC-2000-READ-NEXT-X                                
BPTEMP
BPTEMP         END-PERFORM
BPTEMP
BPTEMP     END-IF.
BPTEMP
BPTEMP     PERFORM  BAC-3000-END-BROWSE                                         
BPTEMP         THRU BAC-3000-END-BROWSE-X.                                      
BPTEMP
BPTEMP     PERFORM  9460-6200-CLIG-GROUP-SIZE                                   
BPTEMP         THRU 9460-6200-CLIG-GROUP-SIZE-X.                                
BPTEMP
BPTEMP 9460-6150-NEXT-BAC-SIZE-X.                                               
BPTEMP     EXIT.

      *--------------------------
       9460-6200-CLIG-GROUP-SIZE.
      *--------------------------

           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.
           PERFORM  2430-2300-GET-LISTBILL
               THRU 2430-2300-GET-LISTBILL-X.
           IF  NOT L2430-RETRN-OK
               SET L9460-POL-COLCT-MTHD-GRP-SMALL TO TRUE
      *MSG: COLLECTION METHOD HAS BEEN DEFAULTED TO SMALL GROUP FOR @1
               MOVE 'CC94600002' TO WGLOB-MSG-REF-INFO
               MOVE RPOL-POL-ID  TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               PERFORM  9460-6400-GET-CLIG-INFO
                   THRU 9460-6400-GET-CLIG-INFO-X
           END-IF.

       9460-6200-CLIG-GROUP-SIZE-X.
           EXIT.

      *------------------------
       9460-6400-GET-CLIG-INFO.
      *------------------------

           PERFORM  9105-1000-BUILD-PARM-INFO
               THRU 9105-1000-BUILD-PARM-INFO-X.
           MOVE L2430-CLI-ID TO L9105-CLI-ID.
           PERFORM  9105-1000-READ-RCLIG
               THRU 9105-1000-READ-RCLIG-X.
           IF  NOT L9105-RETRN-OK
               SET L9460-POL-COLCT-MTHD-GRP-SMALL TO TRUE
      *MSG: COLLECTION METHOD HAS BEEN DEFAULTED TO SMALL GROUP FOR @1
               MOVE 'CC94600002' TO WGLOB-MSG-REF-INFO
               MOVE RPOL-POL-ID  TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE

               EVALUATE TRUE

                   WHEN L9105-CLI-GR-TYP-LARGE
                        SET L9460-POL-COLCT-MTHD-GRP-LARGE TO TRUE

                   WHEN L9105-CLI-GR-TYP-SMALL
                        SET L9460-POL-COLCT-MTHD-GRP-SMALL TO TRUE

                   WHEN OTHER
                        SET L9460-POL-COLCT-MTHD-GRP-SMALL TO TRUE
      *MSG: COLLECTION METHOD HAS BEEN DEFAULTED TO SMALL GROUP FOR @1
                        MOVE 'CC94600002' TO WGLOB-MSG-REF-INFO
                        MOVE RPOL-POL-ID  TO WGLOB-MSG-PARM (1)
                        PERFORM  0260-1000-GENERATE-MESSAGE
                            THRU 0260-1000-GENERATE-MESSAGE-X

               END-EVALUATE
           END-IF.

       9460-6400-GET-CLIG-INFO-X.
          EXIT.

P01361*---------------------                                                    
P01361 9460-6500-GROUP-SIZE.                                                    
P01361*---------------------                                                    
P01361* IF WE HAVE COME TO THIS ROUTINE THEN WE DON'T HAVE A                    
P01361* BILL (BAC RECORD) IN THE PREVIOUS BILLING PERIOD. IN                    
P01361* THIS SITUATION WE WILL FIRST CHECK TO SEE IF WE HAVE                    
P01361* A BILL IN THE FUTURE (ie UNDO/REDO) AND IF SO WILL USE                  
P01361* THE GROUP SIZE FROM THAT BILL. IF WE DON'T FIND A FUTURE                
P01361* BILL THEN WE MUST BE GOING THRU THE MONTHLIVERSARY THE                  
P01361* FIRST TIME SO WE WILL GET THE GROUP SIZE FROM CLIG.                     
P01361
P01361     MOVE RPOL-POL-ID          TO WBAC-POL-ID.                            
P01361     MOVE L9460-EFF-DT         TO WBAC-APPL-CTL-PRCES-DT.
P01361     MOVE LOW-VALUES           TO WBAC-SEQ-NUM.                           
P01361
P01361     MOVE WBAC-KEY             TO WBAC-ENDBR-KEY.                         
P01361     MOVE WWKDT-HIGH-DT        TO WBAC-ENDBR-APPL-CTL-PRCES-DT.           
P01361     MOVE HIGH-VALUES          TO WBAC-ENDBR-SEQ-NUM.                     
P01361
P01361     PERFORM  BAC-1000-BROWSE                                             
P01361         THRU BAC-1000-BROWSE-X.                                          
P01361
P01361     PERFORM  BAC-2000-READ-NEXT
P01361         THRU BAC-2000-READ-NEXT-X.
P01361
P01361     IF  WBAC-IO-OK
P01361
P01361         PERFORM  
P01361             UNTIL NOT WBAC-IO-OK
P01361             
P01361             IF  RBAC-PREM-AMT NOT = ZERO                                 
P01361
P01361                 EVALUATE TRUE
P01361 
P01361                     WHEN RBAC-PAYRL-SIZ-LARGE                            
P01361                          SET L9460-POL-COLCT-MTHD-GRP-LARGE              
P01361                                                     TO TRUE              
P01361
P01361                     WHEN RBAC-PAYRL-SIZ-SMALL                            
P01361                          SET L9460-POL-COLCT-MTHD-GRP-SMALL              
P01361                                                     TO TRUE              
P01361
P01361                     WHEN OTHER
P01361                          PERFORM  9460-6200-CLIG-GROUP-SIZE              
P01361                              THRU 9460-6200-CLIG-GROUP-SIZE-X            
P01361                 END-EVALUATE
P01361
P01361                 PERFORM  BAC-3000-END-BROWSE                             
P01361                     THRU BAC-3000-END-BROWSE-X                           
P01361                 GO TO 9460-6500-GROUP-SIZE-X                             
P01361             END-IF
P01361
P01361             PERFORM  BAC-2000-READ-NEXT                                  
P01361                 THRU BAC-2000-READ-NEXT-X                                
P01361
P01361         END-PERFORM
P01361
P01361     END-IF.
P01361
P01361     PERFORM  BAC-3000-END-BROWSE                                         
P01361         THRU BAC-3000-END-BROWSE-X.                                      
P01361
P01361     PERFORM  9460-6200-CLIG-GROUP-SIZE                                   
P01361         THRU 9460-6200-CLIG-GROUP-SIZE-X.                                
P01361
P01361 9460-6500-GROUP-SIZE-X.                                                  
P01361     EXIT.

      *****************************************************************
      **                 END OF COPYBOOK CCPP9460                    **
      *****************************************************************

      *******  PERFORMED ROUTINES
       COPY NCPPCVGS.

      *******  I/O ROUTINES

       COPY CCPTPOL.
       COPY CCPNCVG.
       COPY CCPBUH.                                                             
       COPY CCPBUHCO.                                                           

       COPY CCPBBAC.
BP9460 COPY CCPVBAC.
BP9460 COPY CCPBBAA4.
BP9460 COPY CCPBCFLW.
BP9460 COPY CCPBPHST.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPS9460.
BP9460*COPY CCPL9460.

       COPY CCPSPGA.
BP9460/
BP9460 COPY CCPS2430.
BP9460 COPY CCPL2430.
BP9460/
BP9460 COPY CCPS9105.
BP9460 COPY CCPL9105.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
BP9460 COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBE                     **         
      *****************************************************************
