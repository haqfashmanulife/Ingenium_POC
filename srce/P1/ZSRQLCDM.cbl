      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSRQLCDM.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : ZSRQLCDM                                          **
      **  REMARKS: BATCH I/O PROGRAM LCDM EXTRACT PROCESSING         **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
M119DM**  10FEB10  CTS    CREATED FOR 'LCDM' FILE PROCESSING.        **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSFILE REPLACING ==:ID:==  BY ==LCDM==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
 
       COPY XCSDFILE REPLACING ==:ID:== BY ==LCDM==.

       COPY ZCSRLCDM.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQLCDM'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==LCDM==
                               ==':ID:'== BY =='LCDM'==.

       COPY ZCSRLCDM REPLACING RLCDM-SEQ-REC-INFO
                            BY WLCDM-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WLCDM-SEQ-IO-WORK-AREA
                                 WLCDM-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==LCDM==.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSRQLCDM                     **
      *****************************************************************
