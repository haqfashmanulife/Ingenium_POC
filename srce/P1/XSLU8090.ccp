      *************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. XSLU8090.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSLU8090                                         **
      **  REMARKS:  TWRK ACCESS MODULE FOR STORING AND RETRIEVING    **
      **            DATA AND STATE INFORMATION BETWEEN INVOCATION    **
      **            OF BUSINESS FUNCTIONS                            **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
014597** 15DEC99    60    NEW                                        **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
MP171F**  19JAN12  CTS	  LOGICAL RECORD LOCKING		     **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      **********************
       CONFIGURATION SECTION.
      **********************
      /
      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU8090'.
       COPY SQLCA.
       COPY XCWLPTR.
014590*COPY XCWL0030.

       COPY XCFRTWRK.
       COPY XCFWTWRK.
      /
MP171F COPY CCWWLOCK.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL8090.
      /
       PROCEDURE DIVISION.

      *--------------
       0000-MAINLINE.
      *--------------

           SET ADDRESS OF L8090-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).

           PERFORM  8090-0000-MAINLINE
               THRU 8090-0000-MAINLINE-x.

       COPY XCCPRETN.

       0000-MAINLINE-X.
           GOBACK.

      /

       COPY XCPP8090.
      /  
      ****************************************************************
      * I/O ROUTINES                                                 *
      ****************************************************************
       COPY XCPATWRK.
       COPY XCPFTWRK.
       COPY XCPGTWRK.
       COPY XCPNTWRK.
       COPY XCPXTWRK.

      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************

       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSLU8090                     **
      *****************************************************************
