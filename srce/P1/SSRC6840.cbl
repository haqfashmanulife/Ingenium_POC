      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC6840.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC6840                                         **
      **  REMARKS:  THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGREGATED FUND TRANSFER REVERSALS, INCLUDING    **
      **            FORMATTING OF FA AND FD RECORDS.                 **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6840'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
       COPY SCWW6840.
      /
      *****************************************************************
      * I/O COPYBOOKS                                                 *
      *****************************************************************
      /
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
       COPY SCFRFD.
      /
      *****************************************************************
      * CALLED MODULE PARAMETER INFORMATION                           *
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6840.
       COPY SCWLSEGF.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L6840-PARM-INFO
                                    LSEGF-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6840-0000-MAINLINE
               THRU 6840-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY SCPP6840.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
      /
      ****************************************************************
      *    FILE I/O PROCESS MODULES                                  *
      ****************************************************************
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRC6840                     **
      *****************************************************************
