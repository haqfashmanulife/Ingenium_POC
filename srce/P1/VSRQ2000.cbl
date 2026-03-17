      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. VSRQ2000.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : VSRQ2000                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           EVS PROCESSING EXTRACT                            **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR '2000' FILE PROCESSING         **
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
 
       COPY VCSS2000.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY VCSD2000.
 
       COPY VCSR2000.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSRQ2000'.
 
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
       COPY VCSW2000.
 
557973*01  W2000-LINK-RECORD         PIC X(469).
557973 01  W2000-LINK-RECORD         PIC X(499).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           W2000-SEQ-IO-WORK-AREA
                                 W2000-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
007684     AND (W2000-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   W2000-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684         MOVE  W2000-LINK-RECORD TO R2000-SEQ-REC-INFO
557660     END-IF.
 
007684     IF  W2000-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM 2000-1000-READ
                  THRU 2000-1000-READ-X
           ELSE
007684     IF  W2000-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM 2000-2000-WRITE
                  THRU 2000-2000-WRITE-X
           ELSE
007684     IF  W2000-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM 2000-3000-OPEN-INPUT
                  THRU 2000-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W2000-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM 2000-4000-OPEN-OUTPUT
                  THRU 2000-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W2000-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM 2000-5000-CLOSE
                  THRU 2000-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  W2000-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM 2000-6000-OPEN-EXTEND
                  THRU 2000-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
557660     END-IF.
 
           IF  WS-FILE-IS-OPEN
007684     AND (W2000-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   W2000-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   W2000-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684         MOVE R2000-SEQ-REC-INFO TO W2000-LINK-RECORD
557660     END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY VCPI2000.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM VSRQ2000                     **
      *****************************************************************
