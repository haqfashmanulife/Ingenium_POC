      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU2510.
 
       COPY XCWWCRHT.
 
      ****************************************************************
      **  MEMBER :  XSRU2510                                        **
      **  REMARKS:  VALIDATE AND SET VERIFY RESPONSES               **
      **            FOR BATCH PROGRAMS                              **
      **  DOMAIN :  SY                                              **
      **  CLASS  :                                                  **
      ****************************************************************
      ** DATE     AUTH   DESCRIPTION                                **
557756** 30SEP97  JPK    CREATED FOR ENHANCED MULTI LANGUAGE SUPPORT**
      **                                                            **
      **                                                            **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU2510'.
 
       COPY SQLCA.
 
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
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL2510.
      /
      *------------------
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L2510-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET L2510-RETRN-OK              TO TRUE.
 
           PERFORM  2510-0000-MAINLINE
               THRU 2510-0000-MAINLINE-X.
 
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
 
      /
       COPY XCPP2510.
 
       COPY XCPL2490.
       COPY XCPS2490.
 
       COPY XCPNTEXT.
 
      *--------------
      * ERROR HANDLING
      *--------------
 
       COPY XCPL0030.
 
      **************************************************************
      ***                           END OF XSRU2510              ***
      **************************************************************
