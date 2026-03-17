      *****************************************************************
      **  MEMBER :  XSRQBCF                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           BATCH CONTROL FILE                                **
      **                                                             **
      **  DOMAIN : AC                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR 'BCF' FILE PROCESSING          **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
54-001 PROGRAM-ID. XSRQBCF.
 
       COPY XCWWCRHT.
 
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSBCF.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY XCSDBCF.
 
       COPY XCSRBCF.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
54-001 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRQBCF'.
 
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
       COPY XCSWBCF.
 
       01  WBCF-LINK-RECORD          PIC X(80).
      /
 
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           WBCF-SEQ-IO-WORK-AREA
                                 WBCF-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
007684     AND (WBCF-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684     OR   WBCF-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
007684          MOVE  WBCF-LINK-RECORD TO RBCF-SEQ-REC-INFO
54-001     END-IF.
 
54-001     EVALUATE TRUE
 
007684         WHEN  WBCF-SEQ-IO-COMMAND = TFCMD-READ-RECORD
                  PERFORM BCF-1000-READ
                     THRU BCF-1000-READ-X
 
007684         WHEN  WBCF-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
                  PERFORM BCF-2000-WRITE
                     THRU BCF-2000-WRITE-X
 
007684         WHEN  WBCF-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
                  PERFORM BCF-3000-OPEN-INPUT
                     THRU BCF-3000-OPEN-INPUT-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
007684         WHEN  WBCF-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
                  PERFORM BCF-4000-OPEN-OUTPUT
                     THRU BCF-4000-OPEN-OUTPUT-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
007684         WHEN  WBCF-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
                  PERFORM BCF-5000-CLOSE
                     THRU BCF-5000-CLOSE-X
                  MOVE 'N' TO WS-FILE-OPEN-SWITCH
 
007684         WHEN  WBCF-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
                  PERFORM BCF-6000-OPEN-EXTEND
                    THRU BCF-6000-OPEN-EXTEND-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
54-001     END-EVALUATE.
 
           IF  WS-FILE-IS-OPEN
007684     AND (WBCF-SEQ-IO-COMMAND = TFCMD-READ-RECORD
007684     OR   WBCF-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
007684     OR   WBCF-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
007684          MOVE RBCF-SEQ-REC-INFO TO WBCF-LINK-RECORD
54-001     END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY XCPIBCF.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSRQBCF                      **
      *****************************************************************
