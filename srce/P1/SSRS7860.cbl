      *****************************************************************
      **  MEMBER :  SSRS7860                                         **
      **  REMARKS:  CALCULATES THE MAXIMUM FREE TRANSFER AMOUNT      **
      **            ON A POLICY.  THE CALCULATION USED IS DETERMINED **
      **            FROM POLICY INDICATORS, PERCENTAGES FROM THE     **
      **            RATE HEADER AND THE CALCULATED CASH VALUES OR    **
      **            PREMIUMS/DEPOSITS PAID.                          **
      **                                                             **
      **  DOMAIN :  PO                                               **
      **  CLASS  :  SFD                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
016109**  30JUN00  602J   FREE FUND TRANSFER PROVISION               **
017150**  09FEB01  612J   CURRENCY SCALING                           **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRS7860.
 
       COPY XCWWCRHT.
 
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      /
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRS7860'.
 
       COPY SQLCA.
      /
      *****************************************************************
      *  COMMON COPYBOOKS
      *****************************************************************
       COPY SCWW7860.
       COPY CCWWINDX.
       COPY XCWWWKDT.
      /
      *****************************************************************
      *  I/O COPYBOOKS
      *****************************************************************
       COPY CCFWPH.
       COPY CCFRPH.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION
      *****************************************************************
       COPY CCWL6080.
       COPY CCWL0186.
       COPY CCWL0144.
       COPY CCWL0182.
017150 COPY XCWL0289.
      /
      *****************************************************************
      *  INPUT PARAMETER INFORMATION
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY SCWL7860.
 
       COPY CCWLPGA.
 
       COPY CCFRPOL.
 
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L7860-PARM-INFO
                                LPGA-PARM-INFO
                                RPOL-REC-INFO
                                WCVGS-WORK-AREA.
      ********************
 
      *-------------------
       0000-MAINLINE.
      *-------------------
 
           PERFORM  7860-0000-MAINLINE
               THRU 7860-0000-MAINLINE-X.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************
       COPY SCPP7860.
       COPY CCPPPLIN.
       COPY CCPPMIDT.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS
      *****************************************************************
       COPY CCPS0186.
       COPY CCPL0186.
      /
       COPY CCPS0144.
       COPY CCPL0144.
      /
       COPY CCPS0182.
       COPY CCPL0182.
      /
       COPY XCPL0260.
      /
017150 COPY XCPL0289.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY CCPNPH.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM SSRS7860                     **
      *****************************************************************
