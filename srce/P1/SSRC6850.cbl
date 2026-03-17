      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC6850.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC6850                                         **
      **  REMARKS:  SEGREGATED FUND ADMINISTRATION CHARGE REVERSAL   **
      **            PROCESSING.                                      **
      **            THIS MODULE PERFORMS ROUTINES TO SUPPORT SEG.    **
      **            FUND ADMINISTRATION CHARGES, INCLUDING           **
      **            FORMATTING OF FA AND FD RECORDS.                 **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
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
 
      *
       WORKING-STORAGE SECTION.
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6850'.
      *
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
 
      *********************************************************
      *   COMMON COPYBOOKS
      *********************************************************
 
       COPY SCWW6850.
      /
      **********************************************************
      * I/O COPYBOOKS
     **********************************************************
 
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
       COPY SCFRFD.
      /
      **********************************************************
      * INPUT PARAMETER INFORMATION
      ********************************************************
 
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6850.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L6850-PARM-INFO
                                    LSEGF-PARM-INFO
                                    LPGA-PARM-INFO
                                    RPOL-REC-INFO
                                    WCVGS-WORK-AREA.
 
      *---------------
       0000-MAIN-LINE.
      *---------------
 
 
           PERFORM 6850-0000-MAINLINE
              THRU 6850-0000-MAINLINE-X.
 
 
 
       0000-MAIN-LINE-X.
           GOBACK.
      /
      ***********************************************************
      *    PROCESSING COPYBOOKS
      ***********************************************************
 
       COPY SCPP6850.
      /
      ***********************************************************
      *    ERROR HANDLING ROUTINES
      ***********************************************************
 
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM SSRC6850                     **
      *****************************************************************
