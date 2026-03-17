      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRS6720.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRS6720                                         **
      **  REMARKS:  THIS MODULE IS CALLED TO FINALIZE SEGREGATED     **
      **            FUND TRANSACTION REVERSALS. FUND ACTIVITY (FA)   **
      **            AND DETAIL (FD) RECORDS ARE UPDATED, AS ARE      **
      **            INVESTMENT COVERAGES (FC) AND FUND COVERAGE (FS) **
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
012137**  07MAY99  56V    SEC CONFIRMATIONS                          **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
MFFCOM**  03OCT05  RNL    SA COMMISSIONS                             **
MP171F**  19JAN12  CTS	  LOGICAL RECORD LOCKING		     **
MS0103**  04OCT21  CTS    MSR-103 CHANGES DONE FOR SULV2 RPU FBNK    **
MS0103**                  REVERSAL                                   **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS6720'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
 
       COPY XCWWWKDT.
       COPY XCWLDTLK.
       COPY CCWWINDX.
      /
       COPY SCWW6720.
      /
       COPY SCWWAGFA.
      /
MP171F COPY CCWWLOCK.
MP171F COPY XCWL8090.
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
 
       COPY SCWL0450.
      /
       COPY CCWL0185.
557701/
557701 COPY CCWL2404.
557788/
557788 COPY CCWL2470.
      /
       COPY CCWL6290.
      /
012137 COPY CCWL3120.
012137*
012137 COPY CCWL6140.
012137/
       COPY SCWL6370.
      /
       COPY SCWL6630.
      /
       COPY SCWL6650.
      /
       COPY SCWL6700.
      /
       COPY SCWL6870.
      /
       COPY SCWL6880.
      /
       COPY SCWL6890.
      /
       COPY SCWL7020.
      /
012146 COPY SCWL8290.
      /
       COPY XCWL1660.
      /
005409 COPY XCWL1670.
005409 COPY XCWL1680.
MS0103 COPY CCWL9966.
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
 
       COPY SCFRFAAG.
       COPY SCFWFAAG.
      /
       COPY SCFRFA.
       COPY SCFWFA.
      /
       COPY SCFRFC.
      /
       COPY SCFRFD.
       COPY SCFWFD.
      /
012137 COPY CCFRPH.
012137 COPY CCFWPH.
012137/
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6720.
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
                                 L6720-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6720-0000-MAINLINE
               THRU 6720-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
 
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY SCPP6720.
      /
       COPY SCPPAGFA.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
       COPY CCPS0185.
       COPY CCPL0185.
557701/
557701 COPY CCPS2404.
557701 COPY CCPL2404.
557788/
557788 COPY CCPS2470.
557788 COPY CCPL2470.
      /
012137 COPY CCPS3120.
012137 COPY CCPL3120.
012137*
012137 COPY CCPS6140.
012137 COPY CCPL6140.
012137/
       COPY CCPS6290.
       COPY CCPL6290.
      /
       COPY SCPS0450.
       COPY SCPL0450.
      /
       COPY SCPS6370.
       COPY SCPL6370.
      /
       COPY SCPL6630.
      /
       COPY SCPS6650.
       COPY SCPL6650.
      /
       COPY SCPL6700.
      /
       COPY SCPS6870.
       COPY SCPL6870.
      /
       COPY SCPS6880.
       COPY SCPL6880.
      /
       COPY SCPS6890.
       COPY SCPL6890.
      /
012146 COPY SCPL8290.
      /
012137 COPY XCPL0260.
012137/
MFFCOM COPY SCPS7020.
       COPY SCPL7020.
      /
MS0103 COPY CCPS9966.
MS0103 COPY CCPL9966.
MS0103/
       COPY XCPL1660.
      /
005409 COPY XCPL1680.
MP171F COPY XCPS8090.
MP171F COPY XCPL8090.
      / 
      ****************************************************************
      *  FILE I/O MODULES                                            *
      ****************************************************************
 
012137 COPY CCPPPLIN.
012137 COPY CCPNPH.
012137/
       COPY SCPCFA.
       COPY SCPNFA.
       COPY SCPUFA.
      /
       COPY SCPUFD.
      /
       COPY SCPAFAAG.
       COPY SCPBFAAG.
       COPY SCPCFAAG.
       COPY SCPUFAAG.
       COPY SCPXFAAG.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRS6720                     **
      *****************************************************************
