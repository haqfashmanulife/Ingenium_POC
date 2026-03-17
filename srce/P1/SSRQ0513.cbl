 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRQ0513.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRQ0513                                         **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           T3 CALCULATION TAX EXTRACT                        **
      **                                                             **
      **  DOMAIN :                                                   **
      **  CLASS  :                                                   **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR '0513' FILE PROCESSING         **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  SRF    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  JT     CODE CLEANUP                               **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY SCSS0513.
 
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY SCSD0513.
 
       COPY SCSR0513.
 
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQ0513'.
 
       COPY SQLCA.
 
       01  WS-WORKING-STORAGE.
           05  WS-FILE-OPEN-SWITCH          PIC X(01)  VALUE 'N'.
               88  WS-FILE-IS-OPEN                     VALUE 'Y'.
               88  WS-FILE-IS-CLOSED                   VALUE 'N'.
 
014590*COPY XCWL0030.
 
       COPY XCWTFCMD.
 
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY SCSW0513.
 
       01  W0513-LINK-RECORD         PIC X(300).
 
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           W0513-SEQ-IO-WORK-AREA
                                 W0513-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (W0513-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   W0513-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684         MOVE  W0513-LINK-RECORD TO R0513-SEQ-REC-INFO
557660     END-IF.
 
007684     IF  W0513-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM 0513-1000-READ
                  THRU 0513-1000-READ-X
           ELSE
007684     IF  W0513-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM 0513-2000-WRITE
                  THRU 0513-2000-WRITE-X
           ELSE
007684     IF  W0513-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM 0513-3000-OPEN-INPUT
                  THRU 0513-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W0513-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM 0513-4000-OPEN-OUTPUT
                  THRU 0513-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W0513-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM 0513-5000-CLOSE
                  THRU 0513-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W0513-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM 0513-6000-OPEN-EXTEND
                  THRU 0513-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
557660     END-IF.
 
           IF  WS-FILE-IS-OPEN
           AND (W0513-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   W0513-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   W0513-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684          MOVE R0513-SEQ-REC-INFO TO W0513-LINK-RECORD
557660     END-IF.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
 
       COPY SCPI0513.
 
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRQ0513                     **
      *****************************************************************
