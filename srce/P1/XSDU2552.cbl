      *****************************************************************
      **  ALL RIGHT, TITLE AND INTEREST IN AND TO THE SOFTWARE         
      **  (THE "SOFTWARE") AND THE ACCOMPANYING DOCUMENTATION OR       
      **  MATERIALS (THE "DOCUMENTATION"), INCLUDING ALL PROPRIETARY   
      **  RIGHTS, THEREIN INCLUDING ALL PATENT RIGHTS, TRADE SECRETS,  
      **  TRADEMARKS AND COPYRIGHTS, SHALL REMAIN THE EXCLUSIVE        
      **  PROPERTY OF HEWLETT-PACKARD DEVELOPMENT COMPANY, L.P.        
      **  NO INTEREST, LICENSE OR ANY RIGHT RESPECTING THE SOFTWARE    
      **  AND THE DOCUMENTATION, OTHER THAN EXPRESSLY GRANTED IN       
      **  THE SOFTWARE LICENSE AGREEMENT, IS GRANTED BY IMPLICATION    
      **  OR OTHERWISE.                                                
      **                                                               
      **  (C) COPYRIGHT 2005-2008 HEWLETT-PACKARD DEVELOPMENT COMPANY, L.P.
      **  ALL RIGHTS RESERVED.                                         
      **                                                               
      **  EACH PARTY AGREES TO (A) COMPLY WITH ALL APPLICABLE LAWS     
      **  REGARDING EXPORT OR RE-EXPORT OF THE CONFIDENTIAL            
      **  INFORMATION, TECHNICAL DATA, OR DERIVATIVES OF SUCH ITEMS;   
      **  AND (B) NOT TO EXPORT OR RE-EXPORT ANY SUCH ITEMS TO A       
      **  DESTINATION OR END USER FOR WHICH APPLICABLE LAW, INCLUDING  
      **  CANADIAN OR U.S. LAW, REQUIRES AN EXPORT LICENSE OR OTHER    
      **  APPROVAL WITHOUT FIRST HAVING OBTAINED SUCH LICENSE OR       
      **  APPROVAL.                                                    
      *****************************************************************
      *-----------------------
       IDENTIFICATION DIVISION.
      *-----------------------

       PROGRAM-ID. XSDU2552.

      *****************************************************************
      **  MEMBER :  XSDU2552                                         **
      **  REMARKS:  THIS PROGRAM GENERATES THE XML FOR DOCUMENTS TO  **
      **            BE SEND TO EXTERNAL SYSTEM.                      **
      **                                                             **
      **            XSDU0008 IS CALLED TO BUILD THE XML DOCUMENT.    **
      **            A USER EXIT POINT HAS BEEN IMPLEMENTED TO ALLOW  **
      **            THE CALLING OF AN ALTERNATE XML GENERATOR UTILITY**
      **                                                             **
      **  DOMAIN :  NB                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************
      /
      *--------------------
       ENVIRONMENT DIVISION.
      *--------------------
      
       CONFIGURATION SECTION.
      
      *-------------
       DATA DIVISION.
      *-------------
      
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU2552'.
      
       COPY SQLCA.
      
       01  WS-WORK-AREA.
           05  WS-PFC-VALUE-TIME-CD        PIC X(05).
               88  WS-PFC-VALUE-TIME-SHORT     VALUE 'SHORT'.
               88  WS-PFC-VALUE-TIME-LONG      VALUE 'LONG'.
       01  WS-WORKING-STORAGE.
           05  WS-BUFFER-MAX               PIC S9(08) BINARY.
      
           05  WS-SCHEMA-FLAG              PIC 9(01).
      
      * THE FOLLOWING FILLER HAS BEEN ADDED TO ALIGN THE POINTER
      * WITH THE 16 BYTE BOUNDARY FOR THE AS400
      
           05  FILLER                      PIC  X(11).
      
           05  WS-FOREIGN-KEY-PTR          USAGE IS POINTER.
           05  WS-FOREIGN-KEY-LEN          PIC S9(04) BINARY.
      
           05  WS-DOC-CTR                  PIC 9(08).
      
           05  WS-DBSRL-ID                 PIC X(04).
      
       01  WS-LOCAL-STORAGE.
           05  WS-DOC-ID-LEN               PIC S9(04) BINARY.
      
           05  WS-TOKEN-ID-LEN             PIC S9(04) BINARY.
      
           05  WS-TXT-FLDS-LEN             PIC S9(04) BINARY.
           05  WS-TXT-FLDS-MIN-LEN         PIC S9(04) BINARY.
           05  WS-TXT-FLDS-MAX-LEN         PIC S9(04) BINARY.
           05  WS-TXT-FLDS-TXT             PIC X(1000).
      
           05  WS-AMT-FLDS-LEN             PIC S9(04) BINARY.
      
           05  WS-DT-FLDS-YR.
               10  WS-DT-FLDS-YR-YR        PIC 9(04).
      
           05  WS-DT-FLDS-MO.
               10  WS-DT-FLDS-MO-SEP-1     PIC X(02).
               10  WS-DT-FLDS-MO-MO        PIC 9(02).
               10  WS-DT-FLDS-MO-SEP-2     PIC X(02).
      
           05  WS-DT-FLDS-DY.
               10  WS-DT-FLDS-DY-SEP-1     PIC X(03).
               10  WS-DT-FLDS-DY-DY        PIC 9(02).
      
           05  WS-TIME-FLDS-TIME.
               10  WS-TIME-FLDS-HR         PIC 9(02).
               10  WS-TIME-SEP-1           PIC X(01).
               10  WS-TIME-FLDS-MI         PIC 9(02).
               10  WS-TIME-SEP-2           PIC X(01).
               10  WS-TIME-FLDS-SEC        PIC 9(02).
               10  WS-TIME-SEP-3           PIC X(01).
               10  WS-TIME-FLDS-MS         PIC 9(06) BLANK WHEN ZERO.
      
           05  WS-TS.
               10  WS-TS-DT                PIC X(10).
               10  WS-TS-SEP-1             PIC X(01).
               10  WS-TS-TIME              PIC X(15).
      
           05  WS-ETBL-TYP-ID              PIC X(30).
           05  WS-ETBL-TYP-ID-LEN          PIC S9(04) BINARY.
           05  WS-ETBL-VALU-ID             PIC X(30).
           05  WS-ETBL-VALU-ID-LEN         PIC S9(04) BINARY.
           05  WS-ETBL-DESC-TXT            PIC X(50).
           05  WS-ETBL-DESC-TMP-TXT        PIC X(50).
           05  WS-ETBL-DESC-LEN            PIC S9(04) BINARY.
      
           05  WS-DM-AV-TBL-CD             PIC X(30).
           05  WS-DM-AV-TBL-CD-LEN         PIC S9(04) BINARY.
           05  WS-DM-AV-CD                 PIC X(30).
           05  WS-DM-AV-CD-LEN             PIC S9(04) BINARY.
           05  WS-ENTITY-SUPPORTED-IND     PIC X(01).
               88  WS-ENTITY-SUPPORTED         VALUE 'Y'.
               88  WS-ENTITY-NOT-SUPPORTED     VALUE 'N'.
      
           05  WS-XML-NAME-CHAR            PIC X(01).
               88  WS-XML-NAME-CHAR-VALID      VALUES 'A' THRU 'Z'
                                                      'a' THRU 'z'
                                                      '0' THRU '9'
                                                      '-' '_'
                                                      .
      
           05  WS-PIC-9999                 PIC 9(04).
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      
       COPY CCWWINDX.
       COPY XCWWWKDT.
       COPY XCWWWSIN.
      
       COPY XCWWFPIM.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      
       COPY XCFWDMAD.
       COPY XCFRDMAD.
      
       COPY CCFWEDIT.
       COPY CCFREDIT.
      
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      
       COPY XCFWUSEC.
       COPY XCFRUSEC.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      
       COPY XCWL0008.
      
       COPY XCWL0013.
      
       COPY XCWL0290.
      
       COPY XCWL1640.
       COPY XCWL1660.
       COPY XCWLDTLK.
      
       COPY XCWL2566.
      /
      *---------------
       LINKAGE SECTION.
      *---------------
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      
       COPY XCWLDOCW.
      
       COPY XCWLBUFR.
      
       01  LDOCW-DBSRL-KEY-INFO             PIC X(1000).
      /
      *------------------
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                LDOCW-PARM-INFO.
      
      *------------------
      
      *--------------
       0000-MAINLINE.
      *--------------

           SET ADDRESS OF LBUFR-BUFFER-WORK-AREA
                                            TO WGLOB-PFC-BUFR-ADDR-PTR.
      
           PERFORM  9990-INIT-WORKING-STORAGE
               THRU 9990-INIT-WORKING-STORAGE-X.

           IF  LDOCW-RETRN-ERROR
               GO TO 0000-MAINLINE-X
           END-IF.
      
           EVALUATE TRUE
      
               WHEN LDOCW-RQST-STRT-DOC
                    PERFORM  1000-STRT-DOC
                        THRU 1000-STRT-DOC-X
      
               WHEN LDOCW-RQST-STRT-NODE
                    PERFORM  2000-STRT-NODE
                        THRU 2000-STRT-NODE-X
      
               WHEN LDOCW-RQST-WRIT-TOKEN
                    PERFORM  3000-WRIT-TOKEN
                        THRU 3000-WRIT-TOKEN-X
      
               WHEN LDOCW-RQST-END-NODE
                    PERFORM  4000-END-NODE
                        THRU 4000-END-NODE-X
      
               WHEN LDOCW-RQST-END-DOC
                    PERFORM  5000-END-DOC
                        THRU 5000-END-DOC-X
      
               WHEN OTHER
                    SET  LDOCW-RETRN-INVALID-REQUEST TO TRUE
                    MOVE 'XS00000005'         TO WGLOB-MSG-REF-INFO
                    MOVE LDOCW-RQST-CD        TO WGLOB-MSG-PARM (1)
                    MOVE WPGWS-CRNT-PGM-ID    TO WGLOB-MSG-PARM (2)
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    PERFORM  0030-5000-LOGIC-ERROR
                        THRU 0030-5000-LOGIC-ERROR-X

           END-EVALUATE.

       0000-MAINLINE-X.
           GOBACK.

      *--------------
       1000-STRT-DOC.
      *--------------
      
      * INITIALISE THE BUFFER AND OTHER WORKING STORAGE FIELDS
      
           PERFORM  9050-INIT-BUFFER
               THRU 9050-INIT-BUFFER-X.
      
      * THE FOLLOWING ENSURES THAT ANY TOKENS THAT 'HANG' OFF PRTX
      * ARE GENERATED WITH THE KEY INFO OF THE PRTX RECORD
      
      *    SET WS-FOREIGN-KEY-PTR TO ADDRESS OF RPRTX-REC-INFO.
      *    MOVE LENGTH OF RPRTX-REC-INFO   TO WS-FOREIGN-KEY-LEN.
      
      * '<?XML...?>' AND  HEADER INFO TO XML
      
           PERFORM  1200-HEADER-INFO
               THRU 1200-HEADER-INFO-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1000-STRT-DOC-X
           END-IF.
      
           IF  LDOCW-PFC-MESSAGE-AUTHENTIC
           OR  LDOCW-PFC-MESSAGE-COMMIT
           OR  LDOCW-PFC-MESSAGE-ROLLBACK
      * WRITE '</REQUEST>' TO THE XML
              PERFORM  9920-APPEND-END-TAG
                  THRU 9920-APPEND-END-TAG-X
      
              IF  LDOCW-RETRN-ERROR
                  GO TO 1000-STRT-DOC-X
              END-IF
      
              PERFORM  9100-OUTPUT-BUFFER
                  THRU 9100-OUTPUT-BUFFER-X
      
              ADD 1                         TO WGLOB-PFC-SEQUENCE-NUM
              GO TO 1000-STRT-DOC-X
           ELSE
      * WRITE '<INGENIUMDATA>' TAGS
                  
              MOVE WFPIM-ELMNT-INGENIUM-DATA   TO L0008-XML-ELEMENT
              MOVE LENGTH OF WFPIM-ELMNT-INGENIUM-DATA
                                            TO L0008-XML-ELEMENT-LEN
              PERFORM  9910-APPEND-START-TAG
                  THRU 9910-APPEND-START-TAG-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 1000-STRT-DOC-X
               END-IF

              MOVE WFPIM-ELMNT-ENVELOPE   TO L0008-XML-ELEMENT
              MOVE LENGTH OF WFPIM-ELMNT-ENVELOPE
                                               TO L0008-XML-ELEMENT-LEN
              PERFORM  9910-APPEND-START-TAG
                  THRU 9910-APPEND-START-TAG-X                  

              MOVE WFPIM-ELMNT-BODY   TO L0008-XML-ELEMENT
              MOVE LENGTH OF WFPIM-ELMNT-BODY
                                               TO L0008-XML-ELEMENT-LEN
              PERFORM  9910-APPEND-START-TAG
                  THRU 9910-APPEND-START-TAG-X                  
           END-IF.
      
       1000-STRT-DOC-X.
           EXIT.
      /
      *-----------------
       1200-HEADER-INFO.
      *-----------------
           PERFORM  1220-COMMON-HDR-INFO
               THRU 1220-COMMON-HDR-INFO-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1200-HEADER-INFO-X
           END-IF.
      
           EVALUATE TRUE
      
               WHEN LDOCW-PFC-MESSAGE-COMMIT
               WHEN LDOCW-PFC-MESSAGE-ROLLBACK
                    CONTINUE
      
               WHEN LDOCW-PFC-MESSAGE-TRANSACT
               WHEN LDOCW-PFC-MESSAGE-TRANSMIT
                    PERFORM  1300-GEN-MESSAGE-TRANS
                        THRU 1300-GEN-MESSAGE-TRANS-X
      
               WHEN LDOCW-PFC-MESSAGE-AUTHENTIC
                    PERFORM  1400-GEN-MESSAGE-AUTH
                        THRU 1400-GEN-MESSAGE-AUTH-X
      
               WHEN OTHER
                    SET LDOCW-RETRN-ERROR   TO TRUE
      
           END-EVALUATE.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1200-HEADER-INFO-X
           END-IF.
      
      * WRITE '</PATHFINDERCONNECTOR>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
       1200-HEADER-INFO-X.
           EXIT.
      /
      *---------------------
       1220-COMMON-HDR-INFO.
      *---------------------
      *
      * WRITE '<REQUEST>' TO THE XML.  XSDU0008 WILL ALSO ADD THE
      * '<?XML...?>' DECLARATION AT THIS STAGE.
           MOVE WFPIM-ELMNT-REQST           TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-REQST TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1220-COMMON-HDR-INFO-X
           END-IF.
      
      * WRITE '<PATHFINDERCONNECTOR>' TO THE XML
           MOVE WFPIM-ELMNT-PATHFIND-CONN   TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-PATHFIND-CONN
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
      * WRITE '<TOKEN>' TO THE XML
      
           PERFORM  1230-HDR-TOKEN-INFO
               THRU 1230-HDR-TOKEN-INFO-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1220-COMMON-HDR-INFO-X
           END-IF.
      
      * WRITE '<SEQUENCE>' TO THE XML
      
           PERFORM  1240-HDR-SEQUENCE-INFO
               THRU 1240-HDR-SEQUENCE-INFO-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1220-COMMON-HDR-INFO-X
           END-IF.
      
      * WRITE '<MESSAGE>' TO THE XML
      
           PERFORM  1250-HDR-MESSAGE-INFO
               THRU 1250-HDR-MESSAGE-INFO-X.
      
       1220-COMMON-HDR-INFO-X.
           EXIT.
      /
      *--------------------
       1230-HDR-TOKEN-INFO.
      *--------------------
      * WRITE '<TOKEN>' TO THE XML
      
           MOVE WFPIM-ELMNT-TOKEN           TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-TOKEN TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1230-HDR-TOKEN-INFO-X
           END-IF.
      

      * WRITE HEADER TOKEN INFO TO THE XML

      *    IF WGLOB-ENVRMNT-GUI
      *       MOVE WGLOB-TASK-ID             TO WS-TXT-FLDS-TXT
      *       MOVE LENGTH OF WGLOB-TASK-ID   TO WS-TXT-FLDS-LEN
      *       MOVE LENGTH OF WGLOB-TASK-ID   TO WS-TXT-FLDS-MAX-LEN
      *    ELSE
      *       MOVE WGLOB-USER-SESN-BTCH-NUM  TO L0290-INPUT-NUMBER
      *       SET L0290-LEAD-ZEROS-SUPPRESS  TO TRUE
      *       SET L0290-MESSAGE-FORMAT       TO TRUE
      *       SET L0290-SIGN-SUPPRESS        TO TRUE
      *       MOVE 7                         TO L0290-MAX-OUT-LEN
      *       MOVE ZERO                      TO L0290-PRECISION
      *
      *       PERFORM  0290-1000-NUMERIC-FORMAT
      *           THRU 0290-1000-NUMERIC-FORMAT-X
      *
      *       MOVE L0290-OUTPUT-DATA         TO WS-TXT-FLDS-TXT
      *       MOVE 7                         TO WS-TXT-FLDS-LEN
      *       MOVE 7                         TO WS-TXT-FLDS-MAX-LEN
      *    END-IF.
      *
      *    MOVE ZERO                      TO WS-TXT-FLDS-MIN-LEN.
           MOVE 4                           TO WS-TXT-FLDS-LEN.
           MOVE 0001                        TO WS-TXT-FLDS-TXT.
      *
      *    PERFORM  9200-EDIT-TXT-FLDS
      *        THRU 9200-EDIT-TXT-FLDS-X.

      *    MOVE WS-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
      *                                    TO L0008-XML-DATA-VALUE.
      *    MOVE WS-TXT-FLDS-LEN            TO L0008-XML-DATA-VALUE-LEN.

           MOVE WS-TXT-FLDS-TXT             TO L0008-XML-DATA-VALUE.
           MOVE WS-TXT-FLDS-LEN             TO 
                                          L0008-XML-DATA-VALUE-LEN.

           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.

           IF  LDOCW-RETRN-ERROR
                 GO TO 1230-HDR-TOKEN-INFO-X
           END-IF

      * WRITE '</TOKEN>' TO THE XML

           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.

       1230-HDR-TOKEN-INFO-X.
           EXIT.
      /
      *-----------------------
       1240-HDR-SEQUENCE-INFO.
      *-----------------------
      * WRITE '<SEQUENCE>' TO THE XML

           MOVE WFPIM-ELMNT-SEQUENCE        TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-SEQUENCE
                                            TO L0008-XML-ELEMENT-LEN.

           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.

           IF  LDOCW-RETRN-ERROR
               GO TO 1240-HDR-SEQUENCE-INFO-X
           END-IF.

      * WRITE HEADER SEQUENCE INFO TO THE XML
      *    MOVE WGLOB-PFC-SEQUENCE-NUM      TO L0290-INPUT-NUMBER.
      *
      *    SET L0290-LEAD-ZEROS-SUPPRESS    TO TRUE.
      *    SET L0290-MESSAGE-FORMAT         TO TRUE.
      *    SET L0290-SIGN-SUPPRESS          TO TRUE.
      *    MOVE 5                           TO L0290-MAX-OUT-LEN.
      *    MOVE ZERO                        TO L0290-PRECISION.
      *
      *    PERFORM  0290-1000-NUMERIC-FORMAT
      *        THRU 0290-1000-NUMERIC-FORMAT-X.
      *
      *    MOVE L0290-OUTPUT-DATA         TO WS-TXT-FLDS-TXT.
      *    MOVE 5                         TO WS-TXT-FLDS-LEN.
      *    MOVE 5                         TO WS-TXT-FLDS-MAX-LEN.
      *    MOVE ZERO                      TO WS-TXT-FLDS-MIN-LEN.
      *    PERFORM  9200-EDIT-TXT-FLDS
      *        THRU 9200-EDIT-TXT-FLDS-X.

      *    MOVE WS-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
      *                                    TO L0008-XML-DATA-VALUE.
      *    MOVE WS-TXT-FLDS-LEN            TO L0008-XML-DATA-VALUE-LEN.

           MOVE 1                           TO WS-TXT-FLDS-LEN.
           MOVE 1                           TO WS-TXT-FLDS-TXT.

           MOVE WS-TXT-FLDS-TXT             TO L0008-XML-DATA-VALUE.
           MOVE WS-TXT-FLDS-LEN             TO 
                                         L0008-XML-DATA-VALUE-LEN.

           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.

           IF  LDOCW-RETRN-ERROR
               GO TO 1240-HDR-SEQUENCE-INFO-X
           END-IF.

      * WRITE '</SEQUENCE>' TO THE XML

           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
       1240-HDR-SEQUENCE-INFO-X.
           EXIT.
      /
      *----------------------
       1250-HDR-MESSAGE-INFO.
      *----------------------
      * WRITE '<MESSAGE>' TO THE XML

           MOVE WFPIM-ELMNT-MSGS            TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-MSGS  TO L0008-XML-ELEMENT-LEN.

           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.

           IF  LDOCW-RETRN-ERROR
               GO TO 1250-HDR-MESSAGE-INFO-X
           END-IF.

      * WRITE HEADER MESSAGE INFO TO THE XML
           IF LDOCW-PFC-MESSAGE-CD NOT = SPACES
              MOVE LDOCW-PFC-MESSAGE-CD     TO L0008-XML-DATA-VALUE
              MOVE LENGTH OF LDOCW-PFC-MESSAGE-CD
                                            TO L0008-XML-DATA-VALUE-LEN
              MOVE LDOCW-PFC-MESSAGE-CD     TO WS-TXT-FLDS-TXT
              MOVE LENGTH OF LDOCW-PFC-MESSAGE-CD
                                            TO WS-TXT-FLDS-LEN
              MOVE LENGTH OF LDOCW-PFC-MESSAGE-CD
                                            TO WS-TXT-FLDS-MAX-LEN
              MOVE ZERO                     TO WS-TXT-FLDS-MIN-LEN

              PERFORM  9200-EDIT-TXT-FLDS
                  THRU 9200-EDIT-TXT-FLDS-X

              MOVE WS-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
                                            TO L0008-XML-DATA-VALUE
              MOVE WS-TXT-FLDS-LEN          TO L0008-XML-DATA-VALUE-LEN

              PERFORM  9940-APPEND-ELEMENT-VALUE
                  THRU 9940-APPEND-ELEMENT-VALUE-X

              IF  LDOCW-RETRN-ERROR
                 GO TO 1250-HDR-MESSAGE-INFO-X
              END-IF
           END-IF.

      * WRITE '</MESSAGE>' TO THE XML

           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.

       1250-HDR-MESSAGE-INFO-X.
           EXIT.
      /
      *-----------------------
       1300-GEN-MESSAGE-TRANS.
      *-----------------------
      
      * WRITE '<FUNCTIONID>' TO THE XML
      
           PERFORM  1310-HDR-FUNC-ID-INFO
               THRU 1310-HDR-FUNC-ID-INFO-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1300-GEN-MESSAGE-TRANS-X
           END-IF.
      
      * WRITE '<EXTERNALSYSTEMID>' TO THE XML
      
           PERFORM  1320-HDR-EXTRNL-SYS-ID-INFO
               THRU 1320-HDR-EXTRNL-SYS-ID-INFO-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1300-GEN-MESSAGE-TRANS-X
           END-IF.
      
      * WRITE '<USERID>' TO THE XML
      
           PERFORM  1330-HDR-USER-ID-INFO
               THRU 1330-HDR-USER-ID-INFO-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1300-GEN-MESSAGE-TRANS-X
           END-IF.
      
      * WRITE '<PASSWORD>' TO THE XML
      
           PERFORM  1340-HDR-PASSW-INFO
               THRU 1340-HDR-PASSW-INFO-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1300-GEN-MESSAGE-TRANS-X
           END-IF.
      
      * WRITE '<LOCALE>' TO THE XML
      
           PERFORM  1350-HDR-LANG-INFO
               THRU 1350-HDR-LANG-INFO-X.
      
      * WRITE '<COMPANY>' TO THE XML
      
           PERFORM  1360-HDR-COMP-INFO
               THRU 1360-HDR-COMP-INFO-X.
      
       1300-GEN-MESSAGE-TRANS-X.
           EXIT.
      /
      *----------------------
       1310-HDR-FUNC-ID-INFO.
      *----------------------
      * WRITE '<FUNCTIONID>' TO THE XML
           MOVE LDOCW-PFC-MESSAGE-CD           TO WS-TXT-FLDS-TXT.
           MOVE LENGTH OF LDOCW-PFC-MESSAGE-CD TO WS-TXT-FLDS-LEN.
           MOVE LENGTH OF LDOCW-PFC-MESSAGE-CD TO WS-TXT-FLDS-MAX-LEN.
           MOVE ZERO                           TO WS-TXT-FLDS-MIN-LEN.
           PERFORM  9200-EDIT-TXT-FLDS
               THRU 9200-EDIT-TXT-FLDS-X.
      
           MOVE WS-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
                                            TO L0008-XML-DATA-VALUE.
           MOVE WS-TXT-FLDS-LEN             TO L0008-XML-DATA-VALUE-LEN.
           MOVE WFPIM-ELMNT-FUNC-ID         TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-FUNC-ID
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
              GO TO 1310-HDR-FUNC-ID-INFO-X
           END-IF.
      
      * WRITE HEADER FUNCTION ID TO THE XML
           IF  LDOCW-PFC-FUNCTION-ID NOT = SPACES
              MOVE LDOCW-PFC-FUNCTION-ID    TO WS-TXT-FLDS-TXT
              MOVE LENGTH OF LDOCW-PFC-FUNCTION-ID
                                            TO WS-TXT-FLDS-LEN
              MOVE LENGTH OF LDOCW-PFC-FUNCTION-ID
                                            TO WS-TXT-FLDS-MAX-LEN
              MOVE ZERO                     TO WS-TXT-FLDS-MIN-LEN
              PERFORM  9200-EDIT-TXT-FLDS
                  THRU 9200-EDIT-TXT-FLDS-X
      
              MOVE WS-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
                                            TO L0008-XML-DATA-VALUE
              MOVE WS-TXT-FLDS-LEN          TO L0008-XML-DATA-VALUE-LEN
      
              PERFORM  9940-APPEND-ELEMENT-VALUE
                  THRU 9940-APPEND-ELEMENT-VALUE-X
      
              IF  LDOCW-RETRN-ERROR
                 GO TO 1310-HDR-FUNC-ID-INFO-X
              END-IF
           END-IF.
      
      * WRITE '</FUNCTIONID>' TO THE XML
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
       1310-HDR-FUNC-ID-INFO-X.
           EXIT.
      /
      *----------------------------
       1320-HDR-EXTRNL-SYS-ID-INFO.
      *----------------------------
      * WRITE '<EXTERNALSYSTEMID>' TO THE XML
           MOVE WFPIM-ELMNT-EXT-SYS-ID      TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-EXT-SYS-ID
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
              GO TO 1320-HDR-EXTRNL-SYS-ID-INFO-X
           END-IF.
      
      * WRITE HEADER EXTERNAL SYSTEM ID TO THE XML
           IF  LDOCW-PFC-XTRNL-SYS-ID NOT = SPACES
              MOVE LDOCW-PFC-XTRNL-SYS-ID   TO WS-TXT-FLDS-TXT
              MOVE LENGTH OF LDOCW-PFC-XTRNL-SYS-ID
                                            TO WS-TXT-FLDS-LEN
              MOVE LENGTH OF LDOCW-PFC-XTRNL-SYS-ID
                                            TO WS-TXT-FLDS-MAX-LEN
              MOVE ZERO                     TO WS-TXT-FLDS-MIN-LEN
              PERFORM  9200-EDIT-TXT-FLDS
                  THRU 9200-EDIT-TXT-FLDS-X
      
              MOVE WS-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
                                            TO L0008-XML-DATA-VALUE
              MOVE WS-TXT-FLDS-LEN          TO L0008-XML-DATA-VALUE-LEN
      
              PERFORM  9940-APPEND-ELEMENT-VALUE
                  THRU 9940-APPEND-ELEMENT-VALUE-X
      
              IF  LDOCW-RETRN-ERROR
                 GO TO 1320-HDR-EXTRNL-SYS-ID-INFO-X
              END-IF
           END-IF.
      
      * WRITE '</EXTERNALSYSTEMID>' TO THE XML
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
       1320-HDR-EXTRNL-SYS-ID-INFO-X.
           EXIT.
      /
      *----------------------
       1330-HDR-USER-ID-INFO.
      *----------------------
      * WRITE '<USERID>' TO THE XML
      
           MOVE WFPIM-ELMNT-USER-ID         TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-USER-ID
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1330-HDR-USER-ID-INFO-X
           END-IF.
      
      * WRITE HEADER USER ID TO THE XML
           IF  WGLOB-USER-ID NOT = SPACES
              MOVE WGLOB-USER-ID            TO WS-TXT-FLDS-TXT
              MOVE LENGTH OF WGLOB-USER-ID  TO WS-TXT-FLDS-LEN
              MOVE LENGTH OF WGLOB-USER-ID  TO WS-TXT-FLDS-MAX-LEN
              MOVE ZERO                     TO WS-TXT-FLDS-MIN-LEN
              PERFORM  9200-EDIT-TXT-FLDS
                  THRU 9200-EDIT-TXT-FLDS-X
      
              MOVE WS-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
                                            TO L0008-XML-DATA-VALUE
              MOVE WS-TXT-FLDS-LEN          TO L0008-XML-DATA-VALUE-LEN
      
              PERFORM  9940-APPEND-ELEMENT-VALUE
                  THRU 9940-APPEND-ELEMENT-VALUE-X
      
              IF  LDOCW-RETRN-ERROR
                  GO TO 1330-HDR-USER-ID-INFO-X
              END-IF
           END-IF.
      
      * WRITE '</USERID>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
       1330-HDR-USER-ID-INFO-X.
           EXIT.
      /
      *--------------------
       1340-HDR-PASSW-INFO.
      *--------------------
      * WRITE '<PASSWORD>' TO THE XML
      
           MOVE WFPIM-ELMNT-USER-PASSW      TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-USER-PASSW
                                            TO L0008-XML-ELEMENT-LEN.
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
              GO TO 1340-HDR-PASSW-INFO-X
           END-IF.

      *     MOVE WGLOB-USER-ID               TO WUSEC-USER-ID.
      *     PERFORM  USEC-1000-READ
      *         THRU USEC-1000-READ-X.

      *     IF WUSEC-IO-OK
      * WRITE HEADER PASSWORD TO THE XML
              MOVE SPACES      TO L0008-XML-DATA-VALUE.
              MOVE 8           TO L0008-XML-DATA-VALUE-LEN.

              MOVE SPACES        TO WS-TXT-FLDS-TXT.
              MOVE 8             TO WS-TXT-FLDS-LEN.
              MOVE 8             TO WS-TXT-FLDS-MAX-LEN.
              MOVE ZERO          TO WS-TXT-FLDS-MIN-LEN.
              PERFORM  9200-EDIT-TXT-FLDS
                  THRU 9200-EDIT-TXT-FLDS-X.

              MOVE WS-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
                                           TO L0008-XML-DATA-VALUE.
              MOVE WS-TXT-FLDS-LEN         TO L0008-XML-DATA-VALUE-LEN.

              PERFORM  9940-APPEND-ELEMENT-VALUE
                  THRU 9940-APPEND-ELEMENT-VALUE-X.

              IF LDOCW-RETRN-ERROR
                 GO TO 1340-HDR-PASSW-INFO-X
              END-IF.
      *     END-IF.

      * WRITE '</PASSWORD>' TO THE XML

           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.

       1340-HDR-PASSW-INFO-X.
           EXIT.
      /
      *-------------------
       1350-HDR-LANG-INFO.
      *-------------------
      * WRITE '<LOCALE>' TO THE XML
      
           MOVE WFPIM-ELMNT-LOCALE          TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-LOCALE
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1350-HDR-LANG-INFO-X
           END-IF.
      
      * WRITE HEADER LANGUAGE TO THE XML
           IF  WGLOB-USER-LANG NOT = SPACES
              MOVE WGLOB-USER-LANG          TO L0008-XML-DATA-VALUE
              MOVE LENGTH OF WGLOB-USER-LANG
                                            TO L0008-XML-DATA-VALUE-LEN
      
              PERFORM  9940-APPEND-ELEMENT-VALUE
                  THRU 9940-APPEND-ELEMENT-VALUE-X
      
              IF  LDOCW-RETRN-ERROR
                 GO TO 1350-HDR-LANG-INFO-X
              END-IF
           END-IF.
      
      * WRITE '</LOCALE>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
       1350-HDR-LANG-INFO-X.
           EXIT.
      
      
      *------------------
       1360-HDR-COMP-INFO.
      *------------------
      * WRITE '<COMPANY>' TO THE XML
      
           MOVE WFPIM-ELMNT-COMPANY         TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-COMPANY
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1360-HDR-COMP-INFO-X
           END-IF.
      
      * WRITE HEADER COMPANY TO THE XML
           IF  WGLOB-COMPANY-CODE NOT = SPACES
              MOVE WGLOB-COMPANY-CODE       TO L0008-XML-DATA-VALUE
              MOVE LENGTH OF WGLOB-COMPANY-CODE
                                            TO L0008-XML-DATA-VALUE-LEN
      
              PERFORM  9940-APPEND-ELEMENT-VALUE
                  THRU 9940-APPEND-ELEMENT-VALUE-X
      
              IF LDOCW-RETRN-ERROR
                 GO TO 1360-HDR-COMP-INFO-X
              END-IF
           END-IF.
      
      * WRITE '</COMPANY>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
      
       1360-HDR-COMP-INFO-X.
           EXIT.
      /
      *----------------------
       1400-GEN-MESSAGE-AUTH.
      *----------------------
      * WRITE '<CONNECTIONTIMEOUT>' TO THE XML
      
           PERFORM  1420-HDR-CONN-TIMEOUT-INFO
               THRU 1420-HDR-CONN-TIMEOUT-INFO-X.
      
       1400-GEN-MESSAGE-AUTH-X.
           EXIT.
      /
      *---------------------------
       1420-HDR-CONN-TIMEOUT-INFO.
      *---------------------------
      * WRITE '<CONNECTIONTIMEOUT>' TO THE XML

           MOVE WFPIM-ELMNT-CONN-TIME      TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-CONN-TIME
                                           TO L0008-XML-ELEMENT-LEN.

           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.

           IF  LDOCW-RETRN-ERROR
               GO TO 1420-HDR-CONN-TIMEOUT-INFO-X
           END-IF.

      * WRITE HEADER CONNECTION TIMEOUT INFO TO THE XML


           IF WGLOB-ENVRMNT-GUI
              SET WS-PFC-VALUE-TIME-SHORT   TO TRUE
           ELSE
              SET WS-PFC-VALUE-TIME-LONG    TO TRUE
           END-IF.
      
           MOVE WS-PFC-VALUE-TIME-CD        TO L0008-XML-DATA-VALUE.
           MOVE LENGTH OF WS-PFC-VALUE-TIME-CD
                                            TO L0008-XML-DATA-VALUE-LEN.
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 1420-HDR-CONN-TIMEOUT-INFO-X
           END-IF.
      
      * WRITE '</CONNECTIONTIMEOUT>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
       1420-HDR-CONN-TIMEOUT-INFO-X.
           EXIT.
      /
      *---------------
       2000-STRT-NODE.
      *---------------
      * ADDING START NODE FOR XML DOCUMENT WITHOUT DOCUMENT ID

           IF LDOCW-DOC-ID = SPACES
              IF LBUFR-BUFFER-LEN > WS-BUFFER-MAX
                 PERFORM  9100-OUTPUT-BUFFER
                     THRU 9100-OUTPUT-BUFFER-X

                 IF LDOCW-RETRN-ERROR
                    GO TO 2000-STRT-NODE-X
                 END-IF
              END-IF
              MOVE LDOCW-TOKEN-ID          TO L0008-XML-ELEMENT
              MOVE WS-TOKEN-ID-LEN         TO L0008-XML-ELEMENT-LEN

              PERFORM  9910-APPEND-START-TAG
                  THRU 9910-APPEND-START-TAG-X

              GO TO 2000-STRT-NODE-X
           END-IF.

      * THE 'DOCUMENT EXTENSION' RELATIONSHIP IS TO BE TREATED
      * DIFFERENTLY.  ANY TOKENS HUNG OFF THIS RELATIONSHIP WILL
      * APPEAR AS THOUGH THEY BELONG DIRECTLY UNDER THE DOCUMENT
      * NODE, SO WE DON'T NEED TO DO ANYTHING HERE.

           IF LDOCW-DBSRL-ID = '9999'
               GO TO 2000-STRT-NODE-X
           END-IF.

      * CHECK IF THE BUFFER IS FULL
      
           IF  LBUFR-BUFFER-LEN > WS-BUFFER-MAX
               PERFORM  9100-OUTPUT-BUFFER
                   THRU 9100-OUTPUT-BUFFER-X
      
               IF LDOCW-RETRN-ERROR
                   GO TO 2000-STRT-NODE-X
               END-IF
           END-IF.
      
      * GET THE PARENT AND CHILD KEY DETAILS FROM THE DOCS INFO.
      
           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.
      
           MOVE LDOCW-DOCSTC-ID             TO L2566-DOCSTC-ID.
           MOVE LDOCW-DBSRL-ID              TO L2566-DBSRL-ID.
      
           PERFORM  2566-5000-GET-DOCS-BY-KEY
               THRU 2566-5000-GET-DOCS-BY-KEY-X.
      
           IF  L2566-RETRN-ERROR
               SET LDOCW-RETRN-ERROR        TO TRUE
               GO TO 2000-STRT-NODE-X
           END-IF.
      
      * WRITE '<' FOLLOWED BY LDOCW-DBSRL-ID, TRANSLATED FROM XTAB,
      * EDITED TO REMOVE SPACES, TO THE XML
      
      * THE FOLLOWING CODE, UNTIL THE LINE MARKED '...HERE' WILL
      * PROBABLY BE RELACED WITH SOMETHING THAT EITHER USES AN
      * EXTENDED VALUE OF LDOCW-DBSRL-ID OR ONE DERIVED FROM A NEW
      * FIELD, READ DIRECTLY OFF THE DBRL TABLE.  USING THE 'EDITED'
      * XTAB VALUES WAS NEVER A GOOD IDEA...
      
           MOVE 'DBRID'                     TO WXTAB-ETBL-TYP-ID.
           MOVE LDOCW-DBSRL-ID              TO WXTAB-ETBL-VALU-ID.
           MOVE WFPIM-EDIT-LANG-CD          TO WXTAB-ETBL-LANG-CD.
      
           PERFORM  XTAB-1000-READ
               THRU XTAB-1000-READ-X.
      
           IF  WXTAB-IO-OK
               MOVE RXTAB-ETBL-DESC-TXT     TO WS-ETBL-DESC-TXT
           ELSE				    
               MOVE WXTAB-ETBL-VALU-ID      TO WS-ETBL-DESC-TXT
           END-IF.
      
      * REMOVE TRAILING SPACES
      
           MOVE SPACES                      TO WS-ETBL-DESC-TMP-TXT.
      
           PERFORM
               VARYING WS-ETBL-DESC-LEN
               FROM LENGTH OF WS-ETBL-DESC-TXT BY -1
               UNTIL WS-ETBL-DESC-TXT (WS-ETBL-DESC-LEN:1) NOT = SPACE
                  OR WS-ETBL-DESC-LEN = 1
               CONTINUE
           END-PERFORM.
      
      * REMOVE UNSUITABLE XML CHARACTERS
      
           MOVE ZERO                        TO J.
      
           PERFORM
               VARYING I FROM 1 BY +1
               UNTIL I > WS-ETBL-DESC-LEN
      
               MOVE WS-ETBL-DESC-TXT (I:1)  TO WS-XML-NAME-CHAR
      
               IF WS-XML-NAME-CHAR-VALID
                   ADD +1 TO J END-ADD
                   MOVE WS-XML-NAME-CHAR    TO WS-ETBL-DESC-TXT (J:1)
               END-IF
      
           END-PERFORM.
      
           MOVE J                           TO WS-ETBL-DESC-LEN.
           MOVE WS-ETBL-DESC-TXT (1:J)      TO WS-ETBL-DESC-TMP-TXT.
           MOVE WS-ETBL-DESC-TMP-TXT        TO WS-ETBL-DESC-TXT.
      
           MOVE WS-ETBL-DESC-TXT            TO L0008-XML-ELEMENT.
           MOVE WS-ETBL-DESC-LEN            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 2000-STRT-NODE-X
           END-IF.
      
       2000-STRT-NODE-X.
           EXIT.
      /
      *----------------
       3000-WRIT-TOKEN.
      *----------------
      
      * CHECK IF THE BUFFER IS FULL
      
           IF  LBUFR-BUFFER-LEN > WS-BUFFER-MAX
               PERFORM  9100-OUTPUT-BUFFER
                   THRU 9100-OUTPUT-BUFFER-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3000-WRIT-TOKEN-X
               END-IF
           END-IF.
      
      * THIS SHOULDN'T BE CALLED FOR 'DBRL' TOKENS, THIS TYPE
      * ONLY EXISTS FOR SCHEMA GENERATION.

           IF LDOCW-DATA-TYP-DBRL
               SET LDOCW-RETRN-INVALID-REQUEST TO TRUE
               MOVE 'XS25520002'         TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

      * FOR 'INFO' TYPE TOKENS, SEE IF WE NEED TO WRITE THE END TAG
      * INSTEAD OF WHAT FOLLOWS.

           IF LDOCW-DATA-TYP-INFO
           OR LDOCW-DATA-TYP-KEY
               IF LDOCW-INFO-FLDS-END
                   PERFORM  3400-INFO-FLDS-END
                       THRU 3400-INFO-FLDS-END-X

                   GO TO 3000-WRIT-TOKEN-X
               END-IF
           END-IF.

      * WRITE '<' FOLLOWED BY LDOCW-TOKEN-ID TO THE XML
      *
      *    MOVE LDOCW-TOKEN-ID             TO L0008-XML-ELEMENT.
      *    MOVE WS-TOKEN-ID-LEN            TO L0008-XML-ELEMENT-LEN.
      *    SET WS-ENTITY-NOT-SUPPORTED     TO TRUE.
      *
      *    PERFORM  9910-APPEND-START-TAG
      *        THRU 9910-APPEND-START-TAG-X.
      *
      *    IF  LDOCW-RETRN-ERROR
      *        GO TO 3000-WRIT-TOKEN-X
      *    END-IF.

      
      * EDIT THE TOKEN VALUE
      
      * ALSO, HERE WE WILL FINALLY DETERMINE THAT A VALID REQUEST HAS
      * BEEN MADE
      
           EVALUATE TRUE
      
               WHEN LDOCW-DATA-TYP-AGE
               WHEN LDOCW-DATA-TYP-CTR
               WHEN LDOCW-DATA-TYP-DUR
               WHEN LDOCW-DATA-TYP-FCT
               WHEN LDOCW-DATA-TYP-HT
               WHEN LDOCW-DATA-TYP-LEN
               WHEN LDOCW-DATA-TYP-NUM
               WHEN LDOCW-DATA-TYP-PCT
               WHEN LDOCW-DATA-TYP-QTY
               WHEN LDOCW-DATA-TYP-RT
               WHEN LDOCW-DATA-TYP-WGT
                   PERFORM  3050-AMT-FLDS-TOKEN
                       THRU 3050-AMT-FLDS-TOKEN-X
      
               WHEN LDOCW-DATA-TYP-AMT
                   PERFORM  3450-AMT-TOKEN
                       THRU 3450-AMT-TOKEN-X

               WHEN LDOCW-DATA-TYP-DMAV
                   MOVE LDOCW-DM-AV-TBL-CD TO WS-DM-AV-TBL-CD
                   MOVE LDOCW-DM-AV-CD     TO WS-DM-AV-CD
                   MOVE LDOCW-DM-AV-CD-LEN TO WS-DM-AV-CD-LEN

                   PERFORM  3300-DMAV-FLDS-TOKEN
                       THRU 3300-DMAV-FLDS-TOKEN-X
      
               WHEN LDOCW-DATA-TYP-DT
               WHEN LDOCW-DATA-TYP-IDT-NUM
               WHEN LDOCW-DATA-TYP-DY
               WHEN LDOCW-DATA-TYP-MO
               WHEN LDOCW-DATA-TYP-YR
                   PERFORM  3150-DT-FLDS-TOKEN
                       THRU 3150-DT-FLDS-TOKEN-X

               WHEN LDOCW-DATA-TYP-EDIT
                   MOVE LDOCW-ETBL-TYP-ID   TO WS-ETBL-TYP-ID
                   MOVE LDOCW-ETBL-VALU-ID  TO WS-ETBL-VALU-ID
                   MOVE LDOCW-ETBL-VALU-ID-LEN
                                            TO WS-ETBL-VALU-ID-LEN
      
                   PERFORM  3250-EDIT-FLDS-TOKEN
                       THRU 3250-EDIT-FLDS-TOKEN-X

               WHEN LDOCW-DATA-TYP-HR
               WHEN LDOCW-DATA-TYP-MI
               WHEN LDOCW-DATA-TYP-SEC
               WHEN LDOCW-DATA-TYP-TIME
                   PERFORM  3200-TIME-FLDS-TOKEN
                       THRU 3200-TIME-FLDS-TOKEN-X

               WHEN LDOCW-DATA-TYP-ID
               WHEN LDOCW-DATA-TYP-NM
               WHEN LDOCW-DATA-TYP-TXT
039177             SET WS-ENTITY-SUPPORTED TO TRUE
                   PERFORM  3100-TXT-FLDS-TOKEN
                       THRU 3100-TXT-FLDS-TOKEN-X
      
               WHEN LDOCW-DATA-TYP-IND
                   PERFORM  3550-IND-TOKEN
                       THRU 3550-IND-TOKEN-X
      
               WHEN LDOCW-DATA-TYP-TS
                   PERFORM  3500-TS-TOKEN
                       THRU 3500-TS-TOKEN-X
      
               WHEN LDOCW-DATA-TYP-XTAB
                   MOVE LDOCW-ETBL-TYP-ID   TO WS-ETBL-TYP-ID
                   MOVE LDOCW-ETBL-VALU-ID  TO WS-ETBL-VALU-ID
                   MOVE LDOCW-ETBL-VALU-ID-LEN
                                            TO WS-ETBL-VALU-ID-LEN
      
                   PERFORM  3350-XTAB-FLDS-TOKEN
                       THRU 3350-XTAB-FLDS-TOKEN-X
      
               WHEN OTHER
                   SET LDOCW-RETRN-INVALID-REQUEST TO TRUE
035753             MOVE 'XS25520003'         TO WGLOB-MSG-REF-INFO
035753             PERFORM  0260-1000-GENERATE-MESSAGE
035753                 THRU 0260-1000-GENERATE-MESSAGE-X
                   PERFORM  0030-5000-LOGIC-ERROR
                       THRU 0030-5000-LOGIC-ERROR-X

           END-EVALUATE.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3000-WRIT-TOKEN-X
           END-IF.

      * WRITE '</', LDOCW-TOKEN-ID AND '>' TO THE XML
      *
      *    PERFORM  9920-APPEND-END-TAG
      *        THRU 9920-APPEND-END-TAG-X.
      *
      *    IF  LDOCW-RETRN-ERROR
      *        GO TO 3000-WRIT-TOKEN-X
      *    END-IF.

       3000-WRIT-TOKEN-X.
           EXIT.
      
      *--------------------
       3050-AMT-FLDS-TOKEN.
      *--------------------
      
      * WRITE L0290-OUTPUT-DATA (1:WS-AMT-FLDS-LEN) TO THE XML
      
           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.
      
           MOVE LDOCW-AMT-FLDS-V0-AMT       TO L0290-INPUT-NUMBER.
           MOVE LDOCW-AMT-FLDS-SIGN-IND     TO L0290-SIGN-IND.
           MOVE LDOCW-AMT-FLDS-PRECSN-NUM   TO L0290-MAX-OUT-LEN.
           IF  LDOCW-AMT-FLDS-SIGN
               ADD +1 TO L0290-MAX-OUT-LEN
           END-IF.
           IF LDOCW-AMT-FLDS-SCALE-NUM > ZERO
               ADD +1 TO L0290-MAX-OUT-LEN END-ADD
           END-IF.
           MOVE LDOCW-AMT-FLDS-SCALE-NUM    TO L0290-PRECISION.
      
           PERFORM  9150-EDIT-AMT-FLDS
               THRU 9150-EDIT-AMT-FLDS-X.
      
           MOVE L0290-OUTPUT-DATA (1:WS-AMT-FLDS-LEN)
                                            TO L0008-XML-DATA-VALUE.
           MOVE WS-AMT-FLDS-LEN             TO L0008-XML-DATA-VALUE-LEN.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3050-AMT-FLDS-TOKEN-X
           END-IF.
      
       3050-AMT-FLDS-TOKEN-X.
           EXIT.
      
      *--------------------
       3100-TXT-FLDS-TOKEN.
      *--------------------
      
      * WRITE LDOCW-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN) TO THE XML
      
           MOVE LDOCW-TXT-FLDS-LEN          TO WS-TXT-FLDS-LEN.
           MOVE LDOCW-TXT-FLDS-MIN-LEN      TO WS-TXT-FLDS-MIN-LEN.
           MOVE LDOCW-TXT-FLDS-MAX-LEN      TO WS-TXT-FLDS-MAX-LEN.
           MOVE LDOCW-TXT-FLDS-TXT          TO WS-TXT-FLDS-TXT.
      
           PERFORM  9200-EDIT-TXT-FLDS
               THRU 9200-EDIT-TXT-FLDS-X.
      
           MOVE LDOCW-TXT-FLDS-TXT (1:WS-TXT-FLDS-LEN)
                                            TO L0008-XML-DATA-VALUE.
           MOVE WS-TXT-FLDS-LEN             TO L0008-XML-DATA-VALUE-LEN.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3100-TXT-FLDS-TOKEN-X
           END-IF.
      
       3100-TXT-FLDS-TOKEN-X.
           EXIT.
      
      *-------------------
       3150-DT-FLDS-TOKEN.
      *-------------------
      
           EVALUATE TRUE
      
               WHEN LDOCW-DATA-TYP-DT
               WHEN LDOCW-DATA-TYP-IDT-NUM
      
      * WRITE L1640-EXTERNAL-DATE TO THE XML
      
                   IF  LDOCW-DATA-TYP-IDT-NUM
                       MOVE LDOCW-IDT-NUM   TO L1660-INVERTED-DATE
      
                       PERFORM  1660-3000-CONVERT-INV-TO-INT
                           THRU 1660-3000-CONVERT-INV-TO-INT-X
      
                       MOVE L1660-INTERNAL-DATE
                                            TO L1640-INTERNAL-DATE
                   ELSE
                       MOVE LDOCW-DT-FLDS-DT
                                            TO L1640-INTERNAL-DATE
                   END-IF
      
                   PERFORM  1640-8000-INTERNAL-TO-MIR
                       THRU 1640-8000-INTERNAL-TO-MIR-X
      
                   MOVE L1640-EXTERNAL-DATE
                                            TO L0008-XML-DATA-VALUE
                   MOVE LENGTH OF L1640-EXTERNAL-DATE
                                            TO L0008-XML-DATA-VALUE-LEN
      
               WHEN LDOCW-DATA-TYP-DY
      
      * WRITE '---' PLUS LDOCW-DT-FLDS-DY TO THE XML
      
                   MOVE '---'               TO WS-DT-FLDS-DY-SEP-1
                   MOVE LDOCW-DT-FLDS-DY    TO WS-DT-FLDS-DY-DY
                   MOVE WS-DT-FLDS-DY       TO L0008-XML-DATA-VALUE
                   MOVE LENGTH OF WS-DT-FLDS-DY
                                            TO L0008-XML-DATA-VALUE-LEN
      
               WHEN LDOCW-DATA-TYP-MO
      
      * WRITE '--', LDOCW-DT-FLDS-MO AND '--' TO THE XML
      
                   MOVE '--'                TO WS-DT-FLDS-MO-SEP-1
                   MOVE LDOCW-DT-FLDS-MO    TO WS-DT-FLDS-MO-MO
                   MOVE '--'                TO WS-DT-FLDS-MO-SEP-2
                   MOVE WS-DT-FLDS-MO       TO L0008-XML-DATA-VALUE
                   MOVE LENGTH OF WS-DT-FLDS-MO
                                           TO L0008-XML-DATA-VALUE-LEN
      
               WHEN LDOCW-DATA-TYP-YR
      
      * WRITE LDOCW-DT-FLDS-YR TO THE XML
      
                   MOVE LDOCW-DT-FLDS-YR    TO WS-DT-FLDS-YR-YR
                   MOVE WS-DT-FLDS-YR       TO L0008-XML-DATA-VALUE
                   MOVE LENGTH OF WS-DT-FLDS-YR
                                            TO L0008-XML-DATA-VALUE-LEN
      
           END-EVALUATE.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3150-DT-FLDS-TOKEN-X
           END-IF.
      
       3150-DT-FLDS-TOKEN-X.
           EXIT.
      
      *---------------------
       3200-TIME-FLDS-TOKEN.
      *---------------------
      
           MOVE LDOCW-TIME-FLDS-TIME        TO WS-TIME-FLDS-TIME.
      
           PERFORM  9300-EDIT-TIME-FLDS
               THRU 9300-EDIT-TIME-FLDS-X.
      
           EVALUATE TRUE
      
               WHEN LDOCW-DATA-TYP-HR
      
      * WRITE WS-TIME-FLDS-HR TO THE XML
      
                   MOVE WS-TIME-FLDS-HR     TO L0008-XML-DATA-VALUE
                   MOVE LENGTH OF WS-TIME-FLDS-HR
                                            TO L0008-XML-DATA-VALUE-LEN
      
               WHEN LDOCW-DATA-TYP-MI
      
      * WRITE WS-TIME-FLDS-MI TO THE XML
      
                   MOVE WS-TIME-FLDS-MI     TO L0008-XML-DATA-VALUE
                   MOVE LENGTH OF WS-TIME-FLDS-MI
                                            TO L0008-XML-DATA-VALUE-LEN
      
               WHEN LDOCW-DATA-TYP-SEC
      
      * WRITE WS-TIME-FLDS-SEC TO THE XML
      
                   MOVE WS-TIME-FLDS-SEC    TO L0008-XML-DATA-VALUE
                   MOVE LENGTH OF WS-TIME-FLDS-SEC
                                            TO L0008-XML-DATA-VALUE-LEN
      
               WHEN LDOCW-DATA-TYP-TIME
      
      * WRITE WS-TIME-FLDS-TIME TO THE XML
      
                   MOVE WS-TIME-FLDS-TIME   TO L0008-XML-DATA-VALUE
                   MOVE LENGTH OF WS-TIME-FLDS-TIME
                                            TO L0008-XML-DATA-VALUE-LEN
      
           END-EVALUATE.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3200-TIME-FLDS-TOKEN-X
           END-IF.
      
       3200-TIME-FLDS-TOKEN-X.
           EXIT.
      
      *---------------------
       3250-EDIT-FLDS-TOKEN.
      *---------------------
      
      * ESTABLISH WHETHER A SIMPLE OR COMPLEX XML STRUCTURE IS REQUIRED
      
           EVALUATE TRUE
      
               WHEN WFPIM-EDIT-ETBL-VALU-ID-ONLY
                   PERFORM  3275-EDIT-ETBL-VALU-ID
                       THRU 3275-EDIT-ETBL-VALU-ID-X
                   GO TO 3250-EDIT-FLDS-TOKEN-X
      
               WHEN WFPIM-EDIT-ETBL-DESC-TXT-ONLY
                   PERFORM  3285-EDIT-ETBL-DESC-TXT
                       THRU 3285-EDIT-ETBL-DESC-TXT-X
                   GO TO 3250-EDIT-FLDS-TOKEN-X
      
           END-EVALUATE.
      
      * WRITE '<ETBLTYPID...' TO THE XML
      
           IF WFPIM-EDIT-ETBL-TYP-ID-YES
               PERFORM  3260-EDIT-ETBL-TYP-ID
                   THRU 3260-EDIT-ETBL-TYP-ID-X
      
               IF LDOCW-RETRN-ERROR
                   GO TO 3250-EDIT-FLDS-TOKEN-X
               END-IF
           END-IF.
      
      * WRITE '<ETBLVALUID...' TO THE XML
      
           IF  WFPIM-EDIT-ETBL-VALU-ID-YES
               PERFORM  3270-EDIT-ETBL-VALU-ID
                   THRU 3270-EDIT-ETBL-VALU-ID-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3250-EDIT-FLDS-TOKEN-X
               END-IF
           END-IF.
      
      * WRITE '<ETBLDESCTXT...' TO THE XML
      
           IF  WFPIM-EDIT-ETBL-DESC-TXT-YES
               PERFORM  3280-EDIT-ETBL-DESC-TXT
                   THRU 3280-EDIT-ETBL-DESC-TXT-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3250-EDIT-FLDS-TOKEN-X
               END-IF
           END-IF.
      
       3250-EDIT-FLDS-TOKEN-X.
           EXIT.
      
      *----------------------
       3260-EDIT-ETBL-TYP-ID.
      *----------------------
      
      * WRITE '<ETBLTYPID>' TO THE XML
      
           MOVE WFPIM-ELMNT-ETBL-TYP-ID     TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-ETBL-TYP-ID
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3260-EDIT-ETBL-TYP-ID-X
           END-IF.
      
      * WRITE WS-ETBL-TYP-ID TO THE XML
      
           PERFORM
               VARYING L0008-XML-DATA-VALUE-LEN
               FROM LENGTH OF WS-ETBL-TYP-ID BY -1
               UNTIL WS-ETBL-TYP-ID (L0008-XML-DATA-VALUE-LEN:1)
                     NOT = SPACE
                  OR L0008-XML-DATA-VALUE-LEN = 1
               CONTINUE
           END-PERFORM.
      
           MOVE WS-ETBL-TYP-ID (1:L0008-XML-DATA-VALUE-LEN)
                                            TO L0008-XML-DATA-VALUE.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3260-EDIT-ETBL-TYP-ID-X
           END-IF.
      
      * WRITE '</ETBLTYPID>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3260-EDIT-ETBL-TYP-ID-X
           END-IF.
      
       3260-EDIT-ETBL-TYP-ID-X.
           EXIT.
      
      *-----------------------
       3270-EDIT-ETBL-VALU-ID.
      *-----------------------
      
      * WRITE '<ETBLVALUID>' TO THE XML
      
           MOVE WFPIM-ELMNT-ETBL-VALU-ID    TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-ETBL-VALU-ID
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3270-EDIT-ETBL-VALU-ID-X
           END-IF.
      
      * WRITE WS-ETBL-VALU-ID TO THE XML
      
           PERFORM  3275-EDIT-ETBL-VALU-ID
               THRU 3275-EDIT-ETBL-VALU-ID-X.
      
           IF LDOCW-RETRN-ERROR
               GO TO 3270-EDIT-ETBL-VALU-ID-X
           END-IF.
      
      * WRITE '</ETBLVALUID>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3270-EDIT-ETBL-VALU-ID-X
           END-IF.
      
       3270-EDIT-ETBL-VALU-ID-X.
           EXIT.
      
      *-----------------------
       3275-EDIT-ETBL-VALU-ID.
      *-----------------------
      
           MOVE WS-ETBL-VALU-ID (1:WS-ETBL-VALU-ID-LEN)
                                            TO L0008-XML-DATA-VALUE.
           MOVE WS-ETBL-VALU-ID-LEN         TO L0008-XML-DATA-VALUE-LEN.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3275-EDIT-ETBL-VALU-ID-X
           END-IF.
      
       3275-EDIT-ETBL-VALU-ID-X.
           EXIT.
      
      *------------------------
       3280-EDIT-ETBL-DESC-TXT.
      *------------------------
      
      * WRITE '<ETBLDESCTXT>' TO THE XML
      
           MOVE WFPIM-ELMNT-ETBL-DESC-TXT   TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-ETBL-DESC-TXT
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3280-EDIT-ETBL-DESC-TXT-X
           END-IF.
      
           PERFORM  3285-EDIT-ETBL-DESC-TXT
               THRU 3285-EDIT-ETBL-DESC-TXT-X.
      
           IF LDOCW-RETRN-ERROR
               GO TO 3280-EDIT-ETBL-DESC-TXT-X
           END-IF.
      
      * WRITE '</ETBLDESCTXT>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3280-EDIT-ETBL-DESC-TXT-X
           END-IF.
      
       3280-EDIT-ETBL-DESC-TXT-X.
           EXIT.
      
      *------------------------
       3285-EDIT-ETBL-DESC-TXT.
      *------------------------
      
      * WRITE REDIT-ETBL-DESC-TXT TO THE XML

           MOVE WS-ETBL-TYP-ID             TO WEDIT-ETBL-TYP-ID.
           MOVE WS-ETBL-VALU-ID            TO WEDIT-ETBL-VALU-ID.

      *    IF RPRTX-TRNXT-LANG-CD = SPACES
               MOVE WGLOB-EDIT-LANG        TO WEDIT-ETBL-LANG-CD.
      *    ELSE
      *        MOVE RPRTX-TRNXT-LANG-CD    TO WEDIT-ETBL-LANG-CD
      *    END-IF.

           PERFORM  EDIT-1000-READ
               THRU EDIT-1000-READ-X.
      
           IF WEDIT-IO-OK
               PERFORM
                   VARYING I
                   FROM LENGTH OF REDIT-ETBL-DESC-TXT BY -1
                   UNTIL REDIT-ETBL-DESC-TXT (I:1) NOT = SPACE
                      OR I = 1
                   CONTINUE
               END-PERFORM
      
               MOVE REDIT-ETBL-DESC-TXT (1:I)
                                            TO L0008-XML-DATA-VALUE
               MOVE I                       TO L0008-XML-DATA-VALUE-LEN
      
               SET L0008-ENTITY-SUPPORTED   TO TRUE
               PERFORM  9940-APPEND-ELEMENT-VALUE
                   THRU 9940-APPEND-ELEMENT-VALUE-X
               IF  LDOCW-RETRN-ERROR
                   GO TO 3285-EDIT-ETBL-DESC-TXT-X
               END-IF
           END-IF.
      
       3285-EDIT-ETBL-DESC-TXT-X.
           EXIT.
      
      *---------------------
       3300-DMAV-FLDS-TOKEN.
      *---------------------
      
      * ESTABLISH WHETHER A SIMPLE OR COMPLEX XML STRUCTURE IS REQUIRED
      
           EVALUATE TRUE
      
               WHEN WFPIM-DMAV-DM-AV-CD-ONLY
                   PERFORM  3325-DMAV-DM-AV-CD
                       THRU 3325-DMAV-DM-AV-CD-X
                   GO TO 3300-DMAV-FLDS-TOKEN-X
      
               WHEN WFPIM-DMAV-DM-AV-DESC-TXT-ONLY
                   PERFORM  3335-DMAV-DM-AV-DESC-TXT
                       THRU 3335-DMAV-DM-AV-DESC-TXT-X
                   GO TO 3300-DMAV-FLDS-TOKEN-X
      
           END-EVALUATE.
      
      * WRITE '<DMAVTBLID...' TO THE XML
      
           IF WFPIM-DMAV-DM-AV-TBL-CD-YES
               PERFORM  3310-DMAV-DM-AV-TBL-CD
                   THRU 3310-DMAV-DM-AV-TBL-CD-X
      
               IF LDOCW-RETRN-ERROR
                   GO TO 3300-DMAV-FLDS-TOKEN-X
               END-IF
           END-IF.
      
      * WRITE '<DMAVCD...' TO THE XML
      
           IF  WFPIM-DMAV-DM-AV-CD-YES
               PERFORM  3320-DMAV-DM-AV-CD
                   THRU 3320-DMAV-DM-AV-CD-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3300-DMAV-FLDS-TOKEN-X
               END-IF
           END-IF.
      
      * WRITE '<DMAVDESCTXT...' TO THE XML
      
           IF  WFPIM-DMAV-DM-AV-DESC-TXT-YES
               PERFORM  3330-DMAV-DM-AV-DESC-TXT
                   THRU 3330-DMAV-DM-AV-DESC-TXT-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3300-DMAV-FLDS-TOKEN-X
               END-IF
           END-IF.
      
       3300-DMAV-FLDS-TOKEN-X.
           EXIT.
      
      *-----------------------
       3310-DMAV-DM-AV-TBL-CD.
      *-----------------------
      
      * WRITE '<DMAVTBLCD>' TO THE XML
      
           MOVE WFPIM-ELMNT-DM-AV-TBL-CD    TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-DM-AV-TBL-CD
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3310-DMAV-DM-AV-TBL-CD-X
           END-IF.
      
      * WRITE WS-DM-AV-TBL-CD TO THE XML
      
           PERFORM
               VARYING L0008-XML-DATA-VALUE-LEN
               FROM LENGTH OF WS-DM-AV-TBL-CD BY -1
               UNTIL WS-DM-AV-TBL-CD (L0008-XML-DATA-VALUE-LEN:1)
                     NOT = SPACE
                  OR L0008-XML-DATA-VALUE-LEN = 1
               CONTINUE
           END-PERFORM.
      
           MOVE WS-DM-AV-TBL-CD (1:L0008-XML-DATA-VALUE-LEN)
                                            TO L0008-XML-DATA-VALUE.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3310-DMAV-DM-AV-TBL-CD-X
           END-IF.
      
      * WRITE '</DMAVTBLCD>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3310-DMAV-DM-AV-TBL-CD-X
           END-IF.
      
       3310-DMAV-DM-AV-TBL-CD-X.
           EXIT.
      
      *-------------------
       3320-DMAV-DM-AV-CD.
      *-------------------
      
      * WRITE '<DMAVCD>' TO THE XML
      
           MOVE WFPIM-ELMNT-DM-AV-CD        TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-DM-AV-CD
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3320-DMAV-DM-AV-CD-X
           END-IF.
      
           PERFORM  3325-DMAV-DM-AV-CD
               THRU 3325-DMAV-DM-AV-CD-X.
      
           IF LDOCW-RETRN-ERROR
               GO TO 3320-DMAV-DM-AV-CD-X
           END-IF.
      
      * WRITE '</DMAVCD>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3320-DMAV-DM-AV-CD-X
           END-IF.
      
       3320-DMAV-DM-AV-CD-X.
           EXIT.
      
      *-------------------
       3325-DMAV-DM-AV-CD.
      *-------------------
      
      * WRITE WS-DM-AV-CD TO THE XML
      
           MOVE WS-DM-AV-CD (1:WS-DM-AV-CD-LEN)
                                            TO L0008-XML-DATA-VALUE.
           MOVE WS-DM-AV-CD-LEN             TO L0008-XML-DATA-VALUE-LEN.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3325-DMAV-DM-AV-CD-X
           END-IF.
      
       3325-DMAV-DM-AV-CD-X.
           EXIT.
      
      *-------------------------
       3330-DMAV-DM-AV-DESC-TXT.
      *-------------------------
      
      * WRITE '<DMAVDESCTXT>' TO THE XML
      
           MOVE WFPIM-ELMNT-DM-AV-DESC-TXT  TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-DM-AV-DESC-TXT
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3330-DMAV-DM-AV-DESC-TXT-X
           END-IF.
      
           PERFORM  3335-DMAV-DM-AV-DESC-TXT
               THRU 3335-DMAV-DM-AV-DESC-TXT-X.
      
           IF LDOCW-RETRN-ERROR
               GO TO 3330-DMAV-DM-AV-DESC-TXT-X
           END-IF.
      
      * WRITE '</DMAVDESCTXT>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3330-DMAV-DM-AV-DESC-TXT-X
           END-IF.
      
       3330-DMAV-DM-AV-DESC-TXT-X.
           EXIT.
      
      *-------------------------
       3335-DMAV-DM-AV-DESC-TXT.
      *-------------------------
      
      * WRITE RDMAD-DM-AV-DESC-TXT TO THE XML

           MOVE WS-DM-AV-TBL-CD            TO WDMAD-DM-AV-TBL-CD.
           MOVE WS-DM-AV-CD                TO WDMAD-DM-AV-CD.

      *    IF RPRTX-TRNXT-LANG-CD = SPACES
               MOVE WGLOB-EDIT-LANG        TO WDMAD-DM-AV-DESC-LANG-CD.
      *    ELSE
      *        MOVE RPRTX-TRNXT-LANG-CD    TO WDMAD-DM-AV-DESC-LANG-CD
      *    END-IF.

           PERFORM  DMAD-1000-READ
               THRU DMAD-1000-READ-X.
      
           IF WDMAD-IO-OK
               PERFORM
                   VARYING I
                   FROM LENGTH OF RDMAD-DM-AV-DESC-TXT BY -1
                   UNTIL RDMAD-DM-AV-DESC-TXT (I:1) NOT = SPACE
                      OR I = 1
                   CONTINUE
               END-PERFORM
      
               MOVE RDMAD-DM-AV-DESC-TXT (1:I)
                                            TO L0008-XML-DATA-VALUE
               MOVE I                       TO L0008-XML-DATA-VALUE-LEN
      
               SET L0008-ENTITY-SUPPORTED   TO TRUE
               PERFORM  9940-APPEND-ELEMENT-VALUE
                   THRU 9940-APPEND-ELEMENT-VALUE-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3335-DMAV-DM-AV-DESC-TXT-X
               END-IF
           END-IF.
      
       3335-DMAV-DM-AV-DESC-TXT-X.
           EXIT.
      
      *---------------------
       3350-XTAB-FLDS-TOKEN.
      *---------------------
      
      * ESTABLISH WHETHER A SIMPLE OR COMPLEX XML STRUCTURE IS REQUIRED
      
           EVALUATE TRUE
      
               WHEN WFPIM-XTAB-ETBL-VALU-ID-ONLY
                   PERFORM  3375-XTAB-ETBL-VALU-ID
                       THRU 3375-XTAB-ETBL-VALU-ID-X
                   GO TO 3350-XTAB-FLDS-TOKEN-X
      
               WHEN WFPIM-XTAB-ETBL-DESC-TXT-ONLY
                   PERFORM  3385-XTAB-ETBL-DESC-TXT
                       THRU 3385-XTAB-ETBL-DESC-TXT-X
                   GO TO 3350-XTAB-FLDS-TOKEN-X
      
           END-EVALUATE.
      
      * WRITE '<ETBLTYPID...' TO THE XML
      
           IF WFPIM-XTAB-ETBL-TYP-ID-YES
               PERFORM  3360-XTAB-ETBL-TYP-ID
                   THRU 3360-XTAB-ETBL-TYP-ID-X
      
               IF LDOCW-RETRN-ERROR
                   GO TO 3350-XTAB-FLDS-TOKEN-X
               END-IF
           END-IF.
      
      * WRITE '<ETBLVALUID...' TO THE XML
      
           IF  WFPIM-XTAB-ETBL-VALU-ID-YES
               PERFORM  3370-XTAB-ETBL-VALU-ID
                   THRU 3370-XTAB-ETBL-VALU-ID-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3350-XTAB-FLDS-TOKEN-X
               END-IF
           END-IF.
      
      * WRITE '<ETBLDESCTXT...' TO THE XML
      
           IF  WFPIM-XTAB-ETBL-DESC-TXT-YES
               PERFORM  3380-XTAB-ETBL-DESC-TXT
                   THRU 3380-XTAB-ETBL-DESC-TXT-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3350-XTAB-FLDS-TOKEN-X
               END-IF
           END-IF.
      
       3350-XTAB-FLDS-TOKEN-X.
           EXIT.
      
      *----------------------
       3360-XTAB-ETBL-TYP-ID.
      *----------------------
      
      * WRITE '<ETBLTYPID>' TO THE XML
      
           MOVE WFPIM-ELMNT-ETBL-TYP-ID     TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-ETBL-TYP-ID
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3360-XTAB-ETBL-TYP-ID-X
           END-IF.
      
      * WRITE WS-ETBL-TYP-ID TO THE XML
      
           PERFORM
               VARYING L0008-XML-DATA-VALUE-LEN
               FROM LENGTH OF WS-ETBL-TYP-ID BY -1
               UNTIL WS-ETBL-TYP-ID (L0008-XML-DATA-VALUE-LEN:1)
                     NOT = SPACE
                  OR L0008-XML-DATA-VALUE-LEN = 1
               CONTINUE
           END-PERFORM.
      
           MOVE WS-ETBL-TYP-ID (1:L0008-XML-DATA-VALUE-LEN)
                                            TO L0008-XML-DATA-VALUE.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3360-XTAB-ETBL-TYP-ID-X
           END-IF.
      
      * WRITE '</ETBLTYPID>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3360-XTAB-ETBL-TYP-ID-X
           END-IF.
      
       3360-XTAB-ETBL-TYP-ID-X.
           EXIT.
      
      *-----------------------
       3370-XTAB-ETBL-VALU-ID.
      *-----------------------
      
      * WRITE '<ETBLVALUID>' TO THE XML
      
           MOVE WFPIM-ELMNT-ETBL-VALU-ID    TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-ETBL-VALU-ID
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3370-XTAB-ETBL-VALU-ID-X
           END-IF.
      
           PERFORM  3375-XTAB-ETBL-VALU-ID
               THRU 3375-XTAB-ETBL-VALU-ID-X.
      
           IF LDOCW-RETRN-ERROR
               GO TO 3370-XTAB-ETBL-VALU-ID-X
           END-IF.
      
      * WRITE '</ETBLVALUID>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3370-XTAB-ETBL-VALU-ID-X
           END-IF.
      
       3370-XTAB-ETBL-VALU-ID-X.
           EXIT.
      
      *-----------------------
       3375-XTAB-ETBL-VALU-ID.
      *-----------------------
      
      * WRITE WS-ETBL-VALU-ID TO THE XML
      
           MOVE WS-ETBL-VALU-ID (1:WS-ETBL-VALU-ID-LEN)
                                            TO L0008-XML-DATA-VALUE.
           MOVE WS-ETBL-VALU-ID-LEN         TO L0008-XML-DATA-VALUE-LEN.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3375-XTAB-ETBL-VALU-ID-X
           END-IF.
      
       3375-XTAB-ETBL-VALU-ID-X.
           EXIT.
      
      *------------------------
       3380-XTAB-ETBL-DESC-TXT.
      *------------------------
      
      * WRITE '<ETBLDESCTXT>' TO THE XML
      
           MOVE WFPIM-ELMNT-ETBL-DESC-TXT   TO L0008-XML-ELEMENT.
           MOVE LENGTH OF WFPIM-ELMNT-ETBL-DESC-TXT
                                            TO L0008-XML-ELEMENT-LEN.
      
           PERFORM  9910-APPEND-START-TAG
               THRU 9910-APPEND-START-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3380-XTAB-ETBL-DESC-TXT-X
           END-IF.
      
           PERFORM  3385-XTAB-ETBL-DESC-TXT
               THRU 3385-XTAB-ETBL-DESC-TXT-X.
      
           IF LDOCW-RETRN-ERROR
               GO TO 3380-XTAB-ETBL-DESC-TXT-X
           END-IF.
      
      * WRITE '</ETBLDESCTXT>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3380-XTAB-ETBL-DESC-TXT-X
           END-IF.
      
       3380-XTAB-ETBL-DESC-TXT-X.
           EXIT.
      
      *------------------------
       3385-XTAB-ETBL-DESC-TXT.
      *------------------------
      
      * WRITE RXTAB-ETBL-DESC-TXT TO THE XML

           MOVE WS-ETBL-TYP-ID             TO WXTAB-ETBL-TYP-ID.
           MOVE WS-ETBL-VALU-ID            TO WXTAB-ETBL-VALU-ID.

      *    IF RPRTX-TRNXT-LANG-CD = SPACES
               MOVE WGLOB-EDIT-LANG        TO WXTAB-ETBL-LANG-CD.
      *    ELSE
      *        MOVE RPRTX-TRNXT-LANG-CD    TO WXTAB-ETBL-LANG-CD
      *    END-IF.

           PERFORM  XTAB-1000-READ
               THRU XTAB-1000-READ-X.
      
           IF  WXTAB-IO-OK
               PERFORM
                   VARYING I
                   FROM LENGTH OF RXTAB-ETBL-DESC-TXT BY -1
                   UNTIL RXTAB-ETBL-DESC-TXT (I:1) NOT = SPACE
                      OR I = 1
                   CONTINUE
               END-PERFORM
      
               MOVE RXTAB-ETBL-DESC-TXT (1:I)
                                            TO L0008-XML-DATA-VALUE
               MOVE I                       TO L0008-XML-DATA-VALUE-LEN
      
               SET L0008-ENTITY-SUPPORTED   TO TRUE
               PERFORM  9940-APPEND-ELEMENT-VALUE
                   THRU 9940-APPEND-ELEMENT-VALUE-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3385-XTAB-ETBL-DESC-TXT-X
               END-IF
           END-IF.
      
       3385-XTAB-ETBL-DESC-TXT-X.
           EXIT.
      
      *-------------------
       3400-INFO-FLDS-END.
      *-------------------
      
      * WRITE '</', THE EDITED LDOCW-TOKEN-ID AND '>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3400-INFO-FLDS-END-X
           END-IF.
      
       3400-INFO-FLDS-END-X.
           EXIT.
      
      *---------------
       3450-AMT-TOKEN.
      *---------------
      
           IF WFPIM-CRCY-CD-YES
      
      * WRITE '<CRCYCD>' TO THE XML
      
               MOVE WFPIM-ELMNT-CRCY-CD     TO L0008-XML-ELEMENT
               MOVE LENGTH OF WFPIM-ELMNT-CRCY-CD
                                            TO L0008-XML-ELEMENT-LEN
      
               PERFORM  9910-APPEND-START-TAG
                   THRU 9910-APPEND-START-TAG-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3450-AMT-TOKEN-X
               END-IF
      
      * WRITE LDOCW-AMT-CRCY-CD TO THE XML
      
               MOVE LDOCW-AMT-CRCY-CD       TO L0008-XML-DATA-VALUE
               MOVE LENGTH OF LDOCW-AMT-CRCY-CD
                                            TO L0008-XML-DATA-VALUE-LEN
      
               PERFORM  9940-APPEND-ELEMENT-VALUE
                   THRU 9940-APPEND-ELEMENT-VALUE-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3450-AMT-TOKEN-X
               END-IF
      
      * WRITE '</CRCYCD>' TO THE XML
      
               PERFORM  9920-APPEND-END-TAG
                   THRU 9920-APPEND-END-TAG-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3450-AMT-TOKEN-X
               END-IF
      
      * WRITE '<CRCYAMT>' TO THE XML
      
               MOVE WFPIM-ELMNT-CRCY-AMT    TO L0008-XML-ELEMENT
               MOVE LENGTH OF WFPIM-ELMNT-CRCY-AMT
                                            TO L0008-XML-ELEMENT-LEN
      
               PERFORM  9910-APPEND-START-TAG
                   THRU 9910-APPEND-START-TAG-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3450-AMT-TOKEN-X
               END-IF
      
           END-IF.
      
           PERFORM  3050-AMT-FLDS-TOKEN
               THRU 3050-AMT-FLDS-TOKEN-X
      
           IF WFPIM-CRCY-CD-YES
      
      * WRITE '</CRCYAMT>' TO THE XML
      
               PERFORM  9920-APPEND-END-TAG
                   THRU 9920-APPEND-END-TAG-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 3450-AMT-TOKEN-X
               END-IF
      
           END-IF.
      
       3450-AMT-TOKEN-X.
           EXIT.
      
      *--------------
       3500-TS-TOKEN.
      *--------------
      
      * WRITE LDOCW-DT-FLDS-DT AND LDOCW-TIME-FLDS-TIME TO THE XML
      
           MOVE LDOCW-DT-FLDS-DT            TO L1640-INTERNAL-DATE.
      
           PERFORM  1640-8000-INTERNAL-TO-MIR
               THRU 1640-8000-INTERNAL-TO-MIR-X.
      
           MOVE LDOCW-TIME-FLDS-TIME        TO WS-TIME-FLDS-TIME.
      
           PERFORM  9300-EDIT-TIME-FLDS
               THRU 9300-EDIT-TIME-FLDS-X.
      
           MOVE L1640-EXTERNAL-DATE         TO WS-TS-DT.
           MOVE SPACE                       TO WS-TS-SEP-1.
           MOVE WS-TIME-FLDS-TIME           TO WS-TS-TIME.
           MOVE WS-TS                       TO L0008-XML-DATA-VALUE.
           MOVE LENGTH OF WS-TS             TO L0008-XML-DATA-VALUE-LEN.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3500-TS-TOKEN-X
           END-IF.
      
       3500-TS-TOKEN-X.
           EXIT.
      
      *---------------
       3550-IND-TOKEN.
      *---------------
      
      * WRITE EITHER 'TRUE' OR 'FALSE' TO THE XML
      
           IF  LDOCW-TXT-FLDS-TXT (1:1) = 'Y'
               MOVE WFPIM-ELMNT-VALUE-TRUE  TO L0008-XML-DATA-VALUE
               MOVE LENGTH OF WFPIM-ELMNT-VALUE-TRUE
                                            TO L0008-XML-DATA-VALUE-LEN
           ELSE
               MOVE WFPIM-ELMNT-VALUE-FALSE
                                            TO L0008-XML-DATA-VALUE
               MOVE LENGTH OF WFPIM-ELMNT-VALUE-FALSE
                                            TO L0008-XML-DATA-VALUE-LEN
           END-IF.
      
           PERFORM  9940-APPEND-ELEMENT-VALUE
               THRU 9940-APPEND-ELEMENT-VALUE-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 3550-IND-TOKEN-X
           END-IF.
      
       3550-IND-TOKEN-X.
           EXIT.
      /
      *--------------
       4000-END-NODE.
      *--------------
      * ADDING NODE FOR XML DOCUMENT WITHOUT DOCUMENT ID
      
           IF  LDOCW-DOC-ID = SPACES
              IF  LBUFR-BUFFER-LEN > WS-BUFFER-MAX
                  PERFORM  9100-OUTPUT-BUFFER
                      THRU 9100-OUTPUT-BUFFER-X
      
                  IF LDOCW-RETRN-ERROR
                     GO TO 4000-END-NODE-X
                  END-IF
              END-IF
      * WRITE '</', NODE DESCRIPTION '>' TO THE XML
              PERFORM  9920-APPEND-END-TAG
                  THRU 9920-APPEND-END-TAG-X
      
              GO TO 4000-END-NODE-X
           END-IF.
      * THE 'DOCUMENT EXTENSION' RELATIONSHIP IS TO BE TREATED
      * DIFFERENTLY.  ANY TOKENS HUNG OFF THIS RELATIONSHIP WILL
      * APPEAR AS THOUGH THEY BELONG DIRECTLY UNDER THE DOCUMENT
      * NODE, SO WE DON'T NEED TO DO ANYTHING HERE.
      
           IF  LDOCW-DBSRL-ID = '9999'
               GO TO 4000-END-NODE-X
           END-IF.
      
      * CHECK IF THE BUFFER IS FULL
      
           IF  LBUFR-BUFFER-LEN > WS-BUFFER-MAX
               PERFORM  9100-OUTPUT-BUFFER
                   THRU 9100-OUTPUT-BUFFER-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 4000-END-NODE-X
               END-IF
           END-IF.
      
      * WRITE '</', LDOCW-DBSRL-ID AND '>' TO THE XML
      
           PERFORM  9920-APPEND-END-TAG
               THRU 9920-APPEND-END-TAG-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 4000-END-NODE-X
           END-IF.
      
       4000-END-NODE-X.
           EXIT.
      /
      *--------------
       5000-END-DOC.
      *--------------
      * CHECK IF THE BUFFER IS FULL.  THIS ISN'T ABSOLUTELY NECESSARY
      * AS WE AREN'T GOING TO BE ADDING ALL THAT MUCH TO THE BUFFER,
      * BUT THERE'S NO HARM DOING THIS, JUST IN CASE.
      
           IF  LBUFR-BUFFER-LEN > WS-BUFFER-MAX
               PERFORM  9100-OUTPUT-BUFFER
                   THRU 9100-OUTPUT-BUFFER-X
      
               IF  LDOCW-RETRN-ERROR
                   GO TO 5000-END-DOC-X
               END-IF
           END-IF.
      
      * FOR EACH OPEN TAG WRITE '</    >' TO THE XML.
      
           SET L0008-ENTITY-NOT-SUPPORTED   TO TRUE.
           PERFORM  0008-6000-QUICK-END
               THRU 0008-6000-QUICK-END-X.
      
           IF NOT L0008-RETRN-OK      
               SET LDOCW-RETRN-ERROR        TO TRUE
           END-IF.
      
      * WRITE THE REMAINING BUFFER
      
           PERFORM  9100-OUTPUT-BUFFER
               THRU 9100-OUTPUT-BUFFER-X.
      
           IF  LDOCW-RETRN-ERROR
               GO TO 5000-END-DOC-X
           END-IF.
      
           ADD 1                            TO WGLOB-PFC-SEQUENCE-NUM.
      
       5000-END-DOC-X.
           EXIT.
      /
      *-----------------
       9050-INIT-BUFFER.
      *-----------------

           MOVE SPACES                      TO LBUFR-BUFFER-TXT.
           MOVE ZERO                        TO LBUFR-BUFFER-LEN.

           PERFORM  0008-0000-INIT-PARM-INFO
               THRU 0008-0000-INIT-PARM-INFO-X.
           PERFORM  0008-1000-BUILD-PARM-INFO
               THRU 0008-1000-BUILD-PARM-INFO-X.
      
           SET L0008-ENTITY-NOT-SUPPORTED TO TRUE.
      
           PERFORM  0008-0500-INITIALIZE
               THRU 0008-0500-INITIALIZE-X.
           IF  NOT L0008-RETRN-OK
               SET LDOCW-RETRN-ERROR      TO TRUE
           END-IF.


       9050-INIT-BUFFER-X.
           EXIT.
      /
      *------------------------
       9060-INIT-APPEND-BUFFER.
      *------------------------

           MOVE SPACES                     TO LBUFR-BUFFER-TXT.
           MOVE ZERO                       TO LBUFR-BUFFER-LEN.
           MOVE 1                          TO L0008-CHAR-PTR.

       9060-INIT-APPEND-BUFFER-X.
           EXIT.
      /
      *-------------------
       9100-OUTPUT-BUFFER.
      *-------------------
      
      * IF THE BUFFER HAS JUST BEEN INITIALISED, THEN WE DON'T NEED TO
      * WRITE ANYTHING.
      
           IF  LBUFR-BUFFER-LEN <= ZERO
               GO TO 9100-OUTPUT-BUFFER-X
           END-IF.
      
      * CALL XSDU0013 TO SEND BUFFER WITH CURRENT BUFFER AREA
      
           PERFORM  0013-1000-BUILD-PARM-INFO
               THRU 0013-1000-BUILD-PARM-INFO-X.
      
           PERFORM  0013-1000-SEND-PFC-SRVR
               THRU 0013-1000-SEND-PFC-SRVR-X.
      
           IF  NOT L0013-RETRN-OK
               SET LDOCW-RETRN-ERROR        TO TRUE
               GO TO 9100-OUTPUT-BUFFER-X
           END-IF.
      
      * INITIALISE THE BUFFER
      
           IF  LBUFR-BUFFER-LEN > WS-BUFFER-MAX
               PERFORM  9060-INIT-APPEND-BUFFER
                   THRU 9060-INIT-APPEND-BUFFER-X
               GO TO 9100-OUTPUT-BUFFER-X
           END-IF.
      
           PERFORM  9050-INIT-BUFFER
               THRU 9050-INIT-BUFFER-X.
      
       9100-OUTPUT-BUFFER-X.
           EXIT.
      /
      *-------------------
       9150-EDIT-AMT-FLDS.
      *-------------------
      
      * CALL XSDU0290, IGNORING LEADING ZEROES, WITH ONLY THE SIGN AND
      * DECIMAL SEPARATOR AS EDITING CHARACTERS
      
           SET L0290-MESSAGE-FORMAT TO TRUE.
           SET L0290-SIGN-LEFT TO TRUE.
           SET L0290-LEAD-ZEROS-SUPPRESS    TO TRUE.
      
           MOVE '.'                         TO L0290-DCML-SYMBL.
      
           PERFORM  0290-1000-NUMERIC-FORMAT
               THRU 0290-1000-NUMERIC-FORMAT-X.
      
      * SIZE THE LENGTH OF THE EDITED AMOUNT
      
           PERFORM
               VARYING WS-AMT-FLDS-LEN FROM L0290-MAX-OUT-LEN BY -1
               UNTIL L0290-OUTPUT-DATA (WS-AMT-FLDS-LEN:1) NOT = SPACE
                  OR WS-AMT-FLDS-LEN = 1
               CONTINUE
           END-PERFORM.
      
       9150-EDIT-AMT-FLDS-X.
           EXIT.
      
      *-------------------
       9200-EDIT-TXT-FLDS.
      *-------------------
      
      * IF THE MINIMUM LENGTH IS UNKNOWN, ASSUME IT EQUALS 1
      
           IF  WS-TXT-FLDS-MIN-LEN <= ZERO
               MOVE 1                       TO WS-TXT-FLDS-MIN-LEN
           END-IF.
      
      * IF THE MAXIMUM LENGTH IS UNKNOWN, ASSUME IS EQUALS THE MAXIMUM
      * SIZE ALLOWED FOR ANY TEXT FIELD
      
           IF  WS-TXT-FLDS-MAX-LEN <= ZERO
               MOVE LENGTH OF WS-TXT-FLDS-TXT
                                            TO WS-TXT-FLDS-MAX-LEN
           END-IF.
      
      * IF THE ACTUAL LENGTH HAS BEEN SUPPLIED, THEN IT MUST FALL
      * WITHIN THE MINIMUM AND MAXIMUM SIZES
      
           IF  WS-TXT-FLDS-LEN = ZERO
               CONTINUE
           ELSE
               IF  WS-TXT-FLDS-LEN < WS-TXT-FLDS-MIN-LEN
                   MOVE WS-TXT-FLDS-MIN-LEN
                                            TO WS-TXT-FLDS-LEN
               END-IF
      
               IF  WS-TXT-FLDS-LEN > WS-TXT-FLDS-MAX-LEN
                   MOVE WS-TXT-FLDS-MAX-LEN
                                            TO WS-TXT-FLDS-LEN
               END-IF
      
               MOVE WS-TXT-FLDS-LEN         TO WS-TXT-FLDS-MAX-LEN
           END-IF.
      
      * REMOVE TRAILING SPACES
      
           PERFORM
               VARYING WS-TXT-FLDS-LEN FROM WS-TXT-FLDS-MAX-LEN BY -1
               UNTIL WS-TXT-FLDS-LEN = WS-TXT-FLDS-MIN-LEN
                  OR WS-TXT-FLDS-TXT (WS-TXT-FLDS-LEN:1) NOT = SPACES
               CONTINUE
           END-PERFORM.
      
       9200-EDIT-TXT-FLDS-X.
           EXIT.
      
      *--------------------
       9300-EDIT-TIME-FLDS.
      *--------------------
      
      * BUILD ISO-FORMAT TIME VALUE
      
           MOVE ':'                         TO WS-TIME-SEP-1.
           MOVE ':'                         TO WS-TIME-SEP-2.
      
           IF  WS-TIME-FLDS-MS = ZERO
           OR  WS-TIME-FLDS-MS = SPACES
               MOVE SPACE                   TO WS-TIME-SEP-3
           ELSE
               MOVE '.'                     TO WS-TIME-SEP-3
           END-IF.
      
       9300-EDIT-TIME-FLDS-X.
           EXIT.
      
      *----------------------
       9910-APPEND-START-TAG.
      *----------------------
      
           SET L0008-ENTITY-NOT-SUPPORTED   TO TRUE.
           PERFORM  0008-1000-START-TAG
               THRU 0008-1000-START-TAG-X.
      
           IF NOT L0008-RETRN-OK
               SET LDOCW-RETRN-ERROR        TO TRUE
           END-IF.
      
       9910-APPEND-START-TAG-X.
           EXIT.
      
      
      *--------------------
       9920-APPEND-END-TAG.
      *--------------------
      
           SET L0008-ENTITY-NOT-SUPPORTED   TO TRUE.
           PERFORM  0008-2000-END-TAG
               THRU 0008-2000-END-TAG-X.
      
           IF NOT L0008-RETRN-OK
               SET LDOCW-RETRN-ERROR        TO TRUE
           END-IF.
      
       9920-APPEND-END-TAG-X.
           EXIT.

      *-------------------------
      *9930-APPEND-ATTRIB-VALUE.
      *-------------------------
      *
      *    PERFORM  0008-3000-ATTRIB-VALUE
      *        THRU 0008-3000-ATTRIB-VALUE-X.
      *
      *    IF NOT L0008-RETRN-OK
      *        SET LDOCW-RETRN-ERROR TO TRUE
      *    END-IF.
      *
      *9930-APPEND-ATTRIB-VALUE-X.
      *    EXIT.
      *
      *----------------------------
       9940-APPEND-ELEMENT-VALUE.
      *----------------------------

           IF WS-ENTITY-SUPPORTED
               SET L0008-ENTITY-SUPPORTED TO TRUE
           END-IF.
      *
           PERFORM  0008-4000-ELEMENT-VALUE
               THRU 0008-4000-ELEMENT-VALUE-X.
      *
      * RESET THE ENTITY-SUPPORT SWITCH TO 'N' UPON RETURNING
      *
           SET L0008-ENTITY-NOT-SUPPORTED   TO TRUE.
      
           IF NOT L0008-RETRN-OK
               SET LDOCW-RETRN-ERROR        TO TRUE
           END-IF.
      
       9940-APPEND-ELEMENT-VALUE-X.
           EXIT.
      /
      *--------------------------
       9990-INIT-WORKING-STORAGE.
      *--------------------------

           INITIALIZE WS-LOCAL-STORAGE.
           INITIALIZE FREQUENTLY-USED-INDICES.
           INITIALIZE LDOCW-OUTPUT-PARM-INFO.
           MOVE SPACES                      TO WWKDT-WORK-FIELDS.
           SET LDOCW-RETRN-OK               TO TRUE.
           SET WS-ENTITY-NOT-SUPPORTED      TO TRUE.

           PERFORM
               VARYING WS-DOC-ID-LEN FROM LENGTH OF LDOCW-DOC-ID BY -1
               UNTIL LDOCW-DOC-ID (WS-DOC-ID-LEN:1) NOT = SPACES
                  OR WS-DOC-ID-LEN = 1
               CONTINUE
           END-PERFORM.

           PERFORM
               VARYING WS-TOKEN-ID-LEN
               FROM LENGTH OF LDOCW-TOKEN-ID BY -1
               UNTIL LDOCW-TOKEN-ID (WS-TOKEN-ID-LEN:1) NOT = SPACES
                  OR WS-TOKEN-ID-LEN = 1
               CONTINUE
           END-PERFORM.

      * FIRST-TIME CODE.  ESTABLISH IF A USER EXIT NEEDS TO BE CALLED
      * AND ESTABLISH THE MAXIMUM ALLOWABLE SIZE OF THE BUFFER THAT WE
      * CAN WORK WITH

           PERFORM  WSIN-1000-CHECK-WS
               THRU WSIN-1000-CHECK-WS-X.
      
           IF  WWSIN-FIRST-TIME-IN
               PERFORM  WSIN-2000-SAVE-KEY-INFO
                   THRU WSIN-2000-SAVE-KEY-INFO-X
           ELSE
               GO TO 9990-INIT-WORKING-STORAGE-X
           END-IF.

           PERFORM  0008-0000-INIT-PARM-INFO
               THRU 0008-0000-INIT-PARM-INFO-X.

           PERFORM  0290-0000-INIT-PARM-INFO
               THRU 0290-0000-INIT-PARM-INFO-X.

           PERFORM  1640-0000-INIT-PARM-INFO
               THRU 1640-0000-INIT-PARM-INFO-X.

           PERFORM  1660-0000-INIT-PARM-INFO
               THRU 1660-0000-INIT-PARM-INFO-X.

           PERFORM  2566-0000-INIT-PARM-INFO
               THRU 2566-0000-INIT-PARM-INFO-X.

           INITIALIZE WS-WORKING-STORAGE.

           SUBTRACT 500
               FROM LENGTH OF LBUFR-BUFFER-TXT GIVING WS-BUFFER-MAX
           END-SUBTRACT.

           MOVE ZERO                        TO WS-DOC-CTR.

           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.

       9990-INIT-WORKING-STORAGE-X.
           EXIT.

      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY XCPPWSIN.

      /
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
      
       COPY XCPS0008.
       COPY XCPL0008.
      
       COPY XCPS0013.
       COPY XCPL0013.
      
       COPY XCPL0260.
      
       COPY XCPS0290.
       COPY XCPL0290.
      
       COPY XCPS1640.
       COPY XCPL1640.
      
       COPY XCPS1660.
       COPY XCPL1660.
      
       COPY XCPS2566.
       COPY XCPL2566.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      
       COPY XCPNDMAD.
      
       COPY CCPNEDIT.
      
       COPY XCPNXTAB.
      
       COPY XCPNUSEC.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************

      *COPY XCCPERR.

       COPY XCPL0030.
      
      ****************************************************************
      **                 END OF PROGRAM XSDU2552                     *
      ****************************************************************

