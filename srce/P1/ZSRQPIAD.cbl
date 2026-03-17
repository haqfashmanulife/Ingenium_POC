      *****************************************************************
      **  MEMBER : ZSRQPIAD                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR             **
      **           PIRA ADHOC REPORT GENERATION                      **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
PIRAAD**  01AUG06  CTS    PIRA ADHOC REPORT GENERATION               **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQPIAD.

       COPY XCWWCRHT.

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==PIAD==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==PIAD==.

       COPY ZCSRPIAD.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQPIAD'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==PIAD==
                               ==':ID:'== BY =='PIAD'==.

       COPY ZCSRPIAD REPLACING RPIAD-SEQ-REC-INFO BY WPIAD-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WPIAD-SEQ-IO-WORK-AREA
                                 WPIAD-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==PIAD==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQPIAD                     **
      *****************************************************************
