      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI6620.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI6620                                         **
      **  REMARKS:  UNIT ALLOCATION ROUTINES FOR SEGREGATED FUND     **
      **            TRANSFERS.                                       **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  GWL    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012135**  07MAY99  56V    STATE FUND APPROVAL                        **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
MFFFU6**  03OCT05  KNM    FUND TRANSFER MODIFICATIONS                **
5-0391**  03OCT05  AC     ADDED FC COPYBOOKS                         **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6620'.
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
012135 COPY CCWL3330.
      /
      *****************************************************************
      * COMMON COPYBOOKS                                              *
      *****************************************************************
       COPY CCWWINDX.
       COPY XCWWWKDT.
       COPY XCWLDTLK.
 
       COPY SCWW6620.
       COPY SCWWRNDP.
       COPY SCWWSETA.
       COPY SCWWUALL.
      /
      *****************************************************************
      * I/O COPYBOOKS                                                 *
      *****************************************************************
       COPY CCFRPH.
       COPY CCFWPH.
      /
       COPY SCFRFA.
MFFFU6 COPY SCFWFA.
       COPY SCFRFC.
5-0391 COPY SCFWFC.
       COPY SCFRFD.
      /
       COPY SCFRFH.
       COPY SCFWFH.
      /
       COPY SCFRFR.
       COPY SCFWFR.
      /
       COPY SCFRFV.
      /
       COPY SCFRFX.
       COPY SCFWFX.
      /
      *****************************************************************
      * CALLED MODULE PARAMETER INFORMATION                           *
      *****************************************************************
       COPY CCWL0186.
       COPY SCWL6640.
       COPY SCWL7010.
017150 COPY XCWL0289.
       COPY XCWL1680.
       COPY XCWL1670.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6620.
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
                                 L6620-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6620-0000-MAINLINE
               THRU 6620-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      **********************
      * PROCESSING COPYBOOKS
      **********************
       COPY SCPP6620.
      /
       COPY CCPPMIDT.
       COPY CCPPPLIN.
       COPY SCPPRNDP.
       COPY SCPPSETA.
       COPY SCPPSUBU.
      /
      ******************************
      * LINKAGE PROCESSING COPYBOOKS
      ******************************
       COPY CCPS0186.
       COPY CCPL0186.
      /
       COPY SCPS6640.
       COPY SCPL6640.
      /
       COPY SCPL7010.
      /
       COPY XCPL0260.
017150 COPY XCPL0289.
       COPY XCPL1680.
012135 COPY CCPS3330.
012135 COPY CCPL3330.
 
      *****************************************************************
      * FILE I/O PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY CCPNPH.
 
       COPY SCPNFH.
       COPY SCPUFH.
 
       COPY SCPNFR.
 
       COPY SCPNFX.
MFFFU6* 
MFFFU6 COPY SCPBFA.
5-0391 COPY SCPBFC.
 
      *****************************************************************
      * ERROR HANDLING ROUTINES                                       *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRI6620                     **
      *****************************************************************
