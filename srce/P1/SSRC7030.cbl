      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    SSRC7030.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC7030                                         **
      **  REMARKS:  SEGREGATED FUND SURRENDER LOAD CALCULATIONS      **
      **                                                             **
      **            THIS MODULE CONTAINS SURRENDER LOAD              **
      **            CALCULATIONS. FOR TARGETTED LOADS, A CALL        **
      **            TO SSRC6450 IS REQUIRED PRIOR TO CALLING         **
      **            THIS MODULE. ALL NON-TARGETTED LOAD              **
      **            CALCULATIONS ARE CONTAINED WITHIN THIS MODULE.   **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC7030'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      *
       COPY SCWW7030.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWINDX.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      /
       COPY SCFRFA.
      /
       COPY CCFRPH.
       COPY CCFWPH.
      /
       COPY CCFRCC.
       COPY CCFWCC.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      *
       COPY CCWL6140.
      /
017150 COPY XCWL0289.
      /
       COPY XCWLDTLK.
       COPY XCWL1670.
       COPY XCWL1680.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL7030.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L7030-PARM-INFO
                                  LSEGF-PARM-INFO
                                  LPGA-PARM-INFO
                                  RPOL-REC-INFO
                                  WCVGS-WORK-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
 
           PERFORM  7030-0000-MAINLINE
               THRU 7030-0000-MAINLINE-X.
 
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
      *
       COPY SCPP7030.
      /
       COPY CCPPPLIN.
      /
       COPY CCPPMIDT.
      /
       COPY CCPS6140.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
       COPY CCPNPH.
      /
       COPY CCPNCC.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
      *
       COPY XCPL0260.
      /
017150 COPY XCPL0289.
      /
       COPY CCPL6140.
      /
       COPY XCPL1680.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCPL0030.
 
      ****************************************************************
      **                 END OF PROGRAM SSRC7030                     *
      ****************************************************************
