      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. SSRC6680.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  SSRC6680                                         **
      **  REMARKS:  THIS MODULE PERFORMS ROUTINES TO SUPPORT         **
      **            SEGREGATED FUND TRANSFERS, INCLUDING FORMATING   **
      **            OF FA AND FD RECORDS FOR THE SOURCE FUNDS AND    **
      **            THE TARGET FUNDS.  ANY FEES ASSOCIATED WITH THE  **
      **            TRANSFER WILL ALSO BE CALCULATED HERE.           **
      **                                                             **
      **  DOMAIN :  CV                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
557701**  30SEP97  CMM    UNDO/REDO FOR SEGFUNDS                     **
008455**  31MAR98  552    EXTENSIVE NUMERIC FORMATTING               **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012137**  07MAY99  56V    SEC CONFIRMS                               **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
MFFFU6**  03OCT05  KNM    FUND TRANSFER MODIFICATIONS                **
MFFCOM**  03OCT05  RNL    SA COMMISSIONS                             **
5-0391**  03OCT05  AC     ADDED FC COPYBOOKS                         **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRC6680'.
 
       COPY SQLCA.
      /
014590*COPY XCWL0030.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
       COPY XCWWWKDT.
       COPY CCWWINDX.
       COPY SCWW6680.
       COPY SCWWAGFA.
       COPY SCWWSETA.
      /
      *****************************************************************
      * I/O COPYBOOKS                                                 *
      *****************************************************************
      /
       COPY CCFRPH.
       COPY CCFWPH.
      /
       COPY SCFRFC.
5-0391 COPY SCFWFC.
      /
       COPY SCFRFA.
MFFFU6 COPY SCFWFA.       
      /
       COPY SCFRFD.
      /
       COPY SCFRFH.
       COPY SCFWFH.
      /
       COPY SCFRFX.
       COPY SCFWFX.
      /
      *****************************************************************
      * CALLED MODULE PARAMETER INFORMATION                           *
      *****************************************************************
      /
       COPY CCWL0186.
      /
       COPY CCWL5510.
      /
012137 COPY CCWL3120.
      /
MFFCOM COPY SCWL7020.
MFFCOM/
017150 COPY XCWL0289.
      /
008455 COPY XCWL0290.
      /
      *****************
       LINKAGE SECTION.
      *****************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWL6680.
       COPY SCWLSEGF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /
      ********************
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
                                 L6680-PARM-INFO
                                 LSEGF-PARM-INFO
                                 LPGA-PARM-INFO
                                 RPOL-REC-INFO
                                 WCVGS-WORK-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  6680-0000-MAINLINE
               THRU 6680-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY SCPP6680.
      /
       COPY CCPPMIDT.
       COPY CCPPPLIN.
      /
       COPY SCPPSETA.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
      /
       COPY CCPS0186.
       COPY CCPL0186.
      /
       COPY CCPS5510.
       COPY CCPL5510.
      /
012137 COPY CCPS3120.
012137 COPY CCPL3120.
      /
MFFCOM COPY SCPS7020.
MFFCOM COPY SCPL7020.
MFFCOM/
       COPY XCPL0260.
      /
017150 COPY XCPL0289.
      /
008455 COPY XCPL0290.
008455 COPY XCPS0290.
      /
      ****************************************************************
      *    FILE I/O PROCESS MODULES                                  *
      ****************************************************************
      /
       COPY SCPNFH.
      /
       COPY SCPNFX.
      /
       COPY CCPNPH.
      /
MFFFU6 COPY SCPBFA.       
      /
5-0391 COPY SCPBFC.       
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM SSRC6680                     **
      *****************************************************************
