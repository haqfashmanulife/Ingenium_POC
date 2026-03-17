      *****************************************************************
      **  MEMBER : ZSRQCFSA                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR             **
      **           CLAIM FSA UL EXTRACT GENERATION                   **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
EN1607**  30MAY07  CTS    CLAIM FSA UL EXTRACT                       **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQCFSA.

       COPY XCWWCRHT.

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==CFSA==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==CFSA==.

       COPY ZCSRCFSA.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQCFSA'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==CFSA==
                               ==':ID:'== BY =='CFSA'==.

       COPY ZCSRCFSA REPLACING RCFSA-SEQ-REC-INFO BY WCFSA-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WCFSA-SEQ-IO-WORK-AREA
                                 WCFSA-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==CFSA==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQCFSA                     **
      *****************************************************************
