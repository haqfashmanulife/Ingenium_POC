      *****************************************************************
      **  MEMBER :  SSRQ0620                                         **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           FUND MVMT/ACTIVITY/DETAIL EXTRACTS                **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :                                                   **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR '0620' FILE PROCESSING         **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  JT     RENAME PROGRAM-ID                          **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
557660 PROGRAM-ID. SSRQ0620.
 
       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY SCSS0620.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY SCSD0620.
 
       COPY SCSR0620.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQ0620'.
 
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
       COPY SCSW0620.
 
       01  W0620-LINK-RECORD         PIC X(386).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           W0620-SEQ-IO-WORK-AREA
                                 W0620-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (W0620-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   W0620-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684          MOVE  W0620-LINK-RECORD TO R0620-SEQ-REC-INFO
54-001     END-IF.
 
54-001     EVALUATE TRUE
 
               WHEN  W0620-SEQ-IO-COMMAND = TFCMD-READ-RECORD
                   PERFORM 0620-1000-READ
                      THRU 0620-1000-READ-X
 
               WHEN  W0620-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
                   PERFORM 0620-2000-WRITE
                      THRU 0620-2000-WRITE-X
 
               WHEN  W0620-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
                   PERFORM 0620-3000-OPEN-INPUT
                      THRU 0620-3000-OPEN-INPUT-X
                   MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN  W0620-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
                   PERFORM 0620-4000-OPEN-OUTPUT
                      THRU 0620-4000-OPEN-OUTPUT-X
                   MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN  W0620-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
                   PERFORM 0620-5000-CLOSE
                      THRU 0620-5000-CLOSE-X
                   MOVE 'N' TO WS-FILE-OPEN-SWITCH
 
               WHEN  W0620-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
                   PERFORM 0620-6000-OPEN-EXTEND
                      THRU 0620-6000-OPEN-EXTEND-X
                   MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN  OTHER
                   CONTINUE
 
           END-EVALUATE.
 
           IF  WS-FILE-IS-OPEN
           AND (W0620-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   W0620-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   W0620-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684          MOVE R0620-SEQ-REC-INFO TO W0620-LINK-RECORD
54-001     END-IF.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /
       COPY SCPI0620.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRQ0620                     **
      *****************************************************************
