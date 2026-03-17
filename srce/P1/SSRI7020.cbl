      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI7020.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI7020                                         **
      **  REMARKS:  CALCULATE AND GENERATE COMMISSIONS FOR SEGREGATED**
      **            FUNDS.                                           **
      **                                                             **
      **  DOMAIN :  AG                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    NEW FOR RELEASE 5.4                        **
557658**  30SEP97  JMG    MODIFICATIONS FOR YEAR 2000                **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
MFFCOM**  03OCT05  RNL    SA COMMISSIONS                             **
U50199**  03OCT05  RNL    ADD CLIENT RELATIONSHIP SEARCH             **
U50202**  03OCT05  RNL    ADD CHSB ALTERNATE BROWSE                  **
MP168A**  14NOV11  CTS    ADDED CWAA ALTERNATE BROWSE                **
M241A2**  12DEC13  CTS    WCVGS-STBL-3-CD HANDLING                   **
UYS001**  20MAY16  CTS    CHANGES DONE AS PART OF UNISYS             **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI7020'.
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
 
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWTAKEY.
       COPY CCWTACXP.
       COPY CCWWBTAX.
       COPY CCWWCCD.
       COPY CCWWINDX.
       COPY CCWWFPA.
       COPY SCWWSETA.
       COPY SCWW7020.
       COPY SCWWACNM.
       COPY SCWWAGFA.
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY CCFWAC.
       COPY CCFRAC.
 
       COPY CCFWAG.
       COPY CCFRAG.
 
       COPY CCFWCVGD.
       COPY CCFRCVGD.
MP168A COPY CCFWCWAR.
MP168A COPY CCFRCWAR.
MP168A COPY CCFWCWAA.
 
       COPY CCFWPH.
       COPY CCFRPH.
U50199 COPY CCFWCCLI.
U50199 COPY CCFRCVGC.
 
MFFCOM COPY NCFWTTAB.
MFFCOM COPY NCFRTTAB.
MFFCOM*
       COPY SCFRFA.
       COPY SCFRFC.
MFFCOM COPY SCFWFC.
MFFCOM COPY SCFHCHST.
MFFCOM COPY SCFRCHST.
MFFCOM COPY SCFWCHST.
U50202 COPY SCFWCHSB.
UYS001 COPY CCFRETAB.
UYS001 COPY CCFWETAB.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY CCWL0186.
       COPY CCWL2110.
       COPY CCWL2430.
       COPY CCWL2450.
       COPY CCWL5277.
       COPY CCWL6140.
       COPY CCWLACCT.
MFFCOM COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWLDTLK.
017150 COPY XCWL0289. 
M241A2 COPY CCWLSTB3.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY SCWL7020.
 
       COPY SCWLSEGF.
 
       COPY CCWLPGA.
 
       COPY CCFRPOL.
 
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L7020-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  7020-0000-MAINLINE
               THRU 7020-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
 
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY CCPPBKAC.
557658 COPY CCPPAC77.
       COPY CCPPCCD.
       COPY CCPPFPA.
       COPY CCPPMIDT.
       COPY CCPPPLIN.
       COPY CCPS0186.
       COPY CCPS2110.
       COPY CCPS2430.
       COPY CCPS2450.
       COPY CCPS5277.
       COPY CCPS6140.
       COPY CCPSACCT.
       COPY SCPPACNM.
       COPY SCPPSETA.
       COPY SCPP7020.
M241A2 COPY CCPSSTB3.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
       COPY CCPL0186.
       COPY CCPL2110.
       COPY CCPL2430.
       COPY CCPL2450.
       COPY CCPL5277.
       COPY CCPL6140.
      /
       COPY XCPL0260.
MFFCOM COPY XCPL1660.
       COPY XCPL1680.
017150 COPY XCPL0289.
      /
M241A2 COPY CCPLSTB3.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY CCPNAG.
 
       COPY CCPACVGD.
       COPY CCPCCVGD.
       COPY CCPNCVGD.
       COPY CCPUCVGD.
 
       COPY CCPNPH.
U50199 COPY CCPBCCLI.
MP168A COPY CCPBCWAA.
      /
MFFCOM COPY CCPERDLG.
MFFCOM COPY CCPERDCD.
MFFCOM COPY NCPNTTAB.
MFFCOM COPY SCPNFC.
MFFCOM COPY SCPACHST.
MFFCOM COPY SCPBCHST.
MFFCOM COPY SCPCCHST.
MFFCOM COPY SCPNCHST.
MFFCOM COPY SCPUCHST.
U50202 COPY SCPBCHSB.
UYS001 COPY CCPBETAB.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
 
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRI7020                     **
      *****************************************************************
