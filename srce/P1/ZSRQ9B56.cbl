      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSRQ9B56.
      
       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQ9B56                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR FMLY TABLE  **
      **           PROCESSING                                        **
      **                                                             **
      **                                                             **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH. DESCRIPTION                                 **
      **                                                             **
SCVICP**  13JAN09  CTS   INITIAL VERSION.                            **
      *****************************************************************
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==9B56==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==9B56==.

       COPY ZCSR9B56.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9B56'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9B56==
                               ==':ID:'== BY =='9B56'==.

       COPY ZCSR9B56 REPLACING R9B56-SEQ-REC-INFO BY W9B56-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9B56-SEQ-IO-WORK-AREA
                                 W9B56-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9B56==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQ9B56                     **
      *****************************************************************
