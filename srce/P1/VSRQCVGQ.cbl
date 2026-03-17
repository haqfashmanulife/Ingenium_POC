      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. VSRQCVGQ.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : VSRQCVGQ                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           EVS COPY OF COVERAGE FILE                         **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR 'CVGQ' FILE PROCESSING         **
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
 
       COPY VCSSCVGQ.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY VCSDCVGQ.
 
       COPY VCSRCVGQ.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSRQCVGQ'.
 
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
       COPY VCSWCVGQ.
 
557973*01  WCVGQ-LINK-RECORD         PIC X(864).
MP171F*557973 01  WCVGQ-LINK-RECORD         PIC X(976).
MP171F 01  WCVGQ-LINK-RECORD         PIC X(1183).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           WCVGQ-SEQ-IO-WORK-AREA
                                 WCVGQ-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
007684     AND (WCVGQ-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   WCVGQ-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684         MOVE  WCVGQ-LINK-RECORD TO RCVGQ-SEQ-REC-INFO
557660     END-IF.
 
007684     IF  WCVGQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM CVGQ-1000-READ
                  THRU CVGQ-1000-READ-X
           ELSE
007684     IF  WCVGQ-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM CVGQ-2000-WRITE
                  THRU CVGQ-2000-WRITE-X
           ELSE
007684     IF  WCVGQ-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM CVGQ-3000-OPEN-INPUT
                  THRU CVGQ-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WCVGQ-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM CVGQ-4000-OPEN-OUTPUT
                  THRU CVGQ-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WCVGQ-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM CVGQ-5000-CLOSE
                  THRU CVGQ-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WCVGQ-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM CVGQ-6000-OPEN-EXTEND
                  THRU CVGQ-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
557660     END-IF.
 
           IF  WS-FILE-IS-OPEN
007684     AND (WCVGQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   WCVGQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   WCVGQ-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684         MOVE RCVGQ-SEQ-REC-INFO TO WCVGQ-LINK-RECORD
557660     END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY VCPICVGQ.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM VSRQCVGQ                     **
      *****************************************************************
