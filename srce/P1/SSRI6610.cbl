      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI6610.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI6610                                         **
      **  REMARKS:  UNIT ALLOCATION ROUTINES FOR SEGREGATED FUND     **
      **            ADMINISTRATIVE CHARGES.                          **
      **            THIS MODULE WILL PERFORM REQUIRED UNIT ALLOCATION**
      **            PROCESSING FOR SEG. FUND ADMINISTRATIVE CHARGES. **
      **            THE ACTIVITY STATUS IS UPDATED AND TOTALS ARE    **
      **            ROLLED FORWARD.  ACTIVITY RECORDS ARE UPDATED FOR**
      **            SOURCE AND TARGET FUNDS.                         **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
005409**  30OCT98  56     LEAP YEAR MODIFICATIONS                    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012141**  07MAY99  56V    PORTFOLIO EXPANSION                        **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6610'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
012141 COPY XCWWFNDM.
      /
005409 COPY XCWL1670.
005409 COPY XCWL1680.
005409 COPY XCWLDTLK.
005409/
       COPY SCWW6610.
      /
       COPY SCWWRNDP.
      /
       COPY SCWWUALL.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCFRFA.
      /
       COPY SCFRFD.
      /
       COPY SCFWFH.
       COPY SCFRFH.
      /
       COPY SCFWFX.
       COPY SCFRFX.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY SCWL6640.
      /
      ****************************************************************
      *  INPUT PARAMETER INFORMATION                                 *
      ****************************************************************
 
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6610.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L6610-PARM-INFO
                                    LSEGF-PARM-INFO
                                    LPGA-PARM-INFO
                                    RPOL-REC-INFO
                                    WCVGS-WORK-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
 
           PERFORM  6610-0000-MAINLINE
               THRU 6610-0000-MAINLINE-X.
 
 
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY SCPP6610.
      /
       COPY SCPPRNDP.
      /
       COPY SCPPSUBU.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
      /
       COPY SCPS6640.
       COPY SCPL6640.
      /
       COPY XCPL0260.
005409 COPY XCPL1680.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY SCPNFH.
       COPY SCPUFH.
      /
       COPY SCPNFX.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *
      *****************************************************************
      **                 END OF PROGRAM SSRI6610                     **
      *****************************************************************
