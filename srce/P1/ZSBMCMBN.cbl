      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBN.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBN                                         **         
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

           SELECT CMBT-DATA-FILE ASSIGN TO ZSCMBT
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBT-SEQ-FILE-STATUS.

           SELECT CMBN-DATA-FILE ASSIGN TO ZSCMBN
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBN-SEQ-FILE-STATUS.

           SELECT RJCT-DATA-FILE ASSIGN TO ZSRJCT
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WRJCT-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  CMBT-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBT-SEQ-REC-INFO.
           05  RCMBT-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBT-POL-TYP             PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBT-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBT-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBT-CEASE-DT            PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBT-CMB-DIFF            PIC -9(13).                            
           05  FILLER  REDEFINES RCMBT-CMB-DIFF.
               10  FILLER                PIC X(01).
               10  RCMBT-CMB-DIFF-N      PIC 9(13).
           05  FILLER                    PIC X(01).                             
           05  RCMBT-OS-DISB-AMT         PIC -9(15).                            
           05  FILLER                    PIC X(01).                             
           05  RCMBT-OS-DISB-AD-AMT      PIC -9(15).                            
           05  FILLER                    PIC X(01).                             
           05  RCMBT-OS-DISB-CLM-AMT     PIC -9(15).                            
           05  FILLER                    PIC X(01).                             
           05  RCMBT-OS-DISB-DTH-AMT     PIC -9(15).                            
           05  FILLER                    PIC X(01).                             
           05  RCMBT-OS-DISB-MAT-AMT     PIC -9(15).                            
           05  FILLER                    PIC X(01).                             
           05  RCMBT-OS-DISB-SURR-AMT    PIC -9(15).                            
           05  FILLER                    PIC X(01).                             
           05  RCMBT-POST-LAPS-SURR-AMT  PIC -9(13).                            
           05  FILLER  REDEFINES RCMBT-POST-LAPS-SURR-AMT.
               10  FILLER                PIC X(01).
               10  RCMBT-POST-LAPS-SURR-AMT-N      PIC 9(13).
           05  FILLER                    PIC X(01).                             
           05  RCMBT-SUB-STAT-CD         PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBT-CNVR-TYP-CD         PIC X(02).                             

       FD  CMBN-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBN-SEQ-REC-INFO.
           05  RCMBN-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBN-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBN-CEASE-DT            PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBN-LAPS-PROC-DT        PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBN-POL-SUB-STAT-CD     PIC X(02).                             
           05  FILLER                    PIC X(01).
           05  RCMBN-SUSP-AMT-BEFORE     PIC 9(13).                     
           05  FILLER                    PIC X(01).
           05  RCMBN-CREDIT-AMT          PIC 9(13).                             
           05  FILLER                    PIC X(01).
           05  RCMBN-SUSP-AMT-AFTER      PIC 9(13).                     
            
       FD  RJCT-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RRJCT-SEQ-REC-INFO.
           05  FILLER                    PIC X(175).                            
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBN'.

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
           05  WS-MAX-LAPS-DT            PIC X(10) VALUE '2003-10-28'.          
           05  WS-TOTAL-CREDIT           PIC S9(13).                            
           05  WS-TEST-DT                PIC X(10).                             
           05  WS-TEST-DT-R              REDEFINES                              
               WS-TEST-DT.                                                      
               10  WS-TEST-DT-YR         PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-MO         PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-DY         PIC 9(02).                             
           05  WS-OLDEST-BAD-DT          PIC X(10).                             
           05  WS-SKIP-POL               PIC X(10).
           05  WS-3003-DT                PIC X(10)
               OCCURS 10 TIMES.
           05  WS-3003-CNT               PIC S9(3) COMP-3.
           05  WS-3003-IX                PIC S9(3) COMP-3.
           05  WS-4001-DT                PIC X(10)
               OCCURS 10 TIMES.
           05  WS-4001-CNT               PIC S9(3) COMP-3.
           05  WS-4001-IX                PIC S9(3) COMP-3.
           05  WS-ACCOUNT-INFO.
               10  WS-ACCOUNT             PIC X(06).
               10  WS-YR-CD               PIC 9(04) VALUE 2004.
               10  WS-SBSDRY-CO-ID        PIC X(02) VALUE SPACES.
               10  WS-COMPANY             PIC X(02) VALUE 'JP'.
               10  WS-PLAN-CD             PIC X(06) VALUE SPACES.
               10  WS-BR-OR-DEPT-ID       PIC X(05) VALUE SPACES.
               10  WS-ISS-LOC-CD          PIC X(02) VALUE SPACES.
               10  WS-CRNT-LOC-CD         PIC X(02) VALUE SPACES.

       01  WS-OUTPUT-LINE.         
           05  WS-OUTPUT-POL-ID                 PIC X(10).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-MESSAGE                PIC X(40).
           05  FILLER                           PIC X(81).

       01  WCMBT-SEQ-IO-WORK-AREA.
           05  WCMBT-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBT'.
           05  WCMBT-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBT-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBT-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBT-SEQ-IO-OK              VALUE 0.
               88  WCMBT-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBT-SEQ-IO-EOF             VALUE 8.
               88  WCMBT-SEQ-IO-ERROR           VALUE 9.

       01  WCMBN-SEQ-IO-WORK-AREA.
           05  WCMBN-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBN'.
           05  WCMBN-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBN-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBN-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBN-SEQ-IO-OK              VALUE 0.
               88  WCMBN-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBN-SEQ-IO-EOF             VALUE 8.
               88  WCMBN-SEQ-IO-ERROR           VALUE 9.

       01  WRJCT-SEQ-IO-WORK-AREA.
           05  WRJCT-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'RJCT'.
           05  WRJCT-SEQ-IO-COMMAND             PIC X(02).
           05  WRJCT-SEQ-FILE-STATUS            PIC X(02).
           05  WRJCT-SEQ-IO-STATUS              PIC 9(01).
               88  WRJCT-SEQ-IO-OK              VALUE 0.
               88  WRJCT-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WRJCT-SEQ-IO-EOF             VALUE 8.
               88  WRJCT-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPOL. 
       COPY CCFRPOL. 

       COPY CCFWMAST.
       COPY CCFRMAST.

       COPY CCFWATRN.
       COPY CCFRATRN.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWWAT77.
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
              UNTIL WCMBT-SEQ-IO-EOF                                            
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

           MOVE ZERO                   TO WCMBT-SEQ-IO-STATUS.

           OPEN INPUT CMBT-DATA-FILE.                                           

           IF WCMBT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCMBN-SEQ-IO-STATUS.
           MOVE ZERO                   TO WRJCT-SEQ-IO-STATUS.

           OPEN OUTPUT CMBN-DATA-FILE.
           OPEN OUTPUT RJCT-DATA-FILE.

           IF WCMBN-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMCMBN'           TO WGLOB-MAIN-PGM-ID                       
                                        WGLOB-CRNT-PGM-ID.

           SET WGLOB-USER-LANG-JAPANESE TO TRUE.
           SET WGLOB-ENVRMNT-BATCH      TO TRUE.
            
           MOVE SPACES                 TO RMAST-KEY.
           MOVE WGLOB-COMPANY-CODE     TO WMAST-CO-ID.
           PERFORM MAST-1000-READ
              THRU MAST-1000-READ-X.
               
           MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE 
                                           WGLOB-SYSTEM-DATE-INT.
                                            
           MOVE 9000                   TO WGLOB-TASK-ID-N
            
           MOVE 'P01304'               TO WGLOB-USER-ID.
      *  INITIALIZE THE ACCOUNTING RECORD
           MOVE SPACES                 TO RATRN-REC-INFO.
           MOVE SPACES                 TO WAT77-REC-INFO.
           MOVE 'CP'                   TO RATRN-CO-ID                    
                                          WAT77-CO-ID.
           MOVE 'BATCH'                TO RATRN-USER-ID.                    
           MOVE '0000001'              TO RATRN-TRNXT-TIME.                    
           MOVE WGLOB-TASK-ID          TO RATRN-TRNXT-TASK-ID
           MOVE '1281'                 TO RATRN-BUS-FCN-ID.
           MOVE 1304                   TO RATRN-TRNXT-BTCH-NUM.
           MOVE '77'                   TO RATRN-TRNXT-TYP-CD
                                          WAT77-CD-77.
           MOVE WGLOB-PROCESS-DATE     TO WAT77-DT 
                                          WAT77-JRNL-DT
                                          WAT77-PREV-DT
                                          RATRN-TRNXT-DT
           MOVE 'N'                    TO WAT77-SUB-TYP-CD.
           MOVE 'P'                    TO WAT77-SRC-CD
                                          WAT77-CD.
           MOVE 'N00010'               TO WAT77-OPER-CAT-CD.
            
           MOVE 'ZS13040001'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO WAT77-DESC-INFO.
            
       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9500-CMBT-READ                                              
               THRU 9500-CMBT-READ-X.                                           
                
           IF NOT WCMBT-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           IF  RCMBT-POL-STAT NOT = 'B'                             
           OR  RCMBT-CEASE-DT > '2003-10-28'
           OR  RCMBT-POST-LAPS-SURR-AMT-N = ZEROS
               MOVE RCMBT-SEQ-REC-INFO TO RRJCT-SEQ-REC-INFO 
               WRITE RRJCT-SEQ-REC-INFO
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.
                             
           MOVE RCMBT-POL-ID       TO WPOL-POL-ID.

           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.

           IF  WPOL-IO-ERROR 
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.
            
           PERFORM  4000-ATRN-WRITE                                     
               THRU 4000-ATRN-WRITE-X.                                 
            
           PERFORM  5000-CMBN-WRITE                                     
               THRU 5000-CMBN-WRITE-X.                                 
            
           MOVE RCMBN-SUSP-AMT-AFTER   TO RPOL-POST-LAPS-SURR-AMT.
            
           PERFORM  POL-2000-REWRITE
               THRU POL-2000-REWRITE-X.
 
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *----------------
       4000-ATRN-WRITE.                                     
      *----------------
           IF RPOL-PLAN-ID = '50000' OR '50001'
               MOVE 'C11000'           TO WS-ACCOUNT
           ELSE
               MOVE 'C41000'           TO WS-ACCOUNT
           END-IF
           MOVE RCMBT-POL-ID           TO WAT77-POL-ID.
           MOVE RPOL-PLAN-ID           TO WAT77-PLAN-ID.
           MOVE RPOL-POL-ISS-EFF-DT    TO WAT77-ISS-DT.
           MOVE '65005000'             TO WAT77-MCL-BASE-ID.
           MOVE 'SURR'                 TO WAT77-REASN-CD.
           MOVE RCMBT-SUB-STAT-CD      TO WAT77-POL-SUB-STAT-CD.                
           MOVE WS-ACCOUNT-INFO        TO WAT77-ID-INFO.
           MOVE RCMBT-CMB-DIFF-N       TO WAT77-AMT.
           MOVE WAT77-REC-INFO         TO RATRN-TRNXT-INFO.
           MOVE +305                   TO RATRN-TRNXT-DTL-INFO-LEN.
           MOVE WGLOB-TASK-ID          TO RATRN-TRNXT-TASK-ID
           MOVE +1                     TO RATRN-TRNXT-SEQ-NUM-N.
           MOVE RATRN-KEY              TO WATRN-KEY.
           PERFORM  ATRN-1000-WRITE
               THRU ATRN-1000-WRITE-X.
                
           MULTIPLY WAT77-AMT    BY -1 GIVING WAT77-AMT.
           MOVE 'LAPSE'                TO WAT77-REASN-CD.
           MOVE '259850'               TO WS-ACCOUNT.
           MOVE '21005000'             TO WAT77-MCL-BASE-ID.
           MOVE WS-ACCOUNT-INFO        TO WAT77-ID-INFO.
           MOVE WAT77-REC-INFO         TO RATRN-TRNXT-INFO.
           MOVE +305                   TO RATRN-TRNXT-DTL-INFO-LEN.
           ADD  +1                     TO RATRN-TRNXT-SEQ-NUM-N.
           MOVE RATRN-KEY              TO WATRN-KEY.
           PERFORM  ATRN-1000-WRITE
               THRU ATRN-1000-WRITE-X.
                
           ADD 1                        TO WGLOB-TASK-ID-N.
            
       4000-ATRN-WRITE-X.                                 
           EXIT.
      *----------------
       5000-CMBN-WRITE.
      *----------------
           MOVE RCMBT-POL-ID          TO RCMBN-POL-ID                           
           MOVE RCMBT-ISS-DT          TO RCMBN-ISS-DT.                          
           MOVE RCMBT-CEASE-DT        TO RCMBN-CEASE-DT.                        
           MOVE RPOL-POL-STAT-CHNG-DT TO RCMBN-LAPS-PROC-DT.
           MOVE RCMBT-SUB-STAT-CD     TO RCMBN-POL-SUB-STAT-CD.                 
           MOVE RCMBT-POST-LAPS-SURR-AMT-N TO RCMBN-SUSP-AMT-BEFORE.            
           MOVE RCMBT-CMB-DIFF-N      TO RCMBN-CREDIT-AMT.                      
           COMPUTE  RCMBN-SUSP-AMT-AFTER =                     
                    RCMBT-POST-LAPS-SURR-AMT-N +         
                    RCMBT-CMB-DIFF-N.                     
           WRITE RCMBN-SEQ-REC-INFO.
            
            
       5000-CMBN-WRITE-X.
           EXIT.

      *---------------
       9500-CMBT-READ.
      *---------------

           MOVE ZERO                   TO WCMBT-SEQ-IO-STATUS.

           READ CMBT-DATA-FILE
                AT END
                  MOVE 8               TO WCMBT-SEQ-IO-STATUS
                  GO TO 9500-CMBT-READ-X.

           IF RCMBT-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WCMBT-SEQ-IO-STATUS
           END-IF.

           IF WCMBT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9500-CMBT-READ-X.
           EXIT.
      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBT-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBT-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBT-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------------
       9800-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBN-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBN-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBN-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9800-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WCMBT-SEQ-IO-STATUS.

           CLOSE CMBT-DATA-FILE.

           IF WCMBT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCMBN-SEQ-IO-STATUS.

           CLOSE RJCT-DATA-FILE.
           CLOSE CMBN-DATA-FILE.

           IF WCMBN-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR                                         
                 THRU 9800-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY CCPUPOL. 
       COPY CCPNMAST.
       COPY CCPAATRN.

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
      **                 END OF PROGRAM ZSBMCMBN                     **         
      *****************************************************************
