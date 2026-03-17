      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    SSRF0406.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRF0406                                         **
      **  REMARKS:  SEGFUND TRANSACTIONS RECALCULATION               **
      **                                                             **
      **            THIS MODULE CONTROLS THE REVERSAL AND            **
      **            REAPPLICATION OF SEGFUND ACTIVITIES              **
      **            BETWEEN THE SPECIFIED START AND END DATES.       **
      **            EACH DEPOSIT WILL INVOKE THE DEPOSIT             **
      **            FUNCTION DRIVER SSRF6320.  EACH ADMIN.           **
      **            MORTALITY CHARGE TRANSACTION WILL INVOKE         **
      **            THE ADMIN CHARGE FUNCTION DRIVER SSRF6340.       **
      **            OTHER TYPES OF ACTIVITY ARE BYPASSED.            **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
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
 
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRF0406'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
 
       COPY CCWWINDX.
      /
       COPY SCWW0406.
      /
       COPY SCWWAGFA.
      /
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
 
       COPY SCFWFA.
       COPY SCFRFA.
      /
       COPY SCFWFAAG.
       COPY SCFRFAAG.
      /
       COPY SCFWFC.
       COPY SCFRFC.
      /
       COPY SCFWFD.
       COPY SCFRFD.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
 
       COPY SCWL0500.
      /
       COPY SCWL6320.
      /
       COPY SCWL6340.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL0406.
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
                                 L0406-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  0406-0000-MAINLINE
               THRU 0406-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
 
       COPY SCPP0406.
      /
       COPY SCPPAGFA.
      /
       COPY SCPS6320.
      /
       COPY SCPS6340.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
 
       COPY SCPL0500.
      /
       COPY SCPL6320.
      /
       COPY SCPL6340.
      /
       COPY XCPL0260.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
 
       COPY SCPBFA.
       COPY SCPNFA.
      /
       COPY SCPNFD.
      /
       COPY SCPAFAAG.
       COPY SCPBFAAG.
       COPY SCPCFAAG.
       COPY SCPUFAAG.
       COPY SCPXFAAG.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCPL0030.
 
      ****************************************************************
      **                 END OF PROGRAM SSRF0406                     *
      ****************************************************************
