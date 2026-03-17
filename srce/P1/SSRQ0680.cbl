      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRQ0680.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : SSRQ0680                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           UNIT PRICE CORRECTION EFFECTIVE DATE EXTRACTS     **
      **                                                             **
      **  DOMAIN :                                                   **
      **  CLASS  :                                                   **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  31NOV95         CREATED FOR '0680' FILE PROCESSING         **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  JT     CODE CLEANUP                               **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY SCSS0680.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY SCSD0680.
 
       COPY SCSR0680.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQ0680'.
 
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
       COPY SCSW0680.
 
       01  W0680-LINK-RECORD         PIC X(224).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           W0680-SEQ-IO-WORK-AREA
                                 W0680-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (W0680-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   W0680-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684         MOVE  W0680-LINK-RECORD TO R0680-SEQ-REC-INFO
557660     END-IF.
 
007684     IF  W0680-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM 0680-1000-READ
                  THRU 0680-1000-READ-X
           ELSE
007684     IF  W0680-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM 0680-2000-WRITE
                  THRU 0680-2000-WRITE-X
           ELSE
007684     IF  W0680-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM 0680-3000-OPEN-INPUT
                  THRU 0680-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W0680-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM 0680-4000-OPEN-OUTPUT
                  THRU 0680-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W0680-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM 0680-5000-CLOSE
                  THRU 0680-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W0680-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM 0680-6000-OPEN-EXTEND
                  THRU 0680-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
557660     END-IF.
 
           IF  WS-FILE-IS-OPEN
           AND (W0680-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   W0680-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   W0680-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684         MOVE R0680-SEQ-REC-INFO TO W0680-LINK-RECORD
557660     END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY SCPI0680.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRQ0680                     **
      *****************************************************************
