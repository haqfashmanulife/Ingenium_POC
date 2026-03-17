      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRI6830.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRI6830                                         **
      **  REMARKS:  SEGREGATED FUND SURRENDER REVERSAL PROCESSING .  **
      **                                                             **
      **            THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGREGATED FUND SURRENDER REVERSALS, INCLUDING   **
      **            FORMATTING OF FA AND FD RECORDS. REVERSALS OF    **
      **            TARGETS ARE ALSO DRIVEN FROM THIS MODULE.        **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
5-0214**  01OCT05  GW     ADD COMMON COPYBOOK                        **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6830'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWWINDX.
5-0214 COPY XCWWWKDT.
      /
       COPY SCWW6830.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
       COPY SCFRFD.
      /
       COPY CCFWPH.
       COPY CCFRPH.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
54-001 COPY SCWL6490.
      /
54-001 COPY CCWL6140.
      /
      ****************************************************************
      *  INPUT PARAMETER INFORMATION                                 *
      ****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6830.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L6830-PARM-INFO
                                  LSEGF-PARM-INFO
                                  LPGA-PARM-INFO
                                  RPOL-REC-INFO
                                  WCVGS-WORK-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
 
           PERFORM  6830-0000-MAINLINE
               THRU 6830-0000-MAINLINE-X.
 
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY SCPP6830.
      /
       COPY CCPPPLIN.
      /
      ****************************************************************
      *  FILE I/O PROCESSING MODULES                                *
      ****************************************************************
 
       COPY CCPNPH.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
 
54-001 COPY SCPS6490.
54-001 COPY SCPL6490.
      /
54-001 COPY CCPS6140.
54-001 COPY CCPL6140.
      /
       COPY XCPL0260.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM SSRI6830                     **
      *****************************************************************
