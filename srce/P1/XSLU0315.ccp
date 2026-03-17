      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    XSLU0315.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSLU0315                                         **
      **  REMARKS:  USER EXIT ROUINTE - RETRIEVE USER EXIT PROGRAM   **
      **            ID.                                              **
      **                                                             **
      **            THIS MODULE IS A STANDARD USER EXIT ROUTINE TO   **
      **            RETRIEVE UXIT TABLE INFORAMTION                  **
      **                                                             **
      **  DOMAIN :  SY                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
011025**  30OCT98  56     NEW FOR RELEASE 5.6 - USER EXIT            **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU0315'.
 
       COPY SQLCA.
       COPY XCWLPTR.
      /
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      *
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
       COPY XCFRUXIT.
       COPY XCFWUXIT.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      *
      *
       COPY XCWLDTLK.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY CCWLPGA.
       COPY XCWL0315.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET ADDRESS OF LPGA-PARM-INFO     TO WGLOB-LPGA-ADDR-PTR.
           SET ADDRESS OF L0315-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
 
           PERFORM  0315-0000-MAINLINE
               THRU 0315-0000-MAINLINE-X.
 
       COPY XCCPRETN.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
      *
       COPY XCPP0315.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
      *
      /
       COPY XCCL0260.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
       COPY XCPNUXIT.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCCP0030.
 
      ****************************************************************
      **                 END OF PROGRAM XSLU0315                     *
      ****************************************************************
