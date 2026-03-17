      *****************************************************************
      **  MEMBER :  ZSRQCNCL                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR CANCELLATION/RIDER         **
      **            CANCELLATION  EXTRACT                            **
      **                                                             **
      **  DOMAIN :  BC                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP282A**  20AUG15  CTS    CREATED FOR CANCELLATION/RIDER CANCELLATION** 
MP282A**                  FILE PROCESSING                            ** 
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSRQCNCL.

       COPY XCWWCRHT.

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==CNCL==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==CNCL==.

       COPY ZCSRCNCL.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQCNCL'.

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
        COPY XCSWSEQ  REPLACING ==:ID:== BY ==CNCL==
                                             ==':ID:'== BY =='CNCL'==.
       
       COPY ZCSRCNCL REPLACING RCNCL-SEQ-REC-INFO BY WCNCL-LINK-RECORD.
      /

       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WCNCL-SEQ-IO-WORK-AREA
                                 WCNCL-LINK-RECORD.

      /
      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************

       COPY XCSISEQ  REPLACING ==:ID:==  BY ==CNCL==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************

       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQCNCL                     **
      *****************************************************************
