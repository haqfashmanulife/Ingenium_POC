      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMDUMD.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMDUMD                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF POLICIES WHERE**
      **            BILLING CHANGED FROM TYPE (G OR 4) TO 1. THE     **
      **            DUMMY PAYOR OR LIST-BILL PREVIOUSLY ATTACHED WILL**
      **            BE DELETED...                                    **
      **            THE CLIENT INFO. MAKING UP THE PAYOR IS BUILT    **
      **            ELSEWHERE...WE JUST USE THE CLI-ID.              **
      *****************************************************************
          
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CMBO-DATA-FILE ASSIGN TO ZSCMBO
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBO-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  CMBO-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBO-SEQ-REC-INFO.
           05  RCMBO-POL-ID              PIC X(10).                             
           05  RCMBO-POL-PAC-DRW-DY      PIC S9(03).                            

      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMDUMD'.

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
           05  WS-PREV-POL-ID            PIC X(10).                             
           05  WS-READ-CTR-POL           PIC S9(04) COMP VALUE 0.
           05  WS-DELETE-CTR-RL-CLI      PIC S9(04) COMP VALUE 0.
           05  WS-DELETE-CTR-POLC-CLI    PIC S9(04) COMP VALUE 0.
           05  WS-DELETE-CTR-RL-CO       PIC S9(04) COMP VALUE 0.
           05  WS-DELETE-CTR-POLC-CO     PIC S9(04) COMP VALUE 0.
           05  WS-UPDATED-ON-POL         PIC S9(04) COMP VALUE 0.
           05  WS-DUMMY-CLI-ID           PIC X(10) VALUE                       
                                         '1111111111'.
           05  WS-DUMMY-COMPANY-ID       PIC X(10) VALUE                   
                                         'G11111111'. 


       01  WS-OUTPUT-LINE.         
           05  WS-OUTPUT-POL-ID          PIC X(10).
           05  WS-OUTPUT-POL-ID-N        REDEFINES         
               WS-OUTPUT-POL-ID          PIC 9(10).
           05  FILLER                    PIC X(01).
           05  WS-OUTPUT-MESSAGE         PIC X(40).
           05  FILLER                    PIC X(81).


       01  WCMBO-SEQ-IO-WORK-AREA.
           05  WCMBO-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBO'.
           05  WCMBO-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBO-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBO-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBO-SEQ-IO-OK              VALUE 0.
               88  WCMBO-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBO-SEQ-IO-EOF             VALUE 8.
               88  WCMBO-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPOL.
       COPY CCFRPOL.

       COPY CCFWPOLC.
       COPY CCFRPOLC.

       COPY CCFWRL.
       COPY CCFRRL.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWL0010.
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
              UNTIL WCMBO-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

           MOVE SPACES                      TO WS-OUTPUT-LINE.
           MOVE WS-READ-CTR-POL             TO WS-OUTPUT-POL-ID-N.
           MOVE '***** RECS. READ FROM INPUT (CMBO)****'
                                             TO WS-OUTPUT-MESSAGE.
           MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                       TO WS-OUTPUT-LINE.
           MOVE WS-DELETE-CTR-RL-CLI         TO WS-OUTPUT-POL-ID-N.
           MOVE '** CLI RECS. DELETED FROM RL TABLE **'
                                             TO WS-OUTPUT-MESSAGE.
           MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                       TO WS-OUTPUT-LINE.
           MOVE WS-DELETE-CTR-POLC-CLI       TO WS-OUTPUT-POL-ID-N.
           MOVE '** CLI RECS. DELETED FROM POLC TABLE **'
                                             TO WS-OUTPUT-MESSAGE.
           MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                       TO WS-OUTPUT-LINE.
           MOVE WS-DELETE-CTR-RL-CO          TO WS-OUTPUT-POL-ID-N.
           MOVE '** CO RECS. DELETED FROM RL TABLE **'
                                             TO WS-OUTPUT-MESSAGE.
           MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                       TO WS-OUTPUT-LINE.
           MOVE WS-DELETE-CTR-POLC-CO        TO WS-OUTPUT-POL-ID-N.
           MOVE '** CO RECS. DELETED FROM POLC TABLE **'
                                             TO WS-OUTPUT-MESSAGE.
           MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                       TO WS-OUTPUT-LINE.
           MOVE WS-UPDATED-ON-POL            TO WS-OUTPUT-POL-ID-N.
           MOVE '** NO RECS. UPDATED ON POLICY TABLE **'
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

           MOVE ZERO                   TO WCMBO-SEQ-IO-STATUS.

           OPEN INPUT CMBO-DATA-FILE.

           IF WCMBO-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMDUMD'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMDUMD'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           MOVE SPACES TO WS-PREV-POL-ID.    


       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9400-CMBO-READ                                              
               THRU 9400-CMBO-READ-X.                                           
           IF NOT WCMBO-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           ELSE                                                            
               ADD +1  TO  WS-READ-CTR-POL                                      
           END-IF.


      *
      *  DELETE THE CURRENT POLC RECORDS
      *
           MOVE SPACES                    TO RPOLC-REC-INFO.
           
           MOVE 'CP'                      TO RPOLC-CO-ID.
           MOVE RCMBO-POL-ID              TO RPOLC-POL-ID.
           MOVE 'P'                       TO RPOLC-POL-CLI-REL-TYP-CD.
           MOVE WS-DUMMY-CLI-ID           TO RPOLC-CLI-ID.

           MOVE RPOLC-KEY                 TO WPOLC-KEY.

           PERFORM POLC-2000-DELETE-WITH-KEY
              THRU POLC-2000-DELETE-WITH-KEY-X.

           IF NOT WPOLC-IO-OK                                                 
               MOVE SPACES                       TO WS-OUTPUT-LINE
               MOVE RCMBO-POL-ID                 TO WS-OUTPUT-POL-ID
               MOVE '*** CLI DELETE ON POLC FAILED ***'
                                                 TO WS-OUTPUT-MESSAGE
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 2000-PROCESS-IN-RECS-X                                     
           ELSE
               ADD +1  TO WS-DELETE-CTR-POLC-CLI
           END-IF.


           MOVE WS-DUMMY-COMPANY-ID       TO RPOLC-CLI-ID.
           MOVE 'L'                       TO RPOLC-POL-CLI-REL-TYP-CD.
           MOVE RPOLC-KEY                 TO WPOLC-KEY.
       
           MOVE RPOLC-KEY                 TO WPOLC-KEY.
       
           PERFORM POLC-2000-DELETE-WITH-KEY
              THRU POLC-2000-DELETE-WITH-KEY-X.
       
           IF NOT WPOLC-IO-OK                                                 
               MOVE SPACES                       TO WS-OUTPUT-LINE
               MOVE RCMBO-POL-ID                 TO WS-OUTPUT-POL-ID
               MOVE '*** CO DELETE ON POLC FAILED ***'
                                                 TO WS-OUTPUT-MESSAGE
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 2000-PROCESS-IN-RECS-X                                     
           ELSE
               ADD +1  TO WS-DELETE-CTR-POLC-CO
           END-IF.

      *
      *  DELETE current RL RECORDS
      *
           MOVE SPACES                 TO RRL-REC-INFO.

           MOVE 'CP'                   TO RRL-CO-ID.
           MOVE 'ADMIN '               TO RRL-REL-SYS-ID.

           MOVE WS-DUMMY-CLI-ID        TO RRL-CLI-ID.
           MOVE RCMBO-POL-ID           TO RRL-REL-SYS-REF-POL-ID.
           MOVE ZERO                   TO RRL-REL-SYS-REF-CVG-NUM.
           MOVE 'P'                    TO RRL-REL-TYP-CD.         
           MOVE 'M'                    TO RRL-REL-CREAT-TYP-CD.
           MOVE WGLOB-PROCESS-DATE     TO RRL-REL-PREV-UPDT-DT.

           MOVE RRL-KEY                TO WRL-KEY.

           PERFORM RL-2000-DELETE-WITH-KEY
              THRU RL-2000-DELETE-WITH-KEY-X.

           IF NOT WRL-IO-OK                                                   
               MOVE SPACES                       TO WS-OUTPUT-LINE
               MOVE RCMBO-POL-ID                 TO WS-OUTPUT-POL-ID
               MOVE '*** CLI DELETE ON RL FAILED ***'
                                                 TO WS-OUTPUT-MESSAGE
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 2000-PROCESS-IN-RECS-X                                     
           ELSE
               ADD +1  TO WS-DELETE-CTR-RL-CLI
           END-IF.

           MOVE WS-DUMMY-COMPANY-ID    TO RRL-CLI-ID.
           MOVE 'L'                    TO RRL-REL-TYP-CD.         
       
           MOVE RRL-KEY                TO WRL-KEY.
       
           PERFORM RL-2000-DELETE-WITH-KEY
              THRU RL-2000-DELETE-WITH-KEY-X.
       
           IF NOT WRL-IO-OK                                                   
               MOVE SPACES                       TO WS-OUTPUT-LINE
               MOVE RCMBO-POL-ID                 TO WS-OUTPUT-POL-ID
               MOVE '*** CO DELETE ON RL FAILED ***'
                                                 TO WS-OUTPUT-MESSAGE
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 2000-PROCESS-IN-RECS-X                                     
           ELSE
               ADD +1  TO WS-DELETE-CTR-RL-CO
           END-IF.

      ****  SET UP FOR POLICY TABLE READ ****
           MOVE LOW-VALUES             TO  WPOL-KEY.
           MOVE RCMBO-POL-ID           TO  WPOL-POL-ID.

           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.

           IF  WPOL-IO-NOT-FOUND
               MOVE SPACES                       TO WS-OUTPUT-LINE
               MOVE RCMBO-POL-ID                 TO WS-OUTPUT-POL-ID
               MOVE '*** POLICY NOT FOUND ON TBL ***'
                                                 TO WS-OUTPUT-MESSAGE
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE RCMBO-POL-PAC-DRW-DY TO RPOL-POL-PAC-DRW-DY.

           PERFORM  POL-2000-REWRITE
               THRU POL-2000-REWRITE-X.

           IF  WPOL-IO-OK
               ADD +1 TO WS-UPDATED-ON-POL
           END-IF.

      *----------------------                                                   
       2000-PROCESS-IN-RECS-X.                                                  
      *----------------------                                                   
           EXIT.

      *---------------
       9400-CMBO-READ.
      *---------------

           MOVE ZERO                   TO WCMBO-SEQ-IO-STATUS.

           READ CMBO-DATA-FILE
                AT END
                  MOVE 8               TO WCMBO-SEQ-IO-STATUS
                  GO TO 9400-CMBO-READ-X.

           IF RCMBO-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WCMBO-SEQ-IO-STATUS
           END-IF.

           IF WCMBO-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       9400-CMBO-READ-X.
           EXIT.

      *-----------------------
       9600-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBO-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBO-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBO-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9600-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WCMBO-SEQ-IO-STATUS.

           CLOSE CMBO-DATA-FILE.

           IF WCMBO-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY XCPOOCF.
      /
       COPY CCPUPOL.
      /
       COPY CCPGPOLC.
      /
       COPY CCPGRL.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0040.
      *COPY XCPL0260.
      *COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMDUMD                     **         
      *****************************************************************
