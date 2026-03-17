      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSLU9684.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSLU9684                                         **
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
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU9684'.
 
       COPY SQLCA.
       COPY XCWLPTR.
 
 
 
      *****************************************************************
      *  COMMON COPYBOOKS
      *****************************************************************
       COPY XCWWWKDT.
       COPY XCWW9684.
      /
      *****************************************************************
      *  I/O COPYBOOKS
      *****************************************************************
       
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION
      *****************************************************************
       COPY XCWLDTLK.
       COPY XCWL1670.
       COPY XCWL1680.
      /
      *****************************************************************
      *  INPUT PARAMETER INFORMATION
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************
        01  DFHCOMMAREA.
          02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL9684.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET ADDRESS OF L9684-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
 
           PERFORM  9684-0000-MAINLINE
               THRU 9684-0000-MAINLINE-X.
 
 
       COPY XCCPRETN.
 
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
       COPY XCPL1680.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       
      /
       COPY XCCL0260.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCCP0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSLU9684                     **
      *****************************************************************
