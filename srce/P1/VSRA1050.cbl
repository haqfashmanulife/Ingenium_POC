      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.  VSRA1050.
       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  VSRA1050                                         **
      **  REMARKS:  OBTAIN IMMEDIATE ANNUITY QUOTE INFORMATION       **
      **            USED FOR VALUATION EXTRACT                       **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :  SIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JMG    MODIFICATIONS FOR MAINTAINABILITY          **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
54-001 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSRA1050'.
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
      /
       COPY CCFWQT.
       COPY CCFRQT.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY VCWL1050.
      /
      *******************
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L1050-PARM-INFO.
      *******************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM 1050-0000-MAINLINE
              THRU 1050-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY VCPP1050.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY CCPNQT.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM VSRA1050                     **
      *****************************************************************
