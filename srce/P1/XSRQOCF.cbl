      *****************************************************************
      **  MEMBER :  XSRQOCF                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           OUTPUT CONTROL FILE                               **
      **                                                             **
      **  DOMAIN : SY                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30NOV92  GPB    CREATED FOR 'OCF' FILE PROCESSING          **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRQOCF.
 
       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSOCF.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY XCSDOCF.
 
       COPY XCSROCF.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
54-001 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRQOCF'.
 
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
       COPY XCSWOCF.
 
       01  WOCF-LINK-RECORD          PIC X(132).
      /
      ***************************
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
007684                           WOCF-SEQ-IO-WORK-AREA
                                 WOCF-LINK-RECORD.
      ***************************
 
      *---------------
       0000-MAINLINE.
      *---------------
 
           IF  WS-FILE-IS-OPEN
007684     AND WOCF-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
007684         MOVE  WOCF-LINK-RECORD       TO ROCF-SEQ-REC-INFO
           END-IF.
 
54-001     EVALUATE TRUE
 
007684         WHEN  WOCF-SEQ-IO-COMMAND = TFCMD-READ-RECORD
                  PERFORM OCF-1000-READ
                     THRU OCF-1000-READ-X
 
007684         WHEN  WOCF-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
                   IF WOCF-NUMBER-LINES  <  99
                      PERFORM OCF-2000-WRITE
                         THRU OCF-2000-WRITE-X
                   ELSE
                      PERFORM OCF-2500-WRITE
                         THRU OCF-2500-WRITE-X
                   END-IF
 
007684         WHEN  WOCF-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
                   PERFORM OCF-4000-OPEN-OUTPUT
                      THRU OCF-4000-OPEN-OUTPUT-X
                   MOVE 'Y'                 TO WS-FILE-OPEN-SWITCH
 
007684         WHEN  WOCF-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
                   PERFORM OCF-5000-CLOSE
                      THRU OCF-5000-CLOSE-X
                   MOVE 'N'                 TO WS-FILE-OPEN-SWITCH
 
007684         WHEN  WOCF-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
                   PERFORM OCF-6000-OPEN-EXTEND
                      THRU OCF-6000-OPEN-EXTEND-X
                   MOVE 'Y'                 TO WS-FILE-OPEN-SWITCH
 
54-001     END-EVALUATE.
 
       0000-MAINLINE-X.
           GOBACK.
      /
       COPY XCPIOCF.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSRQOCF                      **
      *****************************************************************
