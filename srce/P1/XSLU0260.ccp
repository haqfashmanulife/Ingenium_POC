      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    XSLU0260.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSLU0260                                         **
      **  REMARKS:  RETRIEVE MESSAGES FROM THE MSGS TABLE AND ADD    **
      **            PARAMETERS IF NEEDED.                            **
      **                                                             **
      **            THIS MODULE SEARCHES FOR THE FOLLOWING SEQUENCE  **
      **            OF MESSAGES:  GLOBAL MESSAGE, CLASS SPECIFIC     **
      **            MESSAGE, AND "NOT FOUND" MESSAGE.  IF NONE IS    **
      **            LOCATED, IT SETS UP A DEFAULT MESSAGE.  IT THEN  **
      **            BUILDS SCREEN MESSAGE INTO WORK AREA BY FIRST    **
      **            MOVING THE MESSAGE NUMBER, THEN THE MESSAGE      **
      **            TEXT AND INSERTING ANY PARAMETERS IF REQUIRED.   **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95   VK    ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-066**  30NOV95  JJS    CHANGES TO ACCESS NEW TOKEN REPLACEMENT PGM**
53-067**  30NOV95   VK    CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  MIG    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
C20791**   23MAY12  CTS    BATCH LOG SCANNER CHANGES                 **
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
 
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU0260'.
 
       COPY SQLCA.
007766 COPY XCWLPTR.
       COPY XCWWWKDT.
       COPY XCWWWKDT.
      /
       COPY XCWW0260.
      /
53-066 COPY XCWL0270.
      /
       COPY XCFRMSAU.
       COPY XCFWMSAU.
      /
       COPY XCFRMSIN.
       COPY XCFWMSIN.
      /
       COPY XCFRMSGS.
       COPY XCFWMSGS.
      /
C20791       
C20791 COPY XCFRBLOG.
C20791 COPY XCFWBLOG.
C20791
014590*COPY XCWL0030.
 
       LINKAGE SECTION.
 
       01  DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *===============
       0000-MAINLINE.
      *===============
 
           EVALUATE TRUE
 
               WHEN WGLOB-MSG-GENERATE
               OR   WGLOB-MSG-AUDIT
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
 
               WHEN WGLOB-MSG-GET
                    PERFORM  0260-2000-GET-MESSAGE
                        THRU 0260-2000-GET-MESSAGE-X
 
           END-EVALUATE.
 
       COPY XCCPRETN.
 
       0000-MAINLINE-X.
           EXIT.
      /
       COPY XCPP0260.
      /
       COPY XCCP0030.
      /
53-066 COPY XCPL0270.
      /
       COPY XCPAMSAU.
       COPY XCPCMSAU.
      /
       COPY XCPNMSGS.
      /
       COPY XCPAMSIN.
       COPY XCPCMSIN.
C20791       
C20791 COPY XCPABLOG.
C20791 COPY XCPCBLOG.       
      ******************************************************************
      *                   END OF PROGRAM XSLU0260                      *
      ******************************************************************
