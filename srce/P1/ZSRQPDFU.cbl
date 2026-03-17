      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSRQPDFU.
      
       COPY XCWWCRHT.
       
      *****************************************************************
      **  MEMBER : ZSRQPDFU                                          **
      **  REMARKS: BATCH SEQUENTIAL FILE I/O PROGRAM FOR PROCESSING  **
      **           INPUT FILE ZSPDFU                                 **
      **                                                             **
      **  DOMAIN :  BC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH. DESCRIPTION                                 **
UYS104**  20DEC21  CTS   INITIAL DRAFT                               **
      *****************************************************************

      *
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSFILE REPLACING ==:ID:==  BY ==PDFU==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDFILE REPLACING ==:ID:== BY ==PDFU==.
       COPY ZCSRPDFU.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQPDFU'.

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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==PDFU==
                               ==':ID:'== BY =='PDFU'==.

       COPY ZCSRPDFU REPLACING 
            RPDFU-SEQ-REC-INFO BY WPDFU-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 WPDFU-SEQ-IO-WORK-AREA
                                 WPDFU-LINK-RECORD.

      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==PDFU==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSRQPDFU                     **
      *****************************************************************
