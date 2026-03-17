      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. SSRC6450.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  SSRC6450                                         **
      **  REMARKS:  CALCULATES SEGREGATED FUND SURRENDER TARGETS.    **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
013578**  15DEC99  60     3270 REMOVAL                               **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6450'.

       COPY SQLCA.
      /
014590*COPY XCWL0030.

007766 COPY XCWWCVGM.
013578 COPY XCWL8090.

      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY XCWWWKDT.
       COPY CCWWINDX.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.

013578*COPY XCWWTSQP.
       COPY SCWWFTRG.
      /
       COPY SCWWFACS.
      /
       COPY SCWW6450.
      /
       COPY CCWWASI.
      /
      ****************************************************************
      *  RECORD LAYOUTS                                              *
      ****************************************************************
010312*COPY SCSRT2.
010312*COPY SCSWT2.
013578*COPY SCWWTSQ2.
       COPY XCFRTWRK.
       COPY XCFWTWRK.

       COPY CCFRPH.
       COPY CCFWPH.
      /
       COPY CCFRCC.
       COPY CCFWCC.
      /
       COPY SCFRFA.
       COPY SCFWFA.
      /
       COPY SCFRFACO.
       COPY SCFWFACO.
      /
      ****************************************************************
      *  INPUT PARAMETER                                             *
      ****************************************************************
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      /
       COPY CCWL0186.
      /
       COPY CCWL6140.
      /
017150 COPY XCWL0289.
      /
       COPY XCWL1670.
      /
       COPY XCWL1680.
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6450.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L6450-PARM-INFO
                                  LSEGF-PARM-INFO
                                  LPGA-PARM-INFO
                                  RPOL-REC-INFO
                                  WCVGS-WORK-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

      *  THE T2 FILE IS THE BATCH EQUIVALENT TO THE TSQ ON-LINE
010312*    PERFORM  T2-2000-OPEN-IO
010312*        THRU T2-2000-OPEN-IO-X.

           PERFORM  6450-0000-MAINLINE
               THRU 6450-0000-MAINLINE-X.

010312*    PERFORM  T2-4000-CLOSE
010312*        THRU T2-4000-CLOSE-X.


       0000-MAINLINE-X.
           GOBACK.
      /

      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY SCPP6450.
      /
       COPY CCPPASI.
      /
       COPY CCPPMIDT.
      /
       COPY CCPPPLIN.
      /
       COPY SCPPFACS.
      /
013578 COPY XCPS8090.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************

010312*COPY SCPLT2.
       COPY CCPS6140.
       COPY CCPL6140.
      /
       COPY CCPS0186.
       COPY CCPL0186.
      /
       COPY XCPL0260.
      /
017150 COPY XCPL0289.
      /
       COPY XCPL1680.
      /
013578 COPY XCPL8090.
      ****************************************************************
      *  FILE I/O MODULES
      ****************************************************************

010312*COPY SCPAT2.
010312*COPY SCPNT2.
010312*COPY SCPOT2.
010312*COPY SCPXT2.
013578 COPY XCPNTWRK.
013578 COPY XCPXTWRK.
013578 COPY XCPATWRK.
013578 COPY XCPGTWRK.
013578 COPY XCPFTWRK.

       COPY CCPNCC.
      /
       COPY CCPNPH.
      /
       COPY SCPAFACO.
       COPY SCPBFACO.
       COPY SCPCFACO.
       COPY SCPUFACO.
       COPY SCPXFACO.
      /
013578*COPY SCPPTSQ2.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM SSRC6450                     **
      *****************************************************************
