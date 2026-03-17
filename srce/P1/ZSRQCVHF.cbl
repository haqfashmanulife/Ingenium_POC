      *****************************************************************
      **  MEMBER :  ZSRQCVHF                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE CREDIT CARD VALIDATION **
      **            REQUEST HISTORY DETAILS                          **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
20834A**  10OCT20  CTS    CREATED FOR 'CVHF' FILE PROCESSING         **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQCVHF.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==CVHF==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==CVHF==.
       COPY ZCSRCVHF.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQCVHF'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==CVHF==
                               ==':ID:'== BY =='CVHF'==.

       COPY ZCSRCVHF REPLACING RCVHF-SEQ-REC-INFO BY WCVHF-LINK-RECORD.
      /
       PROCEDURE DIVISION             USING WGLOB-GLOBAL-AREA
                                            WCVHF-SEQ-IO-WORK-AREA
                                            WCVHF-LINK-RECORD.



      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==CVHF==.


      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.


      *****************************************************************
      **                 END OF PROGRAM ZSRQCVHF                     **
      *****************************************************************
