      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSDU0002.


      *****************************************************************
      **  MEMBER :  XSDU0002                                         **
      **  REMARKS:  COMMON WORK AREA MANAGER PROGRAM.                **
      **            THIS MODULE PERSISTS DATA REQUIRED BY INGENIUM   **
      **            USING THE COMMON WORK AREA (CWA). REQUESTS ARE   **
      **            MADE TO THIS PROGRAM TO POPULATE THE GLOBAL AREA **
      **            FROM THE CWA.                                    **
      **                                                             **
      **  DOMAIN :  SY                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
DLTY25**  18NOV25   DLTY25 -  CHANGES DONE FOR CLOUD MIGRATION       **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0002'.

       COPY SQLCA.

      ****************************************************************
      *    PROGRAM'S VARIABLES                                       *
      ****************************************************************
       01  WS-ENQUEUE-IND                      PIC X(01).
           88  WS-ENQUEUE                      VALUE 'Y'.
           88  WS-ENQUEUE-NO                   VALUE 'N'.

      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      
       COPY XCWHCWA.
      
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      
       COPY XCWL0013.
       COPY XCWLBUFR.
      
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************

      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.

       COPY XCWL0002.

       COPY XCWWCWA.
      /
      ********************
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0002-PARM-INFO
                                WCWA-COMMON-WORK-AREA.
      ********************
      *--------------
       0000-MAINLINE.
      *--------------
      
           PERFORM  CWA-1000-LOCK-CWA
               THRU CWA-1000-LOCK-CWA-X.
      *
      * INITIALIZATION
      *
           INITIALIZE  L0002-OUTPUT-PARM-INFO.
           SET  L0002-RETRN-OK              TO TRUE.
      *
      * PROCESS REQUEST
      *
           PERFORM  0100-MAINLINE
               THRU 0100-MAINLINE-X.
      *
      * FINIALIZATION
      *
           PERFORM  CWA-2000-UNLOCK-CWA
               THRU CWA-2000-UNLOCK-CWA-X.
       
       0000-MAINLINE-X.
           GOBACK.
      /
      *-------------------
       0100-MAINLINE.
      *-------------------
      *
      * PROCESS REQUEST
      *
           EVALUATE TRUE

                WHEN L0002-RQST-BUILD-GLOB-INFO
                     PERFORM  1000-BUILD-GLOB-INFO
                         THRU 1000-BUILD-GLOB-INFO-X

                WHEN L0002-RQST-ESTB-GLOB-INFO
                     PERFORM  2000-ESTB-GLOB-INFO
                         THRU 2000-ESTB-GLOB-INFO-X

                WHEN L0002-RQST-RETRN-GLOB-INFO
                     PERFORM  3000-RETRN-GLOB-INFO
                         THRU 3000-RETRN-GLOB-INFO-X

                WHEN OTHER
                     SET  L0002-RETRN-INVALID-REQUEST 
                                            TO TRUE

           END-EVALUATE.

       0100-MAINLINE-X.
           EXIT.
      /
      *---------------------
       1000-BUILD-GLOB-INFO.
      *---------------------

           IF  NOT WCWA-SYS-CTL-INGENIUM
               PERFORM  2000-ESTB-GLOB-INFO
                   THRU 2000-ESTB-GLOB-INFO-X
           END-IF.

           MOVE WCWA-PFC-ENBL-IND           TO WGLOB-PFC-ENBL-IND.
           MOVE WCWA-PFC-SRVR-IP-ADDR-ID    TO 
                                 WGLOB-PFC-SRVR-IP-ADDR-ID.
           MOVE WCWA-PFC-SRVR-PORT-NUM      TO 
                                 WGLOB-PFC-SRVR-PORT-NUM.
           MOVE WCWA-PFC-CHAR-SET-CD        TO WGLOB-PFC-CHAR-SET-CD.
           MOVE WCWA-PFC-COMUN-STAT-CD      TO WGLOB-PFC-COMUN-STAT-CD.
      
           SET  WGLOB-PFC-DATA-UPDT-NO      TO TRUE.

           SET  WGLOB-PFC-BUFR-ADDR-PTR     TO 
                                   ADDRESS OF LBUFR-BUFFER-WORK-AREA.

       1000-BUILD-GLOB-INFO-X.
           EXIT.

      *---------------------
       2000-ESTB-GLOB-INFO.
      *---------------------

           INITIALIZE WCWA-APPL-1-INFO.
           SET  WCWA-PFC-ENBL-NO            TO TRUE.
           SET  WCWA-PFC-COMUN-STAT-NOT-STRT 
                                            TO TRUE.
      
           MOVE 'Y'                         TO WCWA-PFC-ENBL-IND.
           MOVE 20000                       TO WCWA-PFC-SRVR-PORT-NUM.
           MOVE 'A'                         TO WCWA-PFC-CHAR-SET-CD.
      
           IF  WCWA-PFC-ENBL
               CONTINUE
           ELSE
               SET  WCWA-SYS-CTL-INGENIUM   TO TRUE
               GO TO 2000-ESTB-GLOB-INFO-X
           END-IF.

           IF  WCWA-PFC-ENBL
               PERFORM  2200-ESTB-GLOB-INFO-PFC
                   THRU 2200-ESTB-GLOB-INFO-PFC-X
           END-IF.

       2000-ESTB-GLOB-INFO-X.
           EXIT.

      *------------------------
       2200-ESTB-GLOB-INFO-PFC.
      *------------------------
           
           MOVE WCWA-PFC-SRVR-IP-ADDR-ID    TO 
                                   WGLOB-PFC-SRVR-IP-ADDR-ID.
           MOVE WCWA-PFC-SRVR-PORT-NUM      TO 
                                   WGLOB-PFC-SRVR-PORT-NUM.
           MOVE WCWA-PFC-CHAR-SET-CD        TO WGLOB-PFC-CHAR-SET-CD.
      
           PERFORM  0013-0000-INIT-PARM-INFO
               THRU 0013-0000-INIT-PARM-INFO-X.
      
           PERFORM  0013-1000-BUILD-PARM-INFO
               THRU 0013-1000-BUILD-PARM-INFO-X.
      
DLTY25     MOVE 'azlapprdingjp01'           TO L0013-PFC-SRVR-NM.
           
           PERFORM  0013-2000-OBTN-IP-ADDR
               THRU 0013-2000-OBTN-IP-ADDR-X.
           
           IF  NOT L0013-RETRN-OK
               SET  L0002-RETRN-PFC-COMUN-ERROR   
                                            TO TRUE
               SET  WCWA-PFC-COMUN-STAT-CONN-PEND 
                                            TO TRUE
               SET  WCWA-SYS-CTL-INGENIUM   TO TRUE
               GO TO 2200-ESTB-GLOB-INFO-PFC-X
           END-IF.
      
           SET  WCWA-PFC-COMUN-STAT-CONN-ESTB 
                                            TO TRUE.
           MOVE L0013-PFC-SRVR-IP-ADDR-ID   TO 
                                  WCWA-PFC-SRVR-IP-ADDR-ID.
      
           SET  WCWA-SYS-CTL-INGENIUM       TO TRUE.
      
       2200-ESTB-GLOB-INFO-PFC-X.
           EXIT.
      /
      *---------------------
       3000-RETRN-GLOB-INFO.
      *---------------------

           INITIALIZE WCWA-SYS-CTL-ID.

           MOVE WGLOB-PFC-SRVR-IP-ADDR-ID   TO 
                                       WCWA-PFC-SRVR-IP-ADDR-ID.
           MOVE WGLOB-PFC-SRVR-PORT-NUM     TO WCWA-PFC-SRVR-PORT-NUM.
           MOVE WGLOB-PFC-CHAR-SET-CD       TO WCWA-PFC-CHAR-SET-CD.
           SET  WCWA-PFC-COMUN-STAT-CONN-ESTB 
                                            TO TRUE.

           SET  WCWA-SYS-CTL-INGENIUM       TO TRUE.

       3000-RETRN-GLOB-INFO-X.
           EXIT.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
       COPY XCCPCWA.
      ****************************************************************
      * COMMON COPYBOOKS                                             *
      ****************************************************************

      ****************************************************************
      * LINKING COPYBOOKS                                            *
      ****************************************************************
      
       COPY XCPS0013.
       COPY XCPL0013.
       COPY XCPL0260.
      
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************

      *****************************************************************
      *  ERROR HANDLING ROUTINES
      *****************************************************************
      *
       COPY XCPL0030.
      *
      *****************************************************************
      **                 END OF PROGRAM XSRU0002                     **
      *****************************************************************
