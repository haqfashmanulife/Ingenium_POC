      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    SSRS6460.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  SSRS6460                                         **
      **  REMARKS:  VERIFY SEGREGATED FUND DEPOSIT TARGETS AND       **
      **            REVERSALS.                                       **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS6460'.

       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
013578 COPY XCWL8090.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************

       COPY CCWWCCD.
      /
       COPY CCWWFPA.
      /
       COPY CCWWINDX.
      /
       COPY SCWW6460.
      /
       COPY SCWWAGFA.
      /
       COPY SCWWFACS.
      /
013578*COPY XCWWTSQP.
       COPY SCWWFTRG.
      /
       COPY XCWLDTLK.
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
      /
010312*COPY SCSWTWRK.
010312*COPY SCSRTWRK.
013578*COPY SCWWTSQ2.
010312 COPY XCFRTWRK.
010312 COPY XCFWTWRK.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************

       COPY CCWL2030.
      /
       COPY CCWL6140.
      /
017150 COPY XCWL0289.       
       COPY XCWL1670.
       COPY XCWL1680.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6460.
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
                                 L6460-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

      *  THE TWRK FILE IS THE BATCH EQUIVALENT TO THE TSQ ON-LINE
010312*    PERFORM  TWRK-2000-OPEN-IO
010312*        THRU TWRK-2000-OPEN-IO-X.

           PERFORM  6460-0000-MAINLINE
               THRU 6460-0000-MAINLINE-X.

010312*    PERFORM  TWRK-4000-CLOSE
010312*        THRU TWRK-4000-CLOSE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************

       COPY SCPP6460.
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
013578 COPY XCPS8090.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************

       COPY CCPL2030.

       COPY CCPL6140.
       COPY CCPS6140.
      /
010312*COPY SCPLT2.
      /
       COPY XCPL0260.
      /
017150 COPY XCPL0289.       
       COPY XCPL1680.
      /
013578 COPY XCPL8090.
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************

       COPY CCPACVGD.
       COPY CCPCCVGD.
       COPY CCPNCVGD.
       COPY CCPUCVGD.
      /
       COPY CCPNPH.
      /
       COPY SCPAFACO.
       COPY SCPBFACO.
       COPY SCPCFACO.
       COPY SCPUFACO.
       COPY SCPXFACO.
      /
010312*COPY SCPATWRK.
010312*COPY SCPNTWRK.
010312*COPY SCPOTWRK.
010312*COPY SCPXTWRK.
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
      **                 END OF PROGRAM SSRS6460                     *
      ****************************************************************
