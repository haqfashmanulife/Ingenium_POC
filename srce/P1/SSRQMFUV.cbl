      *****************************************************************
      **  MEMBER :  SSRQMFUV                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE                        **
      **            FUND UV FEED                                     **
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

       PROGRAM-ID. SSRQMFUV.

       COPY XCWWCRHT.

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY SCSSMFUV.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY SCSDMFUV.

       COPY SCSRMFUV.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRQMFUV'.

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
       COPY SCSWMFUV.

       01  WMFUV-LINK-RECORD         PIC X(23).

      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WMFUV-SEQ-IO-WORK-AREA
                                 WMFUV-LINK-RECORD.

      ***************
       0000-MAINLINE.
      ***************

           IF  WS-FILE-IS-OPEN
           AND (WMFUV-SEQ-IO-COMMAND = TFCMD-WRITE-RECORD
           OR   WMFUV-SEQ-IO-COMMAND = TFCMD-REWRITE-RECORD)
                MOVE  WMFUV-LINK-RECORD TO RMFUV-SEQ-REC-INFO
           END-IF.

           EVALUATE WMFUV-SEQ-IO-COMMAND

               WHEN TFCMD-READ-RECORD
                   PERFORM  MFUV-1000-READ
                       THRU MFUV-1000-READ-X
               WHEN TFCMD-WRITE-RECORD
                   PERFORM  MFUV-2000-WRITE
                       THRU MFUV-2000-WRITE-X
               WHEN TFCMD-OPEN-I-FILE
                   PERFORM  MFUV-3000-OPEN-INPUT
                       THRU MFUV-3000-OPEN-INPUT-X
                   MOVE 'Y'             TO WS-FILE-OPEN-SWITCH
               WHEN TFCMD-OPEN-O-FILE
                   PERFORM  MFUV-4000-OPEN-OUTPUT
                       THRU MFUV-4000-OPEN-OUTPUT-X
                   MOVE 'Y'             TO WS-FILE-OPEN-SWITCH
               WHEN TFCMD-CLOSE-FILE
                   PERFORM  MFUV-5000-CLOSE
                       THRU MFUV-5000-CLOSE-X
                   MOVE 'N'             TO WS-FILE-OPEN-SWITCH
               WHEN TFCMD-OPEN-EXTEND-FILE
                   PERFORM  MFUV-6000-OPEN-EXTEND
                       THRU MFUV-6000-OPEN-EXTEND-X
                   MOVE 'Y'             TO WS-FILE-OPEN-SWITCH

           END-EVALUATE.

           IF  WS-FILE-IS-OPEN
           AND (WMFUV-SEQ-IO-COMMAND = TFCMD-READ-RECORD
           OR   WMFUV-SEQ-IO-COMMAND = TFCMD-READ-RECORD-FOR-UPDATE
           OR   WMFUV-SEQ-IO-COMMAND = TFCMD-READNEXT-RECORD)
                MOVE RMFUV-SEQ-REC-INFO  TO WMFUV-LINK-RECORD
           END-IF.

       0000-MAINLINE-X.
           GOBACK.
      /
       COPY SCPIMFUV.
      /
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM SSRQMFUV                     **
      *****************************************************************
