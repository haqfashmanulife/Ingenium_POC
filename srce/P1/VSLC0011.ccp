      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. VSLC0011.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  VSLC0011                                         **
      **  REMARKS:  PERFORM VALUATION LABEL FIELD EDITS              **
      **                                                             **
      **            THIS MODULE IS CALLED TO PERFORM EDITS AND CROSS **
      **            EDITS ON VALUATION LABEL FIELDS.                 **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :  CIW                                              **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
54-001**  01SEP96  MIG    MODIFICATIONS FOR MAINTAINABILITY          **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'VSLC0011'.

      /
       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.

       COPY VCWW0011.

007766*COPY VCFRVL.
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
007766 COPY VCWL0011.
007766*COPY VCWD0011.
007766 COPY VCFRVL.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
007766     SET ADDRESS OF L0011-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
007766     SET ADDRESS OF RVL-REC-INFO       TO WGLOB-PARM-ADDR-PTR (2).
 
           PERFORM  0011-0000-MAINLINE
               THRU 0011-0000-MAINLINE-X.
 
 
       COPY XCCPRETN.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
      /
       COPY VCPP0011.
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
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
 
       COPY XCCP0030.
 
      *****************************************************************
      **                 END OF PROGRAM VSLC0011                     **
      *****************************************************************
