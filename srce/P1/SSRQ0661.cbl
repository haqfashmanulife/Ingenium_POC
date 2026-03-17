      *****************************************************************
      **  MEMBER :  SSRQ0661                                         **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           FUND INVENTORY EXTRACT                            **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :                                                   **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR '0661' FILE PROCESSING         **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
557693**  30SEP97  JMG    INCREASE SIZE FOR INTERNATIONAL SUPPORT    **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRQ0661.
 
       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY SCSS0661.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY SCSD0661.
 
       COPY SCSR0661.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQ0661'.
 
       COPY SQLCA.
 
       01  WS-WORKING-STORAGE.
           05  WS-FILE-OPEN-SWITCH          PIC X(01)  VALUE 'N'.
               88  WS-FILE-IS-OPEN                     VALUE 'Y'.
               88  WS-FILE-IS-CLOSED                   VALUE 'N'.
      /
014590*COPY XCWL0030.
      /
       COPY XCWTFCMD.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCSW0661.
 
557693*01  W0661-LINK-RECORD         PIC X(235).
557693 01  W0661-LINK-RECORD         PIC X(271).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           W0661-SEQ-IO-WORK-AREA
                                 W0661-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (W0661-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   W0661-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684          MOVE  W0661-LINK-RECORD TO R0661-SEQ-REC-INFO
54-001     END-IF.
 
54-001     EVALUATE TRUE
 
               WHEN W0661-SEQ-IO-COMMAND = TFCMD-READ-RECORD
                   PERFORM 0661-1000-READ
                      THRU 0661-1000-READ-X
 
               WHEN W0661-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
                   PERFORM 0661-2000-WRITE
                      THRU 0661-2000-WRITE-X
 
               WHEN W0661-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
                   PERFORM 0661-3000-OPEN-INPUT
                      THRU 0661-3000-OPEN-INPUT-X
                   MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN W0661-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
                   PERFORM 0661-4000-OPEN-OUTPUT
                      THRU 0661-4000-OPEN-OUTPUT-X
                   MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN W0661-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
                   PERFORM 0661-5000-CLOSE
                      THRU 0661-5000-CLOSE-X
                   MOVE 'N' TO WS-FILE-OPEN-SWITCH
 
               WHEN W0661-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
                   PERFORM 0661-6000-OPEN-EXTEND
                      THRU 0661-6000-OPEN-EXTEND-X
                   MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN  OTHER
                   CONTINUE
 
54-001     END-EVALUATE.
 
           IF  WS-FILE-IS-OPEN
           AND (W0661-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   W0661-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   W0661-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684          MOVE R0661-SEQ-REC-INFO TO W0661-LINK-RECORD
54-001     END-IF.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /
       COPY SCPI0661.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRQ0661                     **
      *****************************************************************
