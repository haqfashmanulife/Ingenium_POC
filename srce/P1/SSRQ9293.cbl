      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRQ9293.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : CSRQ9293'                                         **
      **  REMARKS: BATCH I/O PROGRAM FOR THE 9293 -                  **
      **           SA TOTAL PREMIUM AMOUNT LIST                      **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
OP2-10**  23DEC05  SEL    CREATED FOR '9293' FILE PROCESSING         **
      **                  FOR MFFOP2 - 10                            **   
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY SCSS9293.
 
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY SCSD9293.
 
       COPY SCSR9293.
 
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQ9293'.
 
       COPY SQLCA.
 
       01  WS-WORKING-STORAGE.
           05  WS-FILE-OPEN-SWITCH          PIC X(01)  VALUE 'N'.
               88  WS-FILE-IS-OPEN                     VALUE 'Y'.
               88  WS-FILE-IS-CLOSED                   VALUE 'N'.
 
 
       COPY XCWTFCMD.
 
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY SCSW9293.
 
       01  W9293-LINK-RECORD                PIC X(78).
 
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9293-SEQ-IO-WORK-AREA
                                 W9293-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (W9293-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
           OR   W9293-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
               MOVE  W9293-LINK-RECORD TO R9293-SEQ-REC-INFO
           END-IF.
 
           EVALUATE TRUE 
               
               WHEN W9293-SEQ-IO-COMMAND = TFCMD-READ-RECORD
                    PERFORM 9293-1000-READ
                       THRU 9293-1000-READ-X
               
               WHEN W9293-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
                    PERFORM 9293-2000-WRITE
                       THRU 9293-2000-WRITE-X
               
               WHEN W9293-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
                    PERFORM 9293-3000-OPEN-INPUT
                       THRU 9293-3000-OPEN-INPUT-X
                    SET WS-FILE-IS-OPEN TO TRUE
               
               WHEN W9293-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
                    PERFORM 9293-4000-OPEN-OUTPUT
                       THRU 9293-4000-OPEN-OUTPUT-X
                    SET WS-FILE-IS-OPEN TO TRUE
               
               WHEN W9293-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
                    PERFORM 9293-5000-CLOSE
                       THRU 9293-5000-CLOSE-X
                    SET WS-FILE-IS-CLOSED TO TRUE
               
               WHEN W9293-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
                    PERFORM 9293-6000-OPEN-EXTEND
                       THRU 9293-6000-OPEN-EXTEND-X
                    SET WS-FILE-IS-OPEN TO TRUE
 
           END-EVALUATE.
                         
           IF  WS-FILE-IS-OPEN
           AND (W9293-SEQ-IO-COMMAND = TFCMD-READ-RECORD
           OR   W9293-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR   W9293-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
               MOVE R9293-SEQ-REC-INFO TO W9293-LINK-RECORD
           END-IF.
 
 
       0000-MAINLINE-X.
           GOBACK.
 
       COPY SCPI9293.
 
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRQ9293'                    **
      *****************************************************************
