      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRS6730.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRS6730                                         **
      **  REMARKS:  VERIFY SEGREGATED FUND TRANSFERS.                **
      **            THIS MODULE IS CALLED TO FINALIZE SEGREGATED     **
      **            FUND TRANSFERS.  FUND ACTIVITY RECORDS (FA)      **
      **            AND FUND DETAIL RECORDS (FD) ARE UPDATED,        **
      **            AS ARE INVESTMENT COVERAGE (FC) AND FUND COVERAGE**
      **            (FS) RECORDS.  RRIF ROUTINES ARE CALLED IF REQ'D.**
      **            UNIT ALLOCATIONS ARE ALSO FINALIZED.             **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
557660**  30SEP97  KLE    STANDARDIZATION                            **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUND                      **
557788**  30SEP97  MS     POLICY TABLE SPLIT                         **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
005409**  30OCT98  56     MODIFICATIONS FOR LEAP YEAR                **
012137**  07MAY99  56V    ADD SEG FUND TRANSFERS                     **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
MFFCOM**  03OCT05  RNL    SA COMMISSIONS                             **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
      *
       WORKING-STORAGE SECTION.
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS6730'.
      *
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
012137 COPY CCWL3120.
012137 COPY CCWL6140.
 
      *********************************************************
      *   COMMON COPYBOOKS
      *********************************************************
 
       COPY SCWW6730.
      /
       COPY SCWWAGFA.
      /
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
      /
      **********************************************************
      * I/O COPYBOOKS
     **********************************************************
 
       COPY SCFWFA.
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
012137 COPY CCFRPH.
012137 COPY CCFWPH.
      **********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ********************************************************
 
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
       COPY SCWL6620.
      /
       COPY SCWL6700.
MFFCOM COPY SCWL7020.
      /
005409 COPY XCWLDTLK.
005409 COPY XCWL1670.
005409 COPY XCWL1680.
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6730.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
557660 PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
557660                          L6730-PARM-INFO
557660                          LSEGF-PARM-INFO
557660                          LPGA-PARM-INFO
557660                          RPOL-REC-INFO
557660                          WCVGS-WORK-AREA.
      ********************
 
      *---------------
       0000-MAIN-LINE.
      *---------------
 
           PERFORM 6730-0000-MAINLINE
              THRU 6730-0000-MAINLINE-X.
 
       0000-MAIN-LINE-X.
           GOBACK.
      /
      ***********************************************************
      *    PROCESSING COPYBOOKS
      ***********************************************************
 
       COPY SCPP6730.
      /
012137 COPY CCPPPLIN.
012137 COPY CCPNPH.
      ***********************************************************
      *    LINKAGE PROCESSING COPYBOOKS
      ***********************************************************
 
       COPY CCPS0185.
       COPY CCPL0185.
557701/
557701 COPY CCPS2404.
557701 COPY CCPL2404.
557788/
557788 COPY CCPS2470.
557788 COPY CCPL2470.
      /
       COPY SCPS0450.
       COPY SCPL0450.
      /
       COPY SCPS6370.
       COPY SCPL6370.
      /
       COPY SCPL6620.
      /
       COPY SCPL6700.
MFFCOM COPY SCPS7020.
MFFCOM COPY SCPL7020.
      /
005409 COPY XCPL1680.
012137 COPY CCPS3120.
012137 COPY CCPL3120.
012137 COPY CCPS6140.
012137 COPY CCPL6140.
012137 COPY XCPL0260.
      ***********************************************************
      *    FILE I/O PROCESS MODULES
      ***********************************************************
 
      ***********************************************************
      *    ERROR HANDLING ROUTINES
      ***********************************************************
 
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM SSRS6730                     **
      *****************************************************************
