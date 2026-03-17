      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    SSRF6330.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRF6330                                         **
      **  REMARKS:  SEGREGATED FUND SURRENDER/SURRENDER REVERSAL     **
      **            AND VERIFY.                                      **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
008455**  31MAR98  552    EXTENSIVE NUMERIC FORMATTING               **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
012134**  07MAY99  56V    ADD TAX PROCESSING COPYBOOKS               **
012137**  07MAY99  56V    COPYBOOKS FOR SEC CONFIRM                  **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
016107**  30JUN00  602J   AUTOMATIC REDUCTION OF THE FACE AMOUNT     **
MFFFU7**  03OCT05  AC     ADD PLAN RATE LOOKUP COPYBOOKS             **
OP2-03**  25DEC05  FB     ADD PRTX COPYBOOKS                         **
EN3919**  01AUG08  CTS    AUTOMATED FIRM BANKING REMITTANCE DATE     **
EN3919**                  USING ACTN TABLE                           **
27549A**  15DEC23  CTS    CHANGES DONE AS PART OF CDAP PROJ          **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRF6330'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
       COPY CCWWBTAX.
      /
012137 COPY CCWL3120.
012137 COPY CCWL3330.
      /
016107 COPY SCWWFACS.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
 
       COPY CCWWINDX.
      /
013578*COPY XCWWTSQP.
       COPY SCWW6330.
      /
       COPY XCWWWKDT.
       COPY XCWTFCMD.
008455 COPY XCWL0290.
      /
MFFFU7 COPY CCWL0186.
MFFFU7 COPY CCWL6560.
      /
OP2-03 COPY CCWL9215.
OP2-03 COPY NCWL0303.
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
010312*COPY SCSWT1.
010312*COPY SCSRT1.
013578*COPY SCWWTSQ1.
010312 COPY XCFRTWRK.
010312 COPY XCFWTWRK.
      /
EN3919 COPY CCFWACTN.
EN3919 COPY CCFRACTN.
EN3919/
       COPY SCFWFA.
       COPY SCFRFA.
      /
       COPY SCFWFC.
       COPY SCFRFC.
      /
       COPY SCFWFH.
       COPY SCFRFH.
      /
012137 COPY CCFWPH.
012137 COPY CCFRPH.
      /
016107 COPY SCFRFACO.
016107 COPY SCFWFACO.
      /
      ****************************************************************
      *  INPUT PARAMETER INFORMATION                    *
      ****************************************************************

      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************

       COPY CCWL0182.
557701/
557701 COPY CCWL4770.
557701/
557701 COPY CCWL4780.
      /
       COPY CCWL6500.
      /
       COPY CCWL6860.
      /
       COPY SCWL0410.
      /
       COPY SCWL6370.
      /
       COPY SCWL6660.
      /
       COPY SCWL6710.
      /
       COPY SCWL6720.
      /
       COPY SCWL6830.
012134 COPY CCWL0187.
012134 COPY CCWL1146.
      /
016107 COPY CCWL6360.
016107 COPY CCWL2410.
016107 COPY CCWL5650.
016107 COPY CCWL6140.
27549A COPY CCWL9D90.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6330.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /

      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L6330-PARM-INFO
                                  LSEGF-PARM-INFO
                                  LPGA-PARM-INFO
                                  RPOL-REC-INFO
                                  WCVGS-WORK-AREA.
      *--------------
       0000-MAINLINE.
      *--------------


           PERFORM  6330-0000-MAINLINE
               THRU 6330-0000-MAINLINE-X.


       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
      *
       COPY SCPP6330.
016107 COPY SCPPFACS.
013578*
013578*COPY SCPPTSQ1.
      /
012137 COPY CCPNPH.
012137 COPY CCPPPLIN.
012137 COPY CCPPMIDT.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************

010312*COPY SCPLT1.

       COPY CCPS0182.
       COPY CCPL0182.
557701/
557701 COPY CCPS4770.
557701 COPY CCPL4770.
557701/
557701 COPY CCPS4780.
557701 COPY CCPL4780.
      /
       COPY CCPS6500.
       COPY CCPL6500.
      /
       COPY CCPL6860.
      /
       COPY SCPS0410.
       COPY SCPL0410.
      /
       COPY SCPL6370.
      /
       COPY SCPS6660.
       COPY SCPL6660.
      /
       COPY SCPS6710.
       COPY SCPL6710.
      /
       COPY SCPS6720.
       COPY SCPL6720.
      /
       COPY SCPS6830.
       COPY SCPL6830.
      /
       COPY XCPL0260.
      /
008455 COPY XCPL0290.
008455 COPY XCPS0290.
012134 COPY CCPL0187.
012134 COPY CCPS0187.
012134 COPY CCPL1146.
012134 COPY CCPS1146.
012137 COPY CCPS3120.
012137 COPY CCPL3120.
012137 COPY CCPS3330.
012137 COPY CCPL3330.
      /
016107 COPY CCPS6360.
016107 COPY CCPL6360.
      /
016107 COPY CCPS2410.
016107 COPY CCPL2410.
      /
016107 COPY CCPS5650.
016107 COPY CCPL5650.
      /
016107 COPY CCPS6140.
016107 COPY CCPL6140.
      /
MFFFU7 COPY CCPS0186.
MFFFU7 COPY CCPL0186.
MFFFU7 COPY CCPS6560.
MFFFU7 COPY CCPL6560.
      /
OP2-03 COPY CCPS9215.
OP2-03 COPY CCPL9215.
      /
OP2-03 COPY NCPS0303.
OP2-03 COPY NCPL0303.
      /
27549A COPY CCPS9D90.
27549A COPY CCPL9D90.
27549A/
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
EN3919 COPY CCPNACTN.
EN3919/ 
010312*COPY SCPAT1.
010312*COPY SCPNT1.
010312*COPY SCPXT1.
010312 COPY XCPATWRK.
010312 COPY XCPCTWRK.
010312 COPY XCPNTWRK.
010312 COPY XCPUTWRK.
010312 COPY XCPXTWRK.
      /
016107 COPY SCPAFACO.
016107 COPY SCPBFACO.
016107 COPY SCPCFACO.
016107 COPY SCPUFACO.
016107 COPY SCPXFACO.
      /
       COPY SCPNFH.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCPL0030.
 
      ****************************************************************
      **                 END OF PROGRAM SSRF6330                     *
      ****************************************************************
