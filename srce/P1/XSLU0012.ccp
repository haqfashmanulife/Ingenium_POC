      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSLU0012.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSLU0012                                         **
      **  REMARKS:  GET DEFAULT COMPANY ID FROM XTAB                 **
      **            THIS MODULE PROCESSES REQUESTS TO BROWSE XTAB    **
      **            TO RETRIEVE THE DEFAULT COMPANY ID, WHICH WOULD  **
      **            BE REQUIRED PRIOR TO A SESSION BEING ESTABLISHED.**
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
010418**  30OCT98  56     INITIAL DESIGN                             **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU0012'.
 
       COPY SQLCA.
007766 COPY XCWLPTR.
 
 
014590*COPY XCWL0030.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0012.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
007766     SET ADDRESS OF L0012-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
 
           PERFORM  0012-0000-MAINLINE
               THRU 0012-0000-MAINLINE-X.
 
       COPY XCCPRETN.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPBXTAB.
      /
       COPY XCPP0012.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCP0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSLU0012                     **
      *****************************************************************
