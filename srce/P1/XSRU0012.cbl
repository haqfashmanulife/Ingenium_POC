      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU0012.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSRU0012                                         **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU0012'.
 
       COPY SQLCA.
 
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
014590*COPY XCWL0030.
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0012.
      /
      ********************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L0012-PARM-INFO.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  0012-0000-MAINLINE
               THRU 0012-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPP0012.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPBXTAB.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSRU0012                     **
      *****************************************************************
