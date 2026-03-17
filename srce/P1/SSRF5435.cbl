      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRF5435.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRF5435                                         **
      **  REMARKS:  SEGFUND SURRENDERS FOR TERMINATION PROCESSING.   **
      **                                                             **
      **            THIS MODULE WILL HANDLE THE SURRENDER OR         **
      **            SURRENDER REVERSAL FOR SEGFUND POLICIES ON       **
      **            TERMINATION OR REINSTATEMENT. THE SUCCESSFUL     **
      **            PROCESSING OF EACH COVERAGE IS RETURNED TO THE   **
      **            CALLER. COVERAGES WHICH ARE NOT SEGFUND BUT ARE  **
      **            TO BE PROCESSED BY TERM ARE ALWAYS SUCCESSFUL,   **
      **            SINCE NO SEGFUND PROCESSING IS REQUIRED ON THEM. **
      **                                                             **
      **  DOMAIN :  PO                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  KLE    INITIALIZE LSEGF-PARM-INFO                 **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRF5435'.
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
 
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWWINDX.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCFWFA.
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
       COPY SCFRFS.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY SCWW5435.
      /
       COPY CCWL2430.
      /
       COPY CCWL2460.
      /
       COPY SCWL0500.
      /
       COPY SCWL6330.
      /
       COPY SCWLSEGF.
      /
       COPY XCWL1660.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY SCWL5435.
 
       COPY CCWLPGA.
 
       COPY CCFRPOL.
 
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L5435-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
557660     INITIALIZE LSEGF-PARM-INFO.
 
           PERFORM  5435-0000-MAINLINE
               THRU 5435-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY SCPP5435.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
       COPY CCPS2430.
       COPY CCPL2430.
      /
       COPY CCPS2460.
       COPY CCPL2460.
      /
       COPY SCPL0500.
      /
       COPY SCPS6330.
       COPY SCPL6330.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY SCPBFA.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRF5435                     **
      *****************************************************************
