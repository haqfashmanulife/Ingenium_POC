      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQ951A.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQ951A                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR VALIDATION  **
      **                                                             **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH. DESCRIPTION                                 **
      **                                                             **
M166T1**  23FEB12  CTS   INITIAL VERSION                             **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==951A==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==951A==.

      *CODE EQUIVALENT OF COPYBOOK ZCSR951A
       COPY ZCSR951A.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ951A'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==951A==
                               ==':ID:'== BY =='951A'==.

      *CODE EQUIVALENT OF BELOW STATEMENT
      *
       COPY ZCSR951A REPLACING R951A-SEQ-REC-INFO BY W951A-LINK-RECORD.
      
      *01 W951A-LINK-RECORD                   PIC X(315).
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W951A-SEQ-IO-WORK-AREA
                                 W951A-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==951A==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQ951A                     **
      *****************************************************************
