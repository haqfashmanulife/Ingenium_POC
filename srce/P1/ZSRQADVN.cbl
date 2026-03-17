      *****************************************************************
      **  MEMBER :  ZSRQADVN                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE ADVANCE NOTICE EXTRACT **     
      **  DOMAIN :  PR                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP771C**  16JUN20  CTS    CREATED FOR 'ADVN' FILE PROCESSING         **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQADVN.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==ADVN==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==ADVN==.
       COPY ZCSRADVN.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQADVN'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==ADVN==
                               ==':ID:'== BY =='ADVN'==.

       COPY ZCSRADVN REPLACING RADVN-SEQ-REC-INFO BY WADVN-LINK-RECORD.
      /
       PROCEDURE DIVISION             USING WGLOB-GLOBAL-AREA
                                            WADVN-SEQ-IO-WORK-AREA
                                            WADVN-LINK-RECORD.



      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==ADVN==.


      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.


      *****************************************************************
      **                 END OF PROGRAM ZSRQADVN                     **
      *****************************************************************
