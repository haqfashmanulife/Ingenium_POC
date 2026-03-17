      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSRQ9175.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : ZSRQ9175                                          **
      **  REMARKS: BATCH I/O PROGRAM LINC EXTRACT FOR DATA MIGRATION **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
M119DM**  10FEB10  CTS    CREATED FOR '9175' FILE PROCESSING.        **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSFILE REPLACING ==:ID:==  BY ==9175==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
 
       COPY XCSDFILE REPLACING ==:ID:== BY ==9175==.

       COPY ZCSR9175.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9175'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9175==
                               ==':ID:'== BY =='9175'==.

       COPY ZCSR9175 REPLACING R9175-SEQ-REC-INFO
                            BY W9175-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9175-SEQ-IO-WORK-AREA
                                 W9175-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9175==.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSRQ9175                     **
      *****************************************************************
