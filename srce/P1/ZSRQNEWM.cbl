      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQNEWM.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQNEWM                                          **
      **  REMARKS:  BATCH I/O ROUTINE FOR TEMPORARY NEWM FILE        **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
P00005**  09OCT01  JEB    CREATED FOR ZAP OF JOURNAL DT IN MTD FILE  **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY ZCSSNEWM.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY ZCSDNEWM.

       COPY ZCSRNEWM.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQNEWM'.

       COPY SQLCA.

       01  WS-WORKING-STORAGE.
           05  WS-FILE-OPEN-SWITCH          PIC X(01)  VALUE 'N'.
               88  WS-FILE-IS-OPEN                     VALUE 'Y'.
               88  WS-FILE-IS-CLOSED                   VALUE 'N'.
      /
      /
       COPY XCWTFCMD.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY ZCSWNEWM.

       01  WNEWM-LINK-RECORD         PIC X(507).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WNEWM-SEQ-IO-WORK-AREA
                                 WNEWM-LINK-RECORD.

      ***************
       0000-MAINLINE.
      ***************

           IF  WS-FILE-IS-OPEN
           AND (WNEWM-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
           OR  WNEWM-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
               MOVE  WNEWM-LINK-RECORD TO RNEWM-SEQ-REC-INFO
           END-IF.

           IF  WNEWM-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM NEWM-1000-READ
                  THRU NEWM-1000-READ-X
           END-IF.
           IF  WNEWM-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM NEWM-2000-WRITE
                  THRU NEWM-2000-WRITE-X
           END-IF.
           IF  WNEWM-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM NEWM-3000-OPEN-INPUT
                  THRU NEWM-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           END-IF.
           IF  WNEWM-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM NEWM-4000-OPEN-OUTPUT
                  THRU NEWM-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           END-IF.
           IF  WNEWM-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM NEWM-5000-CLOSE
                  THRU NEWM-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH
           END-IF.
           IF  WNEWM-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM NEWM-6000-OPEN-EXTEND
                  THRU NEWM-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           END-IF.

           IF  WS-FILE-IS-OPEN
           AND (WNEWM-SEQ-IO-COMMAND = TFCMD-READ-RECORD
           OR  WNEWM-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR  WNEWM-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
               MOVE RNEWM-SEQ-REC-INFO TO WNEWM-LINK-RECORD
           END-IF.

           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      /
       COPY ZCPINEWM.
      /
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQNEWM                     **
      *****************************************************************
