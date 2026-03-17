      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBC.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBC                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF BAD COLLECTION**
      **            METHOD MONTHLIVERSARIES FROM ZSBMCMBE AND WILL   **
      **            CALC CMB'S USING A MODIFIED VERSION OF CCPP9495  **         
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
EN0121**  28JUN10  CTS    RETROFIT FOR EN8983 CHANGES                **
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
           SELECT CMBC-DATA-FILE ASSIGN TO ZSCMBC
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBC-SEQ-FILE-STATUS.
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
      *    05  RCMBE-CMB-DIFF            PIC S9(13).                            
      *    05  FILLER                    PIC X(34).                             

       FD  CMBC-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBC-SEQ-REC-INFO.
           05  RCMBC-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBC-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBC-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBC-CEASE-DT            PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBC-ANNIV-DT            PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBC-OLD-CMB-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBC-NEW-CMB-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBC-CMB-DIFF            PIC -9(13).                            
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBC'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-ANNIV-SW               PIC X(1).
               88  WS-ANNIV-NOT-FOUND                VALUE 'N'.
               88  WS-ANNIV-FOUND                    VALUE 'Y'.                 
           05  WS-CFLW-SW                PIC X(1).
               88  WS-CFLW-NOT-FOUND                 VALUE 'N'.                 
               88  WS-CFLW-FOUND                     VALUE 'Y'.                 
           05  WS-BAD-UH-SW              PIC X(1).
               88  WS-BAD-UH-NOT-FOUND               VALUE 'N'.                 
               88  WS-BAD-UH-FOUND                   VALUE 'Y'.                 

       01  SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.
           05  J                         PIC S9(4) COMP.
           05  K                         PIC S9(4) COMP.
           05  L                         PIC S9(4) COMP.

       01  WORK-AREAS.
           05  WS-MAX-DT                 PIC X(10) VALUE '2004-02-28'.          
           05  WS-ANNIV-DT               PIC X(10).                             
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
           05  WS-CMB-ERR-AMT            PIC S9(13).                            
           05  WS-CMB-NEW-AMT            PIC S9(13).                            

       01  WS-SAVE-UH-AREA.            
           05  WS-SAVE-UH-MAX            PIC S9(04) COMP.    
           05  WS-SAVE-UH-DATA           OCCURS 98 TIMES.
               10  WS-SAVE-UH-R-DT       PIC X(10).        
               10  WS-SAVE-UH-DT         PIC X(10).        
               10  WS-SAVE-UH-CD         PIC X(01).        

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

       01  WCMBC-SEQ-IO-WORK-AREA.
           05  WCMBC-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBC'.
           05  WCMBC-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBC-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBC-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBC-SEQ-IO-OK              VALUE 0.
               88  WCMBC-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBC-SEQ-IO-EOF             VALUE 8.
               88  WCMBC-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWCVG.
       COPY CCFRCVG.
       COPY CCWWCVGS.
      /
       COPY CCFWPD.
       COPY CCFRPD.
      /
       COPY CCFWPH.
       COPY CCFRPH.
      /
       COPY CCFWUH.
       COPY CCFRUH.
      /
       COPY CCFWUHCO.
       COPY CCFRUHCO.
      /
       COPY CCFWCFLW.
       COPY CCFRCFLW.
      /
       COPY CCFWPHST.
       COPY CCFRPHST.

       COPY CCWW9495.

       COPY XCWWWKDT.
       COPY XCWWCVGM.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY CCWL0186.
       COPY CCWL9495.
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
              UNTIL WCMBE-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

           MOVE RCMBC-ISS-DT       TO WS-ANNIV-DT.                              
           PERFORM 3000-WRITE-IT    
              THRU 3000-WRITE-IT-X                                              
              VARYING J FROM 1 BY 1                                             
                UNTIL J > WS-SAVE-UH-MAX.                                       

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                   TO WCMBC-SEQ-IO-STATUS.

           OPEN OUTPUT CMBC-DATA-FILE.

           IF WCMBC-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMCMBC'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMCMBC'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

           MOVE SPACES TO WS-PREV-POL-ID.    

           MOVE SPACES TO RCMBC-SEQ-REC-INFO.

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
               MOVE RCMBC-ISS-DT       TO WS-ANNIV-DT                           
               PERFORM 3000-WRITE-IT                                            
                  THRU 3000-WRITE-IT-X                                          
                  VARYING J FROM 1 BY 1                                         
                    UNTIL J > WS-SAVE-UH-MAX                                    

               PERFORM 2100-NEW-POL                                             
                  THRU 2100-NEW-POL-X                                           
           END-IF.

           ADD 1 TO WS-SAVE-UH-MAX.                                             

           MOVE RCMBE-MTHV-DT     TO WS-TEST-DT.                                
           MOVE 00                TO WS-TEST-DT-DY.                             
           MOVE WS-TEST-DT        TO WS-SAVE-UH-DT (WS-SAVE-UH-MAX).            
           MOVE RCMBE-MTHV-DT     TO WS-SAVE-UH-R-DT (WS-SAVE-UH-MAX).          
           MOVE RCMBE-NEW-UH-CD   TO WS-SAVE-UH-CD (WS-SAVE-UH-MAX).            

      *    IF  RCMBE-MTHV-DT < WS-OLDEST-BAD-DT                                 
      *        MOVE RCMBE-MTHV-DT TO WS-OLDEST-BAD-DT                           
      *    END-IF.
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *-------------                                                            
       2100-NEW-POL.                                                            
      *-------------                                                            
           MOVE RCMBE-POL-ID       TO WS-PREV-POL-ID.                           
           MOVE WWKDT-HIGH-DT      TO WS-OLDEST-BAD-DT.                         
           MOVE SPACES             TO RCMBC-SEQ-REC-INFO.                       
           MOVE RCMBE-POL-ID       TO RCMBC-POL-ID.                             
           MOVE RCMBE-POL-STAT     TO RCMBC-POL-STAT.                           
           MOVE RCMBE-ISS-DT       TO RCMBC-ISS-DT.                             
           MOVE RCMBE-CEASE-DT     TO RCMBC-CEASE-DT.                           

           MOVE RCMBE-POL-ID       TO WPOL-POL-ID.                              

           PERFORM POL-1000-READ                                                
              THRU POL-1000-READ-X.                                             

           IF WPOL-IO-NOT-FOUND                                                 
               MOVE WPOL-KEY       TO  WGLOB-MSG-PARM (1)                       
               MOVE 'XS00000097'   TO  WGLOB-MSG-REF-INFO                       
      *MSG: (S) 'POLICY RECORD NOT FOUND'
               PERFORM 0260-1000-GENERATE-MESSAGE                               
                  THRU 0260-1000-GENERATE-MESSAGE-X                             
               GO TO 2100-NEW-POL-X                                             
           END-IF.                                                              
       
           MOVE RPOL-POL-ID         TO  LPGA-POLICY-NUMBER.                     

           PERFORM CVGS-1000-LOAD-CVGS-ARRAY
              THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           MOVE 0                  TO WS-SAVE-UH-MAX.                           
       
       2100-NEW-POL-X.                                                          
           EXIT.

      *--------------
       3000-WRITE-IT.
      *--------------

           IF WS-SAVE-UH-R-DT (J) < WS-ANNIV-DT                                 
               GO TO 3000-WRITE-IT-X                                            
           END-IF.                                                              

           SET  WS-ANNIV-NOT-FOUND TO TRUE.                                     
           PERFORM  3100-FIND-ANNIV-DATE                                        
               THRU 3100-FIND-ANNIV-DATE-X                                      
               UNTIL WS-ANNIV-FOUND.                                            

           MOVE RPOL-POL-ID             TO WCFLW-POL-ID.
           MOVE 1                       TO WCFLW-CVG-NUM-N.
           MOVE 'D'                     TO WCFLW-CF-TYP-CD.
           MOVE WS-ANNIV-DT             TO WCFLW-CF-EFF-DT.
           MOVE 000                     TO WCFLW-CF-SEQ-NUM.

           MOVE WCFLW-KEY               TO WCFLW-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT           TO WCFLW-ENDBR-CF-EFF-DT.               
           MOVE 999                     TO WCFLW-ENDBR-CF-SEQ-NUM.

           SET WS-CFLW-NOT-FOUND        TO TRUE.
           MOVE 0                       TO RCMBC-OLD-CMB-AMT.

           PERFORM  CFLW-1000-BROWSE
               THRU CFLW-1000-BROWSE-X.

           PERFORM  3200-LOOP-THRU-CFLW                                         
               THRU 3200-LOOP-THRU-CFLW-X                                       
               UNTIL NOT WCFLW-IO-OK
                  OR WS-CFLW-FOUND.                                             

           PERFORM  CFLW-3000-END-BROWSE
               THRU CFLW-3000-END-BROWSE-X.


           PERFORM  9495-0000-INIT-PARM-INFO
               THRU 9495-0000-INIT-PARM-INFO-X.

           PERFORM  9495-1000-BUILD-PARM-INFO-E
               THRU 9495-1000-BUILD-PARM-INFO-E-X.

02PR62*    IF RPOL-POL-APP-REASN-JOINT
02PR62*       MOVE W9490-JOINT-EFF-DT TO L9495-JOINT-EFF-DT
02PR62*       SET L9495-JOINT-NO TO TRUE
P01047*       SET L9495-AVG-TYP-CVG-MOS TO TRUE
02PR62*    END-IF.

           MOVE WS-ANNIV-DT             TO L9495-RQST-DT.                       

      *    PERFORM 9495-1000-CALC-CBB-AMTS
      *       THRU 9495-1000-CALC-CBB-AMTS-X.

           SET L9495-RQST-GET-CBB-AMTS    TO TRUE.

           PERFORM  9495-0000-MAINLINE
               THRU 9495-0000-MAINLINE-X.

           MOVE WS-ANNIV-DT             TO RCMBC-ANNIV-DT.                      
           MOVE L9495-CMB-AMT           TO RCMBC-NEW-CMB-AMT.                   
           COMPUTE RCMBC-CMB-DIFF = RCMBC-NEW-CMB-AMT                           
                                  - RCMBC-OLD-CMB-AMT.                          

           PERFORM 9400-CMBC-WRITE                                              
              THRU 9400-CMBC-WRITE-X.                                           

       3000-WRITE-IT-X.
           EXIT.

      *---------------------
       3100-FIND-ANNIV-DATE.
      *---------------------

           MOVE WS-ANNIV-DT        TO L1680-INTERNAL-1.
           MOVE 1                  TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO               TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO               TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2   TO WS-ANNIV-DT.

           IF WS-SAVE-UH-R-DT (J) < WS-ANNIV-DT                                 
               SET WS-ANNIV-FOUND  TO TRUE
           END-IF.

       3100-FIND-ANNIV-DATE-X.
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

           MOVE RCFLW-CF-FND-TRXN-AMT  TO RCMBC-OLD-CMB-AMT.                    

           SET WS-CFLW-FOUND  TO TRUE.                                          

       3200-LOOP-THRU-CFLW-X.                                                   
           EXIT.

      *----------------
       9400-CMBC-WRITE.
      *----------------

           MOVE ZERO                   TO WCMBC-SEQ-IO-STATUS.

           WRITE RCMBC-SEQ-REC-INFO.

           IF WCMBC-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9400-CMBC-WRITE-X.
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

           MOVE WCMBC-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBC-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBC-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
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

           MOVE ZERO                   TO WCMBC-SEQ-IO-STATUS.

           CLOSE CMBC-DATA-FILE.

           IF WCMBC-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *****************************************************************
      **  MEMBER :  CCPP9495                                         **
      **  REMARKS:  CASH BACK BONUS CALCULATOR                       **         
      **                                                             **
      **            THIS MODULE WILL CALCULATE THE...                **
02PR17**                 - RATE BANDING                              **
02PR17**                 - COLLECTION METHOD                         **         
PR006E**                 - MEDICAL RIDER                             **
      **            PIECES OF THE CASH BACK BONUS.                   **         
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
02PR17**  30JUN02  WBP    NEW FOR PHASE 2                            **
2BAC05**  16JUL02  BMB    CORRECTED STRUCTURE AND PARAGRAPH NAMES    **
2BAC05**                  ADDED FLAG TO BYPASS SHORTAGE EDITS        **
02AD12**  20AUG02  AT     RETURN AVERAGE FACE AMOUNT TO CALLER       **
2DAC01**  28AUG02  BMB    ADDED TEST FOR MONTH COUNTER               **
2DAC01**                  CORRECTED CODE FOR 99 COVERAGES            **
B01088**  05SEP02  BMB    SUBSCRIPT NOT CHANGED CORRECTLY FROM 2DAC01**
B10668**  16SEP02  BMB  - ADDED RBB PRO-RATE FLAG AND CBB COI FLAG   **
B10668**                  FOR VALUATION                              **
B10668**                - VALUATION NEEDS ALL OF THE INSTANCES WHEN  **
B10668**                  CBB WAS AWARDED SO THE ARRAYS NEED TO BE 13**
B10668**                  ELEMENTS INSTEAD OF 12 TO GET THE 1ST ONE  **
B10668**                  WHEN THE CVG WAS PUT IN FORCE              **
02PR62**  08OCT02  DPK    JOINT TO SINGLE CBB PROCESSING             **
PR006E**  26JUN03  CSS    NEW CBB - MEDICAL RIDER CALCULATION        **
MM0219**  26JUN03  AT     FOR RATE BANDING AND MEDICAL RIDER CALCS,  **
MM0219**                  SET THE DIVISOR DEPENDING ON THE SWITCH    **
MM0219**                  SET BY THE CALLING PROGRAM                 **
MM0413**  26JUN03  AT     WHEN COUNTING UHCO ROWS TO GET THE         **
MM0413**                  NUMBER OF MONTHS FOR PRO-RATING PURPOSES,  **
MM0413**                  DO NOT COUNT ROWS THAT REPRESENTS CVGS     **
MM0413**                  THAT PHYSICALLY EXIST ON UHCO BUT ARE NOT  **
MM0413**                  TRUE COVERAGES                             **
MM0489**  26JUN03  AT     MRB BONUS SHOULD NOT BE PRORATED           **
MM489B**  26JUN03  AT     FINE TUNE MRB BONUS CALC THAT REGRESSED    **
MM489B**                  WITH ITEM MM0489, USE DIVISOR OF 100 AND   **
MM489B**                  1000000 WHICH IS VALID FOR RBB BUT NOT MRB **
MM1641**  26JUN03  AT     PRO-RATE MRB FOR VALUATION                 **
      *****************************************************************
 
2BAC05*------------------*
2BAC05 9495-0000-MAINLINE.
2BAC05*------------------*

2BAC05     INITIALIZE L9495-OUTPUT-PARM-INFO.
2BAC05     SET L9495-RETRN-OK                    TO TRUE.

2BAC05     EVALUATE TRUE

2BAC05         WHEN L9495-RQST-GET-CBB-AMTS
2BAC05             PERFORM 9495-0100-GET-CBB-AMTS
2BAC05                THRU 9495-0100-GET-CBB-AMTS-X

2BAC05         WHEN OTHER
2BAC05             SET L9495-RETRN-INVALID-REQUEST TO TRUE
2BAC05             MOVE L9495-RETRN-CD           TO WGLOB-ERR-RETRN-CD
2BAC05             PERFORM 0030-5000-LOGIC-ERROR
2BAC05                THRU 0030-5000-LOGIC-ERROR-X

2BAC05     END-EVALUATE.

2BAC05 9495-0000-MAINLINE-X.
2BAC05     EXIT.
      *-----------------------
2BAC05 9495-0100-GET-CBB-AMTS.
      *-----------------------
 
           MOVE 0 TO L9495-RBB-AMT.                                             
           MOVE 0 TO L9495-CMB-AMT.                                             
PR006E     MOVE 0 TO L9495-MRB-AMT.                                             
 
      *
      *  CHECK TO SEE IF THERE IS A SHORTAGE AND IF SO,NO BONUS FOR YOU
      *
2BAC05*    IF RPOL-POL-UL-SHRT-AMT NOT = 0   
2BAC05*        GO TO 9495-0000-MAINLINE-X                                      
2BAC05*    END-IF.
 
2BAC05*    IF  RPOL-POL-UL-SHRT-AMT NOT = 0   
2BAC05*    AND L9495-SHRT-EDIT   
2BAC05*        GO TO 9495-0100-GET-CBB-AMTS-X                                   
2BAC05*    END-IF.
 
      *
      *  DETERMINE WHEN THE LAST CASH BACK BONUS WAS PAID
      *
      *    MOVE RPOL-POL-ISS-EFF-DT TO W9495-LAST-CBB-DT.                       
      *    IF RPOL-CBB-LST-PD-YR NOT = 0
      *        MOVE RPOL-CBB-LST-PD-YR TO W9495-LAST-CBB-DT-YR
      *    END-IF.
            
B10668     MOVE L9495-RQST-DT    TO L1680-INTERNAL-1.                           
B10668     MOVE 1                TO L1680-NUMBER-OF-YEARS.                      
B10668     MOVE ZERO             TO L1680-NUMBER-OF-MONTHS.                     
B10668     MOVE ZERO             TO L1680-NUMBER-OF-DAYS.                       
B10668     PERFORM  1680-4000-SUB-YMD-FROM-DATE                                 
B10668         THRU 1680-4000-SUB-YMD-FROM-DATE-X.                              
B10668     MOVE L1680-INTERNAL-2 TO W9495-LAST-CBB-DT.                          
            
02PR62* IF POLICY IS JOINT TO SINGLE THEN WE MUST USE THE EFFECTIVE
02PR62* DATE OF WHEN THE JOINT POLICY WAS SURRENDERED FOR CALCULATING
02PR62* THE SINGLE POLICY.
02PR62
02PR62*    IF RPOL-POL-APP-REASN-JOINT
02PR62*       MOVE L9495-JOINT-EFF-DT TO W9495-LAST-CBB-DT
02PR62*    END-IF.
 
      *
      *  GET MONTHLIVERSARY COVERAGE DATA
      *
           PERFORM 9495-0500-GET-UHCO-DATA                                      
              THRU 9495-0500-GET-UHCO-DATA-X.
                                                           
      *
      *  DO THE CALCULATIONS
      *
      *    PERFORM 9495-1000-CALC-RATE-BAND-BON                                 
      *       THRU 9495-1000-CALC-RATE-BAND-BON-X.
                                                           
           PERFORM 9495-2000-CALC-COLL-MTHD-BON                                 
              THRU 9495-2000-CALC-COLL-MTHD-BON-X.
                                                           
PR006E*    PERFORM 9495-3000-CALC-MED-RIDER-BON                                 
PR006E*       THRU 9495-3000-CALC-MED-RIDER-BON-X.
 
2BAC05 9495-0100-GET-CBB-AMTS-X.
           EXIT.
      /
      *------------------------                                                 
       9495-0500-GET-UHCO-DATA.                                                 
      *------------------------                                                 
 
      *
      *  VARIOUS UHCO TABLE FIELDS ARE USED THROUGHOUT THE CALCULATIONS
      *  AND IT IS MOST EFFICIENT TO READ AND SAVE THIS DATA UP FRONT           
      *
2DAC01*    PERFORM
2DAC01*       VARYING W9495-CVG FROM +1 BY +1                                   
2DAC01*         UNTIL W9495-CVG > 98                                            
2DAC01*            MOVE 0 TO W9495-UHCO-MTH-CNT (W9495-CVG)                     
2DAC01*    END-PERFORM.

2DAC01     PERFORM
2DAC01        VARYING I FROM +1 BY +1                                   
2DAC01          UNTIL I > WCVGM-MAX-WCVGS-NUM                                   
2DAC01             MOVE 0 TO W9495-UHCO-MTH-CNT (I)                     
2DAC01     END-PERFORM.
 
           MOVE RPOL-CO-ID             TO WUHCO-CO-ID.
           MOVE RPOL-POL-ID            TO WUHCO-POL-ID.
           MOVE W9495-LAST-CBB-DT      TO WUHCO-MTHV-EFF-DT-NUM.
           MOVE 00                     TO WUHCO-MTHV-EFF-DT-NUM-DY.
           MOVE '00'                   TO WUHCO-CVG-NUM.                        
           MOVE WUHCO-KEY              TO WUHCO-ENDBR-KEY.
B10668*    MOVE L9495-RQST-DT          TO L1680-INTERNAL-1.                     
B10668*    MOVE ZERO                   TO L1680-NUMBER-OF-YEARS.                
B10668*    MOVE 1                      TO L1680-NUMBER-OF-MONTHS.               
B10668*    MOVE ZERO                   TO L1680-NUMBER-OF-DAYS.                 
B10668*    PERFORM  1680-4000-SUB-YMD-FROM-DATE                                 
B10668*        THRU 1680-4000-SUB-YMD-FROM-DATE-X.
B10668*    MOVE L1680-INTERNAL-2       TO WUHCO-ENDBR-MTHV-EFF-DT-NUM.
 
      *  VALUATION CALCS NEED THE EXTRA COI    
 
B10668     IF  L9495-EXTRA-COI
B10668         MOVE L9495-RQST-DT      TO WUHCO-ENDBR-MTHV-EFF-DT-NUM           
B10668     ELSE 
B10668         MOVE L9495-RQST-DT      TO L1680-INTERNAL-1                 
B10668         MOVE ZERO               TO L1680-NUMBER-OF-YEARS            
B10668         MOVE 1                  TO L1680-NUMBER-OF-MONTHS           
B10668         MOVE ZERO               TO L1680-NUMBER-OF-DAYS             
B10668         PERFORM  1680-4000-SUB-YMD-FROM-DATE                             
B10668             THRU 1680-4000-SUB-YMD-FROM-DATE-X
B10668         MOVE L1680-INTERNAL-2   TO WUHCO-ENDBR-MTHV-EFF-DT-NUM
           END-IF.
 
           MOVE '99'                   TO WUHCO-ENDBR-CVG-NUM.                
 
           PERFORM UHCO-1000-BROWSE                                             
              THRU UHCO-1000-BROWSE-X.
 
           IF WUHCO-IO-OK
               PERFORM 9495-0550-FETCH-RECORDS                                  
                  THRU 9495-0550-FETCH-RECORDS-X
                  UNTIL NOT WUHCO-IO-OK                                         
               PERFORM UHCO-3000-END-BROWSE                                     
                  THRU UHCO-3000-END-BROWSE-X
           END-IF.
 
       9495-0500-GET-UHCO-DATA-X.
           EXIT.
      /
      *------------------------                                                 
       9495-0550-FETCH-RECORDS.                                                 
      *------------------------                                                 
 
           PERFORM UHCO-2000-READ-NEXT
              THRU UHCO-2000-READ-NEXT-X.

           IF NOT WUHCO-IO-OK                                                   
               GO TO 9495-0550-FETCH-RECORDS-X                                  
           END-IF.

MM0413*
MM0413* IF THE UHCO IS IN 'INITIALIZATION' STATUS THEN THE ROW                  
MM0413* DOES NOT REPRESENT A TRUE COVERAGE SO DO NOT COUNT IT
MM0413*
MM0413     IF RUHCO-MTHV-CVG-STAT-CD = '*' 
MM0413        GO TO 9495-0550-FETCH-RECORDS-X                                  
MM0413     END-IF.
 
           MOVE RUHCO-CVG-NUM                  TO W9495-CVG-CHAR.               
           ADD 1  TO W9495-UHCO-MTH-CNT (W9495-CVG).                            

      *  MTH CNT FIELD USED AS SUBSCRIPT IN A 12 ELMEMENT ARRAY    

B10668*    IF W9495-UHCO-MTH-CNT (W9495-CVG) > 12
B10668     IF W9495-UHCO-MTH-CNT (W9495-CVG) > 13
2DAC01         GO TO 9495-0550-FETCH-RECORDS-X
2DAC01     END-IF.

           MOVE W9495-UHCO-MTH-CNT (W9495-CVG) TO W9495-SUB.                    

           MOVE RUHCO-MTHV-EFF-DT-NUM                                           
             TO W9495-UHCO-MTHV-DT (W9495-CVG W9495-SUB).                       
           MOVE RUHCO-MTHV-CVG-NAR-AMT                                          
             TO W9495-UHCO-NAR-AMT (W9495-CVG W9495-SUB).                       
           MOVE RUHCO-CVG-FACE-AMT                                              
             TO W9495-UHCO-FACE-AMT (W9495-CVG W9495-SUB).                      
           IF RUHCO-MTHV-CVG-STAT-CD = '1'                                      
               MOVE RUHCO-CVG-TOT-DED-AMT                                       
                 TO W9495-UHCO-TOT-DED-AMT (W9495-CVG W9495-SUB)                
           ELSE   
               MOVE 0                                                           
                 TO W9495-UHCO-TOT-DED-AMT (W9495-CVG W9495-SUB)                
           END-IF.
 
       9495-0550-FETCH-RECORDS-X.                                               
           EXIT.
      /
      *-----------------------------                                            
       9495-1000-CALC-RATE-BAND-BON.                                            
      *-----------------------------                                            
 
      *
      *  INITIALIZE FIELDS  
      *
           MOVE 0 TO W9495-AVG-POL-FACE-AMT.                                    
2DAC01*    PERFORM
2DAC01*        VARYING W9495-CVG FROM 1 BY 1                                    
2DAC01*          UNTIL W9495-CVG > RPOL-POL-CVG-REC-CTR-N                       
2DAC01*            MOVE 0 TO W9495-AVG-CVG-FACE-AMT (W9495-CVG)                 
2DAC01*    END-PERFORM.
      
2DAC01     PERFORM
2DAC01         VARYING I FROM 1 BY 1                                    
2DAC01           UNTIL I > RPOL-POL-CVG-REC-CTR-N                       
2DAC01             MOVE 0 TO W9495-AVG-CVG-FACE-AMT (I)                 
2DAC01     END-PERFORM.
      
      *
      *  CALCULATE THE AVG FACE AMT FOR EACH COVERAGE
      *
           PERFORM 9495-1200-CALC-AVG-CVG-FACE                                  
              THRU 9495-1200-CALC-AVG-CVG-FACE-X                                
2DAC01*        VARYING W9495-CVG FROM 1 BY 1                                    
2DAC01*          UNTIL W9495-CVG > RPOL-POL-CVG-REC-CTR-N.                      
2DAC01         VARYING I FROM 1 BY 1                                    
2DAC01           UNTIL I > RPOL-POL-CVG-REC-CTR-N.                      
      
      *
      *  CALCULATE THE RATE BANDING BONUS AMOUNT                                
      *
           PERFORM 9495-1300-CALC-RBB-AMT                                       
              THRU 9495-1300-CALC-RBB-AMT-X
2DAC01*        VARYING W9495-CVG FROM 1 BY 1                                    
2DAC01*          UNTIL W9495-CVG > RPOL-POL-CVG-REC-CTR-N.                      
2DAC01         VARYING I FROM 1 BY 1                                    
2DAC01           UNTIL I > RPOL-POL-CVG-REC-CTR-N.                      
 
           MOVE L9495-RBB-AMT          TO L0289-CRCY-AMT.
           PERFORM  0289-1000-CRCY-RND
               THRU 0289-1000-CRCY-RND-X.
           MOVE L0289-CRCY-AMT         TO L9495-RBB-AMT.
 
       9495-1000-CALC-RATE-BAND-BON-X.                                          
           EXIT.
      /
      *----------------------------                                             
       9495-1200-CALC-AVG-CVG-FACE.                                             
      *----------------------------                                             
 
      *
      *  ONLY INCLUDE LIFE COVERAGES
      *
2DAC01*    MOVE WCVGS-PLAN-ID (W9495-CVG)     TO WPD-PLAN-ID.                   
2DAC01     MOVE WCVGS-PLAN-ID (I)             TO WPD-PLAN-ID.                   
           MOVE RPOL-CO-ID                    TO WPD-CO-ID.
           PERFORM PDIN-1000-PLAN-DEFAULTS-IN                                   
              THRU PDIN-1000-PLAN-DEFAULTS-IN-X.
           IF NOT WPD-IO-OK                                                     
               GO TO 9495-1200-CALC-AVG-CVG-FACE-X                              
           END-IF.
           IF RPD-PLAN-BUS-CLAS-CD NOT = 'L'
               GO TO 9495-1200-CALC-AVG-CVG-FACE-X                              
           END-IF.
 
           MOVE 0 TO W9495-TOT-CVG-FACE-AMT.
 
           PERFORM 9495-1250-TOTAL-FACE-AMTS                                    
              THRU 9495-1250-TOTAL-FACE-AMTS-X                                  
              VARYING W9495-MTH FROM 1 BY 1                                     
2DAC01*         UNTIL W9495-MTH > W9495-UHCO-MTH-CNT (W9495-CVG).          
2DAC01          UNTIL W9495-MTH > W9495-UHCO-MTH-CNT (I)          
B10668*            OR W9495-MTH > 12.               
B10668             OR W9495-MTH > 13.               
 
      *  CHECK MONTH COUNTER FOR > 13 - SET TO 13 TO CALC AVERAGE
2DAC01     MOVE W9495-UHCO-MTH-CNT (I) TO W9495-UHCO-MTH-DIVISOR.
 
B10668*    IF  W9495-UHCO-MTH-CNT (I) > 12                           
B10668*        MOVE 12 TO W9495-UHCO-MTH-DIVISOR
B10668*    END-IF. 
B10668     IF  W9495-UHCO-MTH-CNT (I) > 13                           
B10668         MOVE 13 TO W9495-UHCO-MTH-DIVISOR
2DAC01     END-IF. 
 
MM0219*
MM0219* IF THE CALLING PROGRAM REQUESTS 12 MONTH TYPE AVERAGES
MM0219* THEN THE DIVISIOR MUST BE 12
MM0219*
MM0219     IF L9495-AVG-TYP-12-MOS
MM0219        MOVE 12 TO W9495-UHCO-MTH-DIVISOR
MM0219     END-IF.
 
2DAC01*    IF W9495-UHCO-MTH-CNT (W9495-CVG) NOT = 0                            
2DAC01     IF W9495-UHCO-MTH-DIVISOR NOT = 0                            
               COMPUTE W9495-AVG-POL-FACE-AMT =                                 
                       W9495-AVG-POL-FACE-AMT +                                 
                       W9495-TOT-CVG-FACE-AMT /                                 
2DAC01*                W9495-UHCO-MTH-CNT (W9495-CVG)                           
2DAC01                 W9495-UHCO-MTH-DIVISOR                           
           END-IF.
 
      *
      *  BYPASS COVERAGES ON WAIVER                                             
      *
2DAC01*    IF WCVGS-CVG-CSTAT-CD (W9495-CVG) NOT = '2' AND                      
2DAC01*       W9495-UHCO-MTH-CNT (W9495-CVG) NOT = 0                            
2DAC01*        COMPUTE W9495-AVG-CVG-FACE-AMT (W9495-CVG) =                     
2DAC01*                W9495-TOT-CVG-FACE-AMT /                                 
2DAC01*                W9495-UHCO-MTH-CNT (W9495-CVG)                           
2DAC01*    END-IF.

           IF WCVGS-CVG-CSTAT-CD (I) NOT = '2' AND                      
2DAC01        W9495-UHCO-MTH-CNT (I) NOT = 0                            
2DAC01         COMPUTE W9495-AVG-CVG-FACE-AMT (I) =                     
2DAC01                 W9495-TOT-CVG-FACE-AMT /                                 
2DAC01                 W9495-UHCO-MTH-DIVISOR                           
2DAC01     END-IF.
 
       9495-1200-CALC-AVG-CVG-FACE-X.                                           
           EXIT.
      /
      *--------------------------                                               
       9495-1250-TOTAL-FACE-AMTS.                                               
      *--------------------------                                               
 
      *
      *  WE ONLY INCLUDE CVGS WHOSE NET AMOUNT AT RISK IS GREATER               
      *  THAN 0. SUPPOSEDLY THIS WILL ELIMINATE TERMINATED COVERAGES            
      *  AND WILL INCLUDE COVERAGES ON WAIVER.                                  
      *
2DAC01*    IF W9495-UHCO-NAR-AMT (W9495-CVG W9495-MTH) > 0                      
2DAC01*        COMPUTE W9495-TOT-CVG-FACE-AMT =                                 
2DAC01*                W9495-TOT-CVG-FACE-AMT +                                 
2DAC01*                W9495-UHCO-FACE-AMT (W9495-CVG W9495-MTH)                
2DAC01*    END-IF.

2DAC01     IF W9495-UHCO-NAR-AMT (I W9495-MTH) > 0                      
2DAC01         COMPUTE W9495-TOT-CVG-FACE-AMT =                                 
2DAC01                 W9495-TOT-CVG-FACE-AMT +                                 
2DAC01                 W9495-UHCO-FACE-AMT (I W9495-MTH)                
2DAC01     END-IF.
 
       9495-1250-TOTAL-FACE-AMTS-X.                                             
           EXIT.
      /
      *-----------------------                                                  
       9495-1300-CALC-RBB-AMT.                                                  
      *-----------------------                                                  
 
2DAC01*    IF WCVGS-CVG-CSTAT-CD (W9495-CVG) NOT = '1'                          
2DAC01     IF WCVGS-CVG-CSTAT-CD (I) NOT = '1'                          
02PR62     AND L9495-JOINT-NO
               GO TO 9495-1300-CALC-RBB-AMT-X                                   
           END-IF.
 
2DAC01*    MOVE W9495-CVG              TO I.                                    
           MOVE L9495-RQST-DT          TO L0186-EFF-DT.                         
           PERFORM PLIN-1000-PLAN-HEADER-IN                                     
              THRU PLIN-1000-PLAN-HEADER-IN-X.                                  
           PERFORM 0186-1000-BUILD-PARM-INFO
              THRU 0186-1000-BUILD-PARM-INFO-X.
 
           MOVE W9495-AVG-POL-FACE-AMT TO L0186-TOT-AVAIL-AMT.                  
02AD12     MOVE W9495-AVG-POL-FACE-AMT TO L9495-AVG-FACE-AMT.                   
 
           SET L0186-PLAN-RT-TYP-CBBRB TO TRUE.                                 
           PERFORM 0186-3000-GET-PLRT                                           
              THRU 0186-3000-GET-PLRT-X.
 
           IF NOT L0186-RETRN-OK                                                
               GO TO 9495-1300-CALC-RBB-AMT-X                                   
           END-IF.
 
B10668*    PRORATE THE RBB AMOUNTS FOR EACH COVERAGE TO ACCOUNT FOR THE 
B10668*    VALUATION CALCS THAT OCCUR BETWEEN ANNIVERSARIES  
             
B10668     IF  L9495-PRORATE-RBB-NO   
B10668         COMPUTE L9495-RBB-AMT =                         
B10668                 L9495-RBB-AMT +                                          
B10668                (L0186-RT(1)  *                                          
2DAC01*                W9495-AVG-CVG-FACE-AMT(W9495-CVG) /                     
2DAC01                 W9495-AVG-CVG-FACE-AMT(I) /                         
B10668                 1000000)                                               
B10668     ELSE
B10668         COMPUTE L9495-RBB-AMT =                         
B10668                 L9495-RBB-AMT +                                          
B10668                (L0186-RT(1)  *                                          
B10668                 W9495-AVG-CVG-FACE-AMT(I) /                         
B10668                 1000000 *                                               
B10668                 (W9495-UHCO-MTH-CNT (I) / 12))                          
B10668     END-IF.
 
02PR62
02PR62     IF L9495-JOINT-YES
02PR62     OR RPOL-POL-APP-REASN-JOINT
02PR62        COMPUTE L9495-JOINT-RBB-AMT (I) =                         
02PR62                L9495-JOINT-RBB-AMT (I) +
02PR62               (L0186-RT(1)  *                                          
02PR62                W9495-AVG-CVG-FACE-AMT(I) /                         
02PR62                1000000 *                                               
02PR62                (W9495-UHCO-MTH-CNT (I) / 12))                     
02PR62     END-IF.
 
       9495-1300-CALC-RBB-AMT-X.                                                
           EXIT.
      /
      *-----------------------------                                            
       9495-2000-CALC-COLL-MTHD-BON.                                            
      *-----------------------------                                            
 
      *
      *  DETERMINE IF THERE HAS BEEN ANY LAPSES AND REINSTATEMENTS              
      *
           PERFORM 9495-2100-LOOK-FOR-LAPSES                                    
              THRU 9495-2100-LOOK-FOR-LAPSES-X.
 
      *
      *  GET THE COLLECTION METHOD FOR EACH MONTHLIVERSARY                      
      *
           PERFORM 9495-2200-GET-COLL-METHODS                                   
              THRU 9495-2200-GET-COLL-METHODS-X.
      *
      *  CALCULATE THE COLLECTION METHOD BONUS AMOUNT                           
      *
           PERFORM 9495-2300-CALC-CMB-AMT                                       
              THRU 9495-2300-CALC-CMB-AMT-X
2DAC01*        VARYING W9495-CVG FROM 1 BY 1                                    
2DAC01*          UNTIL W9495-CVG > RPOL-POL-CVG-REC-CTR-N.                      
2DAC01         VARYING I FROM 1 BY 1                                    
2DAC01           UNTIL I > RPOL-POL-CVG-REC-CTR-N.                      
 
           MOVE L9495-CMB-AMT          TO L0289-CRCY-AMT.
           PERFORM  0289-1000-CRCY-RND
               THRU 0289-1000-CRCY-RND-X.
           MOVE L0289-CRCY-AMT         TO L9495-CMB-AMT.
 
       9495-2000-CALC-COLL-MTHD-BON-X.                                          
           EXIT.
      /
      *--------------------------                                               
       9495-2100-LOOK-FOR-LAPSES.                                               
      *--------------------------                                               
 
      *
      *  INITIALIZE LAPSE SAVE FIELDS                                           
      *
EN0121*           PERFORM
EN0121*              VARYING W9495-LAPSE-CNT FROM +1 BY +1                             
EN0121*                UNTIL W9495-LAPSE-CNT > 5                                       
EN0121*                  MOVE SPACES TO W9495-LAPSE-DATES (W9495-LAPSE-CNT)            
EN0121*           END-PERFORM.
EN0121*           MOVE 0 TO W9495-LAPSE-CNT.                                           

      *
      *  SCAN PHST LOOKING FOR LAPSES AND REINSTATEMENTS                        
      *  SINCE THE LAST CASH BACK BONUS WAS PAID                                
      *
           MOVE RPOL-POL-ID           TO WPHST-POL-ID.
           MOVE L9495-RQST-DT         TO L1660-INTERNAL-DATE.
           PERFORM 1660-2000-CONVERT-INT-TO-INV                                 
              THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE   TO WPHST-PCHST-EFF-IDT-NUM.
           MOVE ZEROS                 TO WPHST-PCHST-SEQ-NUM.
           MOVE WPHST-KEY             TO WPHST-ENDBR-KEY.
           MOVE W9495-LAST-CBB-DT     TO L1660-INTERNAL-DATE.
           PERFORM 1660-2000-CONVERT-INT-TO-INV                                 
              THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE   TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.
           MOVE 999                   TO WPHST-ENDBR-PCHST-SEQ-NUM.

           PERFORM PHST-1000-BROWSE                                             
              THRU PHST-1000-BROWSE-X.                                          

           IF NOT WPHST-IO-OK                                                   
               GO TO 9495-2100-LOOK-FOR-LAPSES-X                                
           END-IF.
 
           PERFORM PHST-2000-READ-NEXT                                          
              THRU PHST-2000-READ-NEXT-X.                                       
           PERFORM 9495-2150-SEARCH-PHST                                        
              THRU 9495-2150-SEARCH-PHST-X                                      
              UNTIL NOT WPHST-IO-OK.                                            
           PERFORM PHST-3000-END-BROWSE                                         
              THRU PHST-3000-END-BROWSE-X.                                      

EN0121*           IF W9495-LAPSE-CNT = 0
EN0121*               GO TO 9495-2100-LOOK-FOR-LAPSES-X
EN0121*           END-IF.

EN0121*           IF W9495-LAPSE-DT (W9495-LAPSE-CNT) = SPACES                         
EN0121*              MOVE W9495-LAST-CBB-DT TO W9495-LAPSE-DT(W9495-LAPSE-CNT)         
EN0121*           END-IF.
 
       9495-2100-LOOK-FOR-LAPSES-X.                                             
           EXIT.
      /
      *----------------------                                                   
       9495-2150-SEARCH-PHST.                                                   
      *----------------------                                                   
 
      *
      *  WE ARE ACTUALLY LOOKING FOR REINSTATED LAPSES SINCE WE WON'T           
      *  EVEN GET THIS FAR IF THE POLICY IS STILL LAPSED.                       
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
               GO TO 9495-2150-SEARCH-PHST-X                                    
           END-IF.
 
           IF RPHST-POL-ACTV-TYP-ID = '3901'                                    
EN0121*               ADD 1 TO W9495-LAPSE-CNT
               MOVE RPHST-PCHST-EFF-IDT-NUM TO L1660-INVERTED-DATE              
               PERFORM 1660-3000-CONVERT-INV-TO-INT                             
                  THRU 1660-3000-CONVERT-INV-TO-INT-X                           
EN0121*               MOVE L1660-INTERNAL-DATE                                         
EN0121*                 TO W9495-REINST-DT (W9495-LAPSE-CNT)                           
               PERFORM PHST-2000-READ-NEXT                                      
                  THRU PHST-2000-READ-NEXT-X                                    
               GO TO 9495-2150-SEARCH-PHST-X                                    
           END-IF.
 
           IF RPHST-POL-ACTV-TYP-ID = '3003' AND                                
              RPHST-PCHST-OLD-VALU-TXT = 'B' AND                                
              RPHST-PCHST-NEW-VALU-TXT = '1'                                    
               MOVE RPHST-PCHST-EFF-IDT-NUM TO L1660-INVERTED-DATE              
               PERFORM 1660-3000-CONVERT-INV-TO-INT                             
                  THRU 1660-3000-CONVERT-INV-TO-INT-X                           
EN0121*               IF W9495-LAPSE-CNT = 0                                           
EN0121*                   ADD 1 TO W9495-LAPSE-CNT                                     
EN0121*                   MOVE L9495-RQST-DT                                           
EN0121*                     TO W9495-REINST-DT (W9495-LAPSE-CNT)                       
EN0121*               END-IF                                                           
EN0121*               MOVE L1660-INTERNAL-DATE                                         
EN0121*                 TO W9495-LAPSE-DT (W9495-LAPSE-CNT)                            
           END-IF.
 
           PERFORM PHST-2000-READ-NEXT                                          
              THRU PHST-2000-READ-NEXT-X.                                       
 
       9495-2150-SEARCH-PHST-X.                                                 
           EXIT.
      /
      *---------------------------                                              
       9495-2200-GET-COLL-METHODS.                                              
      *---------------------------                                              
 
      *
      *  INITIALIZE COLLECTION METHOD SAVE FIELDS                               
      *
           PERFORM
              VARYING W9495-CM-CNT FROM +1 BY +1                                
B10668*         UNTIL W9495-CM-CNT > 12                                         
B10668          UNTIL W9495-CM-CNT > 13                                         
                  MOVE SPACES TO W9495-COLCT-MTHDS (W9495-CM-CNT)               
           END-PERFORM.
           MOVE 0 TO W9495-CM-CNT.                                              

      *
      *  SCAN UH TABLE SAVING COLLECTION METHODS                                
      *
           MOVE RPOL-POL-ID          TO WUH-POL-ID.
           MOVE WUH-KEY              TO WUH-ENDBR-KEY.
           MOVE W9495-LAST-CBB-DT    TO WUH-MTHV-EFF-DT-NUM.
           MOVE 00                   TO WUH-MTHV-EFF-DT-NUM-DY.                 
B10668*    MOVE L9495-RQST-DT        TO L1680-INTERNAL-1.                       
B10668*    MOVE ZERO                 TO L1680-NUMBER-OF-YEARS.                  
B10668*    MOVE 1                    TO L1680-NUMBER-OF-MONTHS.                 
B10668*    MOVE ZERO                 TO L1680-NUMBER-OF-DAYS.                   
B10668*    PERFORM  1680-4000-SUB-YMD-FROM-DATE                                 
B10668*        THRU 1680-4000-SUB-YMD-FROM-DATE-X.                              
B10668*    MOVE L1680-INTERNAL-2     TO WUH-ENDBR-MTHV-EFF-DT-NUM.
           
      *  VALUATION CALCS NEED ALL THE MONTHS CBB WAS AWARDED    
 
B10668     IF  L9495-EXTRA-COI
B10668         MOVE L9495-RQST-DT    TO WUH-ENDBR-MTHV-EFF-DT-NUM           
B10668     ELSE 
B10668         MOVE L9495-RQST-DT    TO L1680-INTERNAL-1                 
B10668         MOVE ZERO             TO L1680-NUMBER-OF-YEARS            
B10668         MOVE 1                TO L1680-NUMBER-OF-MONTHS           
B10668         MOVE ZERO             TO L1680-NUMBER-OF-DAYS             
B10668         PERFORM  1680-4000-SUB-YMD-FROM-DATE                             
B10668             THRU 1680-4000-SUB-YMD-FROM-DATE-X
B10668         MOVE L1680-INTERNAL-2 TO WUH-ENDBR-MTHV-EFF-DT-NUM
           END-IF.
 
           PERFORM UH-1000-BROWSE                                               
              THRU UH-1000-BROWSE-X.                                            

           IF NOT WUH-IO-OK
               GO TO 9495-2200-GET-COLL-METHODS-X                               
           END-IF.
       
           PERFORM 9495-2250-SEARCH-UH                                          
              THRU 9495-2250-SEARCH-UH-X
                UNTIL NOT WUH-IO-OK.                                            
           PERFORM UH-3000-END-BROWSE                                           
              THRU UH-3000-END-BROWSE-X.
 
       9495-2200-GET-COLL-METHODS-X.                                            
           EXIT.
      /
      *--------------------                                                     
       9495-2250-SEARCH-UH.                                                     
      *--------------------                                                     
 
      *
      *  SAVE THE COLLECTION METHOD FOR EACH MONTHLIVERSARY THAT                
      *  DID NOT TAKE PLACE WHILE THE POLICY WAS LAPSED                         
      *
           PERFORM UH-2000-READ-NEXT                                            
              THRU UH-2000-READ-NEXT-X.

           IF NOT WUH-IO-OK
               GO TO 9495-2250-SEARCH-UH-X                                      
           END-IF.

           ADD 1 TO W9495-CM-CNT.                                               
 
      *  CM CNT FIELD USED AS SUBSCRIPT IN A 12 ELMEMENT ARRAY    

B10668*    IF W9495-CM-CNT > 12
B10668     IF W9495-CM-CNT > 13
2DAC01         GO TO 9495-2250-SEARCH-UH-X
2DAC01     END-IF.
 
      *    MOVE RCMBC-ISS-DT        TO WS-ISS-DT.                               
      *    MOVE RUH-MTHV-EFF-DT-NUM TO WS-TEST-DT.                              
      *    MOVE WS-ISS-DT-DY        TO WS-TEST-DT-DY.                           
           MOVE 0                   TO K.                                       
           SET WS-BAD-UH-NOT-FOUND  TO TRUE.                                    
           PERFORM 9495-2252-FIND-BAD-UH                                        
              THRU 9495-2252-FIND-BAD-UH-X                                      
              VARYING L FROM 1 BY 1                                             
                UNTIL L > WS-SAVE-UH-MAX                                        
                   OR WS-BAD-UH-FOUND.                                          
 
           MOVE RUH-MTHV-EFF-DT-NUM TO W9495-MTHV-DT (W9495-CM-CNT).            

EN0121*           IF W9495-LAPSE-CNT = 0
EN0121*               IF WS-BAD-UH-FOUND                                               
EN0121*                   MOVE WS-SAVE-UH-CD (K)                                       
EN0121*                     TO W9495-COLCT-MTHD (W9495-CM-CNT)                         
EN0121*               ELSE                                                             
EN0121*                   MOVE RUH-POL-COLCT-MTHD-CD                                   
EN0121*                     TO W9495-COLCT-MTHD (W9495-CM-CNT)                         
EN0121*               END-IF                                                           
EN0121*               GO TO 9495-2250-SEARCH-UH-X                                      
EN0121*           END-IF.
 
EN0121*           MOVE 'N' TO W9495-LAPSE-IND.                                         
EN0121*           PERFORM 9495-2255-LAPSE-CHK                                          
EN0121*              THRU 9495-2255-LAPSE-CHK-X
EN0121*              VARYING W9495-SUB FROM +1 BY +1                                   
EN0121*                UNTIL W9495-SUB > W9495-LAPSE-CNT                               
EN0121*                   OR W9495-LAPSE-IND = 'Y'.                                    

EN0121*           IF W9495-LAPSE-IND = 'N'
EN0121*               IF WS-BAD-UH-FOUND                                               
EN0121*                   MOVE WS-SAVE-UH-CD (K)                                       
EN0121*                     TO W9495-COLCT-MTHD (W9495-CM-CNT)                         
EN0121*               ELSE                                                             
EN0121*                   MOVE RUH-POL-COLCT-MTHD-CD                                   
EN0121*                     TO W9495-COLCT-MTHD (W9495-CM-CNT)                         
EN0121*               END-IF                                                           
EN0121*           END-IF.
 
       9495-2250-SEARCH-UH-X.                                                   
           EXIT.
      /
      *----------------------                                                   
       9495-2252-FIND-BAD-UH.                                                   
      *----------------------                                                   
 
           ADD 1 TO K.
           IF RUH-MTHV-EFF-DT-NUM = WS-SAVE-UH-DT (K)                           
               SET WS-BAD-UH-FOUND TO TRUE   
           END-IF.
 
       9495-2252-FIND-BAD-UH-X.                                                 
           EXIT.
      /
      *--------------------                                                     
       9495-2255-LAPSE-CHK.                                                     
      *--------------------                                                     
 
      *
      *  CHECK THE DATE OF THE MONTHLIVERSARY TO SEE IF IT TOOK                 
      *  PLACE WHILE THE POLICY WAS LAPSED AND IF SO DON'T SAVE                 
      *  THE COLLECTION METHOD                                                  
      *
           MOVE RUH-MTHV-EFF-DT-NUM    TO W9495-TEST-DT.                        
           MOVE RPOL-POL-ISS-EFF-DT-DY TO W9495-TEST-DT-DY.                     
EN0121*           IF W9495-TEST-DT >= W9495-LAPSE-DT (W9495-SUB) AND                   
EN0121*              W9495-TEST-DT <  W9495-REINST-DT (W9495-SUB)                      
EN0121*               MOVE 'Y' TO W9495-LAPSE-IND                                      
EN0121*           END-IF.
 
       9495-2255-LAPSE-CHK-X.                                                   
           EXIT.
      /
      *-----------------------                                                  
       9495-2300-CALC-CMB-AMT.                                                  
      *-----------------------                                                  
 
2DAC01*    MOVE W9495-CVG TO I.                                                
           MOVE L9495-RQST-DT          TO L0186-EFF-DT.                         
           PERFORM PLIN-1000-PLAN-HEADER-IN                                     
              THRU PLIN-1000-PLAN-HEADER-IN-X.                                  
           PERFORM 0186-1000-BUILD-PARM-INFO
              THRU 0186-1000-BUILD-PARM-INFO-X.
 
           SET L0186-PLAN-RT-TYP-CBBCM TO TRUE.                                 
           PERFORM 0186-3000-GET-PLRT                                           
              THRU 0186-3000-GET-PLRT-X.
 
           IF NOT L0186-RETRN-OK                                                
               GO TO 9495-2300-CALC-CMB-AMT-X                                   
           END-IF.
 
           PERFORM 9495-2350-TOTAL-CMB-AMTS                                     
              THRU 9495-2350-TOTAL-CMB-AMTS-X
              VARYING W9495-MTH FROM 1 BY 1                                     
2DAC01*         UNTIL W9495-MTH > W9495-UHCO-MTH-CNT (W9495-CVG).               
2DAC01          UNTIL W9495-MTH > W9495-UHCO-MTH-CNT (I)          
B10668*            OR W9495-MTH > 12.               
B10668             OR W9495-MTH > 13.               
 
       9495-2300-CALC-CMB-AMT-X.                                                
           EXIT.
      /
      *-------------------------                                                
       9495-2350-TOTAL-CMB-AMTS.                                                
      *-------------------------                                                
 
           MOVE 'N' TO W9495-MTHV-IND.                                          
           PERFORM 9495-2355-CALC-BY-COLL-MTHD                                  
              THRU 9495-2355-CALC-BY-COLL-MTHD-X
              VARYING W9495-SUB FROM 1 BY 1                                     
                UNTIL W9495-SUB > W9495-CM-CNT                                  
B10668*            OR W9495-SUB > 12                                  
B10668             OR W9495-SUB > 13                                  
                   OR W9495-MTHV-IND = 'Y'.                                     
 
       9495-2350-TOTAL-CMB-AMTS-X.                                              
           EXIT.
      /
      *----------------------------                                             
       9495-2355-CALC-BY-COLL-MTHD.                                             
      *----------------------------                                             
 
2DAC01*    IF W9495-UHCO-MTHV-DT (W9495-CVG W9495-MTH) NOT =                   
B01088     IF W9495-UHCO-MTHV-DT (I W9495-MTH) NOT =                    
              W9495-MTHV-DT (W9495-SUB)                                         
               GO TO 9495-2355-CALC-BY-COLL-MTHD-X                              
           END-IF.
 
           MOVE 'Y' TO W9495-MTHV-IND.
 
           EVALUATE W9495-COLCT-MTHD (W9495-SUB)
 
               WHEN 'B'                       
                    MOVE 1 TO W9495-RT-COL                          
 
               WHEN 'S'                       
                    MOVE 2 TO W9495-RT-COL                          
 
               WHEN 'L'                       
                    MOVE 3 TO W9495-RT-COL                          
 
               WHEN 'C'                       
                    MOVE 4 TO W9495-RT-COL                          
 
               WHEN 'N'                       
                    MOVE 5 TO W9495-RT-COL                          
 
               WHEN 'P'                       
                    MOVE 6 TO W9495-RT-COL                          
 
               WHEN OTHER                     
                    GO TO 9495-2355-CALC-BY-COLL-MTHD-X                         
 
           END-EVALUATE.
 
           COMPUTE L9495-CMB-AMT =                         
                   L9495-CMB-AMT +                                              
                   (L0186-RT (W9495-RT-COL) *                                   
2DAC01*             W9495-UHCO-TOT-DED-AMT (W9495-CVG W9495-MTH) /              
2DAC01              W9495-UHCO-TOT-DED-AMT (I W9495-MTH) /              
                    100).
                     
02PR62     IF L9495-JOINT-YES
02PR62     OR RPOL-POL-APP-REASN-JOINT
02PR62        COMPUTE L9495-JOINT-CMB-AMT (I) =                         
02PR62                L9495-JOINT-CMB-AMT (I) +                                 
02PR62                (L0186-RT (W9495-RT-COL) *                                
02PR62                 W9495-UHCO-TOT-DED-AMT (I W9495-MTH) /              
02PR62                 100)
02PR62     END-IF.
 
       9495-2355-CALC-BY-COLL-MTHD-X.                                           
           EXIT.
PR006E                                                         
PR006E/                                                        
PR006E*-----------------------------                                            
PR006E 9495-3000-CALC-MED-RIDER-BON.                                            
PR006E*-----------------------------                                            
PR006E                                                         
PR006E*                                                        
PR006E*  INITIALIZE FIELDS                                     
PR006E*                                                        
PR006E     MOVE 0 TO W9495-AVG-POL-COI-AMT.                                    
PR006E                                                         
PR006E     PERFORM                                             
PR006E         VARYING I FROM 1 BY 1                                    
PR006E           UNTIL I > RPOL-POL-CVG-REC-CTR-N                       
PR006E             MOVE 0 TO W9495-AVG-CVG-COI-AMT (I)                 
PR006E     END-PERFORM.                                        
PR006E                                                         
PR006E*                                                        
PR006E*  CALCULATE THE AVG COI AMT FOR EACH COVERAGE          
PR006E*                                                        
PR006E     PERFORM 9495-3200-CALC-AVG-CVG-COI                                  
PR006E        THRU 9495-3200-CALC-AVG-CVG-COI-X                                
PR006E         VARYING I FROM 1 BY 1                                    
PR006E           UNTIL I > RPOL-POL-CVG-REC-CTR-N.                      
PR006E                                                         
PR006E*                                                        
PR006E*  CALCULATE THE MEDICAL RIDER BONUS AMOUNT                           
PR006E*                                                        
PR006E     PERFORM 9495-3300-CALC-MRB-AMT                                       
PR006E        THRU 9495-3300-CALC-MRB-AMT-X                    
PR006E         VARYING I FROM 1 BY 1                                    
PR006E           UNTIL I > RPOL-POL-CVG-REC-CTR-N.                      
PR006E                                                         
PR006E     MOVE L9495-MRB-AMT          TO L0289-CRCY-AMT.      
PR006E     PERFORM  0289-1000-CRCY-RND                         
PR006E         THRU 0289-1000-CRCY-RND-X.                      
PR006E     MOVE L0289-CRCY-AMT         TO L9495-MRB-AMT.       
PR006E                                                         
PR006E 9495-3000-CALC-MED-RIDER-BON-X.                                          
PR006E     EXIT.                                               
PR006E/                                                        
PR006E*---------------------------                                             
PR006E 9495-3200-CALC-AVG-CVG-COI.                                             
PR006E*---------------------------                                             
PR006E                                                         
PR006E*                                                        
PR006E*  ONLY INCLUDE MEDICAL COVERAGES WITHIN CALCULATIONS                    
PR006E*  - CHECK IF COVERAGE PLAN HAS A "PLAN-RT-TYP-CD = CBBMR"
PR006E*    ON THE PLAN RATES TABLE (TPLRT)                        
PR006E*                                                        
PR006E     MOVE L9495-RQST-DT          TO L0186-EFF-DT.                         
PR006E     PERFORM PLIN-1000-PLAN-HEADER-IN                                     
PR006E        THRU PLIN-1000-PLAN-HEADER-IN-X.                                  
PR006E     PERFORM 0186-1000-BUILD-PARM-INFO                   
PR006E        THRU 0186-1000-BUILD-PARM-INFO-X.                
PR006E                                                         
PR006E     MOVE 0                      TO L0186-TOT-AVAIL-AMT.                  
PR006E     SET L0186-PLAN-RT-TYP-CBBMR TO TRUE.                                 
PR006E     PERFORM 0186-3000-GET-PLRT                                           
PR006E        THRU 0186-3000-GET-PLRT-X.                       
PR006E                                                         
PR006E     IF  L0186-RETRN-BAD-PLRT-ACCESS                                      
PR006E         GO TO 9495-3200-CALC-AVG-CVG-COI-X                              
PR006E     END-IF.                                             
PR006E                                                         
PR006E*                                                        
PR006E*  CONTINUE IF MEDICAL COVERAGE PLAN EXISTS ON TPLRT            
PR006E*                                                        
PR006E     MOVE 0 TO W9495-TOT-CVG-COI-AMT.                    
PR006E                                                         
PR006E     PERFORM 9495-3250-TOTAL-COI-AMTS                                    
PR006E        THRU 9495-3250-TOTAL-COI-AMTS-X                                  
PR006E        VARYING W9495-MTH FROM 1 BY 1                                     
PR006E          UNTIL W9495-MTH > W9495-UHCO-MTH-CNT (I)          
PR006E             OR W9495-MTH > 13.                          
PR006E                                                         
PR006E*                                                        
PR006E*  CHECK MONTH COUNTER FOR > 13 - SET TO 13 TO CALC AVERAGE
PR006E*                                                        
PR006E     MOVE W9495-UHCO-MTH-CNT (I) TO W9495-UHCO-MTH-DIVISOR.
PR006E                                                         
PR006E     IF  W9495-UHCO-MTH-CNT (I) > 13                           
PR006E         MOVE 13 TO W9495-UHCO-MTH-DIVISOR               
PR006E     END-IF.                                             
PR006E                                                         
MM0219* 
MM0219* IF THE CALLING PROGRAM REQUESTS 12 MONTH TYPE AVERAGES
MM0219* THEN THE DIVISIOR MUST BE 12                            
MM0219* 
MM0219     IF L9495-AVG-TYP-12-MOS
MM0219        MOVE 12 TO  W9495-UHCO-MTH-DIVISOR
MM0219     END-IF. 
mm0219
PR006E     IF  W9495-UHCO-MTH-DIVISOR NOT = 0                            
PR006E         COMPUTE W9495-AVG-POL-COI-AMT =                                 
PR006E                 W9495-AVG-POL-COI-AMT +                                 
PR006E                 W9495-TOT-CVG-COI-AMT /                                 
PR006E                 W9495-UHCO-MTH-DIVISOR                           
PR006E     END-IF.                                             
PR006E                                                         
PR006E*                                                        
PR006E*  BYPASS COVERAGES ON WAIVER                                             
PR006E*                                                        
PR006E     IF  WCVGS-CVG-CSTAT-CD (I) NOT = '2' AND                      
PR006E         W9495-UHCO-MTH-DIVISOR NOT =  0                            
PR006E         COMPUTE W9495-AVG-CVG-COI-AMT (I) =                     
PR006E                 W9495-TOT-CVG-COI-AMT /                                 
PR006E                 W9495-UHCO-MTH-DIVISOR                           
PR006E     END-IF.                                             
PR006E                                                         
PR006E 9495-3200-CALC-AVG-CVG-COI-X.                                           
PR006E     EXIT.                                               
PR006E/                                                        
PR006E*--------------------------                                               
PR006E 9495-3250-TOTAL-COI-AMTS.                                               
PR006E*--------------------------                                               
PR006E                                                         
PR006E*                                                        
PR006E*  WE ONLY INCLUDE CVGS WHOSE NET AMOUNT AT RISK IS GREATER               
PR006E*  THAN 0. SUPPOSEDLY THIS WILL ELIMINATE TERMINATED COVERAGES            
PR006E*  AND WILL INCLUDE COVERAGES ON WAIVER.                                  
PR006E*                                                        
PR006E     IF  W9495-UHCO-NAR-AMT (I W9495-MTH) > 0                      
PR006E         COMPUTE W9495-TOT-CVG-COI-AMT =                                 
PR006E                 W9495-TOT-CVG-COI-AMT +                                 
PR006E                 W9495-UHCO-TOT-DED-AMT (I W9495-MTH)             
PR006E     END-IF.                                             
PR006E                                                         
PR006E 9495-3250-TOTAL-COI-AMTS-X.                                             
PR006E     EXIT.                                               
PR006E/                                                        
PR006E*-----------------------                                                  
PR006E 9495-3300-CALC-MRB-AMT.                                                  
PR006E*-----------------------                                                  
PR006E                                                         
PR006E     IF  WCVGS-CVG-CSTAT-CD (I) NOT = '1'                          
PR006E     AND L9495-JOINT-NO                                  
PR006E         GO TO 9495-3300-CALC-MRB-AMT-X                                   
PR006E     END-IF.                                             
PR006E                                                         
PR006E     MOVE L9495-RQST-DT          TO L0186-EFF-DT.                         
PR006E     PERFORM PLIN-1000-PLAN-HEADER-IN                                     
PR006E        THRU PLIN-1000-PLAN-HEADER-IN-X.                                  
PR006E     PERFORM 0186-1000-BUILD-PARM-INFO                   
PR006E        THRU 0186-1000-BUILD-PARM-INFO-X.                
PR006E                                                         
PR006E     MOVE W9495-AVG-POL-COI-AMT  TO L0186-TOT-AVAIL-AMT.                  
PR006E     SET L0186-PLAN-RT-TYP-CBBMR TO TRUE.                                 
PR006E     PERFORM 0186-3000-GET-PLRT                                           
PR006E        THRU 0186-3000-GET-PLRT-X.                       
PR006E                                                         
PR006E     IF NOT L0186-RETRN-OK                                                
PR006E         GO TO 9495-3300-CALC-MRB-AMT-X                                   
PR006E     END-IF.                                             
PR006E                                                         
MM1641     IF L9495-PRORATE-MRB-NO
MM1641        COMPUTE L9495-MRB-AMT =                             
MM1641                L9495-MRB-AMT +                                          
MM1641                (L0186-RT(1)  *                                          
MM1641                 W9495-AVG-CVG-COI-AMT(I) /                         
MM1641                 100)                                           
MM1641     ELSE
MM1641        COMPUTE L9495-MRB-AMT =                             
MM1641                L9495-MRB-AMT +                                          
MM1641                (L0186-RT(1)  *                                          
MM1641                 W9495-AVG-CVG-COI-AMT(I) /                         
MM1641                 100 *                                         
MM1641                 (W9495-UHCO-MTH-CNT (I) / 12))                     
MM1641     END-IF.                                      
            
MM1641*PR006E     COMPUTE L9495-MRB-AMT =                             
MM1641*PR006E             L9495-MRB-AMT +                                       
MM1641*PR006E             (L0186-RT(1)  *                                       
MM1641*PR006E              W9495-AVG-CVG-COI-AMT(I) /                         
MM1641*MM489B              100).                                           
MM489B*MM0489              1000000).                                           
MM0489*PR006E              100  *                                              
MM0489*PR006E             (W9495-UHCO-MTH-CNT (I) / 12)).                       
PR006E                                                         
PR006E*                                                        
PR006E     IF  L9495-JOINT-YES                                 
PR006E     OR  RPOL-POL-APP-REASN-JOINT                        
PR006E         COMPUTE L9495-JOINT-MRB-AMT (I) =                         
PR006E                 L9495-JOINT-MRB-AMT (I) +               
PR006E                 (L0186-RT(1)  *                                          
PR006E                  W9495-AVG-CVG-COI-AMT(I) /                         
PR006E                  100  *                                               
PR006E                 (W9495-UHCO-MTH-CNT (I) / 12))                     
PR006E     END-IF.                                             
PR006E                                                         
PR006E 9495-3300-CALC-MRB-AMT-X.                                                
PR006E     EXIT.                                               
PR006E                                                         
 
      *****************************************************************
      **                 END OF COPYBOOK CCPP9495                    **
      *****************************************************************
 
       COPY CCPPMIDT.
       COPY CCPPPDIN.
       COPY CCPPPLIN.
       COPY NCPPCVGS.
 
      *******  I/O ROUTINES

       COPY CCPNPOL.
       COPY CCPNCVG.
       COPY CCPNPD.
       COPY CCPNPH.
       COPY CCPBUH.
       COPY CCPBUHCO.
       COPY CCPBCFLW.
       COPY CCPBPHST.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

54-001 COPY CCPL0010.
54-001 COPY CCPS0010.
      /
       COPY CCPS9495.
       COPY CCPSPGA.
      /
       COPY CCPS0186.
       COPY CCPL0186.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL0289.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBC                     **         
      *****************************************************************
