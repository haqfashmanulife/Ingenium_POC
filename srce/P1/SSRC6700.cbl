      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC6700.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC6700                                         **
      **  REMARKS:  THIS MODULE CONTAINS ROUTINES COMMON TO ALL      **
      **            SEGREGATED FUND VERIFY PROCESSING: VERIFY FUND   **
      **            DETAIL (FD) RECORDS, VERIFY FUND ACTIVITY (FA)   **
      **            RECORDS (I.E. SET UP POINTER FIELDS AND AGENT    **
      **            INFO), VERIFY COVERAGE FUND (FS) RECORDS (I.E    **
      **            SET UP DATE FIELDS).                             **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
005409**  30OCT98  56     LEAP YEAR MODIFICATIONS                    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
MP171F**  19JAN12  CTS	  LOGICAL RECORD LOCKING		     **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6700'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      * I/O COPYBOKS                                                 *
      ****************************************************************
 
       COPY SCFRFC.
       COPY SCFRFD.
       COPY SCFRFA.
       COPY SCFRFS.
      /
       COPY SCFWFD.
       COPY SCFWFA.
      /
       COPY SCFRFAAG.
       COPY SCFWFAAG.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
 
       COPY XCWWWKDT.
005409 COPY XCWL1670.
005409 COPY XCWL1680.
005409 COPY XCWLDTLK.
      /
       COPY CCWWINDX.
      /
       COPY SCWW6700.
      /
       COPY SCWWAGFA.
      /
MP171F COPY CCWWLOCK.
MP171F COPY XCWL8090.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6700.
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
                                 L6700-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6700-0000-MAINLINE
               THRU 6700-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
 
       COPY SCPP6700.
      /
       COPY SCPPAGFA.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
       COPY XCPL0260.
005409 COPY XCPL1680.
      /
MP171F COPY XCPS8090.
MP171F COPY XCPL8090.
      /        
      ****************************************************************
      *  FILE I/O PROCESS MODULES                                    *
      ****************************************************************
 
       COPY SCPAFD.
       COPY SCPBFD.
       COPY SCPUFD.
      /
       COPY SCPUFA.
       COPY SCPAFA.
MP171F COPY SCPNFA. 
      /
       COPY SCPAFAAG.
       COPY SCPBFAAG.
       COPY SCPCFAAG.
       COPY SCPUFAAG.
       COPY SCPXFAAG.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
 
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRC6700                     **
      *****************************************************************
