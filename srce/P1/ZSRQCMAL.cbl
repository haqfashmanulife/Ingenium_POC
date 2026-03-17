
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQCMAL.

      *****************************************************************
      **  MEMBER :  ZSRQCMAL                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE CLIENT UPDATE DETAILS  **
      **                                                             **
      **  DOMAIN :  CL                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
23823C**  02JUL24  CTS    CREATED FOR 'CMAL' FILE PROCESSING         **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==CMAL==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==CMAL==.
       COPY ZCSRCMAL.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQCMAL'.

       COPY SQLCA.

       01  WS-WORKING-STORAGE.
           05  WS-FILE-OPEN-SWITCH         PIC  X(01)  VALUE 'N'.
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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==CMAL==
                               ==':ID:'== BY =='CMAL'==.

       COPY ZCSRCMAL REPLACING RCMAL-SEQ-REC-INFO BY WCMAL-LINK-RECORD.
      /
       PROCEDURE DIVISION             USING WGLOB-GLOBAL-AREA
                                            WCMAL-SEQ-IO-WORK-AREA
                                            WCMAL-LINK-RECORD.



      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==CMAL==.


      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.


      *****************************************************************
      **                 END OF PROGRAM ZSRQCMAL                     **
      *****************************************************************
