      *****************************************************************
      **  MEMBER :  ZSRQCXJF                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE CREDIT CARD VALIDATION **
      **            REQUEST HISTORY DETAILS                          **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
20834A**  10OCT20  CTS    CREATED FOR 'CXJF' FILE PROCESSING         **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQCXJF.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==CXJF==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==CXJF==.
       COPY ZCSRCXJF.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQCXJF'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==CXJF==
                               ==':ID:'== BY =='CXJF'==.

       COPY ZCSRCXJF REPLACING RCXJF-SEQ-REC-INFO BY WCXJF-LINK-RECORD.
      /
       PROCEDURE DIVISION             USING WGLOB-GLOBAL-AREA
                                            WCXJF-SEQ-IO-WORK-AREA
                                            WCXJF-LINK-RECORD.



      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==CXJF==.


      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.


      *****************************************************************
      **                 END OF PROGRAM ZSRQCXJF                     **
      *****************************************************************
