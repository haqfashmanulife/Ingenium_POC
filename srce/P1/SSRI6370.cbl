      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. SSRI6370.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  SSRI6370                                         **
      **  REMARKS:  INITIALIZATION AND TEMPORARY STORAGE QUEUE       **
      **            PROCESSING COMMON TO ALL SEGREGATED FUND FUNCTION**
      **            DRIVERS.                                         **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  ID                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  JT     CODE CLEANUP                               **
005409**  30OCT98  56     LEAP YEAR MODIFICATIONS                    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010312**  30OCT98  56     CHANGES FOR PARALLEL BATCH                 **
012141**  07MAY99  56V    PORTFOLIO EXPANSION                        **
013578**  15DEC99  60     REPLACE TSQ LOGIC                          **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
MP171F**  19JAN12  CTS	  LOGICAL RECORD LOCKING		     **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRI6370'.

       COPY SQLCA.

010312*COPY SCSWT1.

014590*COPY XCWL0030.

013578*COPY XCWWTSQP.
       COPY SCWW6370.
012141 COPY XCWWFNDM.

      ****************************************************************
      *  INPUT PARAMETER INFORMATION                                 *
      ****************************************************************



      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY XCWWWKDT.
      /
       COPY SCWWAGFA.

       COPY SCWWUALL.
      /
       COPY CCWWINDX.
      /
       COPY XCWTFCMD.
MP171F COPY CCWWLOCK.
MP171F COPY XCWL8090.
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
       COPY SCFWFX.
       COPY SCFRFX.
      /
       COPY SCFRFS.
010312*COPY SCSRT1.
013578*COPY SCWWTSQ1.
013578*COPY XCFRTWRK.
013578*COPY XCFWTWRK.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY SCWL0410.
      /
       COPY XCWLDTLK.
017150 COPY XCWL0289.       
       COPY XCWL1660.
005409 COPY XCWL1670.
005409 COPY XCWL1680.
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6370.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING    WGLOB-GLOBAL-AREA
                                    L6370-PARM-INFO
                                    LSEGF-PARM-INFO
                                    LPGA-PARM-INFO
                                    RPOL-REC-INFO
                                    WCVGS-WORK-AREA.

      *--------------
       0000-MAINLINE.
      *--------------


           PERFORM  6370-0000-MAINLINE
               THRU 6370-0000-MAINLINE-X.



       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
013578*COPY SCPPTSQ1.

       COPY SCPP6370.
      /
       COPY SCPPFACC.
      /
       COPY SCPPAGFA.
      /
       COPY SCPPSUBU.
      /
      ****************************************************************
      *  THE FOLLOWING PARAGRAPHS ARE HARD-CODED.                    *
      ****************************************************************

      *---------------------------
013578*6370-9000-OPEN-TEMP-STORAGE.
      *---------------------------

010312*    PERFORM  TWRK-2000-OPEN-IO
010312*        THRU TWRK-2000-OPEN-IO-X.

013578*6370-9000-OPEN-TEMP-STORAGE-X.
013578*    EXIT.
      /
      *-----------------------------
013578*6370-9100-CLOSE-TEMP-STORAGE.
      *-----------------------------

010312*    PERFORM  TWRK-4000-CLOSE
010312*        THRU TWRK-4000-CLOSE-X.

013578*6370-9100-CLOSE-TEMP-STORAGE-X.
013578*    EXIT.

      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************

       COPY SCPS0410.
       COPY SCPL0410.
      /
       COPY XCPL0260.
      /
017150 COPY XCPL0289.      
       COPY XCPL1660.
005409 COPY XCPL1680.

010312*COPY SCPLT1.
      /
MP171F COPY XCPS8090.
MP171F COPY XCPL8090.
      / 
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY SCPAFA.
       COPY SCPBFA.
       COPY SCPCFA.
       COPY SCPNFA.
       COPY SCPUFA.
013578 COPY SCPVFA.
      *
010312*COPY SCPAT1.
010312*COPY SCPNT1.
010312*COPY SCPOT1.
010312*COPY SCPXT1.
013578*COPY XCPATWRK.
013578*COPY XCPCTWRK.
013578*COPY XCPNTWRK.
013578*COPY XCPUTWRK.
013578*COPY XCPXTWRK.
      /
       COPY SCPAFAAG.
       COPY SCPBFAAG.
       COPY SCPCFAAG.
       COPY SCPUFAAG.
       COPY SCPXFAAG.
      /
       COPY SCPBFD.
       COPY SCPCFD.
       COPY SCPNFD.
       COPY SCPUFD.
      /
       COPY SCPNFX.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM SSRI6370                     **
      *****************************************************************
