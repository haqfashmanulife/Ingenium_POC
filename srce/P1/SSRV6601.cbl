      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    SSRV6601.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRV6601                                         **
      **  REMARKS:  SEGREGATED FUND GUARANTEED SURRENDER             **
      **            VALUE PROCESSING FOR UNIVERSAL LIFE              **
      **                                                             **
      **            THIS MODULE WILL OVERRIDE THE NORMAL             **
      **            GUARANTEED SURRENDER VALUE CALCULATED            **
      **            ON A UNIVERSAL LIFE POLICY. IF THE               **
      **            SURRENDER IS DUE TO DEATH ON A LEVEL             **
      **            DEATH BENEFIT POLICY, THEN THERE IS NO           **
      **            GUARANTEED VALUE.                                **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  SIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       CONFIGURATION SECTION.
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRV6601'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      *
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6601.
      /
      ********************
       PROCEDURE DIVISION  USING
                                  WGLOB-GLOBAL-AREA
                                  L6601-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6601-0000-MAINLINE
               THRU 6601-0000-MAINLINE-X.
 
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
      *
       COPY SCPP6601.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCPL0030.
 
      ****************************************************************
      **                 END OF PROGRAM SSRV6601                     *
      ****************************************************************
