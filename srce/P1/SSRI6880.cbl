      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI6880.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI6880                                         **
      **  REMARKS:  THIS MODULE WILL PERFORM REQUIRED UNIT           **
      **            ALLOCATION PROCESSING FOR SEG. FUND              **
      **            ADMINISTRATION CHARGES. THE ACTIVITY STATUS IS   **
      **            UPDATED AND TOTALS ARE ROLLED FORWARD. ROUTINES  **
      **            ARE ACCESSED TO OBTAIN UNIT VALUES AND MINIMUM   **
      **            VALUES.                                          **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6880'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
 
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
      /
       COPY SCWWUALL.
      /
       COPY SCWW6880.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
 
       COPY SCWL6640.
      /
       COPY SCWL7010.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
 
       COPY SCFRFD.
      /
       COPY SCFRFA.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL6880.
      /
       COPY SCWLSEGF.
      /
       COPY CCWLPGA.
      /
       COPY CCFRPOL.
      /
       COPY CCWWCVGS.
      /
      ***************************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L6880-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ***************************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6880-0000-MAINLINE
               THRU 6880-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
 
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
 
       COPY SCPP6880.
      /
       COPY SCPPSUBU.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
       COPY SCPS6640.
       COPY SCPL6640.
      /
       COPY SCPS7010.
       COPY SCPL7010.
      /
       COPY XCPL0260.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
 
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRI6880                     **
      *****************************************************************
