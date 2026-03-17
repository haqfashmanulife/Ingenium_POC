      *****************************************************************
      **  MEMBER :  ZSRQDPCI                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR DEPOSIT CONFIRMATION NOTICE**
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP771C**  16JUN20  CTS    CREATED FOR 'DPCI' FILE PROCESSING         **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQDPCI.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==DPCI==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==DPCI==.
       COPY ZCSRDPCI.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQDPCI'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==DPCI==
                               ==':ID:'== BY =='DPCI'==.

       COPY ZCSRDPCI REPLACING RDPCI-SEQ-REC-INFO BY WDPCI-LINK-RECORD.
      /
       PROCEDURE DIVISION             USING WGLOB-GLOBAL-AREA
                                            WDPCI-SEQ-IO-WORK-AREA
                                            WDPCI-LINK-RECORD.



      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==DPCI==.


      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.


      *****************************************************************
      **                 END OF PROGRAM ZSRQDPCI                     **
      *****************************************************************
