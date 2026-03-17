      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    SSRS6390.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  SSRS6390                                         **
      **  REMARKS:  SEGREGATED FUND DEPOSIT AND DEPOSIT REVERSAL     **
      **            PROCESSING.                                      **
      **                                                             **
      **            THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGREGATED FUND DEPOSITS, AND DEPOSIT REVERSALS, **
      **            INCLUDING FORMATTING OF FA AND FD RECORDS.       **
      **            SET-UP CHARGES AND SHORTAGE CALCULATIONS ARE ALSO *
      **            DONE HERE.  MODULES ARE CALLED TO ALLOCATE THE   **
      **            DEPOSIT TO OTHER COVERAGES AND TO CALCULATE      **
      **            FRONT-END LOADS.                                 **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
008455**  31MAR98  552    EXTENSIVE MUMERIC FORMATTING               **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
012135**  07MAY99  56V    STATE FUND APPROVAL                        **
013578**  15DEC99  60     3270 REMOVAL                               **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS6390'.

       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
013578 COPY XCWL8090.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************

       COPY CCWWINDX.
      /
013578*COPY XCWWTSQP.
       COPY SCWWFTRG.
      /
       COPY SCWW6390.
      /
       COPY SCWWAGFA.
      /
       COPY SCWWFACS.
      /
       COPY XCWWWKDT.
      /
       COPY XCWTFCMD.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************

       COPY CCFWCVGD.
       COPY CCFRCVGD.
      /
       COPY CCFWPH.
       COPY CCFRPH.
      /
       COPY SCFRFA.
       COPY SCFWFA.
      /
       COPY SCFRFACO.
       COPY SCFWFACO.
      /
       COPY SCFRFC.
       COPY SCFWFC.
      /
       COPY SCFRFD.
       COPY SCFWFD.
      /
       COPY SCFRFH.
       COPY SCFWFH.
      /
       COPY SCFRFX.
       COPY SCFWFX.
      /
       COPY SCFRFR.
       COPY SCFWFR.
      /
       COPY SCFRFS.
       COPY SCFWFS.
      /
010312*COPY SCSWT2.
010312*COPY SCSRT2.
013578*COPY SCWWTSQ2.
010312 COPY XCFRTWRK.
010312 COPY XCFWTWRK.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************

       COPY CCWL2450.
      /
012135 COPY CCWL3330.
012135/
       COPY CCWL5510.
      /
       COPY CCWL6110.
      /
       COPY CCWL6120.
      /
       COPY CCWL6140.
      /
       COPY SCWL7020.
      /
       COPY CCWWCCD.
      /
       COPY CCWWFPA.
      /
017150 COPY XCWL0289.
008455 COPY XCWL0290.
      /
       COPY XCWL1670.
       COPY XCWL1680.
      /
       COPY XCWLDTLK.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6390.
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
                                 L6390-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

      *  THE T2 FILE IS THE BATCH EQUIVALENT TO THE TSQ ON-LINE
010312*    PERFORM  T2-2000-OPEN-IO
010312*        THRU T2-2000-OPEN-IO-X.

           PERFORM  6390-0000-MAINLINE
               THRU 6390-0000-MAINLINE-X.

010312*    PERFORM  T2-4000-CLOSE
010312*        THRU T2-4000-CLOSE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************

       COPY SCPP6390.
      /
       COPY CCPS2450.
      /
       COPY CCPS5510.
      /
       COPY CCPS6140.
      /
       COPY SCPS7020.
      /
       COPY CCPPFPA.
      /
       COPY CCPPMIDT.
      /
       COPY CCPPCCD.
      /
       COPY CCPPPLIN.
      /
       COPY SCPPFACS.
      /
013578*COPY SCPPTSQ2.
      /
013578 COPY XCPS8090.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************

       COPY CCPL2450.
      /
       COPY CCPL5510.
      /
       COPY CCPL6110.
      /
       COPY CCPL6120.
      /
       COPY CCPL6140.
      /
       COPY SCPL7020.
      /
010312*COPY SCPLT2.
      /
017150 COPY XCPL0289.
017150/
008455 COPY XCPL0290.
008455 COPY XCPS0290.
      /
012135 COPY CCPS3330.
012135 COPY CCPL3330.
012135/
       COPY XCPL0260.
      /
       COPY XCPL1680.
013578 COPY XCPL8090.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************

       COPY CCPACVGD.
       COPY CCPCCVGD.
       COPY CCPNCVGD.
      /
       COPY CCPNPH.
      /
       COPY CCPUCVGD.
      /
       COPY SCPAFACO.
       COPY SCPBFACO.
       COPY SCPCFACO.
       COPY SCPUFACO.
       COPY SCPXFACO.
      /
       COPY SCPNFA.
      /
       COPY SCPNFH.
      /
       COPY SCPNFX.
      /
       COPY SCPNFR.
      /
010312*COPY SCPAT2.
010312*COPY SCPNT2.
010312*COPY SCPOT2.
010312*COPY SCPXT2.
013578 COPY XCPNTWRK.
013578 COPY XCPXTWRK.
013578 COPY XCPATWRK.
013578 COPY XCPGTWRK.
013578 COPY XCPFTWRK.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************

       COPY XCPL0030.

      ****************************************************************
      **                 END OF PROGRAM SSRS6390                     *
      ****************************************************************
