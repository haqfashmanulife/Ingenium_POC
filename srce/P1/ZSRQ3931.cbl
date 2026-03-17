      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSRQ3931.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : ZSRQ3931                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           APOLOGY LETTER POLICY LIST FOR P03931             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
P03931**  03APR06  CTS    CREATED FOR INGENIUM 6.1.J                 **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY ZCSS3931.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY ZCSD3931.
 
       COPY ZCSR3931.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ3931'.
 
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
       COPY ZCSW3931.
 
       01  W3931-LINK-RECORD         PIC X(132).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W3931-IO-WORK-AREA
                                 W3931-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (W3931-IO-COMMAND = TFCMD-WRITE-RECORD
           OR   W3931-IO-COMMAND = TFCMD-REWRITE-RECORD)
                MOVE  W3931-LINK-RECORD TO R3931-REC-INFO.
 
           IF  W3931-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM 3931-1000-READ
                  THRU 3931-1000-READ-X
           ELSE
           IF  W3931-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM 3931-2000-WRITE
                  THRU 3931-2000-WRITE-X
           ELSE
           IF  W3931-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM 3931-3000-OPEN-INPUT
                  THRU 3931-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
           IF  W3931-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM 3931-4000-OPEN-OUTPUT
                  THRU 3931-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
           IF  W3931-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM 3931-5000-CLOSE
                  THRU 3931-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
           IF  W3931-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM 3931-6000-OPEN-EXTEND
                  THRU 3931-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH.
 
           IF  WS-FILE-IS-OPEN
           AND (W3931-IO-COMMAND = TFCMD-READ-RECORD
           OR   W3931-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR   W3931-IO-COMMAND = TFCMD-READNEXT-RECORD)
                MOVE R3931-REC-INFO TO W3931-LINK-RECORD.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY ZCPI3931.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM ZSRQ3931                     **
      *****************************************************************
