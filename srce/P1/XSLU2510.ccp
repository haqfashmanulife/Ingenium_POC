      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSLU2510.
 
       COPY XCWWCRHT.
 
      ****************************************************************
      **  MEMBER :  XSLU2510                                        **
      **  REMARKS:  VALIDATE AND SET VERIFY RESPONSES               **
      **                                                            **
      **  DOMAIN :  SY                                              **
      **  CLASS  :                                                  **
      ****************************************************************
      ** DATE     AUTH   DESCRIPTION                                **
      ** 30SEP97  JPK    INITIAL DESIGN 5.5                         **
      **                                                            **
      **                                                            **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      ****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU2510'.
 
       COPY SQLCA.
007766 COPY XCWLPTR.
 
 
       COPY XCWWWKDT.
 
014590*COPY XCWL0030.
 
      ***************
      * IO COPYBOOKS
      ***************
 
       COPY XCFWTEXT.
       COPY XCFRTEXT.
      /
 
       COPY XCWL2490.
 
      *****************
       LINKAGE SECTION.
      *****************
 
       01   DFHCOMMAREA.
           02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY XCWL2510.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
007766     SET ADDRESS OF L2510-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
           SET L2510-RETRN-OK                   TO TRUE.
 
           PERFORM 2510-0000-MAINLINE
               THRU 2510-0000-MAINLINE-X.
 
 
 
 
       COPY XCCPRETN.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
 
      /
       COPY XCPP2510.
 
       COPY XCPS2490.
 
       COPY XCCL2490.
 
       COPY XCPNTEXT.
 
      *--------------
      * ERROR HANDLING
      *--------------
 
       COPY XCCP0030.
 
      **************************************************************
      ***                           END OF XSLU2510              ***
      **************************************************************
