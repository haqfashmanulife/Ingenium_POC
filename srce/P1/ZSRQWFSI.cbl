      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQWFSI.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQWFSI                                          **
      **  REMARKS: BATCH I/O PROGRAM TO EXTRACT BASIC POLICY         **
      **           INFORMATION FOR WORKFLOW IMAGING                  **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
WF2006**  24FEB08  CTS    CREATED FOR 'WFSI' FILE PROCESSING.        **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==WFSI==
                               ==:SYS:== BY ==C==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==WFSI==.

       COPY ZCSRWFSI.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQWFSI'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==WFSI==
                               ==':ID:'== BY =='WFSI'==.

       COPY ZCSRWFSI REPLACING RWFSI-SEQ-REC-INFO
                            BY WWFSI-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WWFSI-SEQ-IO-WORK-AREA
                                 WWFSI-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==WFSI==.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSRQWFSI                     **
      *****************************************************************
