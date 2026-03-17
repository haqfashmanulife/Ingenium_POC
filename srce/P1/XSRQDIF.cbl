      *****************************************************************
      **  MEMBER : XSRQDIF                                           **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           DATA INPUT  FILE                                  **
      **                                                             **
      **  DOMAIN : AC                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MI0009**  05MAY03  CSS    CREATED FOR 'DIF' FILE PROCESSING          **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRQDIF.
 
       COPY XCWWCRHT.
 
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSDIF.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY XCSDDIF.
 
       COPY XCSRDIF.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRQDIF'.
 
       COPY SQLCA.
 
       01  WS-WORKING-STORAGE.
           05  WS-FILE-OPEN-SWITCH          PIC X(01)  VALUE 'N'.
               88  WS-FILE-IS-OPEN                     VALUE 'Y'.
               88  WS-FILE-IS-CLOSED                   VALUE 'N'.
      /
       COPY XCWTFCMD.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCSWDIF.
 
       01  WDIF-LINK-RECORD          PIC X(80).
      /
 
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WDIF-SEQ-IO-WORK-AREA
                                 WDIF-LINK-RECORD.
 
      ***************
       0000-MAINLINE.
      ***************
 
           IF  WS-FILE-IS-OPEN
           AND (WDIF-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
           OR   WDIF-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
                MOVE  WDIF-LINK-RECORD TO RDIF-SEQ-REC-INFO
           END-IF.
 
           EVALUATE TRUE
 
               WHEN  WDIF-SEQ-IO-COMMAND = TFCMD-READ-RECORD
                  PERFORM DIF-1000-READ
                     THRU DIF-1000-READ-X
 
               WHEN  WDIF-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
                  PERFORM DIF-2000-WRITE
                     THRU DIF-2000-WRITE-X
 
               WHEN  WDIF-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
                  PERFORM DIF-3000-OPEN-INPUT
                     THRU DIF-3000-OPEN-INPUT-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN  WDIF-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
                  PERFORM DIF-4000-OPEN-OUTPUT
                     THRU DIF-4000-OPEN-OUTPUT-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
               WHEN  WDIF-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
                  PERFORM DIF-5000-CLOSE
                     THRU DIF-5000-CLOSE-X
                  MOVE 'N' TO WS-FILE-OPEN-SWITCH
 
               WHEN  WDIF-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
                  PERFORM DIF-6000-OPEN-EXTEND
                     THRU DIF-6000-OPEN-EXTEND-X
                  MOVE 'Y' TO WS-FILE-OPEN-SWITCH
 
           END-EVALUATE.
 
           IF  WS-FILE-IS-OPEN
           AND (WDIF-SEQ-IO-COMMAND = TFCMD-READ-RECORD
           OR   WDIF-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR   WDIF-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
                MOVE RDIF-SEQ-REC-INFO TO WDIF-LINK-RECORD
           END-IF.
 
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY XCPIDIF.
      /
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSRQDIF                      **
      *****************************************************************
