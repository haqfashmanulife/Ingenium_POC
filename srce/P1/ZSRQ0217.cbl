      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. CSRQ0217.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER : CSRQ0217                                          **
      **  REMARKS: BATCH I/O PROGRAM FOR THE                         **
      **           0217 EXTRACT FILE                                 **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
M216A1**  14FEB13  CTS    CREATED FOR '0217' FILE PROCESSING         **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY XCSSFILE REPLACING ==:ID:==  BY ==0217==
                               ==:SYS:== BY ==C==.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY XCSDFILE REPLACING ==:ID:== BY ==0217==.
 
       COPY ZCSR0217.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'CSRQ0217'.
 
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
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==0217==
                                      ==':ID:'== BY =='0217'==.

 
       COPY ZCSR0217 REPLACING R0217-SEQ-REC-INFO BY W0217-LINK-RECORD.
      /
       PROCEDURE DIVISION  USING WGLOB-GLOBAL-AREA
                                 W0217-SEQ-IO-WORK-AREA
                                 W0217-LINK-RECORD.
      
      *****************************************************************
      *  FILE I/O PROCESSING
      *****************************************************************
       COPY XCSISEQ  REPLACING ==:ID:==  BY ==0217==.

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM CSRQ0217                     **
      *****************************************************************
