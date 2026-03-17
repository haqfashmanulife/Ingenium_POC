      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    SSRS6660.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRS6660                                         **
      **  REMARKS:  SEGREGATED FUND SURRENDER PROCESSING             **
      **                                                             **
      **            THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGREGATED FUND SURRENDERS, INCLUDING            **
      **            FORMATTING OF FA AND FD RECORDS. IT DRIVES       **
      **            UNIT ALLOCATION CALCULATIONS AND TARGET          **
      **            CALCULATIONS.                                    **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
008455**  31MAR98  552    EXTENSIVE NUMERIC FORMATTING               **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012135**  07MAY99  56V    STATE FUND APPROVAL                        **
012137**  07MAY99  56V    SEG FUND INFO                              **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS6660'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
012137 COPY CCWL3120.
012135 COPY CCWL3330.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      *
       COPY CCWWINDX.
      /
       COPY SCWW6660.
      /
       COPY SCWWAGFA.
      /
       COPY SCWWFACS.
      /
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
 
       COPY CCFWPH.
       COPY CCFRPH.
      /
       COPY SCFRFA.
       COPY SCFWFA.
      /
       COPY SCFRFC.
       COPY SCFWFC.
      /
       COPY SCFRFD.
       COPY SCFWFD.
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
      ****************************************************************
      *  INPUT PARAMETER INFORMATION                                 *
      ****************************************************************
 
       COPY CCWL6140.
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
 
       COPY SCWL6450.
      /
       COPY SCWL6600.
      /
      /
       COPY SCWL7030.
      /
017150 COPY XCWL0289.
008455 COPY XCWL0290.
       COPY XCWL1660.
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
       COPY SCWL6660.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L6660-PARM-INFO
                                  LSEGF-PARM-INFO
                                  LPGA-PARM-INFO
                                  RPOL-REC-INFO
                                  WCVGS-WORK-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
 
           PERFORM  6660-0000-MAINLINE
               THRU 6660-0000-MAINLINE-X.
 
 
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
 
       COPY SCPP6660.
      /
       COPY CCPPPLIN.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
      *
       COPY CCPS6140.
       COPY CCPL6140.
      /
       COPY SCPL6450.
       COPY SCPS6450.
      /
       COPY SCPS6600.
       COPY SCPL6600.
      /
       COPY SCPS7030.
       COPY SCPL7030.
      /
008455 COPY XCPL0290.
008455 COPY XCPS0290.
      /
       COPY XCPL0260.
      /
017150 COPY XCPL0289.
      /
       COPY XCPL1660.
      /
       COPY XCPL1680.
012137 COPY CCPS3120.
012137 COPY CCPL3120.
012135 COPY CCPS3330.
012135 COPY CCPL3330.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
 
       COPY CCPNPH.
      /
       COPY SCPNFA.
      /
       COPY SCPNFX.
      /
       COPY SCPNFR.
012135 COPY CCPPMIDT.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCPL0030.
 
      ****************************************************************
      **                 END OF PROGRAM SSRS6660                     *
      ****************************************************************
