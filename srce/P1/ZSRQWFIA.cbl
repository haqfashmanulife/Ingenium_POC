      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQWFIA.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQWFIA                                          **
      **  REMARKS: BATCH I/O PROGRAM TO EXTRACT BASIC POLICY         **
      **           INFORMATION FOR WORKFLOW IMAGING                  **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
WF2006**  24FEB08  CTS    CREATED FOR 'WFIA' FILE PROCESSING.        **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==WFIA==
                               ==:SYS:== BY ==C==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==WFIA==.

       COPY ZCSRWFIA.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQWFIA'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==WFIA==
                               ==':ID:'== BY =='WFIA'==.

       COPY ZCSRWFIA REPLACING RWFIA-SEQ-REC-INFO
                            BY WWFIA-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WWFIA-SEQ-IO-WORK-AREA
                                 WWFIA-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==WFIA==.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSRQWFIA                     **
      *****************************************************************
