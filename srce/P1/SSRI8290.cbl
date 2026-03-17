      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI8290.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI8290                                         **
      **  REMARKS:  PROCESS REVERSAL OF M+E TRANSFER UNIT            **
      **            ALLOCATIONS.                                     **
      **                                                             **
      **            THIS MODULE WILL PERFORM REQUIRED UNIT ALLOCATION**
      **            PROCESSING FOR SEG. FUND M+E TRANSFER REVERSALS. **
      **            THE ACTIVITY STATUS IS UPDATED AND TOTALS ARE    **
      **            ROLLED FORWARD.  ROUTINES ARE ACCESSED TO OBTAIN **
      **            UNIT VALUES AND MINIMUM VALUES.                  **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
012146**  07MAY99  56V    CREATION                                   **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI8290'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWWINDX.
      /
       COPY SCWW8290.
      /
       COPY SCWWUALL.
      /
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCFRFA.
      /
       COPY SCFRFD.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY SCWL6640.
      /
       COPY SCWL7010.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY SCWL8290.
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
                                 L8290-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ***************************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  8290-0000-MAINLINE
               THRU 8290-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY SCPP8290.
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
      **                 END OF PROGRAM SSRI8290                     **
      *****************************************************************
