      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    XSLU2490.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSLU2490                                         **
      **  REMARKS:  RETRIEVE TEXT FROM THE TEXT TABLE                **
      **                                                             **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
557756**  30SEP97  MSP    CREATED FOR ENHANCED MULTI LANGUAGE SUPPORT**
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***********************
       CONFIGURATION SECTION.
      ***********************
      /
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU2490'.
 
       COPY SQLCA.
007766 COPY XCWLPTR.
       COPY XCWWWKDT.
       COPY XCWWWKDT.
      /
       COPY XCWW2490.
      /
       COPY XCWW0260.
      /
       COPY XCWL0270.
      /
       COPY XCFRTEXT.
       COPY XCFWTEXT.
      /
014590*COPY XCWL0030.
 
       LINKAGE SECTION.
 
       01  DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY XCWL2490.
/
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *===============
       0000-MAINLINE.
      *===============
 
007766     SET ADDRESS OF L2490-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
 
           PERFORM  2490-0000-MAINLINE
               THRU 2490-0000-MAINLINE-X.
 
 
       COPY XCCPRETN.
 
       0000-MAINLINE-X.
           EXIT.
      /
       COPY XCPP2490.
      /
       COPY XCCL0260.
      /
       COPY XCCP0030.
      /
       COPY XCPL0270.
      /
       COPY XCPNTEXT.
      ******************************************************************
      *                   END OF PROGRAM XSLU2490                      *
      ******************************************************************
