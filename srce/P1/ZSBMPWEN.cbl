      *****************************************************************
      **  MEMBER :  ZSBMPWEN                                         **
      **  REMARKS:  THIS CONVERSION PROGRAM WILL ENCRYPT THE LOGIN   **
      **            PASSWORD AND THE PREVIOUS EIGHT LOGIN PASSWORDS  **
      **            THAT ARE CURRENTLY STORED ON THE USER SECURITY   **
      **            TABLE.                                           **
      **                                                             **
      **            IMPORTANT NOTE!!!  THIS PROGRAM CAN ONLY BE RUN  **
      **            ONE TIME, SINCE IT TAKES THE EXISTING PSWDS AND  **
      **            ENCRYPT THEMS.  IF THE PROGRAM IS RERUN, THE     **
      **            ENCRYPTED PSWDS WILL BE ENCRYPTED AGAIN, AND     **
      **            THE USER WILL NOT HAVE A CLUE WHAT THEIR         **
      **            CURRENT PASSWORD IS.                             **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
02MI01**  30JUN02  MAW    LOGIN FAILURE MONITORING AND PASSWORD      **
02MI01**                  ENCRYPTION                                 **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    ZSBMPWEN.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.
      *************************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMPWEN'.

       COPY SQLCA.

       01  WS-CONTROL-CARD.
           05  WS-CTL-EDIT-ONLY             PIC X(10).
               88  WS-CTL-EDIT-TEXT         VALUE 'EDIT ONLY='.
           05  WS-CTL-EDIT-SW               PIC X(01).
               88 EDIT-ONLY                 VALUE 'Y'. 
               88 EDIT-ONLY-NO              VALUE 'N'.
                
       01  WS-HEADING-LINE.
           05  FILLER     VALUE SPACES      PIC X(24). 
           05  FILLER                       PIC X(30) 
                   VALUE 'PASSWORD ENCRYPTION CONVERSION'.
           05  FILLER                       PIC X(13) 
                   VALUE ' AUDIT REPORT'.
                
       01  WS-USERID-PRINT-LINE.
           05  FILLER     VALUE SPACES      PIC X(04). 
           05  FILLER                       PIC X(08) 
                          VALUE 'USERID: '.
           05  WS-USER-ID                   PIC X(08).
      
       01  WS-PASSWORD-PRINT-LINE.
           05  FILLER     VALUE SPACES      PIC X(08). 
           05  FILLER                       PIC X(14) 
                          VALUE 'OLD PASSWORD: '.
           05  WS-OLD-PASSWORD              PIC X(08).
           05  FILLER     VALUE SPACES      PIC X(04). 
           05  FILLER                       PIC X(14) 
                          VALUE 'NEW PASSWORD: '.
           05  WS-NEW-PASSWORD              PIC X(08).
      
       01  WS-RECS-PRCES-LINE.
           05  FILLER     VALUE SPACES      PIC X(04). 
           05  FILLER                       PIC X(30)
           VALUE 'TOTAL USEC RECORDS PROCESSED: '.
           05  WS-USEC-REC-PRCES-CTR        PIC 9(6)  VALUE ZERO.

       01  WS-EOJ-LINE.
           05  FILLER     VALUE SPACES      PIC X(45). 
           05  FILLER                       PIC X(21) 
                   VALUE '*** END OF REPORT ***'.
                
      /
P02229 COPY XCWL0035.

       COPY CCWL0010.
       COPY CCWL0950.
      /
       COPY XCFWUSEC.
       COPY XCFRUSEC.
      /
       COPY XCWL9684.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWTFCMD.
      /
       COPY XCWL0040.
      /
       COPY XCWL1670.
       COPY XCWL1660.
       COPY XCWL1680.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWCCC.
      /
       COPY CCWLPGA.
      /
       PROCEDURE DIVISION.
      *************************

      *----------------
       0000-MAIN-LINE.
      *----------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  0200-INITIALIZE
               THRU 0200-INITIALIZE-X.

           PERFORM  1000-CONVERT-RECORDS
               THRU 1000-CONVERT-RECORDS-X.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAIN-LINE-X.
           EXIT.

      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
 
      /
      *----------------
       0200-INITIALIZE.
      *----------------

           MOVE ZEROS TO WS-USEC-REC-PRCES-CTR.
            
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE 'ZSBMPWEN'         TO WGLOB-USER-ID.
           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.
           MOVE WS-HEADING-LINE    TO L0040-HDG-LINE-3.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.
           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO  TO WS-CONTROL-CARD
           END-IF.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       0200-INITIALIZE-X.
           EXIT.
 
      /
      *----------------------
       1000-CONVERT-RECORDS.
      *----------------------
           
           MOVE LOW-VALUES    TO WUSEC-KEY.
           MOVE HIGH-VALUES   TO WUSEC-ENDBR-KEY.
           
           PERFORM  USEC-1000-BROWSE
               THRU USEC-1000-BROWSE-X.

           PERFORM  USEC-2000-READ-NEXT
               THRU USEC-2000-READ-NEXT-X.

           PERFORM  2000-PROCESS-USEC-REC
               THRU 2000-PROCESS-USEC-REC-X
               UNTIL WUSEC-IO-EOF
                  OR WUSEC-IO-NOT-FOUND.

           PERFORM  USEC-3000-END-BROWSE
               THRU USEC-3000-END-BROWSE-X.
           
       1000-CONVERT-RECORDS-X.
           EXIT.

      /
      *-----------------------
       2000-PROCESS-USEC-REC.
      *-----------------------
           
           ADD 1 TO WS-USEC-REC-PRCES-CTR.
           
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.                 
                
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE RUSEC-USER-ID           TO WS-USER-ID.
           MOVE WS-USERID-PRINT-LINE    TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.                 
                
           IF EDIT-ONLY
               PERFORM  3000-ENCRYPT-PSWDS
                   THRU 3000-ENCRYPT-PSWDS-X
           ELSE
               MOVE LOW-VALUES     TO WUSEC-KEY
               MOVE RUSEC-USER-ID  TO WUSEC-USER-ID

               PERFORM  USEC-1000-READ-FOR-UPDATE
                   THRU USEC-1000-READ-FOR-UPDATE-X

               IF  WUSEC-IO-NOT-FOUND
      *MSG: 'LOST RECORD (@1) IN MAINTAIN - CONTACT SYSTEMS'
                   MOVE WUSEC-USER-ID TO WGLOB-MSG-PARM (1)
                   MOVE 'XS00000006'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   GO TO 2000-PROCESS-USEC-REC-X
               END-IF

               PERFORM  3000-ENCRYPT-PSWDS
                   THRU 3000-ENCRYPT-PSWDS-X

               PERFORM  USEC-2000-REWRITE
                   THRU USEC-2000-REWRITE-X
           END-IF.
           
           PERFORM  USEC-2000-READ-NEXT
               THRU USEC-2000-READ-NEXT-X.
           
       2000-PROCESS-USEC-REC-X.
           EXIT.

      /
      *-----------------------
       3000-ENCRYPT-PSWDS.
      *-----------------------
           
           IF  RUSEC-USER-PSWD-TXT   NOT = SPACES
               MOVE RUSEC-USER-PSWD-TXT   TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-USER-PSWD-TXT
           END-IF.
            
           IF  RUSEC-PREV-PSWD-1-TXT NOT = SPACES
               MOVE RUSEC-PREV-PSWD-1-TXT TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-PREV-PSWD-1-TXT
           END-IF.
            
           IF  RUSEC-PREV-PSWD-2-TXT NOT = SPACES
               MOVE RUSEC-PREV-PSWD-2-TXT TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-PREV-PSWD-2-TXT
           END-IF.
            
           IF  RUSEC-PREV-PSWD-3-TXT NOT = SPACES
               MOVE RUSEC-PREV-PSWD-3-TXT TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-PREV-PSWD-3-TXT
           END-IF.
            
           IF  RUSEC-PREV-PSWD-4-TXT NOT = SPACES
               MOVE RUSEC-PREV-PSWD-4-TXT TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-PREV-PSWD-4-TXT
           END-IF.
            
           IF  RUSEC-PREV-PSWD-5-TXT NOT = SPACES
               MOVE RUSEC-PREV-PSWD-5-TXT TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-PREV-PSWD-5-TXT
           END-IF.
            
           IF  RUSEC-PREV-PSWD-6-TXT NOT = SPACES
               MOVE RUSEC-PREV-PSWD-6-TXT TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-PREV-PSWD-6-TXT
           END-IF.
            
           IF  RUSEC-PREV-PSWD-7-TXT NOT = SPACES
               MOVE RUSEC-PREV-PSWD-7-TXT TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-PREV-PSWD-7-TXT
           END-IF.
            
           IF  RUSEC-PREV-PSWD-8-TXT NOT = SPACES
               MOVE RUSEC-PREV-PSWD-8-TXT TO WS-OLD-PASSWORD
               PERFORM  3100-CALL-ENCRYPT-ROUTINE
                   THRU 3100-CALL-ENCRYPT-ROUTINE-X
               MOVE WS-NEW-PASSWORD       TO RUSEC-PREV-PSWD-8-TXT
           END-IF.
            
       3000-ENCRYPT-PSWDS-X.
           EXIT.
           
      /
      *--------------------------
       3100-CALL-ENCRYPT-ROUTINE.
      *--------------------------
           
           PERFORM  9684-1000-BUILD-PARM-INFO
               THRU 9684-1000-BUILD-PARM-INFO-X.

           MOVE WS-OLD-PASSWORD     TO L9684-INPUT-STRING.
           PERFORM  9684-1000-ENCRYPT-DATA
               THRU 9684-1000-ENCRYPT-DATA-X.
           MOVE L9684-OUTPUT-STRING TO WS-NEW-PASSWORD.
                                         
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-PASSWORD-PRINT-LINE  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
       3100-CALL-ENCRYPT-ROUTINE-X.
           EXIT.
           
      /
      *------------------
       8000-PRINT-STATS.
      *------------------

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-RECS-PRCES-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-EOJ-LINE             TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       8000-PRINT-STATS-X.
           EXIT.
      /
      *------------------
       9999-CLOSE-FILES.
      *------------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
 
      /
P02229 COPY XCPL0035.

       COPY XCPL9684.
       COPY XCPS9684.
      /
       COPY XCPBUSEC.
       COPY XCPNUSEC.
       COPY XCPUUSEC.
       COPY XCPAUSEC.
      /
       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPPCCC.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMPWEN                     **
      *****************************************************************
