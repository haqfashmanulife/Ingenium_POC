      *****************************************************************
      **  MEMBER :  ZSRQCTCD                                         **
      **  REMARKS:  BATCH I/O PROGRAM FOR THE CTCD TAX CERTIFICATE   **
      **                                                             **
      **  DOMAIN :  PO                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
23342E**  13AUG20  CTS    CREATED FOR 'CTCD' FILE PROCESSING         **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSRQCTCD.
 
       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSFILE REPLACING ==:ID:==  BY ==CTCD==
                               ==:SYS:== BY ==Z==.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY XCSDFILE REPLACING ==:ID:== BY ==CTCD==.
       COPY ZCSRCTCD.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSRQCTCD'.
 
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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==CTCD==
                               ==':ID:'== BY =='CTCD'==.
 
       COPY ZCSRCTCD REPLACING RCTCD-SEQ-REC-INFO BY WCTCD-LINK-RECORD.
      /
       PROCEDURE DIVISION             USING WGLOB-GLOBAL-AREA
                                            WCTCD-SEQ-IO-WORK-AREA
                                            WCTCD-LINK-RECORD.
 
 
 
      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==CTCD==.      
 
 
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
 
 
      *****************************************************************
      **                 END OF PROGRAM ZSRQCTCD                     **
      *****************************************************************
