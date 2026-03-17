      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSDU0013.

      *****************************************************************
      **  MEMBER :  XSDU0013                                         **
      **  REMARKS:  PATHFINDER CONNECTOR COMMUNICATION PROGRAM.      **
      **            THIS IMPLEMENTATION OF THE PX COMMUNICATION USES **
      **            IBM'S MVS TCP/IP CICS SOCKET INTERFACE.          **
      **            IT SERVICES REQUESTS TO ESTABLISH COMMUNICATION  **
      **            WITH THE PFC LISTENER.                           **
      **                                                             **
      **  DOMAIN :  NB                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
DLTY25**  18NOV25   DLTY25 -  CHANGES DONE FOR CLOUD MIGRATION       **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
       special-names.
       call-convention 74 is winapi.
      
      ***************
       DATA DIVISION.
      ***************
      
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0013'.
      
       COPY SQLCA.
      
      *---------------------------------------------------------------*
      *    PROGRAM'S VARIABLES                                        *
      *---------------------------------------------------------------*
       01  W0013-WORK-INFO.
           05  W0013-CONN-STAT-CD               PIC X(01).
               88  W0013-CONN-STAT-INIT         VALUE 'I'.
               88  W0013-CONN-STAT-SUCCESS      VALUE 'S'.
               88  W0013-CONN-STAT-ERROR        VALUE 'E'.
               88  W0013-CONN-STAT-DONE         VALUE 'S', 'E'.
           05  W0013-UNSTRING-CTR               PIC S9(03).
           05  W0013-UNSTRING-PTR               PIC S9(03).
           05  W0013-UNSTRING-FLD-CTR           PIC S9(03).
      
       COPY XCWWSOKT.
       COPY XCWWCSMT.
      
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         **
      *****************************************************************
      
       COPY XCWL0004.
      
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
      *****************
       LINKAGE SECTION.
      *****************
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      
       COPY XCWL0013.
       COPY XCWLBUFR.
      
      /
      ********************
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0013-PARM-INFO
                                LBUFR-BUFFER-WORK-AREA.
      ********************
      
      *--------------
       0000-MAINLINE.
      *--------------
      
           PERFORM  0100-MAINLINE
               THRU 0100-MAINLINE-X.
      
       0000-MAINLINE-X.
           GOBACK.
      /
      
      *--------------
       0100-MAINLINE.
      *--------------
      
           INITIALIZE  L0013-OUTPUT-PARM-INFO.
           SET  L0013-RETRN-OK              TO TRUE.
           
           PERFORM  SOKT-0000-INITIALIZE
               THRU SOKT-0000-INITIALIZE-X.
      
      *
      * PROCESS MESSAGE REQUEST
      *
           EVALUATE TRUE
      
                WHEN L0013-RQST-SEND-PFC-SRVR
                     PERFORM  1000-SEND-PFC-SRVR
                         THRU 1000-SEND-PFC-SRVR-X
      
                WHEN L0013-RQST-RECV-PFC-SRVR
                     PERFORM  2000-RECV-PFC-SRVR
                         THRU 2000-RECV-PFC-SRVR-X
      
                WHEN L0013-RQST-OBTN-IP-ADDR
                     PERFORM  3000-OBTN-IP-ADDR
                         THRU 3000-OBTN-IP-ADDR-X
      
                WHEN L0013-RQST-CLOS-COMUN
                     PERFORM  4000-CLOS-COMUN
                         THRU 4000-CLOS-COMUN-X
      
                WHEN OTHER
                     SET  L0013-RETRN-INVALD-RQST 
                                            TO TRUE
                     MOVE L0013-RETRN-CD    TO WGLOB-ERR-RETRN-CD
      
           END-EVALUATE.
      
           IF  NOT L0013-RETRN-OK
               MOVE WSOKT-ERR-ERROR-NUM     TO L0013-SOKT-ERROR-NUM
           END-IF.
      
       0100-MAINLINE-X.
           EXIT.
      /
      *------------------------
       1000-SEND-PFC-SRVR.
      *------------------------
      
      *------------------------------------------------------------
      * ESTABLISH THE PATHFINDER CONNECTION INFO IF NOT DONE
      *------------------------------------------------------------
      
           IF  WGLOB-PFC-COMUN-STAT-NOT-STRT
           OR  WGLOB-PFC-COMUN-STAT-CONN-PEND
               PERFORM  1020-COMUN-ESTB
                   THRU 1020-COMUN-ESTB-X
           END-IF.
      
           IF  NOT L0013-RETRN-OK
               IF  WSOKT-INITAPI-DONE
                   PERFORM  SOKT-7000-TERM-API
                       THRU SOKT-7000-TERM-API-X
               END-IF
               GO TO 1000-SEND-PFC-SRVR-X
           END-IF.
      
      *------------------------------------------------------------
      * START THE COMMUNICATION BY OPENING A SOCKET
      *------------------------------------------------------------
      
           IF  WGLOB-PFC-COMUN-STAT-CONN-ESTB
               PERFORM  1050-COMUN-STRT
                   THRU 1050-COMUN-STRT-X
           END-IF.
      
           IF  NOT L0013-RETRN-OK
               IF  WSOKT-INITAPI-DONE
                   PERFORM  SOKT-7000-TERM-API
                       THRU SOKT-7000-TERM-API-X
               END-IF
               GO TO 1000-SEND-PFC-SRVR-X
           END-IF.
      
      *------------------------------------------------------------
      * COMMUNICATE WITH PATHFINDER THROUGH THE SOCKET
      *------------------------------------------------------------
      
           PERFORM  1500-PRCES-COMUN-SEND
               THRU 1500-PRCES-COMUN-SEND-X.
      
       1000-SEND-PFC-SRVR-X.
           EXIT.
      
      *---------------------
       1020-COMUN-ESTB.
      *---------------------
      
DLTY25     MOVE 'azlapprdingjp01'           TO L0013-PFC-SRVR-NM.
           MOVE 9083                       TO L0013-PFC-SRVR-PORT-NUM.
           MOVE 'A'                         TO L0013-PFC-CHAR-SET-CD.
      
           PERFORM  SOKT-1000-INIT-API
               THRU SOKT-1000-INIT-API-X.
      
           IF  NOT WSOKT-RETRN-OK
               SET  L0013-RETRN-ERR-INITAPI TO TRUE
               GO TO 1020-COMUN-ESTB-X
           END-IF.
      
           PERFORM  3050-PRCES-HOST-NM
               THRU 3050-PRCES-HOST-NM-X.
      
           IF  L0013-RETRN-OK
               SET  WGLOB-PFC-DATA-UPDT     TO TRUE
               SET  WGLOB-PFC-COMUN-STAT-CONN-ESTB 
                                            TO TRUE
               MOVE L0013-PFC-SRVR-IP-ADDR-ID
                                            TO 
                                   WGLOB-PFC-SRVR-IP-ADDR-ID
               MOVE L0013-PFC-SRVR-PORT-NUM
                                            TO WGLOB-PFC-SRVR-PORT-NUM
               MOVE L0013-PFC-CHAR-SET-CD
                                            TO WGLOB-PFC-CHAR-SET-CD
           END-IF.
      
       1020-COMUN-ESTB-X.
           EXIT.
      
      *----------------
       1050-COMUN-STRT.
      *----------------
      
           IF  WSOKT-INITAPI-NOT-DONE
               PERFORM  SOKT-1000-INIT-API
                   THRU SOKT-1000-INIT-API-X
      
               IF  NOT WSOKT-RETRN-OK
                   SET  L0013-RETRN-ERR-INITAPI  
                                            TO TRUE
                   GO TO 1050-COMUN-STRT-X
               END-IF
           END-IF.
      
           PERFORM  SOKT-2000-CREAT-SOCKET
               THRU SOKT-2000-CREAT-SOCKET-X.
      
           MOVE WSOKT-COMUN-ID-R            TO WGLOB-PFC-COMUN-ID-R.
      
           IF  NOT WSOKT-RETRN-OK
               SET  L0013-RETRN-ERR-SOCKET  TO TRUE
               GO TO 1050-COMUN-STRT-X
           END-IF.
      
           MOVE L0013-PFC-SRVR-IP-ADDR-ID   TO WSOKT-SRVR-IP-ADDR-ID.
           MOVE L0013-PFC-SRVR-PORT-NUM     TO WSOKT-SRVR-PORT-NUM.
      
           PERFORM  SOKT-3000-CONN-SOCKET
               THRU SOKT-3000-CONN-SOCKET-X.
      
      
           MOVE WSOKT-COMUN-ID-R            TO WGLOB-PFC-COMUN-ID-R.
      
           IF  NOT WSOKT-RETRN-OK
               PERFORM  SOKT-5000-CLOSE-SOCKET
                   THRU SOKT-5000-CLOSE-SOCKET-X
               SET  L0013-RETRN-ERR-CONNECT TO TRUE
               GO TO 1050-COMUN-STRT-X
           END-IF.
      
           IF  WSOKT-INITAPI-DONE
               SET  WGLOB-PFC-COMUN-STAT-CONN-INIT 
                                            TO TRUE
           ELSE
               SET  WGLOB-PFC-COMUN-STAT-CONN     
                                            TO TRUE
           END-IF.
      
       1050-COMUN-STRT-X.
           EXIT.
      
      *---------------------
       1500-PRCES-COMUN-SEND.
      *---------------------
      
           SET  WSOKT-SEND-ONLY             TO TRUE.
      
           PERFORM  1550-SEND
               THRU 1550-SEND-X.
      
           IF  NOT L0013-RETRN-OK
      ***      TRY AGAIN, THE SOCKET MAY HAVE BEEN CLOSED
               PERFORM 1501-RETRY-SEND
                  THRU 1501-RETRY-SEND-X
                  2                        TIMES
           END-IF.
      
       1500-PRCES-COMUN-SEND-X.
           EXIT.
      *
      *----------------
       1501-RETRY-SEND.
      *----------------
      *
           IF L0013-RETRN-OK
               GO TO 1501-RETRY-SEND-X
           END-IF.
      *
           SET L0013-RETRN-OK               TO TRUE.
           PERFORM 1050-COMUN-STRT
              THRU 1050-COMUN-STRT-X.
      *
           PERFORM 1550-SEND
              THRU 1550-SEND-X.
      *
       1501-RETRY-SEND-X.
           EXIT.
      
      *----------------
       1550-SEND.
      *----------------
      
           MOVE L0013-PFC-CHAR-SET-CD       TO WSOKT-CHAR-SET-CD.
           MOVE WGLOB-PFC-COMUN-ID-R        TO WSOKT-COMUN-ID-R.
      
           PERFORM  SOKT-4000-SEND
               THRU SOKT-4000-SEND-X.
      
           IF  WSOKT-RETRN-ERR-WRITE
               SET  L0013-RETRN-ERR-WRITE   TO TRUE
           END-IF.
      
      
       1550-SEND-X.
           EXIT.
      
      *------------------------
       2000-RECV-PFC-SRVR.
      *------------------------
      
      *------------------------------------------------------------
      * THE CONNECTION TO THE SOCKETS MUST BE ESTABLISHED.  IF NOT
      * WE HAVE AN ERROR CONDITION AND MUST TERMINATE THE PROCESS.
      *------------------------------------------------------------
      
           IF  WGLOB-PFC-COMUN-STAT-NOT-STRT
           OR  NOT WGLOB-PFC-COMUN-STAT-OPEN
               SET L0013-RETRN-ERR-SOCKET   TO TRUE
           END-IF.
      
           IF  NOT L0013-RETRN-OK
               IF  WSOKT-INITAPI-DONE
                   PERFORM  SOKT-7000-TERM-API
                       THRU SOKT-7000-TERM-API-X
               END-IF
               GO TO 2000-RECV-PFC-SRVR-X
           END-IF.
      
      *------------------------------------------------------------
      * RECEIVE FROM THE SOCKET
      *------------------------------------------------------------
      
           PERFORM  2100-PRCES-COMUN-RECV
               THRU 2100-PRCES-COMUN-RECV-X.
      
       2000-RECV-PFC-SRVR-X.
           EXIT.
      
      *---------------------
       2100-PRCES-COMUN-RECV.
      *---------------------
      
           SET  WSOKT-RECV-ONLY             TO TRUE.
      
           PERFORM  2150-RECV
               THRU 2150-RECV-X.
      
           IF  NOT L0013-RETRN-OK
               GO TO 2100-PRCES-COMUN-RECV-X
           END-IF.
      
       2100-PRCES-COMUN-RECV-X.
           EXIT.
      
      *---------
       2150-RECV.
      *---------
      
           MOVE L0013-PFC-CHAR-SET-CD       TO WSOKT-CHAR-SET-CD.
           MOVE WGLOB-PFC-COMUN-ID-R        TO WSOKT-COMUN-ID-R.
           MOVE L0013-TERM-PATTERN-TXT      TO WSOKT-TERM-PATTERN-TXT.
           MOVE L0013-TERM-PATTERN-LEN      TO WSOKT-TERM-PATTERN-LEN.
      
           PERFORM  SOKT-4500-RECV
               THRU SOKT-4500-RECV-X.
           IF WSOKT-RETRN-COMPLETE
               SET L0013-STATUS-COMPLETE    TO TRUE
           END-IF.
      
           IF  NOT WSOKT-RETRN-OK
               MOVE WSOKT-RETRN-CD          TO L0013-RETRN-CD
           END-IF.
      
       2150-RECV-X.
           EXIT.
      /
      *-------------------
       3000-OBTN-IP-ADDR.
      *-------------------
      
           PERFORM  SOKT-1000-INIT-API
               THRU SOKT-1000-INIT-API-X.
      
           IF  NOT WSOKT-RETRN-OK
               SET  L0013-RETRN-ERR-INITAPI TO TRUE
               GO TO 3000-OBTN-IP-ADDR-X
           END-IF.
      
           PERFORM  3050-PRCES-HOST-NM
               THRU 3050-PRCES-HOST-NM-X.
      
           IF  WSOKT-INITAPI-DONE
               PERFORM  SOKT-7000-TERM-API
                   THRU SOKT-7000-TERM-API-X
           END-IF.
      
       3000-OBTN-IP-ADDR-X.
           EXIT.
      
      *-------------------
       3050-PRCES-HOST-NM.
      *-------------------
      
      *------------------------------------------------------------
      * GET HOST IP ADDRESS BASED ON HOST NAME
      *------------------------------------------------------------
      
           MOVE 1                           TO W0013-UNSTRING-PTR.
           MOVE ZERO                        TO W0013-UNSTRING-CTR.
           MOVE ZERO                        TO W0013-UNSTRING-FLD-CTR.
           MOVE SPACES                      TO WSOKT-HOST-NAME.
      
           UNSTRING          L0013-PFC-SRVR-NM
               DELIMITED BY  SPACES
               INTO          WSOKT-HOST-NAME
               COUNT IN      W0013-UNSTRING-CTR
               WITH POINTER  W0013-UNSTRING-PTR
               TALLYING IN   W0013-UNSTRING-FLD-CTR
               ON OVERFLOW   CONTINUE
           END-UNSTRING.
      
           IF  W0013-UNSTRING-CTR = ZERO
               MOVE L0013-PFC-SRVR-NM       TO WSOKT-HOST-NAME
           ELSE
               MOVE W0013-UNSTRING-CTR      TO WSOKT-HOST-NAME-LEN
           END-IF.
      
           PERFORM  SOKT-6000-PRCES-HOST-NM
               THRU SOKT-6000-PRCES-HOST-NM-X.
      
           IF  NOT WSOKT-RETRN-OK
               SET  L0013-RETRN-ERR-GETHOST TO TRUE
               GO TO 3050-PRCES-HOST-NM-X
           END-IF.
      
      *-------------------------------------------------------------
      * LOOP UNTIL A CONNECT IS SUCCESFUL OR UNABLE TO CONTINUE
      *------------------------------------------------------------
      
           SET  W0013-CONN-STAT-INIT        TO TRUE.
      
           PERFORM  3100-TRY-SRVR-CONN
               THRU 3100-TRY-SRVR-CONN-X
               UNTIL W0013-CONN-STAT-DONE.
      
           IF  W0013-CONN-STAT-SUCCESS
               SET  L0013-RETRN-OK          TO TRUE
               MOVE WSOKT-SRVR-IP-ADDR-ID   TO L0013-PFC-SRVR-IP-ADDR-ID
           ELSE
               SET  L0013-RETRN-ERR-CONNECT TO TRUE
           END-IF.
      
       3050-PRCES-HOST-NM-X.
           EXIT.
      
      *-------------------
       3100-TRY-SRVR-CONN.
      *-------------------
      
           PERFORM  SOKT-6100-PRCES-HOST-IP
               THRU SOKT-6100-PRCES-HOST-IP-X.
      
           IF  NOT WSOKT-RETRN-OK
               SET  W0013-CONN-STAT-ERROR   TO TRUE
               GO TO 3100-TRY-SRVR-CONN-X
           END-IF.
      
           PERFORM  SOKT-2000-CREAT-SOCKET
               THRU SOKT-2000-CREAT-SOCKET-X.
      
           IF  NOT WSOKT-RETRN-OK
               PERFORM  3200-SET-CONN-NEXT
                   THRU 3200-SET-CONN-NEXT-X
               GO TO 3100-TRY-SRVR-CONN-X
           END-IF.
      
           MOVE L0013-PFC-SRVR-PORT-NUM     TO WSOKT-SRVR-PORT-NUM.
      
           PERFORM  SOKT-3000-CONN-SOCKET
               THRU SOKT-3000-CONN-SOCKET-X.
      
           MOVE WSOKT-COMUN-ID-R            TO WGLOB-PFC-COMUN-ID-R.
      
           IF  NOT WSOKT-RETRN-OK
               PERFORM  SOKT-5000-CLOSE-SOCKET
                   THRU SOKT-5000-CLOSE-SOCKET-X
               PERFORM  3200-SET-CONN-NEXT
                   THRU 3200-SET-CONN-NEXT-X
               GO TO 3100-TRY-SRVR-CONN-X
           END-IF.
      
           PERFORM  SOKT-4200-PING
               THRU SOKT-4200-PING-X.
      
           IF  WSOKT-RETRN-OK
               SET  W0013-CONN-STAT-SUCCESS TO TRUE
           ELSE
               PERFORM  3200-SET-CONN-NEXT
                   THRU 3200-SET-CONN-NEXT-X
           END-IF.
      
           PERFORM  SOKT-5000-CLOSE-SOCKET
               THRU SOKT-5000-CLOSE-SOCKET-X.
      
       3100-TRY-SRVR-CONN-X.
           EXIT.
      
      *-------------------
       3200-SET-CONN-NEXT.
      *-------------------
      
           PERFORM  SOKT-6200-SET-CONN-NEXT
               THRU SOKT-6200-SET-CONN-NEXT-X.
      
           IF  NOT WSOKT-RETRN-OK
               SET  W0013-CONN-STAT-ERROR   TO TRUE
           END-IF.
      
       3200-SET-CONN-NEXT-X.
           EXIT.
      
      *-----------------
       4000-CLOS-COMUN.
      *-----------------
      
           IF  WGLOB-PFC-COMUN-STAT-CONN
           OR  WGLOB-PFC-COMUN-STAT-CONN-INIT
               CONTINUE
           ELSE
               GO TO 4000-CLOS-COMUN-X
           END-IF.
      
           MOVE WGLOB-PFC-COMUN-ID-R        TO WSOKT-COMUN-ID-R.
      
           PERFORM  SOKT-5000-CLOSE-SOCKET
               THRU SOKT-5000-CLOSE-SOCKET-X.
      
           IF  NOT WSOKT-RETRN-OK
               SET  L0013-RETRN-ERR-CLOSE   TO TRUE
           END-IF.
      
           IF  WGLOB-PFC-COMUN-STAT-CONN-INIT
               PERFORM  SOKT-7000-TERM-API
                   THRU SOKT-7000-TERM-API-X
           END-IF.
      
       4000-CLOS-COMUN-X.
           EXIT.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
      
       COPY XCPPSOKT.
      
      ****************************************************************
      * COMMON COPYBOOKS                                             *
      ****************************************************************
      
       COPY XCCPCSMT.
      
      ****************************************************************
      * LINKING COPYBOOKS                                            *
      ****************************************************************
      
       COPY XCPL0004.
       COPY XCPL0260.
      
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
      *
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
      
       COPY XCPL0030.
      
      *****************************************************************
      **                 END OF PROGRAM XSDU0013                     **
      *****************************************************************
