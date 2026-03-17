      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI6870.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI6870                                         **
      **  REMARKS:  PROCESS REVERSAL OF SURRENDER UNIT ALLOCATIONS.  **
      **                                                             **
      **            THIS MODULE WILL PERFORM REQUIRED UNIT ALLOCATION**
      **            PROCESSING FOR SEG. FUND SURRENDER REVERSALS.    **
      **            THE ACTIVITY STATUS IS UPDATED AND TOTALS ARE    **
      **            ROLLED FORWARD.  ROUTINES ARE ACCESSED TO OBTAIN **
      **            UNIT VALUES AND MINIMUM VALUES.                  **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6870'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWWINDX.
      /
       COPY SCWW6870.
      /
       COPY SCWWUALL.
      /
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
       COPY SCFRFD.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY SCWL6640.
      /
       COPY SCWL7010.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6870.
      /
       COPY SCWLSEGF.
      /
       COPY CCWLPGA.
      /
       COPY CCFRPOL.
      /
       COPY CCWWCVGS.
      /
      **************************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L6870-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      **************************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6870-0000-MAINLINE
               THRU 6870-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY SCPP6870.
      /
       COPY SCPPSUBU.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
       COPY SCPS6640.
       COPY SCPL6640.
      /
       COPY SCPS7010.
       COPY SCPL7010.
      /
       COPY XCPL0260.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRI6870                     **
      *****************************************************************
