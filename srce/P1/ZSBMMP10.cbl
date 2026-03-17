      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMMP10.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMMP10                                         **         
      **  REMARKS:  INITIALIZE A NEW NON-RENEWAL CONVERSION-P AMOUNT **         
      **            FIELD ON THE UHCO TABLE                          **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      /
       DATA DIVISION.
       FILE SECTION.
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMMP10'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.

       01  SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.
           05  WS-UHCO-SUB               PIC S9(4) COMP.
           05  WS-UHCO-CNT               PIC S9(4) COMP.
           05  WS-CVG-NUM                PIC 9(2).          
           05  WS-TOT-UHCO               PIC 9(10).         
           05  WS-TOT-CVG-01             PIC 9(10).         
           05  WS-TOT-ZERO-COI           PIC 9(10).         
           05  WS-TOT-NON-ZERO-P         PIC 9(10).         
           05  WS-TOT-UPDT               PIC 9(10).         
           05  WS-COMMIT-CNT             PIC S9(4) COMP.
           05  WS-PRINT-CNT              PIC S9(4) COMP.

       01  WORK-AREAS.
           05  WS-TEST-PLAN-ID           PIC X(06).              
               88  WS-TERM-RIDER         VALUE                   
                     '41400' '41500' '41501' '41600' '41601'     
                     '46300' '46400' '46500'.                    
           05  WS-MTHV-EFF-DT            PIC X(10).                             
           05  WS-MTHV-EFF-DT-R          REDEFINES                              
               WS-MTHV-EFF-DT.                                                  
               10  WS-MTHV-EFF-DT-YR     PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-MTHV-EFF-DT-MO     PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-MTHV-EFF-DT-DY     PIC 9(02).                             
           05  WS-SAVE-RETRN-CD          PIC S9(04)      COMP.
           05  WS-SAVE-RT                PIC S9(09)V9(6) COMP-3.
           05  WS-COMPUTE-CHARGE         PIC S9(11)V9(6) COMP-3.
           05  WS-ANN-COI                PIC S9(13)V9(2) COMP-3.
           05  WS-LMT-ANN-COI            PIC S9(13)V9(2) COMP-3.
           05  WS-AMT-LOAD               PIC S9(13)V9(2) COMP-3.
           05  WS-CNVR-P-AMT             PIC S9(13)V9(2) COMP-3.
           05  WS-UHCO-REC               OCCURS 6000 TIMES.                     
               10  WS-UHCO-KEY           PIC X(24).                         
               10  WS-UHCO-AMT           PIC S9(13)V9(2) COMP-3.            

       01  WS-UPDATE-LINE.                                                      
           05  WS-UPDATE-KEY             PIC X(24).                             
           05  FILLER                    PIC X(01).                             
           05  WS-UPDATE-MESSAGE         PIC X(24).                             
           05  FILLER                    PIC X(01).                             
           05  WS-UPDATE-OLD-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  WS-UPDATE-TO              PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  WS-UPDATE-NEW-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(52).                             

       01  WS-TOTAL-LINE.                                                       
           05  WS-TOTAL-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-TOTAL-AMT              PIC 9(10).                             
           05  FILLER                    PIC X(71).                             

       01  WS-ERROR-LINE.                                                       
           05  WS-ERROR-POL-ID           PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-CVG-NUM          PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATE             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATA             PIC X(06).                             
           05  FILLER                    PIC X(50).                             

       COPY CCFWPH.
       COPY CCFRPH.

       COPY CCFWPOL.
       COPY CCFRPOL.

       COPY CCFWCVG.
       COPY CCFRCVG.
       COPY CCWWCVGS.

       COPY CCFWUHCO.                                                           
       COPY CCFRUHCO.                                                           

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY XCWL0035.
       COPY XCWL0040.
       COPY XCWL0289.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY CCWL0186.
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

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMMP10'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMMP10'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

           MOVE LOW-VALUES          TO WPOL-KEY.
           MOVE HIGH-VALUES         TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

           MOVE 0 TO WS-TOT-UHCO.         
           MOVE 0 TO WS-TOT-CVG-01.         
           MOVE 0 TO WS-TOT-ZERO-COI.         
           MOVE 0 TO WS-TOT-NON-ZERO-P.         
           MOVE 0 TO WS-TOT-UPDT.         

           MOVE 0 TO WS-COMMIT-CNT.       
           MOVE 0 TO WS-PRINT-CNT.       

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

           IF RPOL-POL-STAT-BEFORE-SETL                                         
               GO TO 2000-PROCESS-POL-RECS-X                                    
           END-IF.

           MOVE RPOL-POL-ID         TO  LPGA-POLICY-NUMBER.                     

           PERFORM CVGS-1000-LOAD-CVGS-ARRAY
              THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           MOVE LOW-VALUES          TO WUHCO-KEY.                               
           MOVE RPOL-POL-ID         TO WUHCO-POL-ID.                            
           MOVE HIGH-VALUES         TO WUHCO-ENDBR-KEY.
           MOVE RPOL-POL-ID         TO WUHCO-ENDBR-POL-ID.                      

           MOVE '2000-01-00'        TO WUHCO-MTHV-EFF-DT-NUM.
           MOVE '2005-04-00'        TO WUHCO-ENDBR-MTHV-EFF-DT-NUM.
      *    IF NOT RPOL-MY-KEMPO-TYP-MATURITY
      *        MOVE RPOL-POL-ISS-EFF-DT TO L1680-INTERNAL-1 
      *        MOVE ZERO                TO L1680-NUMBER-OF-YEARS 
      *        MOVE 11                  TO L1680-NUMBER-OF-MONTHS 
      *        MOVE ZERO                TO L1680-NUMBER-OF-DAYS 
      *        PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
      *            THRU 1680-3000-ADD-Y-M-D-TO-DATE-X 
      *        MOVE L1680-INTERNAL-2    TO WUHCO-MTHV-EFF-DT-NUM 
      *    END-IF.
 
           PERFORM UHCO-1000-BROWSE                                             
              THRU UHCO-1000-BROWSE-X.                                          

           IF NOT WUHCO-IO-OK
               GO TO 2000-PROCESS-POL-RECS-X                                    
           END-IF.
       
           MOVE 0 TO WS-UHCO-CNT.                                               
       
           PERFORM 2100-SEARCH-UHCO                                             
              THRU 2100-SEARCH-UHCO-X                                           
                UNTIL NOT WUHCO-IO-OK.                                          
       
           PERFORM UHCO-3000-END-BROWSE                                         
              THRU UHCO-3000-END-BROWSE-X.

      *    LOOP THRU ARRAY UPDATING UHCO RECORDS                                
       
           PERFORM 2200-UPDATE-UHCO                                             
              THRU 2200-UPDATE-UHCO-X                                           
              VARYING WS-UHCO-SUB FROM 1 BY 1                                 
                UNTIL WS-UHCO-SUB > WS-UHCO-CNT                                 
                   OR WS-ERRORS-FOUND.                                          
       
       2000-PROCESS-POL-RECS-X.                                                 
           EXIT.

      *-----------------                                                        
       2100-SEARCH-UHCO.                                                        
      *-----------------                                                        

           PERFORM UHCO-2000-READ-NEXT                                          
              THRU UHCO-2000-READ-NEXT-X.

           IF NOT WUHCO-IO-OK
               GO TO 2100-SEARCH-UHCO-X                                         
           END-IF.

           ADD 1 TO WS-TOT-UHCO.         

           IF RUHCO-CVG-NUM = '01'                                              
               ADD 1 TO WS-TOT-CVG-01 
               GO TO 2100-SEARCH-UHCO-X                                         
           END-IF.

      *    IF RUHCO-NO-RENW-CNVR-P-AMT NOT = 0                                  
      *        ADD 1 TO WS-TOT-NON-ZERO-P 
      *        GO TO 2100-SEARCH-UHCO-X                                         
      *    END-IF.

      *    IF RUHCO-CVG-TOT-DED-AMT = 0                                  
      *        ADD 1 TO WS-TOT-ZERO-COI 
      *        GO TO 2100-SEARCH-UHCO-X                                         
      *    END-IF.

           PERFORM 2150-CALC-CNVR-P-AMT                                         
              THRU 2150-CALC-CNVR-P-AMT-X.

           ADD 1 TO WS-UHCO-CNT.
           MOVE RUHCO-KEY TO WS-UHCO-KEY (WS-UHCO-CNT).
           MOVE WS-CNVR-P-AMT TO WS-UHCO-AMT (WS-UHCO-CNT).

       2100-SEARCH-UHCO-X.                                                      
           EXIT.

      *---------------------
       2150-CALC-CNVR-P-AMT.
      *---------------------

           IF RUHCO-CVG-TOT-DED-AMT = 0                                  
               ADD 1 TO WS-TOT-ZERO-COI 
               MOVE 0 TO WS-CNVR-P-AMT
               GO TO 2150-CALC-CNVR-P-AMT-X                                     
           END-IF.

           COMPUTE WS-AMT-LOAD =
                   RUHCO-CVG-TOT-DED-AMT               
                 - RUHCO-SSTD-MORT-CHRG-AMT.
      
           MOVE RUHCO-CVG-NUM             TO WS-CVG-NUM.
           MOVE WS-CVG-NUM                TO I.
      
           PERFORM  PLIN-1000-PLAN-HEADER-IN
               THRU PLIN-1000-PLAN-HEADER-IN-X.
           IF NOT WPH-IO-OK
               MOVE 'Y' TO WS-ERROR-SW
               MOVE SPACES                  TO WS-ERROR-LINE          
               MOVE RPOL-POL-ID             TO WS-ERROR-POL-ID        
               MOVE RUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
               MOVE RUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
               MOVE '*** ERROR READING PLAN ***'              
                                            TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
               PERFORM 0040-3000-WRITE-OTHER                              
                  THRU 0040-3000-WRITE-OTHER-X                             
               GO TO 2150-CALC-CNVR-P-AMT-X
           END-IF.
      
           PERFORM  0186-1000-BUILD-PARM-INFO
               THRU 0186-1000-BUILD-PARM-INFO-X.
           MOVE 'DRCOM'                   TO L0186-PLAN-RT-TYP-CD.
           MOVE WCVGS-CVG-ISS-EFF-DT (I)  TO L0186-EFF-DT.
      *    MOVE RUHCO-MTHV-EFF-DT-NUM     TO WS-MTHV-EFF-DT.
      *    MOVE WCVGS-CVG-ISS-EFF-DT-DY (I) TO WS-MTHV-EFF-DT-DY.
      *    MOVE WS-MTHV-EFF-DT            TO L0186-EFF-DT.
           PERFORM  2153-CALC-COMM-RHDR
               THRU 2153-CALC-COMM-RHDR-X.
           MOVE WS-COMPUTE-CHARGE         TO WS-CNVR-P-AMT.

       2150-CALC-CNVR-P-AMT-X.
           EXIT.
      /
      *--------------------
       2153-CALC-COMM-RHDR.
      *--------------------

           MOVE ZERO                    TO WS-COMPUTE-CHARGE.
      *
      * OBTAIN THE COMMISSION RATES
      *
      *    PERFORM  2330-1230-BUILD-0186-PARMS
      *        THRU 2330-1230-BUILD-0186-PARMS-X.
          
           PERFORM  0186-3000-GET-PLRT
               THRU 0186-3000-GET-PLRT-X.

           EVALUATE TRUE
       
               WHEN L0186-RETRN-OK
      
                    COMPUTE L0289-CRCY-AMT =
                        L0186-RT (4) * WS-AMT-LOAD /100 * 12
      
      *        SAVE THE CURRENT RATE & RETURN CODE
                    MOVE L0186-RT(4)       TO WS-SAVE-RT
      *             MOVE L0186-RETRN-CD    TO WS-SAVE-RETRN-CD
      
      *        TEST FOR CONVERSION P LIMIT
                    PERFORM 2155-CHECK-CNVR-P-LIMIT
                       THRU 2155-CHECK-CNVR-P-LIMIT-X
      
      *        RESTORE THE SAVED RATE & RETURN CODE
      *             MOVE WS-SAVE-RT        TO L0186-RT(4)
      *             MOVE WS-SAVE-RETRN-CD  TO L0186-RETRN-CD
      
                    PERFORM  0289-1000-CRCY-RND
                        THRU 0289-1000-CRCY-RND-X
        
                    MOVE L0289-CRCY-AMT TO WS-COMPUTE-CHARGE
      
               WHEN L0186-RETRN-BAD-PLRT-ACCESS
                    CONTINUE                         
      
               WHEN L0186-RETRN-BAD-RHDR-ACCESS
                    MOVE 'Y' TO WS-ERROR-SW
                    MOVE SPACES                  TO WS-ERROR-LINE          
                    MOVE RPOL-POL-ID             TO WS-ERROR-POL-ID        
                    MOVE RUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
                    MOVE RUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
                    MOVE '*** COMMISSION RHDR NOT FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
                    MOVE L0186-ID                TO WS-ERROR-DATA
                    MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
                    PERFORM 0040-3000-WRITE-OTHER                              
                       THRU 0040-3000-WRITE-OTHER-X                             
       
               WHEN L0186-RETRN-BAD-RLTB-ACCESS
                    MOVE 'Y' TO WS-ERROR-SW
                    MOVE SPACES                  TO WS-ERROR-LINE          
                    MOVE RPOL-POL-ID             TO WS-ERROR-POL-ID        
                    MOVE RUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
                    MOVE RUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
                    MOVE '*** COMMISSION RLTB NOT FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
                    MOVE L0186-ID                TO WS-ERROR-DATA
                    MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
                    PERFORM 0040-3000-WRITE-OTHER                              
                       THRU 0040-3000-WRITE-OTHER-X                             
      
               WHEN L0186-RETRN-BAD-LGAS-ACCESS
                    MOVE 'Y' TO WS-ERROR-SW
                    MOVE SPACES                  TO WS-ERROR-LINE          
                    MOVE RPOL-POL-ID             TO WS-ERROR-POL-ID        
                    MOVE RUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
                    MOVE RUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
                    MOVE '*** COMMISSION LCGP NOT FOUND ***'              
                                                 TO WS-ERROR-MESSAGE            
                    MOVE L0186-ID                TO WS-ERROR-DATA
                    MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
                    PERFORM 0040-3000-WRITE-OTHER                              
                       THRU 0040-3000-WRITE-OTHER-X                             
        
            END-EVALUATE.

       2153-CALC-COMM-RHDR-X.
           EXIT.
      /
      *---------------------------
      *2330-1230-BUILD-0186-PARMS.
      *---------------------------
      *
      *    MOVE L2330-MTHV-POL-DB-OPT-CD      TO L0186-DB-OPT-CD.
      *    MOVE L2330-MTHV-TOT-AVAIL-AMT      TO L0186-TOT-AVAIL-AMT.
      * 
      *    PERFORM
      *        VARYING L0186-CVG FROM 1 BY 1
      *        UNTIL   L0186-CVG > L0186-CVG-REC-CTR
      *
      *        MOVE L2330-MTHV-CVG-SUPP-BNFT-CD (L0186-CVG)
      *                       TO L0186-CVG-SUPP-BNFT-CD (L0186-CVG)
      *
      *    END-PERFORM.
      *
      *2330-1230-BUILD-0186-PARMS-X.
      *    EXIT.
      /
      *------------------------
       2155-CHECK-CNVR-P-LIMIT.
      *------------------------
      
      * CHECK FOR CONVERSION P LIMIT OF ANNUAL COI RATE,
      * IF NO PLRT ENTRY THEN NO PROBLEM - RATES DON'T APPLY.
       
           MOVE WCVGS-PLAN-ID (I)         TO WS-TEST-PLAN-ID.
           IF NOT WS-TERM-RIDER                                  
               GO TO 2155-CHECK-CNVR-P-LIMIT-X
           END-IF.                                               
       
      *    MOVE RUHCO-MTHV-EFF-DT-NUM     TO WS-MTHV-EFF-DT.
      *    MOVE WCVGS-CVG-ISS-EFF-DT-DY (I)  TO WS-MTHV-EFF-DT-DY.
      *    MOVE WS-MTHV-EFF-DT            TO L0186-EFF-DT.
      *    PERFORM  0186-1000-BUILD-PARM-INFO
      *        THRU 0186-1000-BUILD-PARM-INFO-X.
      *    SET L0186-PLAN-RT-TYP-CNVPL TO TRUE.
       
      *    PERFORM  0186-3000-GET-PLRT
      *        THRU 0186-3000-GET-PLRT-X.
      
      *    EVALUATE TRUE
      *
      *        WHEN L0186-RETRN-OK
      *             CONTINUE
      *
      *        WHEN L0186-RETRN-BAD-PLRT-ACCESS
      *             GO TO 2155-CHECK-CNVR-P-LIMIT-X
      *
      *        WHEN L0186-RETRN-BAD-RHDR-ACCESS
      *             MOVE 'Y' TO WS-ERROR-SW
      *             MOVE SPACES                  TO WS-ERROR-LINE          
      *             MOVE RPOL-POL-ID             TO WS-ERROR-POL-ID        
      *             MOVE RUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
      *             MOVE RUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
      *             MOVE '*** CNVR-P LIMIT RHDR NOT FOUND ***'              
      *                                          TO WS-ERROR-MESSAGE            
      *             MOVE L0186-ID                TO WS-ERROR-DATA
      *             MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
      *             PERFORM 0040-3000-WRITE-OTHER                              
      *                THRU 0040-3000-WRITE-OTHER-X                             
      *
      *        WHEN L0186-RETRN-BAD-RLTB-ACCESS
      *             MOVE 'Y' TO WS-ERROR-SW
      *             MOVE SPACES                  TO WS-ERROR-LINE          
      *             MOVE RPOL-POL-ID             TO WS-ERROR-POL-ID        
      *             MOVE RUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
      *             MOVE RUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
      *             MOVE '*** CNVR-P LIMIT RLTB NOT FOUND ***'              
      *                                          TO WS-ERROR-MESSAGE            
      *             MOVE L0186-ID                TO WS-ERROR-DATA
      *             MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
      *             PERFORM 0040-3000-WRITE-OTHER                              
      *                THRU 0040-3000-WRITE-OTHER-X                             
      *
      *        WHEN L0186-RETRN-BAD-LGAS-ACCESS
      *             MOVE 'Y' TO WS-ERROR-SW
      *             MOVE SPACES                  TO WS-ERROR-LINE          
      *             MOVE RPOL-POL-ID             TO WS-ERROR-POL-ID        
      *             MOVE RUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
      *             MOVE RUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
      *             MOVE '*** CNVR-P LIMIT LGAS NOT FOUND ***'              
      *                                          TO WS-ERROR-MESSAGE            
      *             MOVE L0186-ID                TO WS-ERROR-DATA
      *             MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
      *             PERFORM 0040-3000-WRITE-OTHER                              
      *                THRU 0040-3000-WRITE-OTHER-X                             
      *
      *    END-EVALUATE.
      
      * CALCULATE THE ANNUAL COI CHARGE, THE LIMIT OF ANNUAL COI CHARGE,
      * AND COMPARE. IF THE ANNUAL COI CHARGE IS GREATER THEN RECALCU-
      * LATE THE CHARGE USING THE LIMIT.
      
           COMPUTE WS-ANN-COI = WS-AMT-LOAD * 12
      
           COMPUTE WS-LMT-ANN-COI
      *          = L0186-RT (1)
                 = 20000        
                 * WCVGS-CVG-FACE-AMT (I)
                 / WCVGS-CVG-UNIT-VALU-AMT (I).
       
           IF  WS-ANN-COI > WS-LMT-ANN-COI
               COMPUTE  L0289-CRCY-AMT
                     =  WS-SAVE-RT      
                     *  WS-LMT-ANN-COI
                     /  100
           END-IF.
      
       2155-CHECK-CNVR-P-LIMIT-X.
           EXIT.

      *-----------------
       2200-UPDATE-UHCO.
      *-----------------

           MOVE WS-UHCO-KEY (WS-UHCO-SUB) TO WUHCO-KEY.

           PERFORM UHCO-1000-READ-FOR-UPDATE
              THRU UHCO-1000-READ-FOR-UPDATE-X.

           IF NOT WUHCO-IO-OK
               MOVE 'Y' TO WS-ERROR-SW
               MOVE SPACES                  TO WS-ERROR-LINE          
               MOVE WUHCO-POL-ID            TO WS-ERROR-POL-ID        
               MOVE WUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
               MOVE WUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
               MOVE '*** ERROR ON UHCO READ FOR UPDATE ***'              
                                            TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
               PERFORM 0040-3000-WRITE-OTHER                              
                  THRU 0040-3000-WRITE-OTHER-X                             
               GO TO 2200-UPDATE-UHCO-X
           END-IF.

           MOVE WS-UHCO-AMT (WS-UHCO-SUB) TO RUHCO-NO-RENW-CNVR-P-AMT.

           PERFORM UHCO-2000-REWRITE
              THRU UHCO-2000-REWRITE-X.

           IF NOT WUHCO-IO-OK
               MOVE 'Y' TO WS-ERROR-SW
               MOVE SPACES                  TO WS-ERROR-LINE          
               MOVE WUHCO-POL-ID            TO WS-ERROR-POL-ID        
               MOVE WUHCO-CVG-NUM           TO WS-ERROR-CVG-NUM
               MOVE WUHCO-MTHV-EFF-DT-NUM   TO WS-ERROR-DATE          
               MOVE '*** ERROR ON UHCO REWRITE ***'              
                                            TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE           TO L0040-INPUT-LINE       
               PERFORM 0040-3000-WRITE-OTHER                              
                  THRU 0040-3000-WRITE-OTHER-X                             
               GO TO 2200-UPDATE-UHCO-X
           END-IF.

           ADD 1 TO WS-COMMIT-CNT.
           IF WS-COMMIT-CNT > 1000
               PERFORM  0035-1000-COMMIT
                   THRU 0035-1000-COMMIT-X 
               MOVE 0 TO WS-COMMIT-CNT
           END-IF.

           ADD 1 TO WS-TOT-UPDT.
           MOVE SPACES                  TO WS-UPDATE-LINE.          
           MOVE RUHCO-KEY               TO WS-UPDATE-KEY.        
           MOVE 'UHCO RECORD UPDATED FROM'              
                                        TO WS-UPDATE-MESSAGE.            
           MOVE RUHCO-CNVR-P-AMT        TO WS-UPDATE-OLD-AMT.        
           MOVE 'TO'                    TO WS-UPDATE-TO.        
           MOVE RUHCO-NO-RENW-CNVR-P-AMT TO WS-UPDATE-NEW-AMT.        
           MOVE WS-UPDATE-LINE          TO L0040-INPUT-LINE.       
           ADD 1 TO WS-PRINT-CNT.
           IF WS-PRINT-CNT > 9000
               PERFORM 0040-3000-WRITE-OTHER                              
                  THRU 0040-3000-WRITE-OTHER-X                             
               MOVE 0 TO WS-PRINT-CNT
           END-IF.

       2200-UPDATE-UHCO-X.
           EXIT.

      *--------------
       9000-FINALIZE.
      *--------------
           PERFORM POL-3000-TBL-END-BROWSE                                      
              THRU POL-3000-TBL-END-BROWSE-X.                                   

           MOVE SPACES                  TO WS-TOTAL-LINE.         
           MOVE 'TOTAL UHCO RECORDS READ '             
                                        TO WS-TOTAL-MESSAGE.           
           MOVE WS-TOT-UHCO             TO WS-TOTAL-AMT.
           MOVE WS-TOTAL-LINE           TO L0040-INPUT-LINE.      
           PERFORM 0040-3000-WRITE-OTHER                              
              THRU 0040-3000-WRITE-OTHER-X.                            

           MOVE SPACES                  TO WS-TOTAL-LINE.         
           MOVE 'TOTAL CVG 01 RECORDS '             
                                        TO WS-TOTAL-MESSAGE.           
           MOVE WS-TOT-CVG-01           TO WS-TOTAL-AMT.
           MOVE WS-TOTAL-LINE           TO L0040-INPUT-LINE.      
           PERFORM 0040-3000-WRITE-OTHER                              
              THRU 0040-3000-WRITE-OTHER-X.                            

           MOVE SPACES                  TO WS-TOTAL-LINE.         
           MOVE 'TOTAL ZERO COI RECORDS '             
                                        TO WS-TOTAL-MESSAGE.           
           MOVE WS-TOT-ZERO-COI         TO WS-TOTAL-AMT.
           MOVE WS-TOTAL-LINE           TO L0040-INPUT-LINE.      
           PERFORM 0040-3000-WRITE-OTHER                              
              THRU 0040-3000-WRITE-OTHER-X.                            

      *    MOVE SPACES                  TO WS-TOTAL-LINE.         
      *    MOVE 'TOTAL NON ZERO CNVR P RECORDS '             
      *                                 TO WS-TOTAL-MESSAGE.           
      *    MOVE WS-TOT-NON-ZERO-P       TO WS-TOTAL-AMT.
      *    MOVE WS-TOTAL-LINE           TO L0040-INPUT-LINE.      
      *    PERFORM 0040-3000-WRITE-OTHER                              
      *       THRU 0040-3000-WRITE-OTHER-X.                            

           MOVE SPACES                  TO WS-TOTAL-LINE.         
           MOVE 'TOTAL UHCO RECORDS UPDATED '             
                                        TO WS-TOTAL-MESSAGE.           
           MOVE WS-TOT-UPDT             TO WS-TOTAL-AMT.
           MOVE WS-TOTAL-LINE           TO L0040-INPUT-LINE.      
           PERFORM 0040-3000-WRITE-OTHER                              
              THRU 0040-3000-WRITE-OTHER-X.                            

      *    DISPLAY 'AC RECORDS READ  ' AC-REC-READ.
      *    DISPLAY 'EXTRACTS WRITTEN ' AC-REP-WRITE.
       9000-FINALIZE-X.
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  PERFORMED ROUTINES
       COPY NCPPCVGS.
       
       COPY CCPPMIDT.

       COPY CCPPPLIN.

      *******  I/O ROUTINES

       COPY CCPNPH.
       COPY CCPTPOL.
       COPY CCPNCVG.
       COPY CCPBUHCO.                                                           
       COPY CCPUUHCO.                                                           

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.

       COPY CCPSPGA.

       COPY CCPS0186.
       COPY CCPL0186.

       COPY XCPL0030.
       COPY XCPL0035.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL0289.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMMP10                     **         
      *****************************************************************
