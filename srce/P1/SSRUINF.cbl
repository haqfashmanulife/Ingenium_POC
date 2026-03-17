      *****************************************************************
      **  MEMBER :  SSRUINF                                          **
      **  REMARKS:  THIS MODULE IS USED TO CALCULATE THE             **
      **            INSURANCE FEE FOR THE TVI PRODUCTS               **
      **  DOMAIN :  CL                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
TVI006**  02AUG12  CTS    INITIAL CODING                             **
TVI15B**  10SEP12  CTS    CHANGES FOR FA REDUCTION                   **
TVI18R**  28DEC12  CTS    CHANGES FOR REINSTATEMENT                  **
Q28865**  13FEB13  CTS    TVI - CHANGES FOR SURRENDER PROCESS AFTER  **
Q28865**                  GRACE PERIOD END DATE                      **
NVCP02**  30JUN25  CTS    CHANGES FOR ONTARIO INSURANCE FEE CALC     **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. SSRUINF.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'SSRUINF'.

       COPY SQLCA.
      /

      *****************************************************************
      *        COMMON COPYBOOKS
      *****************************************************************

       COPY SCWWINF.
      /
       COPY CCWWINDX.
      /
TVI15B COPY CCWWFRMT.
TVI15B/
       COPY XCWWWKDT.
      /
      *****************************************************************
      *        I/O COPYBOOKS
      *****************************************************************
      /
       COPY CCFWPOL.
      /
       COPY CCFWPH.
       COPY CCFHPH.
       COPY CCFRPH. 
       COPY CCFWPHS3. 
       COPY CCFRPHST.
      / 
TVI18R COPY CCFWREIN.
TVI18R COPY CCFRREIN.
TVI18R/
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY XCWL1680.
      /
       COPY XCWL1670.
      /      
       COPY SCWL0500.
      /
       COPY SCWL0410.
      /
       COPY CCWL0186.
      /
Q28865 COPY CCWL9C70.
Q28865/ 
       COPY SCWLSEGF.
      /
       COPY XCWLDTLK.
       COPY XCWL0280.
       COPY XCWL0289.
NVCP02 COPY CCWL9D95. 
      /   
       LINKAGE SECTION.
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY SCWLINF.
       COPY CCWLPGA.
       COPY CCFRPOL.
       COPY CCWWCVGS.
      /      
      ********************
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                LINF-PARM-INFO
                                LPGA-PARM-INFO
                                RPOL-REC-INFO
                                WCVGS-WORK-AREA.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  INF-0000-MAINLINE
               THRU INF-0000-MAINLINE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************
       COPY SCPPINF.
      /
       COPY CCPPMIDT.
      /      
       COPY CCPPPLIN.
      /      
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS
      *****************************************************************
       COPY XCPL1680.
      /
       COPY SCPS0410.
       COPY SCPL0410.
      /
       COPY SCPL0500.
      /
       COPY XCPL0260.
      /
       COPY CCPS0186.
       COPY CCPL0186.
      /
Q28865 COPY CCPS9C70.
Q28865 COPY CCPL9C70.
Q28865/       
       COPY XCPL0280.
       COPY XCPL0289.
      /
NVCP02 COPY CCPL9D95.
NVCP02 COPY CCPS9D95.
      / 
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
      /
       COPY CCPNPH.
       COPY CCPVPHS3.
      / 
TVI18R COPY CCPBREIN.
      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM SSRUINF                      **
      *****************************************************************
