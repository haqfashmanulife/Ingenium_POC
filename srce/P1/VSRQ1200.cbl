      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. VSRQ1200.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : VSRQ1200                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           PREMIUM DUE EVS EXTRACT                           **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR '1200' FILE PROCESSING         **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  31DEC96  JMG    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  JT     CODE CLEANUP                               **
557973**  30SEP97  MSP    AMOUNT FIELD SIZING FOR INTL SUPPORT       **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY VCSS1200.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY VCSD1200.
 
       COPY VCSR1200.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSRQ1200'.
 
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
       COPY VCSW1200.
 
557973*01  W1200-LINK-RECORD         PIC X(90).
557973 01  W1200-LINK-RECORD         PIC X(130).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           W1200-SEQ-IO-WORK-AREA
                                 W1200-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
007684     AND (W1200-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   W1200-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684         MOVE  W1200-LINK-RECORD TO R1200-SEQ-REC-INFO
557660     END-IF.
 
007684     IF  W1200-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM 1200-1000-READ
                  THRU 1200-1000-READ-X
           ELSE
007684     IF  W1200-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM 1200-2000-WRITE
                  THRU 1200-2000-WRITE-X
           ELSE
007684     IF  W1200-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM 1200-3000-OPEN-INPUT
                  THRU 1200-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W1200-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM 1200-4000-OPEN-OUTPUT
                  THRU 1200-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W1200-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM 1200-5000-CLOSE
                  THRU 1200-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W1200-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM 1200-6000-OPEN-EXTEND
                  THRU 1200-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
557660     END-IF.
 
           IF  WS-FILE-IS-OPEN
007684     AND (W1200-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   W1200-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   W1200-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684         MOVE R1200-SEQ-REC-INFO TO W1200-LINK-RECORD
557660     END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY VCPI1200.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM VSRQ1200                     **
      *****************************************************************
