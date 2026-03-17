      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRS6740.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRS6740                                         **
      **  REMARKS:  VERIFY SEGREGATED FUND ADMINISTRATIVE CHARGES.   **
      **            THIS MODULE IS CALLED TO FINALIZE SEGREGATED     **
      **            FUND ADMINISTRATIVE CHARGES.                     **
      **            FUND ACTIVITY RECORDS ARE UPDATED. RRIF ROUTINES **
      **            ARE CALLED IF REQUIRED. UNIT ALLOCATIONS ARE     **
      **            ALSO FINALIZED.                                  **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
557788**  30SEP97  MS     POLICY TABLE SPLIT                         **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
005409**  30OCT98  56     MODIFICATIONS FOR LEAP YEAR                **
012137**  07MAY99  56V    SEC CONFIRMATIONS                          **
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
 
      *
       WORKING-STORAGE SECTION.
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS6740'.
      *
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
 
      *********************************************************
      *   COMMON COPYBOOKS
      *********************************************************
 
       COPY SCWW6740.
      /
       COPY SCWWAGFA.
      /
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
      /
MP171F COPY CCWWLOCK.
MP171F COPY XCWL8090.
      /
      **********************************************************
      * I/O COPYBOOKS
      *********************************************************
 
012137 COPY CCFWPH.
012137 COPY CCFRPH.
      /
       COPY SCFWFA.
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
       COPY SCFWFACO.
      /
      **********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ********************************************************
 
       COPY CCWL0185.
557701/
557701 COPY CCWL2404.
      /
012137 COPY CCWL3120.
      /
557788 COPY CCWL2470.
557788/
       COPY SCWL0450.
      /
       COPY SCWL6370.
      /
       COPY SCWL6610.
      /
       COPY SCWL6700.
      /
005409 COPY XCWLDTLK.
005409 COPY XCWL1670.
005409 COPY XCWL1680.
 
      **********************************************************
      * INPUT PARAMETER INFORMATION
      ********************************************************
 
      /
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6740.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L6740-PARM-INFO
                                    LSEGF-PARM-INFO
                                    LPGA-PARM-INFO
                                    RPOL-REC-INFO
                                    WCVGS-WORK-AREA.
 
      *---------------
       0000-MAIN-LINE.
      *---------------
 
 
           PERFORM 6740-0000-MAINLINE
              THRU 6740-0000-MAINLINE-X.
 
 
       0000-MAIN-LINE-X.
           GOBACK.
      /
      ***********************************************************
      *    PROCESSING COPYBOOKS
      ***********************************************************
 
       COPY SCPP6740.
      /
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
012137 COPY CCPS3120.
012137 COPY CCPL3120.
      /
       COPY SCPS0450.
       COPY SCPL0450.
      /
       COPY SCPS6370.
       COPY SCPL6370.
      /
       COPY SCPS6610.
       COPY SCPL6610.
      /
       COPY SCPS6700.
       COPY SCPL6700.
      /
005409 COPY XCPL1680.
      /
012137 COPY XCPL0260.
MP171F COPY XCPS8090.
MP171F COPY XCPL8090.
      / 
      ***********************************************************
      *    FILE I/O PROCESS MODULES
      ***********************************************************
 
012137 COPY CCPPPLIN.
012137 COPY CCPNPH.
      /
       COPY SCPAFA.
       COPY SCPUFA.
       COPY SCPXFA.
MP171F COPY SCPNFA. 
      /
       COPY SCPGFACO.
      /
 
      ***********************************************************
      *    ERROR HANDLING ROUTINES
      ***********************************************************
 
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM SSRS6740                     **
      *****************************************************************
