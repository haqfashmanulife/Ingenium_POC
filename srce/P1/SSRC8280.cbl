      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC8280.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC8280                                         **
      **  REMARKS:  THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGFUND TRANSFER REVERSALS FROM INITIAL TO       **
      **            ACCUMULATION UNITS FOR MORTALITY & EXPENSE       **
      **            CHARGES                                          **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
012146**  07MAY99  56V    CREATION                                   **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC8280'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
       COPY SCWW8280.
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
       COPY SCWL8280.
       COPY SCWLSEGF.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L8280-PARM-INFO
                                    LSEGF-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  8280-0000-MAINLINE
               THRU 8280-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY SCPP8280.
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
      **                 END OF PROGRAM SSRC8280                     **
      *****************************************************************
