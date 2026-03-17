      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSRQ9A78.
      
       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQ9A78                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR CASH BACK   **
      **           BONUS                                             **
      **                                                             **
      **                                                             **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH. DESCRIPTION                                 **
      **                                                             **
EN9652**  20JUN108  CTS    INITIAL VERSION.                           **
      *****************************************************************

      *
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==9A78==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==9A78==.

       COPY ZCSR9A78.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9A78'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9A78==
                               ==':ID:'== BY =='9A78'==.

       COPY ZCSR9A78 REPLACING R9A78-SEQ-REC-INFO BY W9A78-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9A78-SEQ-IO-WORK-AREA
                                 W9A78-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9A78==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQ9A78                     **
      *****************************************************************
