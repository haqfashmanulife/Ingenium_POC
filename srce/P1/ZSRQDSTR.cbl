      *****************************************************************
      **  MEMBER :  ZSRQDSTR                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR  TRANSFER SLIP GENERATION  **
      **            INPUT - ZSDSTR                                   **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP771D**  10MAR20  CTS    CREATED FOR 'DSTR' FILE PROCESSING         **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQDSTR.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==DSTR==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==DSTR==.
       COPY ZCSRDSTR.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQDSTR'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==DSTR==
                               ==':ID:'== BY =='DSTR'==.

       COPY ZCSRDSTR REPLACING RDSTR-SEQ-REC-INFO
                                         BY WDSTR-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WDSTR-SEQ-IO-WORK-AREA
                                 WDSTR-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==DSTR==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQDSTR                     **
      *****************************************************************
