      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMSVAG.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMSVAG                                         **         
      **  REMARKS:  THIS PROGRAM WIIL GENERATE AN EXTRACT FILE THAT  **
      **            CONTAINS SERVICE AGENT INFO FOR P01541           **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  20MAY04  SW     CREATED FOR P01541                         **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT SVAG-DATA-FILE ASSIGN TO ZSSVAG
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WSVAG-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  SVAG-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RSVAG-SEQ-REC-INFO.
           05  RSVAG-POL-ID              PIC X(07).                             
           05  RSVAG-SERV-AGT-ID         PIC X(06).                          
           05  RSVAG-POL-STAT-CD         PIC X(01).                    
           05  RSVAG-POL-ISS-EFF-DT      PIC X(10).
           05  RSVAG-POL-APP-RECV-DT     PIC X(10).                            
           05  RSVAG-ORIG-POL-ID         PIC X(07).                             
      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMSVAG'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(01).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.

       01  WSVAG-SEQ-IO-WORK-AREA.
           05  WSVAG-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'SVAG'.
           05  WSVAG-SEQ-IO-COMMAND             PIC X(02).
           05  WSVAG-SEQ-FILE-STATUS            PIC X(02).
           05  WSVAG-SEQ-IO-STATUS              PIC 9(01).
               88  WSVAG-SEQ-IO-OK              VALUE 0.
               88  WSVAG-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WSVAG-SEQ-IO-EOF             VALUE 8.
               88  WSVAG-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWPOLK.
       COPY CCFRPOLK.

       COPY XCWWWKDT.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWL0010.
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

           MOVE ZERO                   TO WSVAG-SEQ-IO-STATUS.

           OPEN OUTPUT SVAG-DATA-FILE.

           IF WSVAG-SEQ-FILE-STATUS  NOT = ZERO
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
 
           MOVE 'ZSBMSVAG'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMSVAG'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           MOVE SPACES TO RSVAG-SEQ-REC-INFO.

           MOVE LOW-VALUES          TO WPOL-KEY.
           MOVE HIGH-VALUES         TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           IF NOT WPOL-IO-OK                                                    
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE SPACES               TO RSVAG-SEQ-REC-INFO.
            
           MOVE RPOL-POL-ID          TO RSVAG-POL-ID.
           MOVE RPOL-SERV-AGT-ID     TO RSVAG-SERV-AGT-ID.
           MOVE RPOL-POL-STAT-CD     TO RSVAG-POL-STAT-CD.
           MOVE RPOL-POL-ISS-EFF-DT  TO RSVAG-POL-ISS-EFF-DT.
           MOVE RPOL-POL-APP-RECV-DT TO RSVAG-POL-APP-RECV-DT.
                                       
           MOVE RPOL-POL-ID         TO WPOLK-POL-ID.
            
           PERFORM POLK-1000-READ
              THRU POLK-1000-READ-X.
            
           IF  WPOLK-IO-OK
               MOVE RPOLK-ORIG-POL-ID TO RSVAG-ORIG-POL-ID
           END-IF.
           
           PERFORM 9100-SVAG-WRITE                                              
              THRU 9100-SVAG-WRITE-X.                                           

       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *--------------
       9000-FINALIZE.
      *--------------
           PERFORM POL-3000-TBL-END-BROWSE                                      
              THRU POL-3000-TBL-END-BROWSE-X.                                   

       9000-FINALIZE-X.
           EXIT.

      *----------------
       9100-SVAG-WRITE.
      *----------------

           MOVE ZERO                   TO WSVAG-SEQ-IO-STATUS.

           WRITE RSVAG-SEQ-REC-INFO.

           IF WSVAG-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9100-SVAG-WRITE-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WSVAG-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WSVAG-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WSVAG-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WSVAG-SEQ-IO-STATUS.

           CLOSE SVAG-DATA-FILE.

           IF WSVAG-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
 
      *******  I/O ROUTINES

       COPY CCPTPOL.
       COPY CCPNPOLK.
       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY XCPL0030.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBF                     **         
      *****************************************************************
