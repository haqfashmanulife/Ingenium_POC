      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU0800.
 
       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  XSRU0800                                         **
      **  REMARKS:  CHECKPOINT/RESTART PROCESSING UTILITIES          **
      **                                                             **
      **            THIS MODULE PROVIDES FUNCTIONS FOR CHECKPOINT    **
      **            PROCESSING INITIALIZATION, COMMIT CHECKPOINT AND **
      **            FINISH CHECKPOINT FOR BATCH PROGRAMS.            **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
007684**  30OCT98  56     CHECKPOINT / RESTART                       **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
      *---------------------
       ENVIRONMENT DIVISION.
      *---------------------
 
      *--------------
       DATA DIVISION.
      *--------------
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU0800'.
 
       COPY SQLCA.
      /
       COPY XCWW0800.
      /
       COPY XCFRCKPT.
       COPY XCFWCKPT.
      /
014590*COPY XCWL0030.
       COPY XCWL0035.
      /
      *----------------
       LINKAGE SECTION.
      *----------------
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0800.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0800-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  0800-0000-MAINLINE
               THRU 0800-0000-MAINLINE-X.
 
       0000-MAINLINE-X.
           GOBACK.
 
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
 
       COPY XCPP0800.
      /
      ****************************************************************
      * MESSAGE PROCESSING COPYBOOKS                                 *
      ****************************************************************
 
       COPY XCPL0260.
      /
      ****************************************************************
      *  FILE I/O PROCESS MODULES                                    *
      ****************************************************************
      /
       COPY XCPUCKPT.
       COPY XCPNCKPT.
      /
       COPY XCPL0030.
       COPY XCPL0035.
 
      *****************************************************************
      **                 END OF PROGRAM XSRU0800                     **
      *****************************************************************
