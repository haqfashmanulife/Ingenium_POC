      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC6640.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC6640                                         **
      **  REMARKS:  COMMON SEGREGATED FUND UNIT ALLOCATION ROUTINES. **
      **                                                             **
      **            THIS MODULE CONTAINS ROUTINES COMMON TO ALL UNIT **
      **            ALLOCATION MODULES: RETRIEVE FUND UNIT VALUES,   **
      **            CALCULATE NUMBER OF UNITS, AND CALCULATE         **
      **            SURRENDER VALUE.                                 **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
005409**  30OCT98  56     LEAP YEAR MODIFICATIONS                    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
TESTING DONE *** FASHUL***
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6640'.
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
 
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY XCWWWKDT.
       COPY XCWLDTLK.
017150 COPY XCWL0289.       
005409 COPY XCWL1670.
005409 COPY XCWL1680.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCFWFH.
       COPY SCFWFV.
       COPY SCFRFA.
       COPY SCFRFC.
       COPY SCFRFD.
       COPY SCFRFH.
       COPY SCFRFV.
       COPY SCFWFX.
       COPY SCFRFX.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY SCWW6640.
       COPY SCWWRNDP.
       COPY SCWWUALL.
       COPY XCWL1660.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY SCWL6640.
 
       COPY SCWLSEGF.
 
       COPY CCWLPGA.
 
       COPY CCFRPOL.
 
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L6640-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6640-0000-MAINLINE
               THRU 6640-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY SCPP6640.
       COPY SCPPRNDP.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
       COPY XCPL0260.
017150 COPY XCPL0289.       
      /
       COPY XCPL1660.
005409 COPY XCPL1680.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY SCPBFV.
       COPY SCPNFV.
       COPY SCPNFH.
       COPY SCPUFH.
       COPY SCPNFX.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRC6640                     **
      *****************************************************************
