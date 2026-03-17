      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU2490.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSRU2490                                         **
      **  REMARKS : RETRIEVE TEXT DESCRIPTION FROM THE TEXT TABLE    **
      **            FOR BATCH PROGRAMS                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTHOR DESCRIPTION                                **
557756**  30SEP97  MSP    CREATED FOR ENHANCED MULTI LANGUAGE SUPPORT**
      **                                                             **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU2490'.
 
       COPY SQLCA.
       COPY XCWWWKDT.
 
       COPY XCWW2490.
 
       COPY XCWL0270.
 
       COPY XCFRTEXT.
       COPY XCFWTEXT.
 
       COPY XCWW0260.
 
014590*COPY XCWL0030.
 
      *****************
       LINKAGE SECTION.
      *****************
       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL2490.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L2490-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET L2490-RETRN-OK TO TRUE.
 
           PERFORM  2490-0000-MAINLINE
               THRU 2490-0000-MAINLINE-X.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /
       COPY XCPP2490.
      /
       COPY XCPL0030.
      /
       COPY XCPL0260.
      /
       COPY XCPL0270.
      /
       COPY XCPNTEXT.
      *****************************************************************
      **                 END OF PROGRAM XSRU2490                     **
      *****************************************************************
