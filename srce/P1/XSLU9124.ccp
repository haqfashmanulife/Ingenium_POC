      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSLU9124.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSLU9124                                         **
      **  REMARKS:  THIS MODULE IS USED TO OBTAIN JAPANESE ADDRESS   **
      **            DETAILS INFORMATION FOR A SPECIFIED CODE. IF THE **
      **            ADDRESS CODE RECORD DOES NOT EXIST YET,          **
      **            THEN THE DEFAULT (INITIALIZED) VALUES ARE        **
      **            RETURNED WITHOUT AN ERROR.                       **
      **            ALSO, WHEN UPDATING, IF THE RECORD DOES NOT EXIST**
      **            YET, THEN A NEW ROW WILL BE INSERTED.            **
      **  DOMAIN :  CL                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
01AD05**  01AUG01  BMB    INITIAL CREATION FOR JAPANESE PROCESSING   **
P00974**  09MAY05  RZ     ENHANCE FOR ABOLISHED ADDRESS CODE         **
C12393**  24JAN12  CTS    CHANGES FOR UPDATING THE TCLIU TABLE       **
C12393**                  IF ADDRESS CONTENTS ARE CHANGED            **
MP310F**  13JUN18  CTS    CHANGES DONE FOR MULTIPLE BATCHES          **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU9124'.
 
       COPY SQLCA.
       COPY XCWLPTR.
 
      /
 

      *****************************************************************
      *  COMMON COPYBOOKS
      *****************************************************************
 
       COPY XCWW9124.
P00974 COPY XCWWWKDT.
      /
01AD05 COPY CCWEPSTL.
      /
MP310F COPY CCWWLOCK.
MP310F COPY XCWL8090.  
      *****************************************************************
      *  I/O COPYBOOKS
      *****************************************************************
       COPY CCFRADCD.
       COPY CCFWADCD.
      /
P00974 COPY CCFWCLIA.
P00974 COPY CCFRCLIA.
C12393 COPY CCFHCLIA.
C12393 COPY CCFWCLIZ.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION
      *****************************************************************
       COPY XCWLDTLK.
       COPY XCWL1670.
       COPY XCWL1680.
01AD05 COPY XCWL0280.
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
       COPY XCWL9124.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET ADDRESS OF L9124-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
 
           PERFORM  9124-0000-MAINLINE
               THRU 9124-0000-MAINLINE-X.
 
 
       COPY XCCPRETN.
 
       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************
       COPY XCPP9124.
      /
01AD05 COPY CCPEPSTL.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS
      *****************************************************************
       COPY XCCL0260.
       COPY XCPL1680.
01AD05 COPY XCPL0280.
MP310F COPY XCPS8090.
MP310F COPY XCCL8090.   
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY CCPAADCD.
       COPY CCPCADCD.
       COPY CCPNADCD.
       COPY CCPUADCD.
       COPY CCPXADCD.
      /
P00974 COPY CCPCCLIA.
P00974 COPY CCPUCLIA.
C12393*P00974 COPY CCPTCLIA.
C12393 COPY CCPACLIA.
C12393 COPY CCPNCLIA.
C12393 COPY CCPBCLIZ.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCCP0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSLU9124                     **
      *****************************************************************
