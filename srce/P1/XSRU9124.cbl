      *****************************************************************
      **  MEMBER :  XSRU9124                                         **
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
01AD05**  01AUG01  BMB    ADDED POSTAL CODE EDIT ROUTINE             **
P00974**  09MAY05  RZ     ENHANCE FOR ABOLISHED ADDRESS CODE         **
C12393**  24JAN12  CTS    CHANGES FOR UPDATING THE TCLIU TABLE       **
C12393**                  IF ADDRESS CONTENTS ARE CHANGED            **
MP310F**  13JUN18  CTS    CHANGES DONE FOR MULTIPLE BATCHES          **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSRU9124.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU9124'.

       COPY SQLCA.

      /
      *****************************************************************
      *        COMMON COPYBOOKS
      *****************************************************************

       COPY XCWW9124.
      /
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWLDTLK.
P00974 COPY XCWWWKDT.
01AD05 COPY CCWEPSTL.
MP310F COPY CCWWLOCK.
MP310F COPY XCWL8090.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
01AD05 COPY XCWL0280.
      /
      *****************************************************************
      *        I/O COPYBOOKS
      *****************************************************************

       COPY CCFWADCD.
       COPY CCFRADCD.
      /
P00974 COPY CCFWCLIA.
P00974 COPY CCFRCLIA.
C12393 COPY CCFHCLIA.
C12393 COPY CCFWCLIZ.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.

       COPY XCWL9124.
      /
      ********************
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L9124-PARM-INFO.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  9124-0000-MAINLINE
               THRU 9124-0000-MAINLINE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPP9124.
      /
01AD05 COPY CCPEPSTL.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCPL0260.
       COPY XCPL1680.
01AD05 COPY XCPL0280.
MP310F COPY XCPS8090.
MP310F COPY XCPL8090.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
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
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM XSRU9124                     **
      *****************************************************************
