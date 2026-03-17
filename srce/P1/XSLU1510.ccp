      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSLU1510.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSLU1510                                         **
      **  REMARKS:  VALIDATE INFORMATION FOR A SPECIFIC USER         **
      **            SECURITY CLASS.                                  **
      **                                                             **
      **  DOMAIN : SY                                                **
      **  CLASS  : UT                                                **
      *****************************************************************
      **  DATE    AUTHOR   DESCRIPTION                               **
      **                                                             **
54-001**  01SEP96  DPC    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012624**  15DEC99  60     SECURITY                                   **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU1510'.


       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.

      *****************************************************************
      * COMMON COPYBOOKS
      *****************************************************************

       COPY XCWWWKDT.
      /
      *****************************************************************
      * I/O COPYBOOKS
      *****************************************************************

       COPY XCFWUSCL.
       COPY XCFRUSCL.
      /
      *****************************************************************
      * INPUT PARAMETER
      *****************************************************************

      /
      *****************************************************************
      * CALLED MODULE PARAMETER INFORMATION
      *****************************************************************

012624*COPY XCWL0280.
      /
      ****************
       LINKAGE SECTION.
      ****************

       01  DFHCOMMAREA.
           03  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY XCWL1510.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *---------------
       0000-MAINLINE.
      *--------------

      ***  MOVE ANY DATA PASSED INTO THIS PROGRAM VIA THE
      ***  LPSA-IO-AREA        TO THE SPECIFIC PARAMETER AREA IN
      ***  WORKING STORAGE.

007766     SET ADDRESS OF L1510-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).

      ***  PROCESS THE MAINLINE.
           PERFORM  1510-0000-MAINLINE
               THRU 1510-0000-MAINLINE-X.

      ***  MOVE ANY DATA PASSED INTO THIS PROGRAM VIA THE
      ***  LPSA-IO-AREA        BACK TO THE LPSA-IO-AREA
      ***  FROM THE WORKING STORAGE AREA.


      ***  RETURN TO THE ORIGINAL PROGRAM

       COPY XCCPRETN.

       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************************************
      * PROCESSING COPYBOOKS
      *****************************************************************

       COPY XCPP1510.

      /
      *****************************************************************
      * LINKAGE PROCESSING COPYBOOKS
      *****************************************************************

012624*COPY XCPL0280.
      /
      ****************************************************************
      * FILE I/O PROCESSING ROUTINES
      ****************************************************************

       COPY XCPNUSCL.

      /
      *****************************************************************
      * ERROR HANDLING ROUTINES
      *****************************************************************

       COPY XCCP0030.
      *****************************************************************
      **                 END OF PROGRAM XSLU1510                     **
      *****************************************************************
