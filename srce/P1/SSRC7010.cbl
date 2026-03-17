      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC7010.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC7010                                         **
      **  REMARKS:  CHECKS THE MINIMUM VALUE OF A FUND               **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY (NEW)    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC7010'.
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCFWFD.
       COPY SCFRFD.
 
       COPY SCFRFA.
 
       COPY SCFWFH.
       COPY SCFRFH.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
 
       COPY XCWWWKDT.
       COPY SCWW7010.
       COPY SCWWUALL.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL7010.
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
                                 L7010-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  7010-0000-MAINLINE
               THRU 7010-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
 
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
 
       COPY SCPP7010.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
       COPY XCPL0260.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
 
       COPY SCPBFD.
      /
       COPY SCPNFH.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
 
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRC7010                     **
      *****************************************************************
