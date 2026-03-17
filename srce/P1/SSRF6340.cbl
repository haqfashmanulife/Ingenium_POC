      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRF6340.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRF6340                                         **
      **  REMARKS:  SEGREGATED FUND ADMIN/ADMIN REVERSAL AND VERIFY. **
      **            THIS MODULE IS CALLED TO DRIVE SEGREGATED FUND   **
      **            ADMINISTRATIVE CHARGES, ADMINISTRATIVE CHARGE    **
      **            REVERSAL PROCESSING AND THE VERIFY PROCESSING    **
      **            ASSOCIATED WITH THESE FUNCTIONS.                 **
      **            THERE ARE ALSO EDITS IN PLACE FOR ADMINISTRATIVE **
      **            CHARGES AND REVERSALS.                           **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
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
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRF6340'.
      *
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
 
      *********************************************************
      *   COMMON COPYBOOKS
      *********************************************************
 
       COPY XCWTFCMD.
 
       COPY SCWW6340.
      /
       COPY CCWWINDX.
557701/
557701 COPY XCWWWKDT.
013578*
013578*COPY XCWWTSQP.
013578*
013578*
013578* THE FOLLOWING FIELD IS REQUIRED FOR TSQ DELETE PROCESSING
013578* IN THIS MODULE. THE TSQ DATA AREA AT THE END OF XCWWTSQP
013578* REQUIRES A NON-ZERO LENGTH.
013578*           10 FILLER            PIC X(01).
013578*
      **********************************************************
      * I/O COPYBOOKS
     **********************************************************
 
557701 COPY CCFWPH.
557701 COPY CCFRPH.
557701 COPY CCWZPH.
557701/
       COPY SCFRFC.
 
010312*COPY SCSRT1.
010312*COPY SCSWT1.
013578*COPY SCWWTSQ1.
010312 COPY XCFRTWRK.
010312 COPY XCFWTWRK.
      /
      **********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ********************************************************
 
557701 COPY CCWL4770.
557701/
557701 COPY CCWL4780.
557701/
       COPY SCWL0410.
      /
       COPY SCWL6370.
      /
       COPY SCWL6690.
      /
       COPY SCWL6720.
      /
       COPY SCWL6740.
      /
       COPY SCWL6850.
      /
      **********************************************************
      * INPUT PARAMETER INFORMATION
      ********************************************************
 
      /
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6340.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L6340-PARM-INFO
                                    LSEGF-PARM-INFO
                                    LPGA-PARM-INFO
                                    RPOL-REC-INFO
                                    WCVGS-WORK-AREA.
 
      *---------------
       0000-MAIN-LINE.
      *---------------
 
 
           PERFORM 6340-0000-MAINLINE
              THRU 6340-0000-MAINLINE-X.
 
 
 
       0000-MAIN-LINE-X.
           GOBACK.
      *
      /
      ***********************************************************
      *    PROCESSING COPYBOOKS
      ***********************************************************
 
       COPY SCPP6340.
557701/
557701 COPY CCPPPLIN.
013578*
013578*COPY SCPPTSQ1.
      /
      ***********************************************************
      *    LINKAGE PROCESSING COPYBOOKS
      ***********************************************************
 
557701 COPY CCPS4770.
557701 COPY CCPL4770.
557701/
557701 COPY CCPS4780.
557701 COPY CCPL4780.
557701/
010312*COPY SCPLT1.
 
       COPY SCPS0410.
       COPY SCPL0410.
      /
       COPY SCPS6370.
       COPY SCPL6370.
      /
       COPY SCPS6690.
       COPY SCPL6690.
      /
       COPY SCPS6720.
       COPY SCPL6720.
      /
       COPY SCPS6740.
       COPY SCPL6740.
      /
       COPY SCPS6850.
       COPY SCPL6850.
      /
       COPY XCPL0260.
      /
      ***********************************************************
      *    FILE I/O PROCESS MODULES
      ***********************************************************
 
557701 COPY CCPNPH.
557701 COPY CCPZPH.
557701
010312*COPY SCPAT1.
010312*COPY SCPNT1.
010312*COPY SCPXT1.
010312 COPY XCPATWRK.
010312 COPY XCPCTWRK.
010312 COPY XCPNTWRK.
010312 COPY XCPUTWRK.
010312 COPY XCPXTWRK.
      /
 
      ***********************************************************
      *    ERROR HANDLING ROUTINES
      ***********************************************************
 
       COPY XCPL0030.
      *
      *****************************************************************
      **                 END OF PROGRAM SSRF6340                     **
      *****************************************************************
