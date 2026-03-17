      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMZMBI.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMZMBI                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE -  'CMBT'        **
      **            ORIGINALLY TO                                    **
      **            CREATE THE FILE 'CMBI' (POLICIES - 1003 FROM 4 -1**
      **            AND BUILD THE SQL SCANS...                       **
      **  12MAR04   THIS ITERATION                                   **
      **            CREATE THE FILE 'CMBI' (POLICIES - 1003 FROM 4 -G**
      **            G - 4 & G - 1, AND BUILD THE SQL SCANS...        **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CMBP-DATA-FILE ASSIGN TO ZSCMBP
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBP-SEQ-FILE-STATUS.

           SELECT CMBI-DATA-FILE ASSIGN TO ZSCMBI
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBI-SEQ-FILE-STATUS.

           SELECT ZAPR-DATA-FILE ASSIGN TO ZEXPRL13
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WEXPRL-SEQ-FILE-STATUS.

           SELECT ZAPP-DATA-FILE ASSIGN TO ZEXPPOLC
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WEXPPC-SEQ-FILE-STATUS.

           SELECT ZAPS-DATA-FILE ASSIGN TO ZEXPRL04
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WEXPR4-SEQ-FILE-STATUS.

           SELECT ZAPQ-DATA-FILE ASSIGN TO ZEXPOLC4
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WEXPP4-SEQ-FILE-STATUS.

      /
       DATA DIVISION.
       FILE SECTION.

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
           05  RCMBP-FROM                PIC X(01).                             
           05  RCMBP-PHST-OLD-VAL        PIC X(19).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBP-TO                  PIC X(01).                             
           05  RCMBP-PHST-NEW-VAL        PIC X(19).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBP-PTAB-PRCES-CD       PIC X(01).                             

       FD  CMBI-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBI-SEQ-REC-INFO.
           05  RCMBI-POL-ID              PIC X(10).                             

       FD  ZAPR-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RZAPR-SEQ-REC-INFO.
           05  RZAPR-FILLER              PIC X(190).                       

       FD  ZAPP-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RZAPP-SEQ-REC-INFO.
           05  RZAPP-FILLER              PIC X(190).                       

       FD  ZAPS-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RZAPS-SEQ-REC-INFO.
           05  RZAPS-FILLER              PIC X(190).                       

       FD  ZAPQ-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RZAPQ-SEQ-REC-INFO.
           05  RZAPQ-FILLER              PIC X(190).                       

      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMZMBI'.

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
           05  WS-CNT                    PIC S9(4) COMP.

       01  WORK-AREAS.
           05  WS-PREV-POL-ID            PIC X(10).                             
           05  WS-REC-SW                 PIC X.
               88  WS-REC-FOUND          VALUE 'Y'.
           05  WEXPRL-SEQ-FILE-STATUS    PIC X(02).
           05  WEXPPC-SEQ-FILE-STATUS    PIC X(02).
           05  WEXPR4-SEQ-FILE-STATUS    PIC X(02).
           05  WEXPP4-SEQ-FILE-STATUS    PIC X(02).
           05  WS-LOAD-WCMBI-FILE        PIC S9(04) COMP VALUE 0.
           05  WS-FIRST-TIME-IND         PIC X.
               88  WS-FIRST-TIME         VALUE 'Y'.
               88  WS-NOT-FIRST-TIME     VALUE 'N'.

       01  WS-OUTPUT-LINE.         
           05  WS-OUTPUT-POL-ID          PIC X(10).
           05  WS-OUTPUT-POL-ID-N        REDEFINES         
               WS-OUTPUT-POL-ID          PIC 9(10).
           05  FILLER                    PIC X(01).
           05  WS-OUTPUT-MESSAGE         PIC X(40).
           05  FILLER                    PIC X(81).

       01  WS-PRINT-P-LINE.
           05  WS-SELECT-P              PIC X(06) VALUE SPACES.
           05  FILLER                   PIC X(12) VALUE " (POL_ID = '".
           05  WS-SEL-POLP              PIC X(07).
           05  FILLER                   PIC XXX   VALUE "' )".
           05  FILLER                   PIC X(44) VALUE SPACES.

       01  WS-PRINT-R-LINE.
           05  WS-SELECT-R              PIC X(06) VALUE SPACES.
           05  FILLER                   PIC X(20) VALUE                  
                                        " (REL_SYS_REF_ID = '".
           05  WS-SEL-POLR              PIC X(07).
           05  FILLER                   PIC X(08) VALUE "   00' )".
           05  FILLER                   PIC X(31) VALUE SPACES.

       01  WS-HEADING-POLC.
           05  POLC-LINE1                  PIC X(190) VALUE   
               'export to /apps/ingenium/prod/server/scripts/log/TPOLC13
      -    '0.DEL OF DEL MODIFIED BY chardel"" coldel, decpt. datesiso d
      -    'ecplusblank MESSAGES /apps/ingenium/prod/server/scripts/log/
      -    'TPOLC.log'.
           05  POLC-LINE2                  PIC X(190) VALUE   
               'SELECT * FROM INGMP1S.TPOLC'.
           05  POLC-LINE3                  PIC X(190) VALUE   
               '-- Backup before attach of dummy clients for 1304'.
           05  POL4-LINE1                  PIC X(190) VALUE   
               'export to /apps/ingenium/prod/server/scripts/log/TPOLC00
      -    '4.DEL OF DEL MODIFIED BY chardel"" coldel, decpt. datesiso d
      -    'ecplusblank MESSAGES /apps/ingenium/prod/server/scripts/log/
      -    'TPOLC.log'.
           05  POL4-LINE3                  PIC X(190) VALUE   
               '-- Backup after detach of dummy clients for 1304'.


       01  WS-HEADING-RL. .
           05  RL-LINE1                    PIC X(190) VALUE   
               'export to /apps/ingenium/prod/server/scripts/log/TRL1304
      -    '.DEL OF DEL MODIFIED BY chardel"" coldel, decpt. datesiso de
      -    'cplusblank MESSAGES /apps/ingenium/prod/server/scripts/log/T
      -    'RL.log'.
           05  RL-LINE2                    PIC X(190) VALUE   
               'SELECT * FROM INGMP1S.TRL'.
           05  RL-LINE3                    PIC X(190) VALUE   
               '-- Backup before attach of dummy clients for 1304'.
           05  RL4-LINE1                   PIC X(190) VALUE   
               'export to /apps/ingenium/prod/server/scripts/log/TRL0004
      -    '.DEL OF DEL MODIFIED BY chardel"" coldel, decpt. datesiso de
      -    'cplusblank MESSAGES /apps/ingenium/prod/server/scripts/log/T
      -    'RL.log'.
           05  RL4-LINE3                   PIC X(190) VALUE   
               '-- Backup after detach of dummy clients for 1304'.

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

       01  WCMBI-SEQ-IO-WORK-AREA.
           05  WCMBI-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBI'.
           05  WCMBI-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBI-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBI-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBI-SEQ-IO-OK              VALUE 0.
               88  WCMBI-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBI-SEQ-IO-EOF             VALUE 8.
               88  WCMBI-SEQ-IO-ERROR           VALUE 9.

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
              UNTIL WCMBP-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

           PERFORM 4000-FINALIZE
              THRU 4000-FINALIZE-X.

           MOVE SPACES                       TO WS-OUTPUT-LINE.
           MOVE WS-LOAD-WCMBI-FILE           TO WS-OUTPUT-POL-ID-N.
           MOVE '*** RECORDS ADDED TO  CMBI FILE    ***'
                                             TO WS-OUTPUT-MESSAGE.
           MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.


           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO  TO WCMBP-SEQ-IO-STATUS.
           OPEN INPUT CMBP-DATA-FILE.                                           

           IF WCMBP-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           OPEN OUTPUT CMBI-DATA-FILE.

           IF WCMBI-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR                                         
                 THRU 9800-HANDLE-ERROR-X                                       
           END-IF.

           OPEN OUTPUT ZAPR-DATA-FILE.
           OPEN OUTPUT ZAPP-DATA-FILE.
           OPEN OUTPUT ZAPS-DATA-FILE.
           OPEN OUTPUT ZAPQ-DATA-FILE.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N'         TO WS-ERROR-SW.

           MOVE 'CP'        TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMZMBI'  TO WGLOB-MAIN-PGM-ID                       
                               WGLOB-CRNT-PGM-ID.


           MOVE SPACES      TO RZAPP-FILLER 
                               RZAPR-FILLER 
                               RZAPQ-FILLER 
                               RZAPS-FILLER.
           
           MOVE POLC-LINE1  TO RZAPP-FILLER.
           MOVE RL-LINE1    TO RZAPR-FILLER.
           MOVE POL4-LINE1  TO RZAPQ-FILLER.
           MOVE RL4-LINE1   TO RZAPS-FILLER.
           PERFORM 9400-WRITE
              THRU 9400-WRITE-X.

           MOVE SPACES      TO RZAPP-FILLER 
                               RZAPR-FILLER 
                               RZAPQ-FILLER 
                               RZAPS-FILLER.
           
           MOVE POLC-LINE2  TO RZAPP-FILLER 
                               RZAPQ-FILLER.
           MOVE RL-LINE2    TO RZAPR-FILLER 
                               RZAPS-FILLER.
           PERFORM 9400-WRITE
              THRU 9400-WRITE-X.

           MOVE SPACES      TO RZAPP-FILLER 
                               RZAPR-FILLER 
                               RZAPQ-FILLER 
                               RZAPS-FILLER.
           
           MOVE POLC-LINE3  TO RZAPP-FILLER 
           MOVE POL4-LINE3  TO RZAPQ-FILLER.
           MOVE RL-LINE3    TO RZAPR-FILLER 
           MOVE RL4-LINE3   TO RZAPS-FILLER.
           PERFORM 9400-WRITE
              THRU 9400-WRITE-X.
           
           MOVE +0          TO WS-CNT.
           MOVE SPACES      TO WS-PREV-POL-ID.
           MOVE 'Y'         TO WS-FIRST-TIME-IND.
           
       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9500-CMBP-READ                                              
               THRU 9500-CMBP-READ-X.                                           
           IF NOT WCMBP-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

      *    IF  RCMBP-FROM  = '4'
      *    AND RCMBP-TO    = '1'

           IF  (RCMBP-FROM  = '4'
           AND RCMBP-TO    = 'G')
           OR  (RCMBP-FROM  = 'G'
           AND RCMBP-TO    = '4')
           OR  (RCMBP-FROM  = 'G'
           AND RCMBP-TO    = '1')
               PERFORM  3000-CMBI-BUILD                                         
                   THRU 3000-CMBI-BUILD-X                                      
           END-IF.

       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *----------------                                                   
       3000-CMBI-BUILD.                                        
      *----------------                                                   

           IF RCMBP-POL-ID  NOT = WS-PREV-POL-ID
              MOVE RCMBP-POL-ID  TO  RCMBI-POL-ID                      
              PERFORM  9700-CMBI-WRITE
                  THRU 9700-CMBI-WRITE-X
              MOVE RCMBP-POL-ID  TO  WS-PREV-POL-ID                      
              PERFORM  3200-SQL-WRITE
                  THRU 3200-SQL-WRITE-X
              MOVE 'N' TO WS-FIRST-TIME-IND                      
           END-IF.

       3000-CMBI-BUILD-X.
           EXIT.

      *----------------                                                   
       3200-SQL-WRITE.
      *----------------                                                   

           IF  WS-FIRST-TIME-IND = 'Y'
               MOVE ' WHERE'    TO  WS-SELECT-P
                                    WS-SELECT-R 
           ELSE
               MOVE '    OR'    TO  WS-SELECT-P
                                    WS-SELECT-R 
           END-IF.

           MOVE RCMBP-POL-ID    TO WS-SEL-POLP                      
                                   WS-SEL-POLR.

           MOVE WS-PRINT-P-LINE TO RZAPP-FILLER 
                                   RZAPQ-FILLER.
           MOVE WS-PRINT-R-LINE TO RZAPR-FILLER 
                                   RZAPS-FILLER.

           PERFORM 9400-WRITE
              THRU 9400-WRITE-X.

       3200-SQL-WRITE-X.
           EXIT.


      *--------------
       4000-FINALIZE.
      *--------------

           IF  WS-CNT = +0
               MOVE ' WHERE'        TO WS-SELECT-P
                                       WS-SELECT-R 
               MOVE '9999999'       TO WS-SEL-POLP                      
                                       WS-SEL-POLR 
               MOVE WS-PRINT-P-LINE TO RZAPP-FILLER 
                                       RZAPQ-FILLER 
               MOVE WS-PRINT-R-LINE TO RZAPR-FILLER 
                                       RZAPS-FILLER 
               PERFORM 9400-WRITE
                  THRU 9400-WRITE-X 
           END-IF.

           MOVE SPACES TO  RZAPP-FILLER 
                           RZAPR-FILLER 
                           RZAPQ-FILLER 
                           RZAPS-FILLER.

           MOVE ' ;'   TO  RZAPP-FILLER
                           RZAPR-FILLER 
                           RZAPQ-FILLER 
                           RZAPS-FILLER.

           PERFORM 9400-WRITE
              THRU 9400-WRITE-X.
            
       4000-FINALIZE-X.
           EXIT.

      *----------------
       9400-WRITE.
      *----------------

           WRITE RZAPR-SEQ-REC-INFO.
           WRITE RZAPP-SEQ-REC-INFO.
           WRITE RZAPS-SEQ-REC-INFO.
           WRITE RZAPQ-SEQ-REC-INFO.

       9400-WRITE-X.
           EXIT.

      *---------------
       9500-CMBP-READ.
      *---------------

           MOVE ZERO                   TO WCMBP-SEQ-IO-STATUS.

           READ CMBP-DATA-FILE
                AT END
                  MOVE 8               TO WCMBP-SEQ-IO-STATUS
                  GO TO 9500-CMBP-READ-X.

           IF RCMBP-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WCMBP-SEQ-IO-STATUS
           END-IF.

           IF WCMBP-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       9500-CMBP-READ-X.
           EXIT.

      *-----------------------
       9600-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBP-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBP-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBP-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9600-HANDLE-ERROR-X.                                                     
           EXIT.

      *----------------
       9700-CMBI-WRITE.
      *----------------

           MOVE ZERO   TO WCMBI-SEQ-IO-STATUS.

           WRITE RCMBI-SEQ-REC-INFO.

           IF WCMBI-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR                                         
                 THRU 9800-HANDLE-ERROR-X                                       
           ELSE
               ADD +1  TO WS-LOAD-WCMBI-FILE 
               ADD +1  TO WS-CNT 
           END-IF.

       9700-CMBI-WRITE-X.
           EXIT.

      *-----------------------
       9800-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBI-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBI-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBI-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9800-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WCMBP-SEQ-IO-STATUS.

           CLOSE CMBP-DATA-FILE.

           IF WCMBP-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                  TO WCMBI-SEQ-IO-STATUS.

           CLOSE CMBI-DATA-FILE.

           IF WCMBI-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR                                         
                 THRU 9800-HANDLE-ERROR-X                                       
           END-IF.

           CLOSE ZAPR-DATA-FILE.
           CLOSE ZAPP-DATA-FILE.
           CLOSE ZAPS-DATA-FILE.
           CLOSE ZAPQ-DATA-FILE.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

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
      **                 END OF PROGRAM ZSBMZMBI                     **         
      *****************************************************************
