      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    SSRF6320.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRF6320                                         **
      **  REMARKS:  THIS MODULE CONTROLS THE PROCESSING FOR SEGFUND  **
      **            DEPOSITS AND DEPOSIT REVERSALS.  THE MODULE CAN  **
      **            BE CALLED TO PROCESS EDITS ONLY, OR FULL DEPOSIT **
      **            OR DEPOSIT REVERSAL PROCESSING MAY BE INVOKED.   **
      **            THE MODULE ALSO DRIVES THE VERIFY STEP FOR THESE **
      **            FUNCTIONS, WHERE THE TRANSACTION WILL BE FINALIZED*
      **            AND ANY NECESSARY TABLE UPDATED.                 **
      **                                                             **
      **  DOMAIN :  BC                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
011925**  30OCT98  56     RENAME MODULES X*5480 TO C*5480            **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
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
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRF6320'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
 
013578*COPY XCWWTSQP.
013578*
013578* THE FOLLOWING FIELD IS REQUIRED FOR TSQ DELETE PROCESSING
013578* IN THIS MODULE. THE TSQ DATA AREA AT THE END OF COPYBOOK
013578* XCWWTSQP REQUIRES A NON-ZERO LENGTH
013578*
013578*        10  FILLER             PIC X.
      /
       COPY SCWW6320.
      /
       COPY XCWWWKDT.
      /
       COPY XCWTFCMD.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
 
       COPY CCWWBTAX.
      /
       COPY SCFWFA.
       COPY SCFRFA.
      /
       COPY SCFRFC.
      /
010312*COPY SCSWT1.
010312*COPY SCSRT1.
013578*COPY SCWWTSQ1.
010312 COPY XCFRTWRK.
010312 COPY XCFWTWRK.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
 
       COPY CCWL0187.
557701/
557701 COPY CCWL4770.
557701/
557701 COPY CCWL4780.
      /
       COPY CCWL5300.
      /
       COPY CCWL6090.
      /
       COPY CCWL6100.
      /
       COPY SCWL0410.
      /
       COPY SCWL6370.
       COPY SCWL6390.
      /
       COPY SCWL6460.
       COPY SCWL6480.
      /
       COPY SCWL6720.
      /
011925*COPY XCWL5480.
011925 COPY CCWL5480.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY SCWL6320.
 
       COPY SCWLSEGF.
 
       COPY CCWLPGA.
 
       COPY CCFRPOL.
 
       COPY CCWWCVGS.
      /
      ***************************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L6320-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
      ***************************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6320-0000-MAINLINE
               THRU 6320-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
 
013578****************************************************************
013578*  THE FOLLOWING PARAGRAPHS ARE HARD-CODED SINCE BATCH MUST BE *
013578*  DIFFERENT FROM ON-LINE.                                     *
013578****************************************************************
013578*
013578*---------------------------
013578*6320-9000-OPEN-TEMP-STORAGE.
013578*---------------------------
013578*
010312*    PERFORM  T1-2000-OPEN-IO
010312*        THRU T1-2000-OPEN-IO-X.
013578*
013578*6320-9000-OPEN-TEMP-STORAGE-X.
013578*    EXIT.
013578*
013578*-----------------------------
013578*6320-9100-CLOSE-TEMP-STORAGE.
013578*-----------------------------
013578*
010312*    PERFORM  T1-4000-CLOSE
010312*        THRU T1-4000-CLOSE-X.
013578*
013578*6320-9100-CLOSE-TEMP-STORAGE-X.
013578*    EXIT.
013578*
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
 
       COPY SCPP6320.
013578*
013578*COPY SCPPTSQ1.
      /
       COPY CCPS0187.
      /
       COPY CCPS5300.
      /
       COPY SCPS6370.
      /
       COPY SCPS6390.
      /
       COPY SCPS6720.
      /
011925*COPY XCPS5480.
011925 COPY CCPS5480.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
 
       COPY CCPL0187.
557701/
557701 COPY CCPS4770.
557701 COPY CCPL4770.
557701/
557701 COPY CCPS4780.
557701 COPY CCPL4780.
      /
       COPY CCPL5300.
      /
       COPY CCPL6090.
      /
       COPY CCPL6100.
      /
       COPY SCPS0410.
       COPY SCPL0410.
      /
       COPY SCPL6370.
      /
       COPY SCPL6390.
      /
       COPY SCPL6460.
      /
       COPY SCPL6480.
      /
       COPY SCPL6720.
      /
010312*COPY SCPLT1.
      /
011925*COPY XCPL5480.
011925 COPY CCPL5480.
      /
       COPY XCPL0260.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY SCPAFA.
       COPY SCPNFA.
       COPY SCPUFA.
      /
010312*COPY SCPXT1.
010312*COPY SCPNT1.
010312*COPY SCPAT1.
010312*COPY SCPOT1.
010312 COPY XCPATWRK.
010312 COPY XCPCTWRK.
010312 COPY XCPNTWRK.
010312 COPY XCPUTWRK.
010312 COPY XCPXTWRK.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRF6320                     **
      *****************************************************************
