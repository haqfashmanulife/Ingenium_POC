      **************************
       IDENTIFICATION DIVISION.
      **************************
       PROGRAM-ID. XSDU0008.

      *****************************************************************
      **  MEMBER :  XSDU0008                                         **
      **  REMARKS:  XML BUILDER FOR INGENIUM.  THIS PROGRAM WILL     **
      **            ASSEMBLE AN XML DOCUMENT FROM DATA PASSED IN     **
      **            ONE COMPONENT AT A TIME.                         **
      **                                                             **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************
      /
      ***********************
       ENVIRONMENT DIVISION.
      ***********************

      ***********************
       CONFIGURATION SECTION.
      ***********************
      
      ***************
       DATA DIVISION.
      ***************
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0008'.
      
       COPY SQLCA.
      
       01  WS-VALUE-TXT.
           05  WS-VALUE-TXT-BYTE                    OCCURS 500
               INDEXED BY WS-SEARCH-INDX.
               10  WS-VALUE-TXT-SEARCH-BYTE         PIC X(01).
                   88  WS-VALUE-TXT-SEARCH-AMP      VALUE '&'.
                   88  WS-VALUE-TXT-SEARCH-LT       VALUE '<'.
                   88  WS-VALUE-TXT-SEARCH-GT       VALUE '>'.
                   88  WS-VALUE-TXT-SEARCH-APOS     VALUE ''''.
                   88  WS-VALUE-TXT-SEARCH-QUOT     VALUE '"'.
                   88  WS-VALUE-TXT-SEARCH-BLANK    VALUE ' '.
      
       01  WS-INDICATORS-AND-SWITCHES.
           05  WS-ENTITY-SEARCH-SW                  PIC X(01).
               88  WS-ENTITY-SEARCH-COMPLETE        VALUE 'C'.
               88  WS-ENTITY-SEARCH-INCOMPLETE      VALUE 'I'.
      
       01  WS-CONSTANTS.
           05  WS-LEFT-ANGLE-BRACKET    PIC X(01)  VALUE '<'.
           05  WS-RIGHT-ANGLE-BRACKET   PIC X(01)  VALUE '>'.
           05  WS-LEFT-BRACKET          PIC X(01)  VALUE '['.
           05  WS-RIGHT-BRACKET         PIC X(01)  VALUE ']'.
           05  WS-EQUALS                PIC X(01)  VALUE '='.
           05  WS-DASH                  PIC X(01)  VALUE '-'.
           05  WS-SLASH                 PIC X(01)  VALUE '/'.
           05  WS-EXCLAMATION           PIC X(01)  VALUE '!'.
           05  WS-QUOTE                 PIC X(01)  VALUE ''''.
           05  WS-DOUBLE-QUOTE          PIC X(01)  VALUE '"'.
           05  WS-CDATA                 PIC X(05)  VALUE 'CDATA'.
           05  WS-ENTITY-LT             PIC X(04)  VALUE '&lt;'.
           05  WS-ENTITY-GT             PIC X(04)  VALUE '&gt;'.
           05  WS-ENTITY-AMP            PIC X(05)  VALUE '&amp;'.
           05  WS-ENTITY-APOS           PIC X(06)  VALUE '&apos;'.
           05  WS-ENTITY-QUOT           PIC X(06)  VALUE '&quot;'.
      
      *****************
       LINKAGE SECTION.
      *****************
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0008.
       COPY XCWLBUFR.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0008-PARM-INFO
                                LBUFR-BUFFER-WORK-AREA.
      
      *--------------
       0000-MAINLINE.
      *--------------
      *
      * INITIALIZATION.
      *
           SET L0008-RETRN-OK               TO TRUE.
      
      
           IF  L0008-RETRN-ERROR
              GO TO 0000-MAINLINE-X
           END-IF.
      
           EVALUATE TRUE
      
               WHEN L0008-RQST-INITIALIZE
                   PERFORM  0500-INITIALIZE
                       THRU 0500-INITIALIZE-X
      
               WHEN L0008-RQST-START-TAG
                   PERFORM  1000-ADD-START-TAG
                       THRU 1000-ADD-START-TAG-X
      
               WHEN L0008-RQST-END-TAG
                   PERFORM  2000-ADD-END-TAG
                       THRU 2000-ADD-END-TAG-X
      
               WHEN L0008-RQST-ATTRIB-VALUE
                   PERFORM  3000-ADD-ATTRIB-VALUE
                       THRU 3000-ADD-ATTRIB-VALUE-X
      
               WHEN L0008-RQST-ELEMENT-VALUE
                   PERFORM  4000-ADD-ELEMENT-VALUE
                       THRU 4000-ADD-ELEMENT-VALUE-X
      
               WHEN L0008-RQST-CDATA
                   PERFORM  5000-ADD-CDATA
                       THRU 5000-ADD-CDATA-X
      
               WHEN L0008-RQST-QUICK-END
                   PERFORM  6000-QUICK-END
                       THRU 6000-QUICK-END-X
      
               WHEN OTHER
                    SET L0008-RETRN-INVALID-REQUEST  
                                            TO TRUE
      
           END-EVALUATE.
      
           SUBTRACT 1
               FROM L0008-CHAR-PTR
             GIVING LBUFR-BUFFER-LEN.
      
       0000-MAINLINE-X.
           GOBACK.
      
      *----------------
       0500-INITIALIZE.
      *----------------
      
           SET L0008-WORK-BUFR-ADDRESS
                                            TO 
                                ADDRESS OF LBUFR-BUFFER-WORK-AREA.
           COMPUTE L0008-CHAR-PTR
                 = LBUFR-BUFFER-LEN
                 + 1.
           MOVE SPACES                      TO L0008-STACK-ELEMENT-INFO.
           MOVE ZERO                        TO L0008-STACK-CTR.
           IF  L0008-XML-DECL-REQUIRED
               MOVE '<?xml version="1.0" encoding="UTF-8"?>'
                   TO LBUFR-BUFFER-TXT(L0008-CHAR-PTR:38)
               ADD 38                       TO LBUFR-BUFFER-LEN
               ADD 38                       TO L0008-CHAR-PTR
           END-IF.
      
       0500-INITIALIZE-X.
           EXIT.
      /
      *-------------------
       1000-ADD-START-TAG.
      *-------------------
      
      ******************************************************************
      *
      *  1.  START TAG
      *
      *      MOVE START-TAG TO BUFR-BUFFER(CURRENT-POSITION:)
      *
      *      ADD LENGTH OF START-TAG TO CURRENT-POSITION.
      *      ADD 1 TO START-TAG-INDEX.
      *      MOVE START-TAG TO STACK-START-TAG (START-TAG-INDEX).
      *      SET STACK-START-TAG-BLANK (START-TAG-INDEX) TO TRUE.
      *
      ******************************************************************
      *  L0008-CHAR-PTR IS POINTING TO THE NEXT AVAILABLE POSITION IN
      *  THE DOCUMENT.  INSERT TAG IN THIS POSITION OF THE BUFFER.  THE
      *  TAG STARTS WITH '<'.  THE CURRENT TAG IS STORED IN THE WORKING
      *  STORAGE ARRAY, IN THE NEXT AVAILABLE POSITION
      ******************************************************************
      *  LBUFR-BUFFER-LEN CONTAINS THE EXACT LENGTH OF WHAT'S BEEN
      *  WRITTEN OUT SO FAR.
      *  L0008-CHAR-PTR CONTAINS THE NEXT AVAILABLE POSITION FOR WRITING
      *  INTO THE BUFFER - SO IT MUST BE GREATER THAN
      *  LBUFR-BUFFER-LEN.
      ******************************************************************
      
      * CONDITION TO CHECK WHETHER THE PREVIOUS START TAG WAS CLOSED OFF
      
           IF  L0008-STACK-CTR > 0
               IF  L0008-STACK-ANGLE-BRACKET-NO (L0008-STACK-CTR)
                   PERFORM  8020-ADD-RIGHT-ANGLE-BRACKET
                       THRU 8020-ADD-RIGHT-ANGLE-BRACKET-X
               END-IF
           END-IF.
      
           PERFORM  8010-ADD-LEFT-ANGLE-BRACKET
               THRU 8010-ADD-LEFT-ANGLE-BRACKET-X.
      
           PERFORM  9000-PUSH-TAG-ON-STACK
               THRU 9000-PUSH-TAG-ON-STACK-X.
      
           PERFORM  8030-ADD-TAG-NAME
               THRU 8030-ADD-TAG-NAME-X.
      
       1000-ADD-START-TAG-X.
           EXIT.
      
      *----------------
       2000-ADD-END-TAG.
      *----------------
      
           IF  L0008-STACK-CTR = 0
               GO TO 2000-ADD-END-TAG-X
           END-IF.
      
           PERFORM  9100-POP-STACK-AND-WRITE
               THRU 9100-POP-STACK-AND-WRITE-X.
      
       2000-ADD-END-TAG-X.
           EXIT.
      
      *---------------------
       3000-ADD-ATTRIB-VALUE.
      *---------------------
      *
      *  3.  ATTRIB/VALUE
      *      ADD THE ATTRIBUTE="  " TO THE XML STRING
      *      UPDATE THE POINTERS
      *
           IF  L0008-STACK-ANGLE-BRACKET-YES (L0008-STACK-CTR)
      *MSG:    INVALID ATTRIBUTE REQUEST - CAN'T ADD ATTRIBUTE
      *        START TAG ALREADY CONTAINS RIGHT ANGLE BRACKET
               MOVE 'XS00080001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0008-RETRN-INVALID-ATTR-RQST  
                                            TO TRUE
               GO TO 3000-ADD-ATTRIB-VALUE-X
           END-IF.
      
           IF  L0008-XML-ELEMENT NOT =
               L0008-STACK-ELEMENT-NAME (L0008-STACK-CTR)
      *MSG:    INVALID ELEMENT REQUEST - ELEMENT NAME DOESN'T
      *        MATCH CURRENT ELEMENT NAME - REQUEST REJECTED.
               MOVE 'XS00080002'            TO WGLOB-MSG-REF-INFO
               MOVE L0008-XML-ELEMENT       TO WGLOB-MSG-PARM (1)
               MOVE L0008-STACK-ELEMENT-NAME (L0008-STACK-CTR)
                                            TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0008-RETRN-INVALID-ELMNT-RQST 
                                            TO TRUE
               GO TO 3000-ADD-ATTRIB-VALUE-X
           END-IF.
      
           PERFORM  8070-ADD-ATTR-NAME
               THRU 8070-ADD-ATTR-NAME-X.
      
           PERFORM  8080-ADD-ATTR-VALUE
               THRU 8080-ADD-ATTR-VALUE-X.
      
       3000-ADD-ATTRIB-VALUE-X.
           EXIT.
      
      *----------------------
       4000-ADD-ELEMENT-VALUE.
      *----------------------
      
      *  4.  ELEMENT/VALUE
      *      IF NO VALUE
      *          END OFF THE CURRENT START TAG WITH '>'
      *          OUTPUT THE VALUE
      *          SET THE TAG-VALUE TO TRUE TO INDICATE THAT THERE
      *          IS A VALUE
      *      ELSE
      *          ERROR CONDITION - ATTEMPT TO PUT TWO OR MORE VALUES
      *                            ON THIS START TAG
      *      END-IF.
      
           IF  L0008-XML-ELEMENT NOT =
               L0008-STACK-ELEMENT-NAME (L0008-STACK-CTR)
      *MSG:    INVALID ELEMENT REQUEST - ELEMENT NAME DOESN'T
      *        MATCH CURRENT ELEMENT NAME - REQUEST REJECTED.
               MOVE 'XS00080002'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0008-RETRN-INVALID-ELMNT-RQST 
                                            TO TRUE
               GO TO 4000-ADD-ELEMENT-VALUE-X
           END-IF.
      
           IF  L0008-STACK-ANGLE-BRACKET-NO (L0008-STACK-CTR)
               PERFORM  8020-ADD-RIGHT-ANGLE-BRACKET
                   THRU 8020-ADD-RIGHT-ANGLE-BRACKET-X
           END-IF.
      
           PERFORM  8090-ADD-DATA-VALUE
               THRU 8090-ADD-DATA-VALUE-X.
      
       4000-ADD-ELEMENT-VALUE-X.
           EXIT.
      
      *--------------
       5000-ADD-CDATA.
      *--------------
      
      *  5.  CDATA
      *      THE FORMAT OF CDATA IS AS FOLLOWS:
      *      <![CDATA[   ***   SOME STUFF  ***  ]]>
      *
           IF  L0008-STACK-ANGLE-BRACKET-NO (L0008-STACK-CTR)
               PERFORM  8020-ADD-RIGHT-ANGLE-BRACKET
                   THRU 8020-ADD-RIGHT-ANGLE-BRACKET-X
           END-IF.
      
           PERFORM  8010-ADD-LEFT-ANGLE-BRACKET
               THRU 8010-ADD-LEFT-ANGLE-BRACKET-X.
      
           PERFORM  8100-ADD-EXCLAMATION
               THRU 8100-ADD-EXCLAMATION-X.
      
           PERFORM  8050-ADD-LEFT-BRACKET
               THRU 8050-ADD-LEFT-BRACKET-X.
      
           PERFORM  8110-ADD-CDATA
               THRU 8110-ADD-CDATA-X.
      
           PERFORM  8050-ADD-LEFT-BRACKET
               THRU 8050-ADD-LEFT-BRACKET-X.
      
           PERFORM  8090-ADD-DATA-VALUE
               THRU 8090-ADD-DATA-VALUE-X.
      
           PERFORM  8060-ADD-RIGHT-BRACKET
               THRU 8060-ADD-RIGHT-BRACKET-X
                2 TIMES.
      
           PERFORM  8020-ADD-RIGHT-ANGLE-BRACKET
               THRU 8020-ADD-RIGHT-ANGLE-BRACKET-X.
      
       5000-ADD-CDATA-X.
           EXIT.
      
      *--------------
       6000-QUICK-END.
      *--------------
      
           IF  L0008-STACK-CTR = 0
               GO TO 6000-QUICK-END-X
           END-IF.
      
           PERFORM  9100-POP-STACK-AND-WRITE
               THRU 9100-POP-STACK-AND-WRITE-X
              UNTIL L0008-STACK-CTR = 0.
      
       6000-QUICK-END-X.
           EXIT.
      
      
      ******************************************************************
      *  THE 8000 SERIES PARAGRAPHS EXIST TO APPEND INDIVIDUAL
      *  COMPONENTS OF XML TO THE DOCUMENT.  EACH PARAGRAPH WILL ADD
      *  A COMPONENT TO THE OUTPUT STRING AND UPDATE THE POINTER
      *  ACCORDINGLY.
      ******************************************************************
      
      *---------------------------
       8010-ADD-LEFT-ANGLE-BRACKET.
      *---------------------------
      *
      *    ADD:   <
      
           MOVE WS-LEFT-ANGLE-BRACKET
                                            TO 
                         LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1)
           ADD +1
             TO L0008-CHAR-PTR.
      
       8010-ADD-LEFT-ANGLE-BRACKET-X.
           EXIT.
      
      *---------------------------
       8020-ADD-RIGHT-ANGLE-BRACKET.
      *---------------------------
      *
      *    ADD:   >
      
           MOVE WS-RIGHT-ANGLE-BRACKET
                                            TO 
                         LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1)
           ADD +1
                                            TO L0008-CHAR-PTR.
           SET L0008-STACK-ANGLE-BRACKET-YES (L0008-STACK-CTR) 
                                            TO TRUE.
      
       8020-ADD-RIGHT-ANGLE-BRACKET-X.
           EXIT.
      
      *-----------------
       8030-ADD-TAG-NAME.
      *-----------------
      *
      *    ADD:   TAGNAME
      
           MOVE L0008-STACK-ELEMENT-NAME-LEN (L0008-STACK-CTR)
                                            TO L0008-WORK-CTR.
      
           MOVE L0008-STACK-ELEMENT-NAME (L0008-STACK-CTR)
                                            TO 
              LBUFR-BUFFER-TXT(L0008-CHAR-PTR:L0008-WORK-CTR).
      
           ADD L0008-WORK-CTR	            TO L0008-CHAR-PTR.

      
       8030-ADD-TAG-NAME-X.
           EXIT.
      
      *---------------
       8040-ADD-SLASH.
      *---------------
      *
      *    ADD:   /
      
           MOVE WS-SLASH                    TO
                           LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1).
           ADD +1                           TO L0008-CHAR-PTR.
      
       8040-ADD-SLASH-X.
           EXIT.
      
      *---------------------
       8050-ADD-LEFT-BRACKET.
      *---------------------
      *
      *    ADD:   [
      
           MOVE WS-LEFT-BRACKET	            TO
                               LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1).
           ADD +1                           TO L0008-CHAR-PTR.
      
       8050-ADD-LEFT-BRACKET-X.
           EXIT.
      
      *----------------------
       8060-ADD-RIGHT-BRACKET.
      *----------------------
      *
      *    ADD:   ]
      
           MOVE WS-RIGHT-BRACKET
                                            TO 
                     LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1).                       
           ADD +1                           TO L0008-CHAR-PTR.
      
       8060-ADD-RIGHT-BRACKET-X.
           EXIT.
      
      *------------------
       8070-ADD-ATTR-NAME.
      *------------------
      *
      *    ADD:   ATTRIBUTE
      
           MOVE SPACE		                TO 
                                 LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1).
           ADD 1                            TO L0008-CHAR-PTR.
      
           IF L0008-XML-ATTRIBUTE-LEN > 0
               MOVE L0008-XML-ATTRIBUTE-LEN TO L0008-WORK-CTR
           ELSE
               PERFORM
                 VARYING L0008-WORK-CTR
                    FROM LENGTH OF L0008-XML-ATTRIBUTE
                    BY   -1
                   UNTIL L0008-XML-ATTRIBUTE(L0008-WORK-CTR:1)
                     NOT = SPACE
                   CONTINUE
               END-PERFORM
           END-IF.
      
           MOVE L0008-XML-ATTRIBUTE         TO                                        
      	      LBUFR-BUFFER-TXT(L0008-CHAR-PTR:L0008-WORK-CTR).
      
           ADD L0008-WORK-CTR	           TO L0008-CHAR-PTR.

      
       8070-ADD-ATTR-NAME-X.
           EXIT.
      
      *-------------------
       8080-ADD-ATTR-VALUE.
      *-------------------
      *
      *    ADD:   ="ATTRIBUTE VALUE"
           MOVE WS-EQUALS	                TO
                             LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1).
           ADD 1                            TO L0008-CHAR-PTR.
      
           MOVE WS-DOUBLE-QUOTE	            TO 
                               LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1).
           ADD 1                            TO L0008-CHAR-PTR.
      
           PERFORM  8090-ADD-DATA-VALUE
               THRU 8090-ADD-DATA-VALUE-X.
      
           MOVE WS-DOUBLE-QUOTE	            TO
                             LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1).
           ADD 1                            TO L0008-CHAR-PTR.
      
       8080-ADD-ATTR-VALUE-X.
           EXIT.
      
      *----------------------
       8090-ADD-DATA-VALUE.
      *----------------------
      *
      *    ADD:   DATA VALUE
      
           IF  L0008-RQST-CDATA
           OR  L0008-ENTITY-NOT-SUPPORTED
               PERFORM  8091-MOVE-DATA-TO-XML
                   THRU 8091-MOVE-DATA-TO-XML-X
           ELSE
               MOVE L0008-XML-DATA-VALUE    TO WS-VALUE-TXT

               PERFORM  8500-SEARCH-REPLACE-ENTITY
                   THRU 8500-SEARCH-REPLACE-ENTITY-X
           END-IF.
      
       8090-ADD-DATA-VALUE-X.
           EXIT.
      
      *---------------------
       8091-MOVE-DATA-TO-XML.
      *---------------------
      
           IF  L0008-XML-DATA-VALUE-LEN > 0
               MOVE L0008-XML-DATA-VALUE-LEN 
                                            TO L0008-WORK-CTR
           ELSE
               PERFORM
                 VARYING L0008-WORK-CTR
                    FROM LENGTH OF L0008-XML-DATA-VALUE
                    BY   -1
                   UNTIL L0008-XML-DATA-VALUE(L0008-WORK-CTR:1)
                     NOT = SPACE
                   CONTINUE
               END-PERFORM
           END-IF.
      
           MOVE L0008-XML-DATA-VALUE        TO 
                    LBUFR-BUFFER-TXT(L0008-CHAR-PTR:L0008-WORK-CTR).
      
           ADD L0008-WORK-CTR	            TO L0008-CHAR-PTR.
              
      
       8091-MOVE-DATA-TO-XML-X.
           EXIT.
      
      
      *--------------------
       8100-ADD-EXCLAMATION.
      *--------------------
      *
      *    ADD:   !
      
           MOVE WS-EXCLAMATION	            TO
                            LBUFR-BUFFER-TXT(L0008-CHAR-PTR:1).
           ADD +1                           TO L0008-CHAR-PTR.
      
       8100-ADD-EXCLAMATION-X.
           EXIT.
      
      *--------------
       8110-ADD-CDATA.
      *--------------
      *
      *    ADD:   CDATA
      
           MOVE WS-CDATA                    TO
                               LBUFR-BUFFER-TXT(L0008-CHAR-PTR:5).
           ADD +5                           TO L0008-CHAR-PTR.
      
       8110-ADD-CDATA-X.
           EXIT.
      
      *--------------------------
       8500-SEARCH-REPLACE-ENTITY.
      *--------------------------
      
           MOVE +1                          TO L0008-WORK-STRT-SUB.
           MOVE ZERO                        TO L0008-WORK-END-SUB.
           MOVE ZERO                        TO L0008-WORK-LENGTH.
           SET WS-ENTITY-SEARCH-INCOMPLETE  TO TRUE.
           SET WS-SEARCH-INDX               TO +1.
      
           PERFORM
               UNTIL  WS-ENTITY-SEARCH-COMPLETE
                 SEARCH  WS-VALUE-TXT-BYTE
                 VARYING WS-SEARCH-INDX
      
                   AT END
                       SET WS-ENTITY-SEARCH-COMPLETE   
                                            TO TRUE
      
                   WHEN  WS-VALUE-TXT-SEARCH-AMP (WS-SEARCH-INDX)
                       PERFORM  8510-ENTITY-AMP
                           THRU 8510-ENTITY-AMP-X
      
                   WHEN  WS-VALUE-TXT-SEARCH-LT (WS-SEARCH-INDX)
                       PERFORM  8520-ENTITY-LT
                           THRU 8520-ENTITY-LT-X
      
                   WHEN  WS-VALUE-TXT-SEARCH-GT (WS-SEARCH-INDX)
                       PERFORM  8530-ENTITY-GT
                           THRU 8530-ENTITY-GT-X
      
                   WHEN  WS-VALUE-TXT-SEARCH-APOS (WS-SEARCH-INDX)
                       PERFORM  8540-ENTITY-APOS
                           THRU 8540-ENTITY-APOS-X
      
                   WHEN  WS-VALUE-TXT-SEARCH-QUOT (WS-SEARCH-INDX)
                       PERFORM  8550-ENTITY-QUOT
                           THRU 8550-ENTITY-QUOT-X
      
                   WHEN  WS-VALUE-TXT-SEARCH-BLANK (WS-SEARCH-INDX)
                       PERFORM  8560-CHECK-FOR-ALL-BLANK
                           THRU 8560-CHECK-FOR-ALL-BLANK-X
      
               END-SEARCH
      
           END-PERFORM.
      
      
       8500-SEARCH-REPLACE-ENTITY-X.
           EXIT.
      
      *---------------
       8510-ENTITY-AMP.
      *---------------
      
           PERFORM  8570-MOVE-PORTION-TO-XML
               THRU 8570-MOVE-PORTION-TO-XML-X.
      
           MOVE WS-ENTITY-AMP               TO
                              LBUFR-BUFFER-TXT(L0008-CHAR-PTR:5).
           ADD +5                           TO L0008-CHAR-PTR.
      
           SET WS-SEARCH-INDX UP BY +1.
      
       8510-ENTITY-AMP-X.
           EXIT.
      
      *--------------
       8520-ENTITY-LT.
      *--------------
      
           PERFORM  8570-MOVE-PORTION-TO-XML
               THRU 8570-MOVE-PORTION-TO-XML-X.
      
           MOVE WS-ENTITY-LT                TO
                                 LBUFR-BUFFER-TXT(L0008-CHAR-PTR:4).
           ADD +4                           TO L0008-CHAR-PTR.
      
           SET WS-SEARCH-INDX UP BY +1.
      
       8520-ENTITY-LT-X.
           EXIT.
      
      *--------------
       8530-ENTITY-GT.
      *--------------
      
           PERFORM  8570-MOVE-PORTION-TO-XML
               THRU 8570-MOVE-PORTION-TO-XML-X.
      
           MOVE WS-ENTITY-GT                TO 
                                    LBUFR-BUFFER-TXT(L0008-CHAR-PTR:4).
           ADD +4                           TO L0008-CHAR-PTR.
      
           SET WS-SEARCH-INDX UP BY +1.
      
       8530-ENTITY-GT-X.
           EXIT.
      
      *----------------
       8540-ENTITY-APOS.
      *----------------
      
           PERFORM  8570-MOVE-PORTION-TO-XML
               THRU 8570-MOVE-PORTION-TO-XML-X.
      
           MOVE WS-ENTITY-APOS              TO 
                     LBUFR-BUFFER-TXT(L0008-CHAR-PTR:6).
           ADD +6                           TO L0008-CHAR-PTR.
      
           SET WS-SEARCH-INDX UP BY +1.
      
       8540-ENTITY-APOS-X.
           EXIT.
      
      *----------------
       8550-ENTITY-QUOT.
      *----------------
      
           PERFORM  8570-MOVE-PORTION-TO-XML
               THRU 8570-MOVE-PORTION-TO-XML-X.
      
           MOVE WS-ENTITY-QUOT              TO 
                           LBUFR-BUFFER-TXT(L0008-CHAR-PTR:6).
           ADD +6                           TO L0008-CHAR-PTR.
      
           SET WS-SEARCH-INDX UP BY +1.
      
       8550-ENTITY-QUOT-X.
           EXIT.
      
      *------------------------
       8560-CHECK-FOR-ALL-BLANK.
      *------------------------
      
           SET L0008-WORK-END-SUB           TO WS-SEARCH-INDX.
      
           COMPUTE L0008-WORK-LENGTH = LENGTH OF WS-VALUE-TXT
                             - L0008-WORK-END-SUB
                             + 1.
      
           IF  WS-VALUE-TXT (L0008-WORK-END-SUB:L0008-WORK-LENGTH)
               = SPACES
               PERFORM  8570-MOVE-PORTION-TO-XML
                   THRU 8570-MOVE-PORTION-TO-XML-X
               SET WS-ENTITY-SEARCH-COMPLETE TO TRUE
           END-IF.
      
           SET WS-SEARCH-INDX UP BY +1.
      
       8560-CHECK-FOR-ALL-BLANK-X.
           EXIT.
      
      *------------------------
       8570-MOVE-PORTION-TO-XML.
      *------------------------
      *  THIS PARAGRAPH MOVES THE PORTION OF THE VALUE
      *  FROM THE LAST ENTITY POSITION (OR START) TO THE CURRENT
      *  ENTITY POSITION
      *
           SET L0008-WORK-END-SUB TO WS-SEARCH-INDX.
           COMPUTE L0008-WORK-LENGTH = L0008-WORK-END-SUB
                                     - L0008-WORK-STRT-SUB.
           IF L0008-WORK-LENGTH > 0
               MOVE L0008-XML-DATA-VALUE
                      (L0008-WORK-STRT-SUB:L0008-WORK-LENGTH)
                                            TO
                 LBUFR-BUFFER-TXT(L0008-CHAR-PTR:L0008-WORK-LENGTH)
           END-IF.
      
           ADD L0008-WORK-LENGTH
                                            TO L0008-CHAR-PTR.
           COMPUTE L0008-WORK-STRT-SUB = L0008-WORK-END-SUB + 1.
      
       8570-MOVE-PORTION-TO-XML-X.
           EXIT.
      
      *----------------------
       9000-PUSH-TAG-ON-STACK.
      *----------------------
      
           ADD +1        TO L0008-STACK-CTR.
           MOVE L0008-XML-ELEMENT           TO 
             L0008-STACK-ELEMENT-NAME (L0008-STACK-CTR).
           IF L0008-XML-ELEMENT-LEN > 0
               MOVE L0008-XML-ELEMENT-LEN   TO
                 L0008-STACK-ELEMENT-NAME-LEN (L0008-STACK-CTR)
           ELSE
               PERFORM
                 VARYING L0008-WORK-CTR
                    FROM LENGTH OF
                            L0008-STACK-ELEMENT-NAME (L0008-STACK-CTR)
                    BY   -1
                   UNTIL L0008-STACK-ELEMENT-NAME
                          (L0008-STACK-CTR)(L0008-WORK-CTR:1)
                     NOT = SPACE
                   CONTINUE
               END-PERFORM
               MOVE L0008-WORK-CTR          TO
                 L0008-STACK-ELEMENT-NAME-LEN (L0008-STACK-CTR)
           END-IF.
           SET L0008-STACK-ANGLE-BRACKET-NO (L0008-STACK-CTR)
                                            TO TRUE.
      
       9000-PUSH-TAG-ON-STACK-X.
           EXIT.
      
      *------------------------
       9100-POP-STACK-AND-WRITE.
      *------------------------
      *
      *  TERMINATE CURRENT TAG WITH EITHER A SLASH OR AN END TAG NAME
      *
      *  IF NOTHING WAS ENTERED FOR THE ELEMENT, TERMINATE IT WITH A
      *  SLASH
      *
           IF L0008-STACK-ANGLE-BRACKET-NO (L0008-STACK-CTR)
               PERFORM  8040-ADD-SLASH
                   THRU 8040-ADD-SLASH-X
           ELSE
               PERFORM  8010-ADD-LEFT-ANGLE-BRACKET
                   THRU 8010-ADD-LEFT-ANGLE-BRACKET-X
               PERFORM  8040-ADD-SLASH
                   THRU 8040-ADD-SLASH-X
               PERFORM  8030-ADD-TAG-NAME
                   THRU 8030-ADD-TAG-NAME-X
           END-IF.
      
           PERFORM  8020-ADD-RIGHT-ANGLE-BRACKET
               THRU 8020-ADD-RIGHT-ANGLE-BRACKET-X.
      
           MOVE SPACES TO L0008-STACK-ELEMENT-REC (L0008-STACK-CTR).
           SUBTRACT +1    FROM L0008-STACK-CTR.
      
      *  WHEN THE DOCUMENT IS COMPLETE, RESET THE WORKING STORAGE
      *  ADDRESS POINTER OF THE BUFFER SO THAT THE NEXT CALL INTO
      *  THIS ROUTINE PROPERLY INITIALIZES ALL OF WORKING STORAGE
      *  AGAIN.
      
           IF L0008-STACK-CTR = 0
               COMPUTE L0008-WORK-LENGTH = LENGTH OF LBUFR-BUFFER-TXT
                                 - L0008-CHAR-PTR
                                 + 1
               MOVE LOW-VALUES
                 TO LBUFR-BUFFER-TXT(L0008-CHAR-PTR:L0008-WORK-LENGTH)
           END-IF.
      
       9100-POP-STACK-AND-WRITE-X.
           EXIT.
      /
      ******************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                  *
      ******************************************************************
       COPY XCPL0260.
      /
      ******************************************************************
      *    ERROR HANDLING ROUTINES                                     *
      ******************************************************************
      
       COPY XCPL0030.
      
      ******************************************************************
      *             END OF PROGRAM  XSDU0008                           *
      ******************************************************************
