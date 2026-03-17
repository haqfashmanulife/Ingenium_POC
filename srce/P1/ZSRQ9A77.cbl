      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSRQ9A77.
      
       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQ9A77                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR CASH BACK   **
      **           BONUS                                             **
      **                                                             **
      **                                                             **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH. DESCRIPTION                                 **
      **                                                             **
MP7304**  20SEPT08  CTS    INITIAL VERSION.                           **
      *****************************************************************

      *
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==9A77==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==9A77==.

       COPY ZCSR9A77.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9A77'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9A77==
                               ==':ID:'== BY =='9A77'==.

       COPY ZCSR9A77 REPLACING R9A77-SEQ-REC-INFO BY W9A77-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9A77-SEQ-IO-WORK-AREA
                                 W9A77-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9A77==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQ9A77                     **
      *****************************************************************
