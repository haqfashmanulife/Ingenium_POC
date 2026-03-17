      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC8270.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC8270                                         **
      **  REMARKS:  THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGREGATED FUND TRANSFER FROM INITIAL TO         **
      **            ACCUMULATION UNITS FOR MORTALITY AND EXPENSE     **
      **            CHARGES                                          **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
012146**  07MAY99  56V    CREATION                                   **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC8270'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
       COPY XCWWWKDT.
       COPY CCWWINDX.
       COPY SCWW8270.
       COPY SCWWAGFA.
       COPY SCWWSETA.
      /
      *****************************************************************
      * I/O COPYBOOKS                                                 *
      *****************************************************************
      /
       COPY CCFRPH.
       COPY CCFWPH.
      /
       COPY SCFRFC.
      /
       COPY SCFRFA.
      /
       COPY SCFRFS.
      /
       COPY SCFRFD.
       COPY SCFWFD.
      /
       COPY SCFRFH.
       COPY SCFWFH.
      /
       COPY SCFRFV.
       COPY SCFWFV.
      /
       COPY SCFRFX.
       COPY SCFWFX.
      /
      *****************************************************************
      * CALLED MODULE PARAMETER INFORMATION                           *
      *****************************************************************
      /
       COPY CCWL0186.
      /
       COPY CCWL3120.
      /
       COPY CCWL5510.
      /
017150 COPY XCWL0289.
      /
       COPY XCWL0290.
      /
       COPY XCWL1660.
       COPY XCWLDTLK.
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL8270.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L8270-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  8270-0000-MAINLINE
               THRU 8270-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY SCPP8270.
      /
       COPY CCPPMIDT.
       COPY CCPPPLIN.
      /
       COPY SCPPSETA.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
      /
       COPY CCPS0186.
       COPY CCPL0186.
      /
       COPY CCPS3120.
       COPY CCPL3120.
      /
       COPY CCPS5510.
       COPY CCPL5510.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
      /
017150 COPY XCPL0289.
      /
       COPY XCPL0290.
       COPY XCPS0290.
      /
      ****************************************************************
      *    FILE I/O PROCESS MODULES                                  *
      ****************************************************************
       COPY SCPBFD.
       COPY SCPNFD.
      /
       COPY SCPNFH.
      /
       COPY SCPBFV.
       COPY SCPNFV.
      /
       COPY SCPNFX.
      /
       COPY CCPNPH.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRC8270                     **
      *****************************************************************
