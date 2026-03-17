      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQ9A52.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQ9A52                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR POLICY      **
      **           INPUT FILE FOR WHICH 5021 PHST NEEDS TO BE UPDATED**
      **                                                             **
      *****************************************************************
      **  DATE     AUTH. DESCRIPTION                                 **
      **                                                             **
TVI000**  28JAN13  CTS   INITIAL VERSION                             **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==9A52==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==9A52==.

      *CODE EQUIVALENT OF COPYBOOK ZCSR9A52
       01 R9A52-SEQ-REC-INFO                   PIC X(70).
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9A52'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9A52==
                               ==':ID:'== BY =='9A52'==.

      *CODE EQUIVALENT OF BELOW STATEMENT
      *
      *COPY ZCSR9A52 REPLACING R9A52-SEQ-REC-INFO BY W9A52-LINK-RECORD.
      *
       01 W9A52-LINK-RECORD                   PIC X(70).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9A52-SEQ-IO-WORK-AREA
                                 W9A52-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9A52==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQ9A52                     **
      *****************************************************************
