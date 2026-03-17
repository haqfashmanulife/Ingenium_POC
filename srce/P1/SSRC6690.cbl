      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC6690.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC6690                                         **
      **  REMARKS:  THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGREGATED FUND ADMINISTRATIVE CHARGES, INCLUDING**
      **            FORMATTING OF FA RECORDS. IT DRIVES UNIT         **
      **            ALLOCATION CALCULATIONS AND TARGET CALCULATIONS. **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012135**  07MAY99  56V    ADD STATE FUND APPROVAL                    **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
MFPFU2**  07OCT04  CLB    ALLOCATE COI WTHDR BETWEEN GA AND SA CVGS  **
MFPFU2**                  FOR MULTIFUNDS BY ORDER COI WTHDR RULE.    **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6690'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
012135 COPY CCWL3330.
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY XCWWWKDT.
      /
       COPY CCWWINDX.
      /
       COPY SCWW6690.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
 
017150 COPY XCWL0289.
      /
       COPY SCFRFA.
       COPY SCFWFA.
      /
       COPY SCFRFD.
       COPY SCFWFD.
      /
MFPFU2 COPY SCFRFH.
MFPFU2 COPY SCFWFH.
MFPFU2/
       COPY SCFRFR.
       COPY SCFWFR.
      /
012135 COPY CCFWPH.
012135 COPY CCFRPH.
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6690.
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
                                 L6690-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6690-0000-MAINLINE
               THRU 6690-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
 
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY SCPP6690.
      /
012135 COPY CCPPMIDT.
012135 COPY CCPPPLIN.
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
017150 COPY XCPL0289.
      /
       COPY SCPBFA.
      /
MFPFU2 COPY SCPNFH.
MFPFU2/
       COPY SCPNFR.
      /
012135 COPY CCPNPH.
       COPY XCPL0260.
      /
012135 COPY CCPS3330.
012135 COPY CCPL3330.
 
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRC6690                     **
      *****************************************************************
