      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCFLS.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCFLS                                         **         
      **  REMARKS:  THIS WILL LIST CLFW INFO FOR CERTAIN POLICIES    **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT PLST-DATA-FILE ASSIGN TO ZSPLST
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WPLST-SEQ-FILE-STATUS.

           SELECT CFLS-DATA-FILE ASSIGN TO ZSCFLS
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCFLS-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  PLST-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RPLST-SEQ-REC-INFO.
           05  RPLST-POL-ID              PIC X(07).                             

       FD  CFLS-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCFLS-SEQ-REC-INFO.
           05  RCFLS-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCFLS-EFF-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCFLS-SEQ-NUM             PIC 9(03).                             
           05  FILLER                    PIC X(01).
           05  RCFLS-PRCES-DT            PIC X(10).
           05  FILLER                    PIC X(01).                             
           05  RCFLS-REVRS-PRCES-DT      PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCFLS-TRXN-CD             PIC X(03).                             
           05  FILLER                    PIC X(01).                             
           05  RCFLS-REASN-CD            PIC X(03).                             
           05  FILLER                    PIC X(01).                             
           05  RCFLS-CLI-TRXN-AMT        PIC -9(13).                            
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCFLS'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.

       01  SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.

       01  WORK-AREAS.
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

       01  WS-ERROR-LINE.                                                       
           05  WS-ERROR-POL-ID           PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATE             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATA             PIC X(01).                             
           05  FILLER                    PIC X(58).                             

       01  WPLST-SEQ-IO-WORK-AREA.
           05  WPLST-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'PLST'.
           05  WPLST-SEQ-IO-COMMAND             PIC X(02).
           05  WPLST-SEQ-FILE-STATUS            PIC X(02).
           05  WPLST-SEQ-IO-STATUS              PIC 9(01).
               88  WPLST-SEQ-IO-OK              VALUE 0.
               88  WPLST-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WPLST-SEQ-IO-EOF             VALUE 8.
               88  WPLST-SEQ-IO-ERROR           VALUE 9.

       01  WCFLS-SEQ-IO-WORK-AREA.
           05  WCFLS-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CFLS'.
           05  WCFLS-SEQ-IO-COMMAND             PIC X(02).
           05  WCFLS-SEQ-FILE-STATUS            PIC X(02).
           05  WCFLS-SEQ-IO-STATUS              PIC 9(01).
               88  WCFLS-SEQ-IO-OK              VALUE 0.
               88  WCFLS-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCFLS-SEQ-IO-EOF             VALUE 8.
               88  WCFLS-SEQ-IO-ERROR           VALUE 9.
      /
       COPY CCFWCFLW.
       COPY CCFRCFLW.

       COPY XCWWWKDT.
       COPY XCWWCVGM.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY XCWL0015.
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
              UNTIL WPLST-SEQ-IO-EOF                                            
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

           MOVE ZERO                   TO WPLST-SEQ-IO-STATUS.

           OPEN INPUT PLST-DATA-FILE.

           IF WPLST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCFLS-SEQ-IO-STATUS.

           OPEN OUTPUT CFLS-DATA-FILE.

           IF WCFLS-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMCFLS'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMCFLS'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

      *    PERFORM PGA-1000-BUILD-PARMS
      *       THRU PGA-1000-BUILD-PARMS-X.

           MOVE SPACES TO RCFLS-SEQ-REC-INFO.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9300-PLST-READ         
               THRU 9300-PLST-READ-X.
           IF NOT WPLST-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

      *    MOVE RPLST-POL-ID        TO LPGA-POLICY-NUMBER.

           MOVE RPLST-POL-ID        TO WCFLW-POL-ID.
           MOVE 1                   TO WCFLW-CVG-NUM-N.
           MOVE 'D'                 TO WCFLW-CF-TYP-CD.
           MOVE WWKDT-LOW-DT        TO WCFLW-CF-EFF-DT.
           MOVE 000                 TO WCFLW-CF-SEQ-NUM.

           MOVE WCFLW-KEY           TO WCFLW-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT       TO WCFLW-ENDBR-CF-EFF-DT.
           MOVE 999                 TO WCFLW-ENDBR-CF-SEQ-NUM.

           PERFORM  CFLW-1000-BROWSE
               THRU CFLW-1000-BROWSE-X.

           PERFORM  3200-LOOP-THRU-CFLW
               THRU 3200-LOOP-THRU-CFLW-X
               UNTIL NOT WCFLW-IO-OK.

           PERFORM  CFLW-3000-END-BROWSE
               THRU CFLW-3000-END-BROWSE-X.

       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *--------------------                                                     
       3200-LOOP-THRU-CFLW.                                                     
      *--------------------                                                     

           PERFORM  CFLW-2000-READ-NEXT
               THRU CFLW-2000-READ-NEXT-X.
           IF NOT WCFLW-IO-OK                                                   
               GO TO 3200-LOOP-THRU-CFLW-X                                      
           END-IF.

           IF RCFLW-CF-REASN-CD NOT = 'CMB'                                     
               GO TO 3200-LOOP-THRU-CFLW-X               
           END-IF.

           MOVE SPACES                    TO RCFLS-SEQ-REC-INFO.
           MOVE RCFLW-POL-ID              TO RCFLS-POL-ID.
           MOVE RCFLW-CF-EFF-DT           TO RCFLS-EFF-DT.
           MOVE RCFLW-CF-SEQ-NUM          TO RCFLS-SEQ-NUM.
           MOVE RCFLW-CF-PRCES-DT         TO RCFLS-PRCES-DT.
           MOVE RCFLW-CF-REVRS-PRCES-DT   TO RCFLS-REVRS-PRCES-DT.
           MOVE RCFLW-CF-TRXN-CD          TO RCFLS-TRXN-CD.
           MOVE RCFLW-CF-REASN-CD         TO RCFLS-REASN-CD.
           MOVE RCFLW-CF-CLI-TRXN-AMT     TO RCFLS-CLI-TRXN-AMT.

           PERFORM 9400-CFLS-WRITE
              THRU 9400-CFLS-WRITE-X.

       3200-LOOP-THRU-CFLW-X.                                                   
           EXIT.

      *---------------
       9300-PLST-READ.
      *---------------

           MOVE ZERO                   TO WPLST-SEQ-IO-STATUS.
           READ PLST-DATA-FILE
                AT END
                  MOVE 8               TO WPLST-SEQ-IO-STATUS
                  GO TO 9300-PLST-READ-X.

           IF RPLST-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WPLST-SEQ-IO-STATUS
           END-IF.

           IF WPLST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       9300-PLST-READ-X.
           EXIT.

      *----------------
       9400-CFLS-WRITE.
      *----------------

           MOVE ZERO                   TO WCFLS-SEQ-IO-STATUS.

           WRITE RCFLS-SEQ-REC-INFO.

           IF WCFLS-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9400-CFLS-WRITE-X.
           EXIT.

      *-----------------------
       9600-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WPLST-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WPLST-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WPLST-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9600-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCFLS-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCFLS-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCFLS-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WPLST-SEQ-IO-STATUS.

           CLOSE PLST-DATA-FILE.

           IF WPLST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCFLS-SEQ-IO-STATUS.

           CLOSE CFLS-DATA-FILE.

           IF WCFLS-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
 
      *******  I/O ROUTINES

       COPY CCPBCFLW.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

54-001 COPY CCPL0010.
54-001 COPY CCPS0010.
      /
      *COPY CCPSPGA.

       COPY XCPL0015.
       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL0289.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCFLS                     **         
      *****************************************************************
