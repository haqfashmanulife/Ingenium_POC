      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. VSRQPOLQ.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : VSRQPOLQ                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           EVS COPY OF POLICY FILE                           **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR 'POLQ' FILE PROCESSING         **
51-855**  30NOV93  JJS    INCREASE IN POL FILE RECORD LENGTH         **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  31DEC96  JMG    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  JT     CODE CLEANUP                               **
557973**  30SEP97  JMG    INCREASE LENGTH FOR INTERNATIONAL SUPPORT  **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
MP171F**  10JAN12  CTS    CONCURRENCY AND LOGICAL LOCKING            **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY VCSSPOLQ.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY VCSDPOLQ.
 
       COPY VCSRPOLQ.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSRQPOLQ'.
 
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
       COPY VCSWPOLQ.
 
557973*01  WPOLQ-LINK-RECORD         PIC X(1280).
MP171F*557973 01  WPOLQ-LINK-RECORD         PIC X(1296).
MP171F 01  WPOLQ-LINK-RECORD         PIC X(2222).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           WPOLQ-SEQ-IO-WORK-AREA
                                 WPOLQ-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
007684     AND (WPOLQ-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   WPOLQ-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684         MOVE  WPOLQ-LINK-RECORD TO RPOLQ-SEQ-REC-INFO
557660     END-IF.
 
007684     IF  WPOLQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM POLQ-1000-READ
                  THRU POLQ-1000-READ-X
           ELSE
007684     IF  WPOLQ-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM POLQ-2000-WRITE
                  THRU POLQ-2000-WRITE-X
           ELSE
007684     IF  WPOLQ-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM POLQ-3000-OPEN-INPUT
                  THRU POLQ-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WPOLQ-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM POLQ-4000-OPEN-OUTPUT
                  THRU POLQ-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WPOLQ-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM POLQ-5000-CLOSE
                  THRU POLQ-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WPOLQ-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM POLQ-6000-OPEN-EXTEND
                  THRU POLQ-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
557660     END-IF.
 
           IF  WS-FILE-IS-OPEN
007684     AND (WPOLQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   WPOLQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   WPOLQ-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684         MOVE RPOLQ-SEQ-REC-INFO TO WPOLQ-LINK-RECORD
557660     END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY VCPIPOLQ.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM VSRQPOLQ                     **
      *****************************************************************
 
