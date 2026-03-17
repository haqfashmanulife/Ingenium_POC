      *****************************************************************
      **  MEMBER :  ZSRQNCTD                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE NCTD TAX CERTIFICATE   **
      **                                                             **
      **  DOMAIN :  PO                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
23342E**  13AUG20  CTS    CREATED FOR 'NCTD' FILE PROCESSING         **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSRQNCTD.
 
       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSFILE REPLACING ==:ID:==  BY ==NCTD==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY XCSDFILE REPLACING ==:ID:== BY ==NCTD==.
       COPY ZCSRNCTD.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQNCTD'.
 
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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==NCTD==
                               ==':ID:'== BY =='NCTD'==.
 
       COPY ZCSRNCTD REPLACING RNCTD-SEQ-REC-INFO BY WNCTD-LINK-RECORD.
      /
       PROCEDURE DIVISION             USING WGLOB-GLOBAL-AREA
                                            WNCTD-SEQ-IO-WORK-AREA
                                            WNCTD-LINK-RECORD.
 
 
 
      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==NCTD==.      
 
 
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
 
 
      *****************************************************************
      **                 END OF PROGRAM ZSRQNCTD                     **
      *****************************************************************
