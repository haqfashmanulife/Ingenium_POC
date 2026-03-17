      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSRQ3635.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSRQ3635                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE                        **
      **            3635 DATAMODEL FILE                              **
      **                                                             **
      **  DOMAIN :                                                   **
      **  CLASS  :                                                   **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
006002**  15DEC99  60     NEW PROGRAM                                **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSS3635.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSD3635.

       COPY XCSR3635.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRQ3635'.

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
       COPY XCSW3635.

       01  W3635-LINK-RECORD         PIC X(300).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W3635-SEQ-IO-WORK-AREA
                                 W3635-LINK-RECORD.

      *--------------
       0000-MAINLINE.
      *--------------

           IF  WS-FILE-IS-OPEN
           AND (W3635-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
           OR   W3635-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
                MOVE  W3635-LINK-RECORD TO R3635-SEQ-REC-INFO
           END-IF.


           EVALUATE TRUE
             WHEN  W3635-SEQ-IO-COMMAND = TFCMD-READ-RECORD
               PERFORM 3635-1000-READ
                  THRU 3635-1000-READ-X

             WHEN  W3635-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
               PERFORM 3635-2000-WRITE
                  THRU 3635-2000-WRITE-X

             WHEN  W3635-SEQ-IO-COMMAND = TFCMD-OPEN-I-FILE
               PERFORM 3635-3000-OPEN-INPUT
                  THRU 3635-3000-OPEN-INPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH

             WHEN  W3635-SEQ-IO-COMMAND = TFCMD-OPEN-O-FILE
               PERFORM 3635-4000-OPEN-OUTPUT
                  THRU 3635-4000-OPEN-OUTPUT-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH

             WHEN  W3635-SEQ-IO-COMMAND = TFCMD-CLOSE-FILE
               PERFORM 3635-5000-CLOSE
                  THRU 3635-5000-CLOSE-X
               MOVE 'N' TO WS-FILE-OPEN-SWITCH

             WHEN  W3635-SEQ-IO-COMMAND = TFCMD-OPEN-EXTEND-FILE
               PERFORM 3635-6000-OPEN-EXTEND
                  THRU 3635-6000-OPEN-EXTEND-X
               MOVE 'Y' TO WS-FILE-OPEN-SWITCH
           END-EVALUATE.

           IF  WS-FILE-IS-OPEN
           AND (W3635-SEQ-IO-COMMAND = TFCMD-READ-RECORD
           OR   W3635-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR   W3635-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
                MOVE R3635-SEQ-REC-INFO TO W3635-LINK-RECORD
           END-IF.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
       COPY XCPI3635.
      /
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM XSRQ3635                     **
      *****************************************************************
