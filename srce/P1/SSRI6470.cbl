      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI6470.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI6470                                         **
      **  REMARKS:  UNIT ALLOCATION ROUTINES FOR SEGREGATED FUND     **
      **            DEPOSITS.                                        **
      **                                                             **
      **            THIS MODULE WILL PERFORM REQUIRED UNIT A         **
      **            ALLOCATION PROCESSING FOR SEG FUND DEPOSITS. THE **
      **            ACTIVITY STATUS IS UPDATED AND TOTALS ARE        **
      **            ROLLED FORWARD. ROUTINES ARE ACCESSED TO OBTAIN  **
      **            INTEREST RATES AND GET UNIT VALUES.              **
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
017150**  09FEB01  612J   CURRENCY SCALING                           **
P03561**  15DEC05  RNL    CUMULATIVE FIELDS FOR JOINT TO SINGLE      **
P03561**                  POLICIES                                   **
P03561**  25OCT06  GW     ADD MODULES TO BROWSE FUND ACTIVITY TABLE  **
P03561**                  & CALC. INVERTED DATES                     **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6470'.
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
      /
      *****************************************************************
      * COMMON COPYBOOKS                                              *
      *****************************************************************
       COPY XCWLDTLK.
 
       COPY SCWW6470.
       COPY SCWWUALL.
      /
      *****************************************************************
      * I/O COPYBOOKS                                                 *
      *****************************************************************
P03561 COPY SCFWFA.
       COPY SCFRFA.
 
       COPY SCFRFC.
 
       COPY SCFRFD.
 
       COPY SCFRFX.
       COPY SCFWFX.
      /
P03561 COPY CCFRCVG.
P03561 COPY CCFWCVG.
      *****************************************************************
      * CALLED MODULES                                                *
      *****************************************************************
       COPY SCWL6640.
017150 COPY XCWL0289.       
P03561 COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
      /
 
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6470.
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
                                 L6470-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6470-0000-MAINLINE
               THRU 6470-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
54-001     GOBACK.
      /
      *****************************************************************
      * PROCESSING COPYBOOKS                                          *
      *****************************************************************
       COPY SCPP6470.
      /
      *****************************************************************
      * LINKAGE PROCESSING COPYBOOKS                                  *
      *****************************************************************
       COPY XCPL0260.
017150 COPY XCPL0289.       
       COPY XCPL1680.
 
       COPY SCPS6640.
       COPY SCPL6640.
      /
P03561 COPY XCPL1660.
      *****************************************************************
      * FILE I/O PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY SCPNFX.
P03561 COPY CCPNCVG.
P03561 COPY SCPBFA.
      /
      *****************************************************************
      * ERROR HANDLING ROUTINES                                       *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRI6470                     **
      *****************************************************************
