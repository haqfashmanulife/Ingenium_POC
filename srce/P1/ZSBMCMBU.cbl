      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBU.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBU                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF POLICY NUMBERS**
      **            AND DATES AND WILL UNDO THE POLICY BACK TO THE   **
      **            UNDO DATE                                        **
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
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBU'.

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
           05  WS-RUN-DT                 PIC X(10) VALUE '2004-03-24'.          
           05  WS-JRNL-DT                PIC X(10) VALUE '2004-03-24'.          
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

       COPY CCFWPOL.
       COPY CCFRPOL.
       COPY CCFHPOL.

       COPY CCFWCVG.
       COPY CCFRCVG.
       COPY CCWWCVGS.
       COPY CCFHCVGS.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY CCWL4750.
      *COPY CCWL0201.
       COPY XCWL0035.
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

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMCMBU'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMCMBU'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          
      *    MOVE WS-RUN-DT            TO WGLOB-SYSTEM-DATE-INT.                  
           MOVE WS-RUN-DT            TO WGLOB-PROCESS-DATE.                     

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

           MOVE WS-JRNL-DT           TO LPGA-JRNL-DT.                           

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

           MOVE RULST-POL-ID           TO WPOL-POL-ID.

           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.

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

           PERFORM CVGS-1000-LOAD-CVGS-ARRAY
              THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           IF NOT WCVG-IO-OK
               PERFORM  POL-3000-UNLOCK
                   THRU POL-3000-UNLOCK-X
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE RPOL-REC-INFO     TO HPOL-REC-INFO.
           MOVE WCVGS-WORK-AREA   TO HCVGS-WORK-AREA.

           PERFORM  4750-1000-BUILD-PARM-INFO                                   
               THRU 4750-1000-BUILD-PARM-INFO-X.                                
           MOVE RULST-UNDO-DT TO L4750-EFF-DT.                                  
           IF L4750-EFF-DT = RPOL-POL-ISS-EFF-DT                                
      *  WE WANT TO BY-PASS REVERSING THE INITIAL PREMIUM
               SET  L4750-TCNTRCT-PREM-REVRS-BPSS TO TRUE                       
           END-IF.                                                              
      *    SET  L4750-PRCES-EXCLUSIVE        TO TRUE.                           
           PERFORM  4750-1000-UNDO-PROCESSING                                   
               THRU 4750-1000-UNDO-PROCESSING-X.                                

           IF NOT L4750-RETRN-OK                                                
               MOVE SPACES                       TO WS-OUTPUT-LINE              
               MOVE RULST-POL-ID                 TO WS-OUTPUT-POL-ID            
               MOVE '***** UNDO FAILED *****'                                   
                                                 TO WS-OUTPUT-MESSAGE           
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
           END-IF.

      *    IF L4750-RETRN-OK                                                    
      *        MOVE RULST-REDO-DT  TO L0201-EFF-DT                              
      *
      *        PERFORM  0201-1000-AUTO-PROCESSING                               
      *            THRU 0201-1000-AUTO-PROCESSING-X                             
      *
      *        IF L0201-RETRN-ERROR                                             
      *            MOVE SPACES                   TO WS-OUTPUT-LINE              
      *            MOVE RULST-POL-ID             TO WS-OUTPUT-POL-ID            
      *            MOVE 'REDO FAILED'                                           
      *                                          TO WS-OUTPUT-MESSAGE           
      *            MOVE WS-OUTPUT-LINE           TO L0040-INPUT-LINE            
      *            PERFORM  0040-3000-WRITE-OTHER                               
      *                THRU 0040-3000-WRITE-OTHER-X                             
      *        END-IF                                                           
      *    END-IF.
       
           IF  RPOL-REC-INFO   NOT = HPOL-REC-INFO
           OR  WCVGS-WORK-AREA NOT = HCVGS-WORK-AREA
               MOVE WGLOB-PROCESS-DATE TO RPOL-PREV-FILE-MAINT-DT
               PERFORM  2700-REWRITE-POL-AND-CVG
                   THRU 2700-REWRITE-POL-AND-CVG-X
           ELSE
               PERFORM  POL-3000-UNLOCK
                   THRU POL-3000-UNLOCK-X
           END-IF.
       
           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *------------------------
       2700-REWRITE-POL-AND-CVG.
      *------------------------

           MOVE WWKDT-ZERO-DT         TO RPOL-POL-NXT-ACTV-DT.
           IF RPOL-NXT-ACTV-TYP-CD NOT = 'SCH'
               MOVE 'RSH'             TO RPOL-NXT-ACTV-TYP-CD
           END-IF.

           PERFORM  POL-2000-REWRITE
               THRU POL-2000-REWRITE-X.

           PERFORM  2750-REWRITE-COVERAGES
               THRU 2750-REWRITE-COVERAGES-X
               VARYING I FROM 1 BY 1
               UNTIL I > RPOL-POL-CVG-REC-CTR-N.

       2700-REWRITE-POL-AND-CVG-X.
           EXIT.

      *----------------------
       2750-REWRITE-COVERAGES.
      *----------------------

           MOVE RPOL-POL-ID            TO WCVG-POL-ID.
           MOVE I                      TO WCVG-CVG-NUM-N.

           IF HCVGS-CVG-INFO (I) NOT = WCVGS-CVG-INFO (I)
               PERFORM  CVG-1000-READ-FOR-UPDATE
                   THRU CVG-1000-READ-FOR-UPDATE-X
               MOVE WCVGS-CVG-INFO (I) TO RCVG-CVG-INFO
               PERFORM  CVG-2000-REWRITE
                   THRU CVG-2000-REWRITE-X
           END-IF.

       2750-REWRITE-COVERAGES-X.
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

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

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

       COPY NCPPCVGS.

      *******  I/O ROUTINES

       COPY CCPNCVG.
       COPY CCPUCVG.

       COPY CCPUPOL.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPS4750.
       COPY CCPL4750.

      *COPY CCPS4800.
      *COPY CCPL4800.

       COPY CCPSPGA.

       COPY CCPL0010.
       COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0035.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBU                     **         
      *****************************************************************
