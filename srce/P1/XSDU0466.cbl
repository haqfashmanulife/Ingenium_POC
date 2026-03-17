      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  XSDU0466.

      *****************************************************************
      **  MEMBER :  XSDU0466                                         **
      *****************************************************************
      **  REMARKS:  SEND COMITE, ROLLBACK OR AUTHENTICATE XML        **
      **            MESSAGE TO PATHFINDER CONNECTOR                  **
      **                                                             **
      **  DOMAIN :  NB                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************
      
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0466'.
      
       COPY SQLCA.
      /
       01  WS-WORK-AREA.
           05  WS-MSG-SEND-IND             PIC X.
               88  WS-MSG-SEND-YES         VALUE 'Y'.
      
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWWINDX.
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      *
       COPY CCWLPGA.
       COPY XCWL0013.
       COPY XCWL0023.
       COPY NCFRPRTX.
       COPY XCWLDOCW REPLACING ':PGM-ID:' BY 'XSDU2552'.
      *
      *****************
       LINKAGE SECTION.
      *****************
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0466.
       COPY XCWLBUFR.
      /
      *******************
      
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0466-PARM-INFO.
      *******************
      *--------------
       0000-MAINLINE.
      *--------------
      
           SET ADDRESS OF LBUFR-BUFFER-WORK-AREA
                       TO WGLOB-PFC-BUFR-ADDR-PTR.
      *
      *INITIALIZATION
      *
           SET L0466-RETRN-OK               TO TRUE.
      
           INITIALIZE WS-WORK-AREA.
      
           PERFORM  DOCW-0000-INIT-PARM-INFO
               THRU DOCW-0000-INIT-PARM-INFO-X.
      
           PERFORM  0023-0000-INIT-PARM-INFO
               THRU 0023-0000-INIT-PARM-INFO-X.
      
           EVALUATE TRUE
      
                WHEN L0466-RQST-AUTHENTIC-MSG
                     SET LDOCW-PFC-MESSAGE-AUTHENTIC 
                                            TO TRUE
      
                WHEN L0466-RQST-ROLLBACK-MSG
                     SET LDOCW-PFC-MESSAGE-ROLLBACK  
                                            TO TRUE
      
                WHEN L0466-RQST-COMMIT-MSG
                     SET LDOCW-PFC-MESSAGE-COMMIT   
                                            TO TRUE
      
                WHEN OTHER
                     SET L0466-RETRN-INVALID-REQUEST 
                                            TO TRUE
      
           END-EVALUATE.
      
           PERFORM  1000-SEND-MESSAGE-TO-PFC
               THRU 1000-SEND-MESSAGE-TO-PFC-X
      
           IF  LDOCW-RETRN-OK
           AND WS-MSG-SEND-YES
              PERFORM  2000-GET-INTGR-SYS-RESP
                  THRU 2000-GET-INTGR-SYS-RESP-X
           END-IF.
      
       0000-MAINLINE-X.
           GOBACK.
      /
      *-------------------------
       1000-SEND-MESSAGE-TO-PFC.
      *-------------------------
      
           IF  WGLOB-PFC-SEQUENCE-NUM > 0
           AND LDOCW-PFC-MESSAGE-AUTHENTIC
              GO TO 1000-SEND-MESSAGE-TO-PFC-X
           END-IF.
      
           IF  WGLOB-PFC-SEQUENCE-NUM = 0
           AND ( LDOCW-PFC-MESSAGE-COMMIT OR
                 LDOCW-PFC-MESSAGE-ROLLBACK )
              GO TO 1000-SEND-MESSAGE-TO-PFC-X
           END-IF.
      
           PERFORM  DOCW-1000-STRT-DOC
               THRU DOCW-1000-STRT-DOC-X.
           SET WS-MSG-SEND-YES              TO TRUE.
      
       1000-SEND-MESSAGE-TO-PFC-X.
           EXIT.
      /
      *------------------------
       2000-GET-INTGR-SYS-RESP.
      *------------------------
      
           PERFORM  0023-1000-BUILD-PARM-INFO
               THRU 0023-1000-BUILD-PARM-INFO-X.
      
      * GET OUTPUT
           PERFORM  0023-1000-START-RETRIEVE
               THRU 0023-1000-START-RETRIEVE-X.
      
           IF  L0023-RETRN-ERROR
      * MSG: INVALID RESPONSE FROM PATHFINDER CONNECTOR
               MOVE 'XS04660001'             TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-GET-INTGR-SYS-RESP-X
           END-IF.
      
           IF  L0466-RQST-AUTHENTIC-MSG
           AND NOT L0023-PFC-RETRN-AUTHENTICATE
      * MSG: PATHFINDER CONNECTOR AUTHENTICATE FAILED
               MOVE 'XS04660002'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0466-RETRN-ERROR        TO TRUE
               GO TO 2000-GET-INTGR-SYS-RESP-X
           END-IF.
      
           IF  L0466-RQST-COMMIT-MSG
           AND NOT L0023-PFC-RETRN-COMMIT
      * MSG: PATHFINDER CONNECTOR COMMIT FAILED
               MOVE 'XS04660003'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0466-RETRN-ERROR        TO TRUE
               GO TO 2000-GET-INTGR-SYS-RESP-X
           END-IF.
      
           IF  L0466-RQST-ROLLBACK-MSG
           AND NOT L0023-PFC-RETRN-ROLLBACK
      * MSG: PATHFINDER CONNECTOR ROLLBACK FAILED
               MOVE 'XS04660004'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0466-RETRN-ERROR        TO TRUE
               GO TO 2000-GET-INTGR-SYS-RESP-X
           END-IF.
      
       2000-GET-INTGR-SYS-RESP-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
       COPY XCPL0013.
       COPY XCPS0013.
      /
       COPY XCPL0023.
       COPY XCPS0023.
      /
       COPY XCPLDOCW.
       COPY XCPSDOCW.
      /
       COPY XCPL0260.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
      
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM XSDU0466                     **
      *****************************************************************
