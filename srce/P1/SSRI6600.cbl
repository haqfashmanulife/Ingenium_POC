      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    SSRI6600.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI6600                                         **
      **  REMARKS:  UNIT ALLOCATION ROUTINES FOR SEGREGATED          **
      **            FUND SURRENDERS                                  **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
005409**  30OCT98  56     LEAP YEAR MODIFICATIONS                    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012135**  07MAY99  56V    STATE FUND APPROVAL                        **
012141**  07MAY99  56V    PORTFOLIO EXPANSION                        **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6600'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
012135 COPY CCWL3330.
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      *
       COPY CCWWINDX.
      /
       COPY SCWW6600.
      /
       COPY SCWWAGFA.
      /
       COPY SCWWRNDP.
      /
       COPY SCWWUALL.
      /
       COPY XCWWWKDT.
005409 COPY XCWL1670.
005409 COPY XCWL1680.
005409 COPY XCWLDTLK.
012141 COPY XCWWFNDM.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
       COPY CCFWPH.
       COPY CCFRPH.
      /
       COPY SCFRFA.
      /
       COPY SCFRFC.
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
      ****************************************************************
      *  INPUT PARAMETER INFORMATION                                 *
      ****************************************************************
 
       COPY CCWL6140.
      /
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
 
       COPY SCWL0410.
      /
       COPY SCWL6450.
      /
      /
       COPY SCWL6601.
      /
       COPY SCWL6640.
      /
       COPY SCWL6650.
      /
       COPY SCWL7030.
      /
017150 COPY XCWL0289.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6600.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L6600-PARM-INFO
                                  LSEGF-PARM-INFO
                                  LPGA-PARM-INFO
                                  RPOL-REC-INFO
                                  WCVGS-WORK-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6600-0000-MAINLINE
               THRU 6600-0000-MAINLINE-X.
 
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
 
       COPY SCPP6600.
      /
       COPY CCPPPLIN.
      /
       COPY SCPPRNDP.
      /
       COPY SCPPSUBU.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
 
       COPY CCPS6140.
       COPY CCPL6140.
      /
       COPY SCPS0410.
       COPY SCPL0410.
      /
       COPY SCPS6601.
       COPY SCPL6601.
      /
       COPY SCPS6450.
       COPY SCPL6450.
      /
       COPY SCPS6640.
       COPY SCPL6640.
      /
       COPY SCPS6650.
       COPY SCPL6650.
      /
       COPY SCPS7030.
       COPY SCPL7030.
      /
       COPY XCPL0260.
      /
017150 COPY XCPL0289.
      /
005409 COPY XCPL1680.
005409/
012135 COPY CCPL3330.
012135 COPY CCPS3330.
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
       COPY CCPNPH.
      /
       COPY SCPNFH.
       COPY SCPUFH.
      /
       COPY SCPNFX.
      /
       COPY SCPNFR.
      /
012135 COPY CCPPMIDT.
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCPL0030.
 
      ****************************************************************
      **                 END OF PROGRAM SSRI6600                     *
      ****************************************************************
