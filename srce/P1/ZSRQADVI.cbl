      *****************************************************************
      **  MEMBER :  ZSRQADVI                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR ADVANCE NOTICE I/P FILE    **
      **            ERROR NOTICE                                     **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP771C**  16JUN20  CTS    CREATED FOR 'ADVI' FILE PROCESSING         **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQADVI.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==ADVI==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==ADVI==.
       COPY ZCSRADVI.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQADVI'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==ADVI==
                               ==':ID:'== BY =='ADVI'==.

       COPY ZCSRADVI REPLACING RADVI-SEQ-REC-INFO BY WADVI-LINK-RECORD.
      /
       PROCEDURE DIVISION             USING WGLOB-GLOBAL-AREA
                                            WADVI-SEQ-IO-WORK-AREA
                                            WADVI-LINK-RECORD.



      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==ADVI==.


      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.


      *****************************************************************
      **                 END OF PROGRAM ZSRQADVI                     **
      *****************************************************************
