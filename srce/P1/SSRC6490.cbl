      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. SSRC6490.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  SSRC6490                                         **
      **  REMARKS:  THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGREGATED FUND SURRENDER TARGET REVERSAL        **
      **            CALCULATIONS. THE RESULTS OF THE CALCULATIONS    **
      **            ARE STORED ON A TSQ FOR PROCESSING IN THE VERIFY **
      **            STEP.                                            **
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
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6490'.

       COPY SQLCA.
      /
014590*COPY XCWL0030.
013578 COPY XCWL8090.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY XCWWWKDT.

       COPY XCWTFCMD.
      /
       COPY CCWWINDX.
      /
      ****************************************************************
      *  INPUT PARAMETER INFORMATION                                 *
      ****************************************************************
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************

010312*COPY SCSRT2.
010312*COPY SCSWT2.
013578*COPY SCWWTSQ2.
010312 COPY XCFRTWRK.
010312 COPY XCFWTWRK.
      /
       COPY SCFRFA.
       COPY SCFWFA.
      /

013578*COPY XCWWTSQP.
       COPY SCWWFTRG.
      /
       COPY SCFRFACO.
       COPY SCFWFACO.
      /
       COPY SCWWFACS.
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6490.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L6490-PARM-INFO
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

           PERFORM  6490-0000-MAINLINE
               THRU 6490-0000-MAINLINE-X.

010312*    PERFORM  T2-4000-CLOSE
010312*        THRU T2-4000-CLOSE-X.

       0000-MAINLINE-X.
           GOBACK.
      /

      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY SCPP6490.
      /
013578 COPY XCPS8090.
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
013578 COPY XCPL8090.
010312*COPY SCPLT2.
010312
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
       COPY SCPPFACS.
      /
       COPY SCPAFACO.
       COPY SCPBFACO.
       COPY SCPCFACO.
       COPY SCPUFACO.
       COPY SCPXFACO.
      /
013578*COPY SCPPTSQ2.
      /
       COPY XCPL0260.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM SSRC6490                     **
      *****************************************************************
