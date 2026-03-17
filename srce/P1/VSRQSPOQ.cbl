      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. VSRQSPOQ.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : VSRQSPOQ                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           EVS COPY OF SUSPENDED POLICY FILE                 **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR 'SPOQ' FILE PROCESSING         **
51-855**  30NOV93  JJS    INCREASE IN SPOL RECORD LENGTH             **
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
 
       COPY VCSSSPOQ.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY VCSDSPOQ.
 
       COPY VCSRSPOQ.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSRQSPOQ'.
 
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
       COPY VCSWSPOQ.
 
557973*01  WSPOQ-LINK-RECORD         PIC X(1280).
557973 01  WSPOQ-LINK-RECORD         PIC X(1296).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           WSPOQ-SEQ-IO-WORK-AREA
                                 WSPOQ-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
007684     AND (WSPOQ-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   WSPOQ-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684         MOVE  WSPOQ-LINK-RECORD TO RSPOQ-SEQ-REC-INFO
557660     END-IF.
 
007684     IF  WSPOQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM SPOQ-1000-READ
                  THRU SPOQ-1000-READ-X
           ELSE
007684     IF  WSPOQ-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM SPOQ-2000-WRITE
                  THRU SPOQ-2000-WRITE-X
           ELSE
007684     IF  WSPOQ-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM SPOQ-3000-OPEN-INPUT
                  THRU SPOQ-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WSPOQ-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM SPOQ-4000-OPEN-OUTPUT
                  THRU SPOQ-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WSPOQ-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM SPOQ-5000-CLOSE
                  THRU SPOQ-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           ELSE
007684     IF  WSPOQ-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM SPOQ-6000-OPEN-EXTEND
                  THRU SPOQ-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
557660     END-IF.
 
           IF  WS-FILE-IS-OPEN
007684     AND (WSPOQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   WSPOQ-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   WSPOQ-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684         MOVE RSPOQ-SEQ-REC-INFO TO WSPOQ-LINK-RECORD
557660     END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY VCPISPOQ.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM VSRQSPOQ                     **
      *****************************************************************
