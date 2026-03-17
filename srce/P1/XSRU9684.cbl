      *****************************************************************
      **  MEMBER :  XSRU9684                                         **
      **  REMARKS:  THIS MODULE IS USED TO ENCRYPT AN INPUT STRING   **
      **            OF CHARACTERS INTO AN OUTPUT STRING OF THE SAME  **
      **            NUMBER OF CHARACTERS.                            **
      **                                                             **
      **            THERE IS 1 VARIABLE PASSED IN:                   **
      **            - THE INPUT STRING OF CHARACTERS                 **
      **                                                             **
      **  DOMAIN :  GL                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
02MI01**  30JUN02  MAW    INITIAL CODING                             **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU9684.
 
       COPY XCWWCRHT.
 
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       CONFIGURATION SECTION.
      /
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU9684'.
 
       COPY SQLCA.
      /
      *****************************************************************
      *        COMMON COPYBOOKS
      *****************************************************************

       COPY XCWWWKDT.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWLDTLK.
       COPY XCWW9684.
      /
      *****************************************************************
      *        I/O COPYBOOKS
      *****************************************************************
 
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL9684.
      /
      ********************
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L9684-PARM-INFO.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  9684-0000-MAINLINE
               THRU 9684-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************
 
       COPY XCPP9684.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS
      *****************************************************************
       COPY XCPL0260.
       COPY XCPL1680.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSRU9684                     **
      *****************************************************************
