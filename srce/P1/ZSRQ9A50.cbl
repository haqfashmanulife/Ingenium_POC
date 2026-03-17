      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQ9A50.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQ9A50                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR POLICY      **
      **           INPUT FILE FOR WHICH 1910 PHST NEEDS TO BE CREATED**
      **                                                             **
      *****************************************************************
      **  DATE     AUTH. DESCRIPTION                                 **
      **                                                             **
NWLPPT**  05OCT10  CTS   INITIAL VERSION                             **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==9A50==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==9A50==.

      *CODE EQUIVALENT OF COPYBOOK ZCSR9A50
       01 R9A50-SEQ-REC-INFO                   PIC X(70).
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9A50'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9A50==
                               ==':ID:'== BY =='9A50'==.

      *CODE EQUIVALENT OF BELOW STATEMENT
      *
      *COPY ZCSR9A50 REPLACING R9A50-SEQ-REC-INFO BY W9A50-LINK-RECORD.
      *
       01 W9A50-LINK-RECORD                   PIC X(70).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9A50-SEQ-IO-WORK-AREA
                                 W9A50-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9A50==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQ9A50                     **
      *****************************************************************
