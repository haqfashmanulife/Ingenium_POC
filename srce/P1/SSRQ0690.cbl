      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRQ0690.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRQ0690                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE                        **
      **            UNIT PRICE CORRECTION EFFECTIVE DATE EXTRACTS    **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  31NOV95         CREATED FOR '0690' FILE PROCESSING         **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
012078**  30OCT98  56     LENGTH OF W0690-LINK-RECORD IS 187 NOT 224 **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY SCSS0690.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY SCSD0690.
 
       COPY SCSR0690.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQ0690'.
 
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
       COPY SCSW0690.
 
012078*01  W0690-LINK-RECORD         PIC X(224).
012078 01  W0690-LINK-RECORD         PIC X(189).
 
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           W0690-SEQ-IO-WORK-AREA
                                 W0690-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (W0690-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   W0690-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684          MOVE  W0690-LINK-RECORD TO R0690-SEQ-REC-INFO
           END-IF.
 
           EVALUATE TRUE
 
           WHEN W0690-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM 0690-1000-READ
                  THRU 0690-1000-READ-X
 
           WHEN W0690-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
                PERFORM 0690-2000-WRITE
                   THRU 0690-2000-WRITE-X
 
           WHEN W0690-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
                PERFORM 0690-3000-OPEN-INPUT
                   THRU 0690-3000-OPEN-INPUT-X
                MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
           WHEN W0690-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
                PERFORM 0690-4000-OPEN-OUTPUT
                   THRU 0690-4000-OPEN-OUTPUT-X
                MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
           WHEN W0690-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
                PERFORM 0690-5000-CLOSE
                   THRU 0690-5000-CLOSE-X
                MOVE 'N' TO WS-FILE-OPEN-SWITCH
 
           WHEN W0690-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
                PERFORM 0690-6000-OPEN-EXTEND
                   THRU 0690-6000-OPEN-EXTEND-X
                MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
           END-EVALUATE.
 
           IF  WS-FILE-IS-OPEN
           AND (W0690-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   W0690-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   W0690-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684          MOVE R0690-SEQ-REC-INFO TO W0690-LINK-RECORD
           END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY SCPI0690.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRQ0690                     **
      *****************************************************************
