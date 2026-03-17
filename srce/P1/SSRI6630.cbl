      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI6630.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI6630                                         **
      **  REMARKS:  THIS MODULE WILL PERFORM REQUIRED UNIT           **
      **            ALLOCATION PROCESSIN FOR SEG. FUND DEPOSIT       **
      **            REVERSALS. THE ACTIVITY STATUS IS UPDATED AND    **
      **            TOTALS ARE ROLLED FORWARD. ROUTINES ARE ACCESSED **
      **            TO OBTAIN UNIT VALUES AND MINIMUM VALUES.        **
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
P03561**  15DEC05  RNL    CUMULATIVE FIELDS FOR JOINT TO SINGLE      **
P03561**                  POLICIES                                   **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6630'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
 
       COPY XCWWWKDT.
       COPY CCWWINDX.
      /
       COPY SCWW6630.
      /
       COPY SCWWUALL.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
 
       COPY SCWL6640.
      /
       COPY SCWL7010.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
 
       COPY CCFRPH.
       COPY CCFWPH.
      /
       COPY SCFRFA.
      /
       COPY SCFRFD.
      /
       COPY SCFRFX.
       COPY SCFWFX.
      /
P03561 COPY SCFRFC.
P03561 COPY SCFWFC.
P03561/
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6630.
      /
       COPY SCWLSEGF.
      /
       COPY CCWLPGA.
      /
       COPY CCFRPOL.
      /
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L6630-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6630-0000-MAINLINE
               THRU 6630-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
 
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
 
       COPY SCPP6630.
      /
       COPY CCPPPLIN.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
       COPY XCPL0260.
      /
       COPY SCPS6640.
       COPY SCPL6640.
      /
       COPY SCPS7010.
       COPY SCPL7010.
      /
      ****************************************************************
      *  FILE I/O PROCESS MODULES                                    *
      ****************************************************************
 
P03561 COPY SCPNFC.
       COPY SCPNFX.
      /
       COPY CCPNPH.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRI6630                     **
      *****************************************************************
