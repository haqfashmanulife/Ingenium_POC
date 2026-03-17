      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. VSRQSCVQ.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : VSRQSCVQ                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           EVS COPY OF SUSPENDED COVERAGE FILE               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR 'SCVQ' FILE PROCESSING         **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  31DEC96  JMG    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  JT     CODE CLEANUP                               **
557973**  30SEP97  JMG    INCREASE LENGTH FOR INTERNATIONAL SUPPORT  **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY VCSSSCVQ.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY VCSDSCVQ.
 
       COPY VCSRSCVQ.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSRQSCVQ'.
 
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
       COPY VCSWSCVQ.
 
557973*01  WSCVQ-LINK-RECORD         PIC X(864).
557973 01  WSCVQ-LINK-RECORD         PIC X(976).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           WSCVQ-SEQ-IO-WORK-AREA
                                 WSCVQ-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
007684     AND (WSCVQ-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   WSCVQ-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684         MOVE  WSCVQ-LINK-RECORD TO RSCVQ-SEQ-REC-INFO
557660     END-IF.
 
007684     IF  WSCVQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM SCVQ-1000-READ
                  THRU SCVQ-1000-READ-X
           ELSE
007684     IF  WSCVQ-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM SCVQ-2000-WRITE
                  THRU SCVQ-2000-WRITE-X
           ELSE
007684     IF  WSCVQ-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM SCVQ-3000-OPEN-INPUT
                  THRU SCVQ-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WSCVQ-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM SCVQ-4000-OPEN-OUTPUT
                  THRU SCVQ-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WSCVQ-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM SCVQ-5000-CLOSE
                  THRU SCVQ-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WSCVQ-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM SCVQ-6000-OPEN-EXTEND
                  THRU SCVQ-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
557660     END-IF.
 
           IF  WS-FILE-IS-OPEN
007684     AND (WSCVQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   WSCVQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   WSCVQ-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684         MOVE RSCVQ-SEQ-REC-INFO TO WSCVQ-LINK-RECORD
557660     END-IF.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /
       COPY VCPISCVQ.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM VSRQSCVQ                     **
      *****************************************************************
