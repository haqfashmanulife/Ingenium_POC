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
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSDU0023.

      *****************************************************************
      **  MEMBER :  XSDU0023                                         **
      **  REMARKS:  THIS IS A SERVICE ROUTINE DESIGNED TO SIMPLIFY   **
      **            RETRIEVAL OF DATA FROM AN XML BUFFER STREAM      **
      **            RETURNED FROM THE PATHFINDER CLIENT              **
      **                                                             **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************

      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0023'.

       COPY SQLCA.

       01  WS-WORKING-STORAGE.
           05  WS-XML-BUFFER-ADDRESS               POINTER  VALUE NULL.
           05  WS-RETRIEVE-SW                      PIC X(01).
               88  WS-RETRIEVE-START               VALUE '0'.
               88  WS-RETRIEVE-STOP                VALUE '1'.
           05  WS-BUFR-SPLIT-SW                    PIC X(01).
               88  WS-BUFR-SPLIT-YES               VALUE 'Y'.
               88  WS-BUFR-SPLIT-NO                VALUE 'N'.
           05  WS-START-SUB                        PIC S9(09) BINARY.
           05  WS-END-SUB                          PIC S9(09) BINARY.
           05  WS-LENGTH                           PIC S9(09) BINARY.
           05  WS-XML-BUFFER-LENGTH-LIMIT          PIC S9(08) BINARY.
           05  WS-TEMP-XML-BUFFER                  PIC X(100000).

       01  WS-RESULT-INFO.
           05  WS-RETRN-CD                         PIC 9(02).
           05  WS-RESULT-CD                        PIC X(02).
               88  WS-RESULT-START-TAG             VALUE '01'.
               88  WS-RESULT-END-TAG               VALUE '02'.
               88  WS-RESULT-ATTR-VALUE            VALUE '03'.
               88  WS-RESULT-ELEMENT-VALUE         VALUE '04'.
               88  WS-RESULT-CDATA                 VALUE '05'.
               88  WS-RESULT-END-DATA              VALUE '06'.
               88  WS-RESULT-PARSE-ERROR           VALUE '07'.
           05  WS-ELEMENT-NAME                     PIC X(50).
           05  WS-ATTRIB-NAME                      PIC X(50).
           05  WS-VALUE                            PIC X(1000).

       01  WS-XML-ELEMENT-STACK.
           05  WS-XML-STACK-CTR                    PIC S9(04) BINARY.
           05  WS-XML-ELEMENT-STACK-REC            OCCURS 20.
               10  WS-XML-ELEMENT-NAME             PIC X(50).

       01  WS-UNREAD-BUFR-INFO.
           05  WS-UNREAD-BUFR-LEN                  PIC S9(09) BINARY.
           05  WS-UNREAD-BUFR                      PIC X(3000).

       01  WS-EXTRA-BUFR-INFO.
           05  WS-EXTRA-BUFR-LEN                   PIC S9(09) BINARY.
           05  WS-EXTRA-BUFR                       PIC X(3000).

       01  WS-CONSTANTS.
           05  WS-LEFT-ANGLE-BRACKET               PIC X(01)  VALUE '<'.
           05  WS-RIGHT-ANGLE-BRACKET              PIC X(01)  VALUE '>'.
           05  WS-SLASH                            PIC X(01)  VALUE '/'.

      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      
       COPY CCWWINDX.
       COPY XCWWFPIM.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      
       COPY XCWL0013.
       COPY XCWL0009.

      *****************
       LINKAGE SECTION.
      *****************
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0023.
       COPY XCWLBUFR.

       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0023-PARM-INFO
                                LBUFR-BUFFER-WORK-AREA.
      /
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  9990-INIT-WORKING-STORAGE
               THRU 9990-INIT-WORKING-STORAGE-X.

           EVALUATE TRUE

               WHEN L0023-RQST-START-RETRIEVE
                    PERFORM  1000-START-RETRIEVE
                        THRU 1000-START-RETRIEVE-X

               WHEN L0023-RQST-RETRIEVE-NEXT
                    PERFORM  2000-RETRIEVE-NEXT
                        THRU 2000-RETRIEVE-NEXT-X

               WHEN OTHER
                   SET L0023-RETRN-INVALID-REQUEST 
                                            TO TRUE

           END-EVALUATE.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      *--------------------
       1000-START-RETRIEVE.
      *--------------------

      *  RETRIEVE PATHFINDER CONNECTOR MESSAGE

           PERFORM  9000-GET-PFC-BUFR
               THRU 9000-GET-PFC-BUFR-X.

           IF  NOT L0023-RETRN-OK
               GO TO 1000-START-RETRIEVE-X
           END-IF.

      *  START RETRIEVE

           SET WS-RETRIEVE-START            TO TRUE.

           PERFORM  1100-START-RETRIEVE-LOOP
               THRU 1100-START-RETRIEVE-LOOP-X
               UNTIL WS-RETRIEVE-STOP
               OR NOT L0023-RETRN-OK.

       1000-START-RETRIEVE-X.
           EXIT.
      /
      *-------------------------
       1100-START-RETRIEVE-LOOP.
      *-------------------------

      *  PARSE AN XML BUFFER

           SET L0009-INITIALIZE-YES         TO TRUE.
           PERFORM  6000-GET-NEXT-ELEMENT
               THRU 6000-GET-NEXT-ELEMENT-X.

           IF  NOT L0023-RETRN-OK
               GO TO 1100-START-RETRIEVE-LOOP-X
           END-IF.

           IF  L0023-RETRN-RETRIEVE-COMPLETE
               GO TO 1100-START-RETRIEVE-LOOP-X
           END-IF.

      *  RETURN INFO TO LINKAGE XCWL0023

           IF  WS-RESULT-ELEMENT-VALUE
           AND WS-ELEMENT-NAME = WFPIM-ELMNT-RETRN-CD
               MOVE WS-VALUE                TO L0023-PFC-RETRN-CD
           END-IF.

           IF  WS-RESULT-ELEMENT-VALUE
           AND WS-ELEMENT-NAME = WFPIM-ELMNT-DESCRIP
               MOVE WS-VALUE                TO L0023-PFC-RETRN-DESCRIP
           END-IF.

      *  STOP RETRIEVE IF START TAG = INGENIUMDATA

           IF  WS-RESULT-END-TAG
           AND WS-ELEMENT-NAME = WFPIM-ELMNT-PATHFIND-CONN
               MOVE WS-ELEMENT-NAME         TO L0023-ELEMENT-NAME
               SET L0023-ELEMENT-END-TAG    TO TRUE
               SET WS-RETRIEVE-STOP         TO TRUE
               GO TO 1100-START-RETRIEVE-LOOP-X
           END-IF.

       1100-START-RETRIEVE-LOOP-X.
           EXIT.
      /
      *-------------------
       2000-RETRIEVE-NEXT.
      *-------------------

      *    MOVE CURRENT ELEMENT FROM STACK

           IF  WS-XML-STACK-CTR > ZERO
               MOVE WS-XML-ELEMENT-NAME (WS-XML-STACK-CTR)
                                            TO L0023-ELEMENT-NAME
           END-IF.

      *    START RETRIEVE

           SET WS-RETRIEVE-START            TO TRUE.

           PERFORM  2100-RETRIEVE-LOOP
               THRU 2100-RETRIEVE-LOOP-X
              UNTIL WS-RETRIEVE-STOP
                 OR NOT L0023-RETRN-OK.

       2000-RETRIEVE-NEXT-X.
           EXIT.
      /
      *-------------------
       2100-RETRIEVE-LOOP.
      *-------------------

      *  PARSE AN XML BUFFER

           PERFORM  6000-GET-NEXT-ELEMENT
               THRU 6000-GET-NEXT-ELEMENT-X.

           IF  L0023-RETRN-RETRIEVE-COMPLETE
           OR  WS-RESULT-END-DATA
               SET WS-XML-BUFFER-ADDRESS    TO NULL
           END-IF.


           IF  L0023-RETRN-RETRIEVE-COMPLETE
           OR  WS-RESULT-END-DATA
           OR  NOT L0023-RETRN-OK
               SET WS-RETRIEVE-STOP         TO TRUE
               GO TO 2100-RETRIEVE-LOOP-X
           END-IF.

      *  WHEN START TAG, CHECK WHETHER OR NOT RETRIEVE NEED TO BE
      *  STOPPED

           IF  WS-RESULT-START-TAG
               MOVE WS-ELEMENT-NAME         TO L0023-ELEMENT-NAME
               SET L0023-ELEMENT-START-TAG  TO TRUE
               SET WS-RETRIEVE-STOP         TO TRUE
           END-IF.

           IF  WS-RESULT-END-TAG
               SET L0023-ELEMENT-END-TAG    TO TRUE
               SET WS-RETRIEVE-STOP         TO TRUE
           END-IF.

           IF  WS-RESULT-ATTR-VALUE
               MOVE WS-ATTRIB-NAME          TO L0023-ATTRIBUTE-NAME
               MOVE WS-VALUE                TO L0023-FIELD-VALUE
               SET L0023-ELEMENT-ATTR-VALUE TO TRUE
               SET WS-RETRIEVE-STOP         TO TRUE
           END-IF.

           IF  WS-RESULT-ELEMENT-VALUE
               MOVE WS-VALUE                TO L0023-FIELD-VALUE
               SET L0023-ELEMENT-ELMNT-VALUE 
                                            TO TRUE
               SET WS-RETRIEVE-STOP         TO TRUE
           END-IF.

       2100-RETRIEVE-LOOP-X.
           EXIT.
      /
      *----------------------
       6000-GET-NEXT-ELEMENT.
      *----------------------

      * CALL XSDU0009 TO PARSE AN XML DOCUMENT INTO COMPONENT PARTS

           PERFORM  0009-1000-GET-NEXT
               THRU 0009-1000-GET-NEXT-X.

           IF  L0009-RETRN-PARSE-COMPLETE
               SET L0023-RETRN-RETRIEVE-COMPLETE  
                                            TO TRUE
               GO TO 6000-GET-NEXT-ELEMENT-X
           END-IF.

           IF  NOT L0009-RETRN-OK
      *MSG:    RETRIEVE FAILED.  REQUEST REJECTED.
               MOVE 'XS00230001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0023-RETRN-ERROR        TO TRUE
               GO TO 6000-GET-NEXT-ELEMENT-X
           END-IF.

           MOVE L0009-RETRN-CD              TO WS-RETRN-CD.

           EVALUATE TRUE

               WHEN L0009-RESULT-START-TAG
                   SET WS-RESULT-START-TAG  TO TRUE
                   PERFORM  7000-PUSH-XML-STACK
                       THRU 7000-PUSH-XML-STACK-X

               WHEN L0009-RESULT-END-TAG
                   SET WS-RESULT-END-TAG    TO TRUE
                   PERFORM  7100-POP-XML-STACK
                       THRU 7100-POP-XML-STACK-X

               WHEN L0009-RESULT-ATTRIB-VALU-PAIR
                   SET WS-RESULT-ATTR-VALUE 
                                            TO TRUE

               WHEN L0009-RESULT-ELEMNT-VALU-PAIR
                   SET WS-RESULT-ELEMENT-VALUE
                                            TO TRUE

               WHEN L0009-RESULT-END-OF-DATA
                   SET WS-RESULT-END-DATA   TO TRUE

               WHEN L0009-RESULT-PARSE-ERROR
                   SET WS-RESULT-PARSE-ERROR
                                            TO TRUE

               WHEN OTHER
                    CONTINUE

           END-EVALUATE.

           MOVE L0009-XML-ELEMENT           TO WS-ELEMENT-NAME.
           MOVE L0009-XML-ATTRIBUTE         TO WS-ATTRIB-NAME.
           MOVE L0009-XML-DATA-VALUE        TO WS-VALUE.

           IF  NOT L0023-RETRN-OK
      *MSG:  XML RETRIEVE FAILED.  REQUEST REJECTED.
               MOVE 'XS00230001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0023-RETRN-ERROR        TO TRUE
               GO TO 6000-GET-NEXT-ELEMENT-X
           END-IF.

      *  CHECK WHETHER OR NOT THERE IS MORE THAN ONE BUFFER TO PARSE.
      *  IF THERE IS MORE THAN ONE BUFFER TO PARSE, CHECK WHETHER OR
      *  NOT THE CURRENT POINTER EXCEEDS THE BUFFER LIMIT, IF IT DOES,
      *  APPEND CURRENT UNREAD BUFFER TO THE BEGINNING OF NEXT BUFFER

           PERFORM  8000-CHECK-END-OF-BUFR
               THRU 8000-CHECK-END-OF-BUFR-X.

           IF  NOT L0023-RETRN-OK
               GO TO 6000-GET-NEXT-ELEMENT-X
           END-IF.

       6000-GET-NEXT-ELEMENT-X.
           EXIT.

      *---------------------
       7000-PUSH-XML-STACK.
      *---------------------

      *  PUSH NEW ELEMENT INFO INTO STACK

           ADD 1                            TO WS-XML-STACK-CTR.
           MOVE L0009-XML-ELEMENT	    TO 
                             WS-XML-ELEMENT-NAME (WS-XML-STACK-CTR).

       7000-PUSH-XML-STACK-X.
           EXIT.

      *--------------------
       7100-POP-XML-STACK.
      *--------------------

      *  CHECK THE END TAG EQUAL TO CURRENT TAG

           IF  L0009-XML-ELEMENT NOT =
               WS-XML-ELEMENT-STACK-REC (WS-XML-STACK-CTR)
               SET L0023-RETRN-ERROR        TO TRUE
               GO TO 7100-POP-XML-STACK-X
           END-IF.

      *  POP STACK

           MOVE SPACES	                    TO
             WS-XML-ELEMENT-STACK-REC (WS-XML-STACK-CTR).

           SUBTRACT +1  FROM WS-XML-STACK-CTR.

       7100-POP-XML-STACK-X.
           EXIT.


      *-----------------------
       8000-CHECK-END-OF-BUFR.
      *-----------------------

           IF  L0009-CHAR-PTR > LENGTH OF LBUFR-BUFFER-TXT
               GO TO 8000-CHECK-END-OF-BUFR-X
           END-IF.

      *  ALWAYS CHECK FOR OPEN TAG TO APPEND

           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) NOT =
               WS-LEFT-ANGLE-BRACKET
               GO TO 8000-CHECK-END-OF-BUFR-X
           END-IF.

      *  IF EXTRA BUFFER EXISTS, APPEND EXTRA BUFFER TO THE END OF
      *  CURRENT BUFFER

           PERFORM  8400-APPEND-EXTRA-BUFR
               THRU 8400-APPEND-EXTRA-BUFR-X.

      *  EXIT IF THERE IS ONLY ONE BUFFER

           IF  WS-BUFR-SPLIT-NO
               GO TO 8000-CHECK-END-OF-BUFR-X
           END-IF.

      *  MORE THAN ONE BUFFER

      *  CHECK WHETHER OR NOT IT EXCEEDS THE BUFFER LIMIT.
      *  IF IT EXCEEDS THE BUFFER LIMIT, APPEND CURRENT UNREAD BUFFER
      *  TO THE BEGINNING OF NEXT BUFFER
      
           IF  L0009-CHAR-PTR <= WS-XML-BUFFER-LENGTH-LIMIT
               GO TO 8000-CHECK-END-OF-BUFR-X
           END-IF.
      
      *  SAVE CURRENT UNREAD BUFFER
      
           PERFORM  8100-SAVE-UNREAD-BUFR
               THRU 8100-SAVE-UNREAD-BUFR-X.
      
      *  GET NEXT PX BUFFER
      
           PERFORM  8200-GET-NEXT-PFC-BUFR
               THRU 8200-GET-NEXT-PFC-BUFR-X.
      
           IF  NOT L0023-RETRN-OK
               GO TO 8000-CHECK-END-OF-BUFR-X
           END-IF.
      
      *  APPEND CURRENT UNREAD BUFFER TO THE BEGINNING OF NEXT BUFFER
      
           PERFORM  8300-APPEND-UNREAD-BUFR
               THRU 8300-APPEND-UNREAD-BUFR-X.
      
      *  RESET XSDU0009 PARAMETERS
      
           PERFORM  0009-1000-BUILD-PARM-INFO
               THRU 0009-1000-BUILD-PARM-INFO-X.

           SET L0009-STATE-00               TO TRUE.
      
       8000-CHECK-END-OF-BUFR-X.
           EXIT.
      
      *----------------------
       8100-SAVE-UNREAD-BUFR.
      *----------------------
      
      *  SAVE CURRENT UNREAD BUFFER TO WORKING STORAGE

           INITIALIZE WS-UNREAD-BUFR-INFO.
      
           COMPUTE WS-UNREAD-BUFR-LEN = LBUFR-BUFFER-LEN
                                      - L0009-CHAR-PTR
                                      + 1.
      
           MOVE LBUFR-BUFFER-TXT (L0009-CHAR-PTR:WS-UNREAD-BUFR-LEN)
             TO WS-UNREAD-BUFR.
      
       8100-SAVE-UNREAD-BUFR-X.
           EXIT.

      *----------------------
       8200-GET-NEXT-PFC-BUFR.
      *----------------------
      
           PERFORM  9000-GET-PFC-BUFR
               THRU 9000-GET-PFC-BUFR-X.
      
           IF  NOT L0023-RETRN-OK
               GO TO 8200-GET-NEXT-PFC-BUFR-X
           END-IF.
      
       8200-GET-NEXT-PFC-BUFR-X.
           EXIT.
      
      *------------------------
       8300-APPEND-UNREAD-BUFR.
      *------------------------
      
      *  IF TOTAL LENGTH OF UNREAD BUFFER AND THE NEW BUFFER GREATER
      *  THAN THE LENGTH OF LBUFR-BUFFER-TXT, CALCULATE THE EXTRA LENGTH
      *  AND SAVE THE EXTRA BUFFER TO WORKING STORAGE
      
           IF  (WS-UNREAD-BUFR-LEN + LBUFR-BUFFER-LEN) >
               LENGTH OF LBUFR-BUFFER-TXT
               PERFORM  8310-SAVE-EXTRA-BUFR
                   THRU 8310-SAVE-EXTRA-BUFR-X
           END-IF.
      
      *  APPEND CURRENT UNREAD BUFFER TO THE BEGINNING OF NEXT BUFFER
      
           MOVE SPACES                      TO WS-TEMP-XML-BUFFER.
      
           MOVE LBUFR-BUFFER-TXT (1:LBUFR-BUFFER-LEN)
                                            TO WS-TEMP-XML-BUFFER.
      
           MOVE SPACES                      TO LBUFR-BUFFER-TXT.
      
           MOVE WS-UNREAD-BUFR (1:WS-UNREAD-BUFR-LEN)
                                            TO 
      	        LBUFR-BUFFER-TXT (1:WS-UNREAD-BUFR-LEN).
           MOVE WS-TEMP-XML-BUFFER  (1:LBUFR-BUFFER-LEN)
                                            TO
              LBUFR-BUFFER-TXT (WS-UNREAD-BUFR-LEN + 1 :
                                     LBUFR-BUFFER-LEN).
      
           ADD WS-UNREAD-BUFR-LEN           TO LBUFR-BUFFER-LEN.
      
       8300-APPEND-UNREAD-BUFR-X.
           EXIT.
      
      *---------------------
       8310-SAVE-EXTRA-BUFR.
      *---------------------
      
      *  CALCULATE THE EXTRA LENGTH AND SAVE THE EXTRA BUFFER TO
      *  WORKING STORAGE
      
           COMPUTE WS-START-SUB = LBUFR-BUFFER-LEN
                                - WS-UNREAD-BUFR-LEN
                                + 1.
      
           MOVE WS-UNREAD-BUFR-LEN          TO WS-EXTRA-BUFR-LEN.

           MOVE LBUFR-BUFFER-TXT (WS-START-SUB:WS-EXTRA-BUFR-LEN)
                                            TO 
                           WS-EXTRA-BUFR (1:WS-EXTRA-BUFR-LEN).
      *  RESET LBUFR-BUFFER-LEN
      
           COMPUTE LBUFR-BUFFER-LEN = LBUFR-BUFFER-LEN
                                       - WS-UNREAD-BUFR-LEN.
      
       8310-SAVE-EXTRA-BUFR-X.
           EXIT.
      
      *-----------------------
       8400-APPEND-EXTRA-BUFR.
      *-----------------------
      
      *  EXIT IF NO EXTRA BUFFER TO APPEND
      
           IF  WS-EXTRA-BUFR-LEN = ZERO
               GO TO 8400-APPEND-EXTRA-BUFR-X
           END-IF.
      
      *  CHECK WHETHER OR NOT THE CURRENT BUFFER HAS ENOUGH SPACES
      *  TO APPEND
      
           IF  L0009-CHAR-PTR <= WS-EXTRA-BUFR-LEN
               GO TO 8400-APPEND-EXTRA-BUFR-X
           END-IF.
      
      * APPEND EXTRA BUFFER TO THE END OF CURRENT BUFFER
      
           COMPUTE LBUFR-BUFFER-LEN = LBUFR-BUFFER-LEN
                                       - L0009-CHAR-PTR
                                       + 1.
      
           MOVE SPACES                      TO WS-TEMP-XML-BUFFER.
      
           MOVE LBUFR-BUFFER-TXT (L0009-CHAR-PTR:LBUFR-BUFFER-LEN)
             TO WS-TEMP-XML-BUFFER.

           MOVE SPACES                      TO LBUFR-BUFFER-TXT.
      
           MOVE WS-TEMP-XML-BUFFER  (1:LBUFR-BUFFER-LEN)
                                            TO 
      		LBUFR-BUFFER-TXT (1:LBUFR-BUFFER-LEN).
           MOVE WS-EXTRA-BUFR (1:WS-EXTRA-BUFR-LEN)
                                            TO 
            LBUFR-BUFFER-TXT (LBUFR-BUFFER-LEN + 1 :                                
                                     WS-EXTRA-BUFR-LEN).
      
           ADD WS-EXTRA-BUFR-LEN            TO LBUFR-BUFFER-LEN.
      
      *  RESET WORKING STORAGE

           INITIALIZE WS-EXTRA-BUFR-INFO.
      
      *  RESET XSDU0009 PARAMETERS
      
           PERFORM  0009-1000-BUILD-PARM-INFO
               THRU 0009-1000-BUILD-PARM-INFO-X.
      
           SET L0009-STATE-00               TO TRUE.
      
       8400-APPEND-EXTRA-BUFR-X.
           EXIT.
      
      *-----------------
       9000-GET-PFC-BUFR.
      *-----------------

      *  CALL XSDU0013 TO RETRIEVE PATHFINDER RESPONSE
      *  THE TERMINATION STRING MUST BE TERMINATED WITH NULLS

           PERFORM  0013-1000-BUILD-PARM-INFO
               THRU 0013-1000-BUILD-PARM-INFO-X.
           MOVE LOW-VALUES                  TO L0013-TERM-PATTERN-TXT.
           MOVE 11                          TO L0013-TERM-PATTERN-LEN.
           MOVE '</Response>'
             TO L0013-TERM-PATTERN-TXT(1:L0013-TERM-PATTERN-LEN).
           PERFORM  0013-1500-RECV-PFC-SRVR
               THRU 0013-1500-RECV-PFC-SRVR-X.

           PERFORM  9010-CHK-END-RESPONSE-OUTPUT
               THRU 9010-CHK-END-RESPONSE-OUTPUT-X.

       9000-GET-PFC-BUFR-X.
           EXIT.
      
      *------------------------------
       9010-CHK-END-RESPONSE-OUTPUT.
      *------------------------------

      *  CHECK WHETHER OR NOT WE HAVE THE COMPLETE DOCUMENT
      *  THE L0003-STATUS CODE WILL TELL US IF WE HAVE RECEIVED
      *  THE TERMINATION TAG.

           IF L0013-STATUS-COMPLETE
               SET WS-BUFR-SPLIT-NO         TO TRUE
           ELSE
               SET WS-BUFR-SPLIT-YES        TO TRUE
           END-IF.

       9010-CHK-END-RESPONSE-OUTPUT-X.
           EXIT.

      *--------------------------
       9990-INIT-WORKING-STORAGE.
      *--------------------------

           SET L0023-RETRN-OK               TO TRUE.
           INITIALIZE L0023-OUTPUT-PARM-INFO.
           INITIALIZE WS-RESULT-INFO.

           IF  WS-XML-BUFFER-ADDRESS NOT =
                       ADDRESS OF LBUFR-BUFFER-WORK-AREA
           OR  L0023-INITIALIZE-YES
               CONTINUE
           ELSE
               GO TO 9990-INIT-WORKING-STORAGE-X
           END-IF.

           SET L0023-INITIALIZE-NO          TO TRUE.
           MOVE LOW-VALUES                  TO LBUFR-BUFFER-TXT.
           MOVE ZERO                        TO LBUFR-BUFFER-LEN.

           SET WS-XML-BUFFER-ADDRESS
            TO ADDRESS OF LBUFR-BUFFER-WORK-AREA.

           PERFORM  0009-0000-INIT-PARM-INFO
               THRU 0009-0000-INIT-PARM-INFO-X.

           PERFORM  0009-1000-BUILD-PARM-INFO
               THRU 0009-1000-BUILD-PARM-INFO-X.

           INITIALIZE WS-XML-ELEMENT-STACK.

           COMPUTE WS-XML-BUFFER-LENGTH-LIMIT =
                   LENGTH OF LBUFR-BUFFER-TXT - 3000.

           INITIALIZE WS-UNREAD-BUFR-INFO.
           INITIALIZE WS-EXTRA-BUFR-INFO.

           SET WS-BUFR-SPLIT-NO             TO TRUE.

       9990-INIT-WORKING-STORAGE-X.
           EXIT.

      ******************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                  *
      ******************************************************************
      
       COPY XCPL0260.
       COPY XCPS0013.
       COPY XCPL0013.
       COPY XCPS0009.
       COPY XCPL0009.

      ******************************************************************
      *    ERROR HANDLING ROUTINES                                     *
      ******************************************************************
      
       COPY XCPL0030.
      /
      ******************************************************************
      *             END OF PROGRAM  XSDU0023                          **
      ******************************************************************
