      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRF6350.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRF6350                                         **
      **  REMARKS:  SEGREGATED FUND TRANSFER/TRANSFER REVERSAL VERIFY**
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
557660**  30SEP97  JMG    CODE CLEANUP                               **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
016109**  30JUN00  602J   FREE FUND TRANSFER PROVISION               **
MFFFU6**  03OCT05  KNM    FUND TRANSFER MODIFICATIONS                **
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
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRF6350'.
      *
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
 
      *********************************************************
      *   COMMON COPYBOOKS
      *********************************************************
 
       COPY XCWTFCMD.
 
       COPY SCWW6350.
      /
       COPY CCWWINDX.
013578*
013578*COPY XCWWTSQP.
013578*
013578*  THE FOLLOWING FILLER IS REQUIRED FOR TSQ DATA AREA FOR TSQ
013578*  DELETE AND SHOULDN'T BE REMOVED
013578*
013578*10  FILLER                      PIC X(01).
      /
      **********************************************************
      * I/O COPYBOOKS
      **********************************************************
MFFFU6/
MFFFU6 COPY CCFRPH.
MFFFU6 COPY CCFWPH.
      /
016109 COPY SCFRFA.
      /
       COPY SCFRFC.
 
010312*COPY SCSRT1.
010312*COPY SCSWT1.
013578*COPY SCWWTSQ1.
010312 COPY XCFRTWRK.
010312 COPY XCFWTWRK.
      /
      **********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      **********************************************************
 
       COPY CCWL4770.
      /
       COPY CCWL4780.
      /
       COPY SCWL0410.
      /
       COPY SCWL6370.
      /
       COPY SCWL6680.
      /
       COPY SCWL6720.
      /
       COPY SCWL6730.
      /
       COPY SCWL6840.
      /
016109 COPY SCWL7860.
      /
016109 COPY XCWL0290.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6350.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L6350-PARM-INFO
                                    LSEGF-PARM-INFO
                                    LPGA-PARM-INFO
                                    RPOL-REC-INFO
                                    WCVGS-WORK-AREA.
 
      *---------------
       0000-MAINLINE.
      *---------------
 
           PERFORM 6350-0000-MAINLINE
              THRU 6350-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
013578****************************************************************
557660*  THE FOLLOWING PARAGRAPHS ARE HARD-CODED SINCE BATCH MUST BE *
013578*  DIFFERENT FROM ON-LINE.                                     *
013578****************************************************************
013578*
013578*---------------------------
013578*6350-9000-OPEN-TEMP-STORAGE.
013578*---------------------------
013578*
010312*    PERFORM  T1-2000-OPEN-IO
010312*        THRU T1-2000-OPEN-IO-X.
013578*
013578*6350-9000-OPEN-TEMP-STORAGE-X.
013578*    EXIT.
013578*
013578*-----------------------------
013578*6350-9100-CLOSE-TEMP-STORAGE.
013578*-----------------------------
013578*
010312*    PERFORM  T1-4000-CLOSE
010312*        THRU T1-4000-CLOSE-X.
013578*
013578*6350-9100-CLOSE-TEMP-STORAGE-X.
013578*    EXIT.
      /
      ***********************************************************
      *    PROCESSING COPYBOOKS
      ***********************************************************
 
       COPY SCPP6350.
013578*
013578*COPY SCPPTSQ1.
      /
      ***********************************************************
      *    LINKAGE PROCESSING COPYBOOKS
      ***********************************************************
 
       COPY CCPS4770.
       COPY CCPL4770.
      /
       COPY CCPS4780.
       COPY CCPL4780.
      /
010312*COPY SCPLT1.
      /
       COPY SCPS0410.
       COPY SCPL0410.
      /
       COPY SCPS6370.
       COPY SCPL6370.
      /
       COPY SCPS6680.
       COPY SCPL6680.
      /
       COPY SCPS6720.
       COPY SCPL6720.
      /
       COPY SCPL6730.
      /
       COPY SCPL6840.
      /
016109 COPY SCPL7860.
      /
       COPY XCPL0260.
      /
016109 COPY XCPL0290.
016109 COPY XCPS0290.
      /
      ***********************************************************
      *    FILE I/O PROCESS MODULES
      ***********************************************************

MFFFU6 COPY CCPNPH. 
010312*COPY SCPAT1.
010312*COPY SCPNT1.
010312*COPY SCPOT1.
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
      **                 END OF PROGRAM SSRF6350                     **
      *****************************************************************
