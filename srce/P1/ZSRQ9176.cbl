      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSRQ9176.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : ZSRQ9176                                          **
      **  REMARKS: BATCH I/O PROGRAM DATA MIGRATION LINC UPLOAD      **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
M119DM**  10FEB10  CTS    CREATED FOR '9176' FILE PROCESSING.        **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSFILE REPLACING ==:ID:==  BY ==9176==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
 
       COPY XCSDFILE REPLACING ==:ID:== BY ==9176==.

       COPY ZCSR9176.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQ9176'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==9176==
                               ==':ID:'== BY =='9176'==.

       COPY ZCSR9176 REPLACING R9176-SEQ-REC-INFO
                            BY W9176-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W9176-SEQ-IO-WORK-AREA
                                 W9176-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==9176==.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSRQ9176                     **
      *****************************************************************
