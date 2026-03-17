      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRQ9859.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : SSRQ9859                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           SUCESSFUL FUND TRANSFER REPORT GENERATION         **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  23NOV05  CTS    CREATED FOR INGENIUM 6.1                   **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY SCSS9859.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY SCSD9859.
 
       COPY SCSR9859.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQ9859'.
 
       COPY SQLCA.
 
       01  WS-WORKING-STORAGE.
           05  WS-FILE-OPEN-SWITCH          PIC X(01)  VALUE 'N'.
               88  WS-FILE-IS-OPEN                     VALUE 'Y'.
               88  WS-FILE-IS-CLOSED                   VALUE 'N'.
      /
       COPY XCWTFCMD.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCSW9859.
 
       01  W9859-LINK-RECORD         PIC X(132).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9859-IO-WORK-AREA
                                 W9859-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (W9859-IO-COMMAND = TFCMD-WRITE-RECORD
           OR   W9859-IO-COMMAND = TFCMD-REWRITE-RECORD)
                MOVE  W9859-LINK-RECORD TO R9859-REC-INFO.
 
           IF  W9859-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM 9859-1000-READ
                  THRU 9859-1000-READ-X
           ELSE
           IF  W9859-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM 9859-2000-WRITE
                  THRU 9859-2000-WRITE-X
           ELSE
           IF  W9859-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM 9859-3000-OPEN-INPUT
                  THRU 9859-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
           IF  W9859-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM 9859-4000-OPEN-OUTPUT
                  THRU 9859-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
           IF  W9859-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM 9859-5000-CLOSE
                  THRU 9859-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
           IF  W9859-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM 9859-6000-OPEN-EXTEND
                  THRU 9859-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH.
 
           IF  WS-FILE-IS-OPEN
           AND (W9859-IO-COMMAND = TFCMD-READ-RECORD
           OR   W9859-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR   W9859-IO-COMMAND = TFCMD-READNEXT-RECORD)
                MOVE R9859-REC-INFO TO W9859-LINK-RECORD.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY SCPI9859.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRQ9859                     **
      *****************************************************************
