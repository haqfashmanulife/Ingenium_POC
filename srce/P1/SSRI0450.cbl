      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI0450.
 
       COPY XCWWCRHT.
      /
      *****************************************************************
      **  MEMBER :  SSRI0450                                         **
      **  REMARKS:  SEGREGATED FUND ACCOUNTING ROUTINES.             **
      **                                                             **
      **            THIS MODULE IS CALLED TO PERFORM ALL SEGREGATED  **
      **            FUND ACCOUNTING. ACCOUNTING RECORDS WILL BE      **
      **            GENERATED FOR DEPOSITS AND PREMIUMS AS WELL AS   **
      **            ACCOUNTING SPECIFIC TO ALL FUND ACTIVITY TYPES   **
      **            AND ASSOCIATED FUND DETAILS. GAIN LOSS           **
      **            GAIN/LOSS ACCOUNTING WILL ALSO BE GENERATED      **
      **            FROM THIS MODULE, AND A TAX ACCOUNTING MODULE    **
      **            WILL BE INVOKED.                                 **
      **                                                             **
      **  DOMAIN :  AC                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-006**  30NOV95  DH     ADD COPYBOOKS TO SUPPORT FUND ACCOUNTING   **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
557658**  30SEP97  JMG    MODIFICATIONS FOR YEAR 2000                **
558021**  30SEP97  MOK    RETRIEVE ACCOUNT DESCRIPTION FROM TABLE    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012134**  07MAY99  56V    VARIABLE TAXATION                          **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
MFFACC**  01OCT05  CLB    ADD COPYBOOKS FOR SEGFUND ACCTG CHANGES    **
CR0100**  10JAN06  CTS    ADD COPYBOOKS FOR STANDALONE ACCTG CHANGES **
NWLBCA**  25SEP09  CTS    ADDED COPYBOOKS FOR TRAD-PD-TO-DT RECALC   **
MS0068**  09SEP21  CTS    MSR-68 CHANGES DONE FOR SULV2 RPU REVERSAL **
MS0068**                  ACCOUNTING - WHOLE LIFE                    **
PM0334**  03OCT22  CTS    FIX FOR MATURITY ACCT FOR SUL MATURITY     **
PM0389**  04NOV22  CTS    PMG-389 CHANGES FOR SUL MATURTY - SURR REV **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI0450'.
      /
       COPY SQLCA.
007766 COPY XCWLPTR.
 
014590*COPY XCWL0030.
      /
       01  HOLD-ACNT-DATE.
           05  HOLD-ACNT-PROCESS-DATE.
               10  HOLD-ACNT-PROCESS-YR       PIC 9(04).
               10  FILLER                     PIC X(01).
               10  HOLD-ACNT-PROCESS-MO       PIC 9(02).
               10  FILLER                     PIC X(01).
               10  HOLD-ACNT-PROCESS-DY       PIC 9(02).
      /
      *****************************************************************
      **  COMMON COPYBOOKS                                           **
      *****************************************************************
558021*COPY CCWTAAGT.
558021*COPY CCWTACXP.
       COPY CCWTADTH.
       COPY CCWTAKEY.
       COPY CCWTAMAT.
558021*COPY CCWTAPRM.
       COPY CCWTASUR.
558021*COPY CCWTASUS.
558021*COPY CCWTATAX.
       COPY SCWTACCT.
      /
       COPY CCWWBTAX.
      /
       COPY SCWW0450.
      /
       COPY SCWWACNM.
      /
       COPY SCWWAGFA.
      /
       COPY CCWWCCD.
      /
       COPY CCWWINDX.
      /
       COPY XCWTDTTB.
       COPY XCWWWKDT.
      /
MS0068 COPY CCWWPLAN.
MS0068/      
      *****************************************************************
      **  I/O COPYBOOKS                                              **
      *****************************************************************
 
       COPY CCFWAC.
       COPY CCFRAC.
      /
       COPY CCFWCVGD.
       COPY CCFRCVGD.
      /
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
       COPY SCFRFD.
      /
       COPY SCFRFH.
       COPY SCFWFH.
      /
      *****************************************************************
      **  CALLED MODULE PARAMETER INFORMATION                        **
      *****************************************************************
 
       COPY CCWLACCT.
      /
012134 COPY CCWL1146.
       COPY CCWL2090.
       COPY CCWL2120.
NWLBCA COPY CCWL9037.       
012134 COPY CCWL2130.
       COPY CCWL2140.
       COPY CCWL2185.
53-006 COPY CCWL2190.
012134 COPY CCWL2430.
CR0100 COPY CCWL2435.
       COPY CCWL5277.
       COPY CCWL5370.
MFFACC COPY CCWL9370.
MFFACC COPY CCWL9806.
PM0334 COPY CCWL9215.
PM0389 COPY CCWL0187.
      /
       COPY XCWLDTLK.
      /
MFFACC COPY XCWL0289.
       COPY XCWL1670.
       COPY XCWL1680.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL0450.
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
                                 L0450-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *---------------
       0000-MAINLINE.
      *---------------
 
           PERFORM 0450-0000-MAINLINE
              THRU 0450-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************
      *  PROCESSING COPYBOOKS
      *****************************************
 
       COPY SCPP0450.
      /
       COPY CCPPMIDT.
      /
       COPY CCPPCCD.
      /
       COPY SCPPACNM.
      /
       COPY CCPPBKAC.
      /
54-001 COPY CCPSACCT.
      /
557658 COPY CCPPAC77.
      /
      *************************************
      *  LINKAGE COPYBOOKS
      *************************************
 
012134 COPY CCPS1146.
012134 COPY CCPL1146.
012134/
       COPY CCPS2090.
       COPY CCPL2090.
      /
       COPY CCPS2120.
       COPY CCPL2120.
      /
NWLBCA COPY CCPS9037.
NWLBCA COPY CCPL9037.
NWLBCA/
012134 COPY CCPS2130.
012134 COPY CCPL2130.
012134/
       COPY CCPS2140.
       COPY CCPL2140.
      /
       COPY CCPS2185.
       COPY CCPL2185.
      /
53-006 COPY CCPS2190.
54-001 COPY CCPL2190.
      /
012134 COPY CCPS2430.
012134 COPY CCPL2430.
012134/
CR0100 COPY CCPS2435.
CR0100 COPY CCPL2435.
CR0100/
       COPY CCPS5277.
       COPY CCPL5277.
      /
       COPY CCPS5370.
       COPY CCPL5370.
      /
MFFACC COPY CCPL9370.
MFFACC COPY CCPS9370.
MFFACC/
MFFACC COPY CCPL9806.
MFFACC COPY CCPS9806.
PM0334 COPY CCPL9215.
PM0334 COPY CCPS9215.
PM0389 COPY CCPL0187.
PM0389 COPY CCPS0187.
      /
       COPY XCPL0260.
MFFACC COPY XCPL0289.
       COPY XCPL1680.
      /
      ******************************************************************
      *  FILE I/O COPYBOOKS
      ******************************************************************
       COPY SCPNFH.
      /
      ******************************************************************
      *  ERROR HANDLING ROUTINES
      ******************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRI0450                     **
      *****************************************************************
