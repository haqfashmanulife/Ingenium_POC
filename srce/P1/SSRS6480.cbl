      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRS6480.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRS6480                                         **
      **  REMARKS:  VERIFY SEGREGATED FUND DEPOSITS.                 **
      **            THIS MODULE IS CALLED TO FINALIZE SEGREGATED     **
      **            FUND DEPOSITS. FUND ACTIVITY (FA) AND FUND       **
      **            DETAIL (FD) RECORDS ARE UPDATED, AS ARE          **
      **            INVESTMENT COVERAGE (FC) AND FUND COVERAGE (FS)  **
      **            RECORDS. RRIF ROUTINES ARE CALLED IF REQUIRED.   **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
557788**  30SEP97  MS     POLICY TABLE SPLIT                         **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
005409**  30OCT98  56     MODIFICATIONS FOR LEAP YEAR                **
012137**  07MAY99  56V    SEC CONFIRMS                               **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
MP171F**  19JAN12  CTS	  LOGICAL RECORD LOCKING		     **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS6480'.
 
       COPY SQLCA.
012137 COPY XCWLPTR.
 
014590*COPY XCWL0030.
 
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY XCWWWKDT.
012137/
012137 COPY CCWWINDX.
      /
MP171F COPY CCWWLOCK.
MP171F COPY XCWL8090.      
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCFWFA.
       COPY SCFRFA.
       COPY SCFRFC.
       COPY SCFWFACO.
012137 COPY CCFRPH.
012137 COPY CCFWPH.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY SCWW6480.
      /
       COPY CCWL0185.
557701/
557701 COPY CCWL2404.
557788/
557788 COPY CCWL2470.
      /
       COPY SCWL0450.
      /
       COPY SCWL6370.
      /
       COPY SCWL6470.
      /
       COPY SCWL6700.
      /
       COPY SCWL7020.
012137/
012137 COPY CCWL3120.
      /
       COPY SCWWAGFA.
      /
005409 COPY XCWLDTLK.
005409 COPY XCWL1670.
005409 COPY XCWL1680.
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6480.
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
                                 L6480-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6480-0000-MAINLINE
               THRU 6480-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY SCPP6480.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
       COPY CCPL0185.
557701/
557701 COPY CCPS2404.
557701 COPY CCPL2404.
557788/
557788 COPY CCPS2470.
557788 COPY CCPL2470.
      /
       COPY SCPL0450.
      /
       COPY SCPS6370.
       COPY SCPL6370.
      /
012137 COPY CCPS3120.
012137 COPY CCPL3120.
012137/
       COPY SCPL6470.
      /
       COPY SCPL6700.
      /
       COPY SCPL7020.
      /
       COPY XCPL0260.
      /
005409 COPY XCPL1680.
MP171F COPY XCPS8090.
MP171F COPY XCPL8090.
      / 
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
012137 COPY CCPPPLIN.
012137/
012137 COPY CCPNPH.
012137/
       COPY SCPGFACO.
       COPY SCPUFA.
       COPY SCPXFA.
MP171F COPY SCPNFA. 
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRS6480                     **
      *****************************************************************
