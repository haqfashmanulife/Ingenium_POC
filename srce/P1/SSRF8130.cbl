      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. SSRF8130.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  SSRF8130                                         **
      **  REMARKS:  SEGFUND TRANSFER FROM INITIAL TO ACCUMULATION    **
      **            UNITS FOR MORTALITY AND EXPENSE CHARGES/         **
      **            TRANSFER REVERSAL/VERIFY/VERIFY REVERSAL         **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  07MAY99  56V    CREATION                                   **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
016227**  30JUN00  602J   CODE CLEANUP AND STANDARDIZATION           **
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
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRF8130'.
      *

       COPY SQLCA.

014590*COPY XCWL0030.

      *********************************************************
      *   COMMON COPYBOOKS
      *********************************************************

       COPY XCWTFCMD.

       COPY SCWW8130.
      /
       COPY CCWWINDX.
013578*
013578*COPY XCWWTSQP.
013578*
013578*  THE FOLLOWING FILLER IS REQUIRED FOR TSQ DATA AREA FOR TSQ
013578*  DELETE AND SHOULDN'T BE REMOVED
013578*
013578*10  FILLER                      PIC X(01).
      /
      **********************************************************
      * I/O COPYBOOKS
      **********************************************************

       COPY SCFRFC.
      /
       COPY SCFRFD.
      /
013578*COPY SCWWTSQ1.
       COPY XCFRTWRK.
       COPY XCFWTWRK.
      /
      **********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      **********************************************************

       COPY CCWL4770.
      /
       COPY CCWL4780.
      /
       COPY SCWL0410.
      /
       COPY SCWL6370.
      /
016227*COPY SCWL6680.
      /
       COPY SCWL6720.
      /
       COPY SCWL6730.
      /
       COPY SCWL6840.
      /
       COPY SCWL8270.
      /
       COPY SCWL8280.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL8130.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L8130-PARM-INFO
                                    LSEGF-PARM-INFO
                                    LPGA-PARM-INFO
                                    RPOL-REC-INFO
                                    WCVGS-WORK-AREA.

      *---------------
       0000-MAINLINE.
      *---------------

           PERFORM 8130-0000-MAINLINE
              THRU 8130-0000-MAINLINE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      ***********************************************************
      *    PROCESSING COPYBOOKS
      ***********************************************************

       COPY SCPP8130.
013578*
013578*COPY SCPPTSQ1.
      /
      ***********************************************************
      *    LINKAGE PROCESSING COPYBOOKS
      ***********************************************************

       COPY CCPS4770.
       COPY CCPL4770.
      /
       COPY CCPS4780.
       COPY CCPL4780.
      /
       COPY SCPS0410.
       COPY SCPL0410.
      /
       COPY SCPS6370.
       COPY SCPL6370.
      /
016227*COPY SCPS6680.
016227*COPY SCPL6680.
      /
       COPY SCPS6720.
       COPY SCPL6720.
      /
       COPY SCPL6730.
      /
       COPY SCPL6840.
      /
       COPY SCPS8270.
       COPY SCPL8270.
      /
       COPY SCPL8280.
      /
       COPY XCPL0260.
      /
      ***********************************************************
      *    FILE I/O PROCESS MODULES
      ***********************************************************

       COPY XCPATWRK.
       COPY XCPCTWRK.
       COPY XCPNTWRK.
       COPY XCPUTWRK.
       COPY XCPXTWRK.
      /
      ***********************************************************
      *    ERROR HANDLING ROUTINES
      ***********************************************************

       COPY XCPL0030.
      *
      *****************************************************************
      **                 END OF PROGRAM SSRF8130                     **
      *****************************************************************
