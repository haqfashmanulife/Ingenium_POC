      *****************************************************************
      **  MEMBER :  SSRQUVCT                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE                        **
      **            MCL UV CORRECTION FILE                           **
      **                                                             **
      **  DOMAIN :  BC                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MFFF11** 20SEP2005 SUG    CREATED FOR 'MFUV' FILE PROCESSING         **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. SSRQUVCT.

       COPY XCWWCRHT.

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY SCSSUVCT.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY SCSDUVCT.

       COPY SCSRUVCT.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQUVCT'.

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
       COPY SCSWUVCT.

       01  WUVCT-LINK-RECORD         PIC X(132).

      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WUVCT-SEQ-IO-WORK-AREA
                                 WUVCT-LINK-RECORD.

      ***************
       0000-MAINLINE.
      ***************

           IF  WS-FILE-IS-OPEN
           AND (WUVCT-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
           OR   WUVCT-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
                MOVE  WUVCT-LINK-RECORD TO RUVCT-SEQ-REC-INFO
           END-IF.

           EVALUATE WUVCT-SEQ-IO-COMMAND

               WHEN TFCMD-READ-RECORD
                   PERFORM  UVCT-1000-READ
                       THRU UVCT-1000-READ-X
               WHEN TFCMD-WRITE-RECORD
                   PERFORM  UVCT-2000-WRITE
                       THRU UVCT-2000-WRITE-X
               WHEN TFCMD-OPEN-I-FILE
                   PERFORM  UVCT-3000-OPEN-INPUT
                       THRU UVCT-3000-OPEN-INPUT-X
                   MOVE 'Y'             TO WS-FILE-OPEN-SWITCH
               WHEN TFCMD-OPEN-O-FILE
                   PERFORM  UVCT-4000-OPEN-OUTPUT
                       THRU UVCT-4000-OPEN-OUTPUT-X
                   MOVE 'Y'             TO WS-FILE-OPEN-SWITCH
               WHEN TFCMD-CLOSE-FILE
                   PERFORM  UVCT-5000-CLOSE
                       THRU UVCT-5000-CLOSE-X
                   MOVE 'N'             TO WS-FILE-OPEN-SWITCH
               WHEN TFCMD-OPEN-EXTEND-FILE
                   PERFORM  UVCT-6000-OPEN-EXTEND
                       THRU UVCT-6000-OPEN-EXTEND-X
                   MOVE 'Y'             TO WS-FILE-OPEN-SWITCH

           END-EVALUATE.

           IF  WS-FILE-IS-OPEN
           AND (WUVCT-SEQ-IO-COMMAND = TFCMD-READ-RECORD
           OR   WUVCT-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR   WUVCT-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
                MOVE RUVCT-SEQ-REC-INFO  TO WUVCT-LINK-RECORD
           END-IF.

       0000-MAINLINE-X.
           GOBACK.
      /
       COPY SCPIUVCT.
      /
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM SSRQUVCT                     **
      *****************************************************************
