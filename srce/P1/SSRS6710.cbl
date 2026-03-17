      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    SSRS6710.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  SSRS6710                                         **
      **  REMARKS:  VERIFY SEGREGATED FUND SURRENDERS                **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  JPC    MODIFICATIONS FOR MAINTAINABILITY          **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
557788**  30SEP97  MS     POLICY TABLE SPLIT                         **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
005409**  30OCT98  56     MODIFICATIONS FOR LEAP YEAR                **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
LOC005**  31MAR00  601    EFT SUPPORT                                **
MFFFU7**  03OCT05  AC     ADDED FIRM BANKING COPYBOOKS               **
MP171F**  19JAN12  CTS	  LOGICAL RECORD LOCKING		     **
27549A**  15DEC23  CTS    CHANGES DONE AS PART OF CDAP PROJ          **
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS6710'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      *
       COPY CCWWBTAX.
      /
       COPY CCWWINDX.
      /
       COPY SCWW6710.
      /
       COPY XCWWWKDT.
      /
MP171F COPY CCWWLOCK.
MP171F COPY XCWL8090.
MP171F COPY XCWW0260.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
      /
       COPY SCFRFA.
       COPY SCFWFA.
      /
       COPY SCFWFACO.
      /
       COPY SCFRFC.
      /
      ****************************************************************
      *  INPUT PARAMETER INFORMATION                                 *
      ****************************************************************

      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************

MFFFU7 COPY CCWL9966.
      /
       COPY CCWLACCT.
      /
       COPY CCWL0185.
      /
       COPY CCWL2100.
      /
LOC005 COPY CCWL2195.
557701/
557701 COPY CCWL2404.
557788/
557788 COPY CCWL2470.
      /
       COPY CCWL6290.
      /
       COPY SCWL0450.
      /
       COPY SCWL6370.
      /
       COPY SCWL6600.
      /
       COPY SCWL6650.
      /
       COPY SCWL6700.
      /
       COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWLDTLK.
005409 COPY XCWL1680.
27549A COPY CCWL9D90.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6710.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L6710-PARM-INFO
                                  LSEGF-PARM-INFO
                                  LPGA-PARM-INFO
                                  RPOL-REC-INFO
                                  WCVGS-WORK-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
 
           PERFORM  6710-0000-MAINLINE
               THRU 6710-0000-MAINLINE-X.
 
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
 
       COPY SCPP6710.
      /
       COPY CCPSACCT.
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************

MFFFU7 COPY CCPL9966.
MFFFU7 COPY CCPS9966.
      /
       COPY CCPS0185.
       COPY CCPL0185.
      /
       COPY CCPS2100.
       COPY CCPL2100.
      /
LOC005 COPY CCPS2195.
LOC005 COPY CCPL2195.
      /
557701 COPY CCPS2404.
557701 COPY CCPL2404.
557788/
557788 COPY CCPS2470.
557788 COPY CCPL2470.
      /
       COPY CCPS6290.
       COPY CCPL6290.
      /
       COPY SCPS0450.
       COPY SCPL0450.
      /
       COPY SCPS6370.
       COPY SCPL6370.
      /
       COPY SCPS6600.
       COPY SCPL6600.
      /
       COPY SCPS6650.
       COPY SCPL6650.
      /
       COPY SCPS6700.
       COPY SCPL6700.
      /
       COPY XCPL1660.
005409 COPY XCPL1680.
      /
MP171F COPY XCPS8090.
MP171F COPY XCPL8090.
      /
27549A COPY CCPS9D90.
27549A COPY CCPL9D90.
27549A/
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
       COPY SCPAFA.
       COPY SCPCFA.
       COPY SCPNFA.
       COPY SCPXFA.
       COPY SCPUFA.
      /
       COPY SCPGFACO.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
 
       COPY XCPL0030.
MP171F COPY XCPL0260.
 
      ****************************************************************
      **                 END OF PROGRAM SSRS6710                     *
      ****************************************************************
