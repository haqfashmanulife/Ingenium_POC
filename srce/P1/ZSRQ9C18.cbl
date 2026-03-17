      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSRQ9C18.
 
       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSRQ9C18                                         **
      **  REMARKS:  UPDATION OF CDSA AMOUNT FOR SA RIDER             **
      **            FUND WITHDRAWAL                                  **
      **                                                             **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
R14135**  04JUL18  CTS    CREATED FOR '9C18' FILE PROCESSING         **
      *****************************************************************
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSFILE REPLACING ==:ID:==  BY ==9C18==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY XCSDFILE REPLACING ==:ID:== BY ==9C18==.
 
       COPY ZCSR9C18.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9C18'.
 
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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9C18==
                               ==':ID:'== BY =='9C18'==.
 
       COPY ZCSR9C18 REPLACING R9C18-SEQ-REC-INFO BY W9C18-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9C18-SEQ-IO-WORK-AREA
                                 W9C18-LINK-RECORD.
 
      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9C18==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM ZSRQ9C18                     **
      *****************************************************************
