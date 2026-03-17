      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSRQ9B59.
      
       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSRQ9B59                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR PROSPECT    **
      **           VISIT TABLE PROCESSING                            **
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

       COPY XCSSFILE REPLACING ==:ID:==  BY ==9B59==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==9B59==.

       COPY ZCSR9B59.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9B59'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9B59==
                               ==':ID:'== BY =='9B59'==.

       COPY ZCSR9B59 REPLACING R9B59-SEQ-REC-INFO BY W9B59-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9B59-SEQ-IO-WORK-AREA
                                 W9B59-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9B59==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQ9B59                     **
      *****************************************************************
