      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQ9A51.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQ9A51                                          **
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

       COPY XCSSFILE REPLACING ==:ID:==  BY ==9A51==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==9A51==.

      *CODE EQUIVALENT OF COPYBOOK ZCSR9A51
       01 R9A51-SEQ-REC-INFO                   PIC X(42).
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9A51'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9A51==
                               ==':ID:'== BY =='9A51'==.

      *CODE EQUIVALENT OF BELOW STATEMENT
      *
      *COPY ZCSR9A51 REPLACING R9A51-SEQ-REC-INFO BY W9A51-LINK-RECORD.
      *
       01 W9A51-LINK-RECORD                   PIC X(42).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9A51-SEQ-IO-WORK-AREA
                                 W9A51-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9A51==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQ9A51                     **
      *****************************************************************
