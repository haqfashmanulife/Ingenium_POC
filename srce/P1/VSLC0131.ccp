      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. VSLC0131.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  VSLC0131                                         **
      **  REMARKS:  PERFORM VALUATION SELECTED BLOCK EDITS           **
      **                                                             **
      **            THIS MODULE IS CALLED TO PERFORM EDITS AND CROSS **
      **            EDITS ON VALUATION SELECTED BLOCK OF BUSINESS    **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  31DEC96  JMG    MODIFICATIONS FOR MAINTAINABILITY          **
010692**  31MAR98  552    EDIT L0131-VAL-LABL AGAINST VL TABLE       **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
013578**  15DEC99  60     REMOVE COPYBOOK CCWCCOMM                   **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'VSLC0131'.

       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.

       COPY CCFRPH.
       COPY CCFWPH.
007766*COPY VCFRVS.
010692 COPY VCFWVL.
010692 COPY VCFRVL.
      /
       COPY XCWEBLCH.
      /
       COPY CCFWEDIT.
       COPY CCFREDIT.
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  DFHCOMMAREA.
           02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY VCWL0131.
007766*COPY VCWD0131.
007766 COPY VCFRVS.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
007766     SET ADDRESS OF L0131-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
007766     SET ADDRESS OF RVS-REC-INFO       TO WGLOB-PARM-ADDR-PTR (2).
 
           PERFORM  0131-0000-MAINLINE
               THRU 0131-0000-MAINLINE-X.
 
 
       COPY XCCPRETN.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
       COPY VCPP0131.
      /
       COPY CCPEPLAN.
      /
       COPY CCPESTB1.
      /
       COPY CCPESTB2.
      /
       COPY VCPEVSBK.
      /
       COPY VCPEVLBL.
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
       COPY XCCL0260.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY CCPNEDIT.
      /
       COPY CCPNPH.
      /
       COPY CCPCPH.
      /
010692 COPY VCPNVL.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
 
       COPY XCCP0030.
 
      *****************************************************************
      **                 END OF PROGRAM VSLC0131                     **
      *****************************************************************
