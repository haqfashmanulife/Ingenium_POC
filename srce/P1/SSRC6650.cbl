      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    SSRC6650.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  SSRC6650                                         **
      **  REMARKS:  VERIFY SEGREGATED FUND SURRENDER TARGETS         **
      **                                                             **
      **            THIS MODULE CONTAINS SURRENDER TARGET FINALIZE   **
      **            LOGIC. IT RETRIEVES THE TSQ CREATED IN EARLIER   **
      **            TARGET PROCESSING, AND UPDATES COVERAGE AND      **
      **            FACO FIELDS.                                     **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
012139**  07MAY99  56V    SUPPORT REFUND OF EXCESS SALES LOAD        **
013578**  15DEC99  60     3270 REMOVAL                               **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6650'.

       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
013578 COPY XCWL8090.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************

012139 COPY XCWL1670.
012139 COPY XCWL1680.
012139 COPY XCWWWKDT.
012139 COPY XCWLDTLK.

013578*COPY XCWWTSQP.
       COPY SCWWFTRG.
      /
       COPY SCWW6650.
      /
       COPY SCWWFACS.
      /
       COPY XCWTFCMD.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************

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
       COPY SCFRFS.
       COPY SCFWFS.
      /
010312*COPY SCSWT2.
010312*COPY SCSRT2.
013578*COPY SCWWTSQ2.
010312 COPY XCFRTWRK.
010312 COPY XCFWTWRK.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6650.
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
                                 L6650-PARM-INFO
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

           PERFORM  6650-0000-MAINLINE
               THRU 6650-0000-MAINLINE-X.

010312*    PERFORM  T2-4000-CLOSE
010312*        THRU T2-4000-CLOSE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************

       COPY SCPP6650.
      /
       COPY SCPPFACS.
      /
013578*COPY SCPPTSQ2.
      /
013578 COPY XCPS8090.
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************

       COPY XCPL0260.
012139 COPY XCPL1680.
      /
010312*COPY SCPLT2.
      /
013578 COPY XCPL8090.
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************

       COPY SCPAFACO.
      /
       COPY SCPBFACO.
      /
       COPY SCPCFACO.
      /
       COPY SCPUFACO.
      /
       COPY SCPXFACO.
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
      **                 END OF PROGRAM SSRC6650                     *
      ****************************************************************
