      **************************
       IDENTIFICATION DIVISION.
      **************************
       PROGRAM-ID. XSDU0009.

      *****************************************************************
      **  MEMBER :  XSDU0009                                         **
      **  REMARKS:  XML PARSER FOR INGENIUM.  THIS PROGRAM WILL PARSE**
      **            AN XML DOCUMENT INTO ITS COMPONENT PARTS,        **
      **            RETURNING ONE SET OF PARTS WITH EACH CALL UNTIL  **
      **            COMPLETELY PARSED.                               **
      **                                                             **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************

      ***********************
       ENVIRONMENT DIVISION.
      ***********************

      ***********************
       CONFIGURATION SECTION.
      ***********************
      
      ***************
       DATA DIVISION.
      ***************
      
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0009'.
      
       COPY SQLCA.
      
       01  WS-WORKING-STORAGE-FIELDS.
           05  FILLER                           PIC X(32) VALUE
               'WORKING-STORAGE FOR XSDU0009>>>:'.
           05  WS-SUB1                          PIC S9(9)  BINARY.
           05  WS-SUB2                          PIC S9(9)  BINARY.
           05  WS-SUB3                          PIC S9(9)  BINARY.
           05  WS-START-SUB                     PIC S9(9)  BINARY.
           05  WS-SEQ-NUM                       PIC S9(9)  BINARY.
           05  WS-END-SUB                       PIC S9(9)  BINARY.
           05  WS-BASE-PTR                      PIC S9(9)  BINARY.
           05  WS-LEN                           PIC S9(4)  BINARY.
           05  WS-ENTITY-LEN                    PIC S9(4)  BINARY.
           05  WS-LEAD-SPACE-CTR                PIC S9(4)  BINARY.
           05  WS-SEARCH-FOUND-POS              PIC S9(9)  BINARY.
           05  WS-COLON-SUB                     PIC S9(9)  BINARY.
           05  WS-SEARCH-CHAR                   PIC X.
           05  WS-WHITE-SPACE-CHECK             PIC X.
           05  WS-ENTITY-FIELD                  PIC X(06).
           05  WS-MARKUP-CHAR                   PIC X.
           05  WS-ATTRIBUTE-NAME                PIC X(50).
           05  WS-ELEMENT-NAME.
               10  WS-ELEMENT-NAMESPACE         PIC X(10).
               10  WS-ELEMENT-NAME-UNQUALIFIED  PIC X(50).
           05  WS-DATA-VALUE-FIELD.
               10  WS-DATA-VALUE-CHAR           PIC X(01)
                                                OCCURS 1010 TIMES.
           05  WS-NAME-VALUE-FIELD.
               10  WS-NAME-VALUE-CHAR           PIC X(01)
                                                OCCURS 1000 TIMES.
           05  FILLER REDEFINES WS-NAME-VALUE-FIELD.
               10  FILLER                       PIC X(5).
                   88  WS-CDATA                 VALUE 'CDATA'.
           05  WS-CDATA-CONSTANT                PIC X(05) VALUE 'CDATA'.
           05  WS-END-OF-MSG-SWITCH             PIC X(01).
               88  WS-END-OF-MSG                VALUE 'Y'.
               88  WS-END-OF-MSG-NO             VALUE 'N'.
           05  WS-INVALID-CHAR-FOUND-SWITCH     PIC X(01).
               88  WS-INVALID-CHAR-FOUND        VALUE 'Y'.
               88  WS-INVALID-CHAR-NOT-FOUND    VALUE 'N'.
           05  WS-SEARCH-RESULT-SWITCH          PIC X(01).
               88  WS-SEARCH-RESULT-FOUND       VALUE 'Y'.
               88  WS-SEARCH-RESULT-NOT-FOUND   VALUE 'N'.
           05  WS-PARSE-ERROR-SWITCH            PIC X(01).
               88  WS-PARSE-ERROR-YES           VALUE 'Y'.
               88  WS-PARSE-ERROR-NO            VALUE 'N'.
           05  FILLER                           PIC  X(10).
           05  WS-XML-BUFFER-ADDRESS            POINTER VALUE NULL.
      
       01  WS-CONSTANTS.
           05  WS-LEFT-ANGLE-BRACKET            PIC X(01)  VALUE '<'.
           05  WS-RIGHT-ANGLE-BRACKET           PIC X(01)  VALUE '>'.
           05  WS-LEFT-BRACKET                  PIC X(01)  VALUE '['.
           05  WS-RIGHT-BRACKET                 PIC X(01)  VALUE ']'.
           05  WS-EQUALS                        PIC X(01)  VALUE '='.
           05  WS-DASH                          PIC X(01)  VALUE '-'.
           05  WS-TAB                           PIC X(01)  VALUE X'05'.
           05  WS-LF                            PIC X(01)  VALUE X'25'.
           05  WS-CR                            PIC X(01)  VALUE X'0d'.
           05  WS-QUOTE                         PIC X(01)  VALUE ''''.
           05  WS-DOUBLE-QUOTE                  PIC X(01)  VALUE '"'.
           05  WS-COLON                         PIC X(01)  VALUE ':'.
      
           05  WS-VALID-CHARACTER-TXT           PIC X(01).
               88  WS-VALID-CHARACTER  VALUES '_', 'A', 'B', 'C', 'D',
                                              'E', 'F', 'G', 'H', 'I',
                                              'J', 'K', 'L', 'M', 'N',
                                              'O', 'P', 'Q', 'R', 'S',
                                              'T', 'U', 'V', 'W', 'X',
                                              'Y', 'Z', 'a', 'b', 'c',
                                              'd', 'e', 'f', 'g', 'h',
                                              'i', 'j', 'k', 'l', 'm',
                                              'n', 'o', 'p', 'q', 'r',
                                              's', 't', 'u', 'v', 'w',
                                              'x', 'y', 'z', '0', '1',
                                              '2', '3', '4', '5', '6',
                                              '7', '8', '9', '-', ':'.
           05  WS-VALID-FIRST-CHARACTER-TXT     PIC X(01).
               88  WS-VALID-FIRST-CHARACTER  VALUES '_', 'A', 'B', 'C',
                                               'D', 'E', 'F', 'G', 'H',
                                                    'I', 'J', 'K', 'L',
                                                    'M', 'N', 'O', 'P',
                                                    'Q', 'R', 'S', 'T',
                                                    'U', 'V', 'W', 'X',
                                                    'Y', 'Z', 'a', 'b',
                                                    'c', 'd', 'e', 'f',
                                                    'g', 'h', 'i', 'j',
                                                    'k', 'l', 'm', 'n',
                                                    'o', 'p', 'q', 'r',
                                                    's', 't', 'u', 'v',
                                                    'w', 'x', 'y', 'z'.
      
           05  WS-ENTITY-TABLE-SIZE           PIC S9(4) VALUE +5
                                              BINARY SYNC.
           05  WS-ENTITY-TABLE.
               10  FILLER                     PIC X(7)  VALUE '&gt;  >'.
               10  FILLER                     PIC X(7)  VALUE '&lt;  <'.
               10  FILLER                     PIC X(7)  VALUE '&amp; &'.
               10  FILLER                     PIC X(7)  VALUE '&quot;"'.
               10  FILLER                     PIC X(6)  VALUE '&apos;'.
               10  FILLER                     PIC X     VALUE QUOTE.
           05  FILLER REDEFINES WS-ENTITY-TABLE.
               10  FILLER                     OCCURS 5 TIMES.
                   15  WS-ENTITY              PIC X(6).
                   15  WS-ENTITY-CHAR         PIC X.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0009.
       COPY XCWLBUFR.
      
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0009-PARM-INFO
                                LBUFR-BUFFER-WORK-AREA.
      *--------------
       0000-MAINLINE.
      *--------------
      *
      *INITIALIZATION
      *
           IF  WS-XML-BUFFER-ADDRESS NOT =
                       ADDRESS OF LBUFR-BUFFER-WORK-AREA
           OR  L0009-INITIALIZE-YES
               SET WS-XML-BUFFER-ADDRESS    TO 
                           ADDRESS OF LBUFR-BUFFER-WORK-AREA
               SET L0009-INITIALIZE-NO      TO TRUE
               MOVE +0                      TO L0009-CHAR-PTR
               MOVE +0                      TO WS-SEQ-NUM
               SET L0009-STATE-00           TO TRUE
               MOVE SPACE                   TO L0009-RESULT-CD
               MOVE SPACE                   TO WS-TAB
               IF  WS-TAB = X'20'
                  MOVE X'09'                TO WS-TAB
                  MOVE X'0A'                TO WS-LF
                  MOVE X'0D'                TO WS-CR
               ELSE
                  MOVE X'05'                TO WS-TAB
                  MOVE X'25'                TO WS-LF
                  MOVE X'0D'                TO WS-CR
               END-IF
           END-IF.
      
           SET WS-END-OF-MSG-NO             TO TRUE.
           SET WS-PARSE-ERROR-NO            TO TRUE.
      
      *
      * MAIN PROCESS
      *
           EVALUATE TRUE
      
               WHEN L0009-RQST-GET-NEXT
                    PERFORM  0100-GET-NEXT
                        THRU 0100-GET-NEXT-X
      
               WHEN OTHER
                    SET L0009-RETRN-INVALID-REQUEST  TO TRUE
      
           END-EVALUATE.
      
           GOBACK.
      
       0000-MAINLINE-X.
           EXIT.
      /
      *--------------
       0100-GET-NEXT.
      *--------------
      
           SET WS-END-OF-MSG-NO        TO TRUE.
           SET WS-PARSE-ERROR-NO       TO TRUE.
      
           PERFORM  1000-PARSE-XML
               THRU 1000-PARSE-XML-X
              UNTIL WS-END-OF-MSG
                 OR WS-PARSE-ERROR-YES.
      
           IF  WS-PARSE-ERROR-YES
               PERFORM  9000-PARSING-COMPLETE
                   THRU 9000-PARSING-COMPLETE-X
           END-IF.
      
           IF  L0009-RETRN-PARSE-COMPLETE
               GO TO 0100-GET-NEXT-X
           END-IF.
      
           SET L0009-RETRN-OK          TO TRUE.
      
       0100-GET-NEXT-X.
           EXIT.
      
      *---------------
       1000-PARSE-XML.
      *---------------
      
           IF  L0009-STATE-01
           OR  L0009-STATE-02
           OR  L0009-STATE-03
           OR  L0009-STATE-04
           OR  L0009-STATE-05
           OR  L0009-STATE-06
               PERFORM  9000-PARSING-COMPLETE
                   THRU 9000-PARSING-COMPLETE-X
           END-IF.
      
           IF  L0009-CHAR-PTR > LBUFR-BUFFER-LEN
           OR  L0009-CHAR-PTR > LENGTH OF LBUFR-BUFFER-TXT
               SET WS-END-OF-MSG            TO TRUE
               PERFORM  9000-PARSING-COMPLETE
                   THRU 9000-PARSING-COMPLETE-X
               GO TO 1000-PARSE-XML-X
           END-IF.
      
           ADD +1 TO L0009-CHAR-PTR.
      
           EVALUATE TRUE
               WHEN L0009-STATE-00
                    PERFORM  1010-PROCESS-STATE-00
                        THRU 1010-PROCESS-STATE-00-X
      
               WHEN L0009-STATE-07
                    PERFORM  1080-PROCESS-STATE-07
                        THRU 1080-PROCESS-STATE-07-X
      
               WHEN L0009-STATE-01
                    PERFORM  1020-PROCESS-STATE-01
                        THRU 1020-PROCESS-STATE-01-X
      
               WHEN L0009-STATE-20
                    PERFORM  1210-PROCESS-STATE-20
                        THRU 1210-PROCESS-STATE-20-X
      
               WHEN L0009-STATE-25
                    PERFORM  1260-PROCESS-STATE-25
                        THRU 1260-PROCESS-STATE-25-X
      
               WHEN L0009-STATE-26
                    PERFORM  1270-PROCESS-STATE-26
                        THRU 1270-PROCESS-STATE-26-X
      
               WHEN L0009-STATE-27
                    PERFORM  1280-PROCESS-STATE-27
                        THRU 1280-PROCESS-STATE-27-X
      
               WHEN L0009-STATE-28
                    PERFORM  1290-PROCESS-STATE-28
                        THRU 1290-PROCESS-STATE-28-X
      
               WHEN L0009-STATE-31
                    PERFORM  1320-PROCESS-STATE-31
                        THRU 1320-PROCESS-STATE-31-X
      
               WHEN L0009-STATE-33
                    PERFORM  1340-PROCESS-STATE-33
                        THRU 1340-PROCESS-STATE-33-X
      
               WHEN L0009-STATE-08
                    PERFORM  1090-PROCESS-STATE-08
                        THRU 1090-PROCESS-STATE-08-X
      
               WHEN L0009-STATE-09
                    PERFORM  1100-PROCESS-STATE-09
                        THRU 1100-PROCESS-STATE-09-X
      
               WHEN L0009-STATE-10
                    PERFORM  1110-PROCESS-STATE-10
                        THRU 1110-PROCESS-STATE-10-X
      
               WHEN L0009-STATE-12
                    PERFORM  1130-PROCESS-STATE-12
                        THRU 1130-PROCESS-STATE-12-X
      
               WHEN L0009-STATE-13
                    PERFORM  1140-PROCESS-STATE-13
                        THRU 1140-PROCESS-STATE-13-X
      
               WHEN L0009-STATE-21
                    PERFORM  1220-PROCESS-STATE-21
                        THRU 1220-PROCESS-STATE-21-X
      
               WHEN L0009-STATE-22
                    PERFORM  1230-PROCESS-STATE-22
                        THRU 1230-PROCESS-STATE-22-X
      
               WHEN L0009-STATE-24
                    PERFORM  1250-PROCESS-STATE-24
                        THRU 1250-PROCESS-STATE-24-X
      
               WHEN L0009-STATE-02
                    CONTINUE
      
               WHEN L0009-STATE-03
                    CONTINUE
      
               WHEN L0009-STATE-04
                    CONTINUE
      
               WHEN L0009-STATE-05
                    CONTINUE
      
               WHEN L0009-STATE-06
                    CONTINUE
      
               WHEN L0009-STATE-11
                    CONTINUE
      
               WHEN L0009-STATE-14
                    PERFORM  1150-PROCESS-STATE-14
                        THRU 1150-PROCESS-STATE-14-X
      
               WHEN L0009-STATE-15
                    PERFORM  1160-PROCESS-STATE-15
                        THRU 1160-PROCESS-STATE-15-X
      
               WHEN L0009-STATE-16
                    PERFORM  1170-PROCESS-STATE-16
                        THRU 1170-PROCESS-STATE-16-X
      
               WHEN L0009-STATE-17
                    CONTINUE
      
               WHEN L0009-STATE-18
                    PERFORM  1190-PROCESS-STATE-18
                        THRU 1190-PROCESS-STATE-18-X
      
               WHEN L0009-STATE-19
                    PERFORM  1200-PROCESS-STATE-19
                        THRU 1200-PROCESS-STATE-19-X
      
               WHEN L0009-STATE-23
                    CONTINUE
      
               WHEN L0009-STATE-29
                    PERFORM  1300-PROCESS-STATE-29
                        THRU 1300-PROCESS-STATE-29-X
      
               WHEN OTHER
                    SET WS-PARSE-ERROR-YES  TO TRUE
      
           END-EVALUATE.
      
       1000-PARSE-XML-X.
           EXIT.
      
      *----------------------
       1010-PROCESS-STATE-00.
      *----------------------
      *  THIS PARAGRAPH IS CALLED AT THE START OF A PARSE PROCESS
      *  AND AFTER EACH SUBSEQUENT PIECE OF THE XML DOCUMENT IS PARSED
      *  OUT.
      
           IF  L0009-CHAR-PTR > LBUFR-BUFFER-LEN
           OR  L0009-CHAR-PTR > LENGTH OF LBUFR-BUFFER-TXT
               GO TO 1010-PROCESS-STATE-00-X
           END-IF.
      
           PERFORM  8000-SKIP-WHITE-SPACE
               THRU 8000-SKIP-WHITE-SPACE-X.
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
            = WS-LEFT-ANGLE-BRACKET
               SET L0009-STATE-07           TO TRUE
           ELSE
               SET L0009-STATE-33           TO TRUE
               SUBTRACT +1 FROM L0009-CHAR-PTR
           END-IF.
      
       1010-PROCESS-STATE-00-X.
           EXIT.
      
      *----------------------
       1020-PROCESS-STATE-01.
      *----------------------
      
           PERFORM  8000-SKIP-WHITE-SPACE
               THRU 8000-SKIP-WHITE-SPACE-X.
      
           EVALUATE LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
      
               WHEN '/'
                   SET L0009-STATE-21       TO TRUE
      
               WHEN '>'
                   SET L0009-STATE-00       TO TRUE
      
               WHEN OTHER
                   PERFORM  8200-GET-VALID-FIRST-CHAR
                       THRU 8200-GET-VALID-FIRST-CHAR-X
                   IF  WS-SEARCH-RESULT-FOUND
                       MOVE L0009-CHAR-PTR  TO WS-BASE-PTR
                       SET L0009-STATE-27   TO TRUE
                   ELSE
                       SET  WS-PARSE-ERROR-YES   
                                            TO TRUE
                   END-IF
      
           END-EVALUATE.
      
       1020-PROCESS-STATE-01-X.
           EXIT.
      /
      *----------------------
       1080-PROCESS-STATE-07.
      *----------------------
      
           PERFORM  8000-SKIP-WHITE-SPACE
               THRU 8000-SKIP-WHITE-SPACE-X.
      
           EVALUATE LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
               WHEN '/'
                   SET L0009-STATE-25       TO TRUE
      
               WHEN '?'
                   SUBTRACT +1 FROM L0009-CHAR-PTR
                   SET L0009-STATE-22       TO TRUE
      
               WHEN '!'
                   SET L0009-STATE-08       TO TRUE
      
               WHEN OTHER
      * VALIDATE THAT THE NAME ABOUT TO BE RETRIEVED STARTS WITH A
      * VALID CHARACTER
      *
                   PERFORM  8200-GET-VALID-FIRST-CHAR
                       THRU 8200-GET-VALID-FIRST-CHAR-X
                   IF  WS-SEARCH-RESULT-FOUND
                       MOVE L0009-CHAR-PTR  TO WS-BASE-PTR
                       SET L0009-STATE-20   TO TRUE
                   ELSE
                       SET WS-PARSE-ERROR-YES  
                                            TO TRUE
                   END-IF
           END-EVALUATE.
      
       1080-PROCESS-STATE-07-X.
           EXIT.
      
      *----------------------
       1090-PROCESS-STATE-08.
      *----------------------
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) = WS-DASH
               SET L0009-STATE-09           TO TRUE
           ELSE
               IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
                    = WS-LEFT-BRACKET
                  SET L0009-STATE-14        TO TRUE
               ELSE
                   SET WS-PARSE-ERROR-YES   TO TRUE
               END-IF
           END-IF.
      
       1090-PROCESS-STATE-08-X.
           EXIT.
      
      *----------------------
       1100-PROCESS-STATE-09.
      *----------------------
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) = WS-DASH
               SET L0009-STATE-10           TO TRUE
           ELSE
               SET WS-PARSE-ERROR-YES       TO TRUE
           END-IF.
      
       1100-PROCESS-STATE-09-X.
           EXIT.
      
      *----------------------
       1110-PROCESS-STATE-10.
      *----------------------
      
           MOVE WS-DASH                     TO WS-SEARCH-CHAR.
      
           PERFORM  8100-FIND-SEARCH-CHAR
               THRU 8100-FIND-SEARCH-CHAR-X.
      
           IF  WS-SEARCH-RESULT-FOUND
               SET L0009-STATE-12           TO TRUE
               SUBTRACT 1 FROM L0009-CHAR-PTR
           END-IF.
      
       1110-PROCESS-STATE-10-X.
           EXIT.
      
      *----------------------
       1130-PROCESS-STATE-12.
      *----------------------
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) = WS-DASH
               SET L0009-STATE-13           TO TRUE
           ELSE
               SET L0009-STATE-10           TO TRUE
           END-IF.
      
       1130-PROCESS-STATE-12-X.
           EXIT.
      
      *----------------------
       1140-PROCESS-STATE-13.
      *----------------------
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
             = WS-RIGHT-ANGLE-BRACKET
               SET L0009-STATE-00           TO TRUE
           ELSE
               SET L0009-STATE-10           TO TRUE
           END-IF.
      
       1140-PROCESS-STATE-13-X.
           EXIT.
      
      *----------------------
       1150-PROCESS-STATE-14.
      *----------------------
      
           MOVE L0009-CHAR-PTR              TO WS-BASE-PTR.
      
           PERFORM  8300-RETRIEVE-NAME
               THRU 8300-RETRIEVE-NAME-X.
      
           IF  WS-CDATA
               SET L0009-STATE-15           TO TRUE
           END-IF.
      
           SUBTRACT +1 FROM L0009-CHAR-PTR.
      
       1150-PROCESS-STATE-14-X.
           EXIT.
      
      *----------------------
       1160-PROCESS-STATE-15.
      *----------------------
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) = WS-LEFT-BRACKET
               SET L0009-STATE-16           TO TRUE
           END-IF.
      
           COMPUTE WS-BASE-PTR = L0009-CHAR-PTR + +1.
      
       1160-PROCESS-STATE-15-X.
           EXIT.
      
      *----------------------
       1170-PROCESS-STATE-16.
      *----------------------
      *
      *  LEFT BRACKET FOUND - PARSE UNTIL WE GET TO RIGHT BRACKET
      *
           MOVE WS-RIGHT-BRACKET            TO WS-SEARCH-CHAR.
      
           PERFORM  8100-FIND-SEARCH-CHAR
               THRU 8100-FIND-SEARCH-CHAR-X.
      
           IF  WS-SEARCH-RESULT-FOUND
               SET L0009-STATE-18  TO TRUE
               SUBTRACT 1 FROM L0009-CHAR-PTR
           END-IF.
      
       1170-PROCESS-STATE-16-X.
           EXIT.
      
      *----------------------
       1190-PROCESS-STATE-18.
      *----------------------
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) = WS-RIGHT-BRACKET
               SET L0009-STATE-19           TO TRUE
           ELSE
               SET L0009-STATE-16           TO TRUE
           END-IF.
      
       1190-PROCESS-STATE-18-X.
           EXIT.
      
      *----------------------
       1200-PROCESS-STATE-19.
      *----------------------
      
           MOVE WS-RIGHT-ANGLE-BRACKET      TO WS-SEARCH-CHAR.
      
           PERFORM  8100-FIND-SEARCH-CHAR
               THRU 8100-FIND-SEARCH-CHAR-X.
      
           IF  WS-SEARCH-RESULT-FOUND
               SET L0009-STATE-02           TO TRUE
               SUBTRACT 1 FROM L0009-CHAR-PTR
           ELSE
               SET L0009-STATE-16           TO TRUE
           END-IF.
      
       1200-PROCESS-STATE-19-X.
           EXIT.
      
      *----------------------
       1210-PROCESS-STATE-20.
      *----------------------
      *
      *  RETRIEVE THE WHOLE NAME
      *
           PERFORM  8300-RETRIEVE-NAME
               THRU 8300-RETRIEVE-NAME-X.
      
           MOVE WS-NAME-VALUE-FIELD         TO WS-ELEMENT-NAME.
      
           SET L0009-STATE-01               TO TRUE.
      
           SUBTRACT +1 FROM L0009-CHAR-PTR.
      
       1210-PROCESS-STATE-20-X.
           EXIT.
      
      *----------------------
       1220-PROCESS-STATE-21.
      *----------------------
      
           PERFORM  8000-SKIP-WHITE-SPACE
               THRU 8000-SKIP-WHITE-SPACE-X.
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
             = WS-RIGHT-ANGLE-BRACKET
               SET L0009-STATE-03           TO TRUE
           END-IF.
      
       1220-PROCESS-STATE-21-X.
           EXIT.
      
      *----------------------
       1230-PROCESS-STATE-22.
      *----------------------
      
           MOVE '?'                         TO WS-SEARCH-CHAR.
      
           PERFORM  8100-FIND-SEARCH-CHAR
               THRU 8100-FIND-SEARCH-CHAR-X.
      
           IF  WS-SEARCH-RESULT-FOUND
               SET L0009-STATE-24           TO TRUE
           END-IF.
      
       1230-PROCESS-STATE-22-X.
           EXIT.
      /
      *----------------------
       1250-PROCESS-STATE-24.
      *----------------------
      *
      *  SEARCHING FOR THE END OF THE XML IDENTIFIER STRING
      *  -- DATA BETWEEN THE ANGLE BRACKETS IS NOT IMPORTANT.
      *  THIS PARAGRAPH WILL INVOKE A LOOP TO OPTIMIZE THE PARSING
      *  OF THIS PORTION OF THE PARSER.
      *
      
           PERFORM
           VARYING L0009-CHAR-PTR FROM L0009-CHAR-PTR BY +1
           UNTIL LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
                 = WS-RIGHT-ANGLE-BRACKET
               CONTINUE
           END-PERFORM.
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
             = WS-RIGHT-ANGLE-BRACKET
               SET L0009-STATE-00           TO TRUE
           END-IF.
      
       1250-PROCESS-STATE-24-X.
           EXIT.
      
      *----------------------
       1260-PROCESS-STATE-25.
      *----------------------
      
      *  FORWARD SLASH FOUND - SEARCH FOR NAME TO GET TERMINATION
      *  TAG NAME
      *
           PERFORM  8200-GET-VALID-FIRST-CHAR
               THRU 8200-GET-VALID-FIRST-CHAR-X.
      
           IF  WS-SEARCH-RESULT-FOUND
               MOVE L0009-CHAR-PTR          TO WS-BASE-PTR
               SET L0009-STATE-26           TO TRUE
           ELSE
               SET WS-PARSE-ERROR-YES       TO TRUE
           END-IF.
      
       1260-PROCESS-STATE-25-X.
           EXIT.
      
      *----------------------
       1270-PROCESS-STATE-26.
      *----------------------
      
      *  SEARCHING FOR TERMINATION STRING
      *
           PERFORM  8300-RETRIEVE-NAME
               THRU 8300-RETRIEVE-NAME-X.
      
           MOVE WS-NAME-VALUE-FIELD         TO WS-ELEMENT-NAME.
      
           PERFORM  8000-SKIP-WHITE-SPACE
               THRU 8000-SKIP-WHITE-SPACE-X.
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
               = WS-RIGHT-ANGLE-BRACKET
               SET L0009-STATE-05           TO TRUE
           END-IF.
      
       1270-PROCESS-STATE-26-X.
           EXIT.
      
      *----------------------
       1280-PROCESS-STATE-27.
      *----------------------
      
      *  VALID FIRST CHARACTER OF A NAME HAS BEEN FOUND - NAME MUST BE
      *  AN ATTRIBUTE NAME
      *
           PERFORM  8300-RETRIEVE-NAME
               THRU 8300-RETRIEVE-NAME-X.
      
           MOVE WS-NAME-VALUE-FIELD (11: )  TO WS-ATTRIBUTE-NAME.
      
           PERFORM  8000-SKIP-WHITE-SPACE
               THRU 8000-SKIP-WHITE-SPACE-X.
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) = WS-EQUALS
               SET L0009-STATE-28           TO TRUE
           END-IF.
      
       1280-PROCESS-STATE-27-X.
           EXIT.
      
      *----------------------
       1290-PROCESS-STATE-28.
      *----------------------
      *
      *  ATTRIBUTE NAME HAS BEEN PARSED OUT - NOW LOOKING FOR AN
      *  ATTRIBUTE VALUE
      *
           PERFORM  8000-SKIP-WHITE-SPACE
               THRU 8000-SKIP-WHITE-SPACE-X.
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) = WS-QUOTE
               SET L0009-STATE-29           TO TRUE
           ELSE
               IF LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
                = WS-DOUBLE-QUOTE
                   SET L0009-STATE-31       TO TRUE
               ELSE
                   SET WS-PARSE-ERROR-YES   TO TRUE
               END-IF
           END-IF.
      
           COMPUTE WS-BASE-PTR = L0009-CHAR-PTR + +1.
      
       1290-PROCESS-STATE-28-X.
           EXIT.
      
      *----------------------
       1300-PROCESS-STATE-29.
      *----------------------
      *
      *  SEARCH FOR THE ENDING QUOTE - SINGLE QUOTE
      *
           MOVE WS-QUOTE                    TO WS-SEARCH-CHAR.
      
           PERFORM  8100-FIND-SEARCH-CHAR
               THRU 8100-FIND-SEARCH-CHAR-X.
      
           IF  WS-SEARCH-RESULT-FOUND
               SET L0009-STATE-04           TO TRUE
           END-IF.
      
       1300-PROCESS-STATE-29-X.
           EXIT.
      
      *----------------------
       1320-PROCESS-STATE-31.
      *----------------------
      *
      *  SEARCH FOR THE ENDING QUOTE - DOUBLE QUOTE
      *
           MOVE WS-DOUBLE-QUOTE             TO WS-SEARCH-CHAR.
      
           PERFORM  8100-FIND-SEARCH-CHAR
               THRU 8100-FIND-SEARCH-CHAR-X.
      
           IF  WS-SEARCH-RESULT-FOUND
               SET L0009-STATE-04           TO TRUE
           END-IF.
      
       1320-PROCESS-STATE-31-X.
           EXIT.
      
      *----------------------
       1340-PROCESS-STATE-33.
      *----------------------
      
           MOVE L0009-CHAR-PTR              TO WS-BASE-PTR.
           MOVE WS-LEFT-ANGLE-BRACKET       TO WS-SEARCH-CHAR.
      
           PERFORM  8100-FIND-SEARCH-CHAR
               THRU 8100-FIND-SEARCH-CHAR-X.
      
           IF  WS-SEARCH-RESULT-FOUND
               SET L0009-STATE-06           TO TRUE
               SUBTRACT +1 FROM L0009-CHAR-PTR
           END-IF.
      
      
       1340-PROCESS-STATE-33-X.
           EXIT.
      
      /
      *----------------------
       8000-SKIP-WHITE-SPACE.
      *----------------------
      
           PERFORM
            VARYING L0009-CHAR-PTR FROM L0009-CHAR-PTR BY +1
              UNTIL
               (LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) NOT = SPACE   AND
                LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) NOT = WS-TAB  AND
                LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) NOT = WS-LF   AND
                LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) NOT = WS-CR)
                 OR  L0009-CHAR-PTR > LBUFR-BUFFER-LEN
               CONTINUE
           END-PERFORM.
      
       8000-SKIP-WHITE-SPACE-X.
           EXIT.
      
      *----------------------
       8100-FIND-SEARCH-CHAR.
      *----------------------
      *
      *  THIS ROUTINE WILL SEARCH THE CURRENT XML DOCUMENT
      *  FOR THE CHARACTER SPECIFIED BY WS-SEARCH-CHAR.  THE
      *  SEARCH TAKES PLACE FROM THE CURRENT PARSE POSITION
      *  UNTIL EITHER THE CHARACTER IS FOUND, OR THE END OF THE
      *  XML DOCUMENT IS REACHED.
      *
           SET WS-SEARCH-RESULT-NOT-FOUND TO TRUE.
      
           PERFORM  8110-SEARCH
               THRU 8110-SEARCH-X
               VARYING L0009-CHAR-PTR FROM L0009-CHAR-PTR BY +1
               UNTIL WS-SEARCH-RESULT-FOUND
                 OR L0009-CHAR-PTR > LBUFR-BUFFER-LEN.
      
       8100-FIND-SEARCH-CHAR-X.
           EXIT.
      
      *------------
       8110-SEARCH.
      *------------
      
           IF  LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1) = WS-SEARCH-CHAR
               MOVE L0009-CHAR-PTR          TO WS-SEARCH-FOUND-POS
               SET WS-SEARCH-RESULT-FOUND   TO TRUE
           END-IF.
      
       8110-SEARCH-X.
           EXIT.
      
      /
      *--------------------------
       8200-GET-VALID-FIRST-CHAR.
      *--------------------------
      
           SET WS-SEARCH-RESULT-NOT-FOUND   TO TRUE.
      
           MOVE LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
                                            TO 
      		  WS-VALID-FIRST-CHARACTER-TXT
           IF  WS-VALID-FIRST-CHARACTER
               SET WS-SEARCH-RESULT-FOUND   TO TRUE
           END-IF.
      
       8200-GET-VALID-FIRST-CHAR-X.
           EXIT.
      
      /
      *---------------------
       8300-RETRIEVE-NAME.
      *---------------------
      *
      *  THIS ROUTINE SEARCHES THROUGH THE CURRENT NAME UNTIL IT REACHES
      *  THE END OF THE NAME
      *
      *  IT THEN DROPS INTO THE NEXT PARAGRAPH WHERE IT MOVES THE NAME,
      *  ONE CHARACTER AT A TIME, INTO A NAME FIELD
      *
      
           SET WS-INVALID-CHAR-NOT-FOUND    TO TRUE.
           MOVE ZERO                        TO WS-COLON-SUB.
      
           PERFORM
             UNTIL WS-INVALID-CHAR-FOUND
                OR L0009-CHAR-PTR > LBUFR-BUFFER-LEN
      
               MOVE LBUFR-BUFFER-TXT (L0009-CHAR-PTR:1)
                 TO WS-VALID-CHARACTER-TXT
               IF  WS-VALID-CHARACTER
                   IF WS-VALID-CHARACTER-TXT = WS-COLON
                       MOVE L0009-CHAR-PTR  TO WS-COLON-SUB
                   END-IF
                   ADD +1 TO L0009-CHAR-PTR
               ELSE
                   SET WS-INVALID-CHAR-FOUND 
                                            TO TRUE
               END-IF
      
           END-PERFORM.
      
           COMPUTE WS-LEN = L0009-CHAR-PTR - WS-BASE-PTR.
      
           IF  WS-COLON-SUB = ZERO
               MOVE SPACE                   TO
                                         WS-NAME-VALUE-FIELD (1:10)
               MOVE LBUFR-BUFFER-TXT (WS-BASE-PTR:WS-LEN)
                                            TO 
                              WS-NAME-VALUE-FIELD (11:)             
           ELSE
               COMPUTE WS-LEN = WS-COLON-SUB - WS-BASE-PTR
               MOVE LBUFR-BUFFER-TXT (WS-BASE-PTR:WS-LEN)
                          TO WS-NAME-VALUE-FIELD
               COMPUTE WS-LEN = L0009-CHAR-PTR - WS-COLON-SUB - 1
               MOVE LBUFR-BUFFER-TXT ((WS-COLON-SUB + 1):WS-LEN)
                          TO WS-NAME-VALUE-FIELD (11:)
           END-IF.
      
       8300-RETRIEVE-NAME-X.
           EXIT.
      
      *----------------------
       9000-PARSING-COMPLETE.
      *----------------------
      *
      *  THIS ROUTINE RETURNS THE RESULTS OF THE PARSING.  ONE SET
      *  OF VALUES IS RETURNED - EITHER A ELEMENT ONLY,
      *  AN ELEMENT/ATTRIBUTE/VALUE SET, OR AN ELEMENT/DATA PAIR
      *
           EVALUATE TRUE
      
               WHEN WS-PARSE-ERROR-YES
                   SET L0009-RETRN-ERROR    TO TRUE
                   SET L0009-RESULT-PARSE-ERROR 
                                            TO TRUE
      
               WHEN WS-END-OF-MSG
                   SET L0009-RETRN-PARSE-COMPLETE 
                                            TO TRUE
                   SET L0009-RESULT-END-OF-DATA   
                                            TO TRUE
                   SET WS-XML-BUFFER-ADDRESS 
                                            TO NULL
      
               WHEN L0009-STATE-01
                   MOVE WS-ELEMENT-NAME     TO L0009-SAVE-ELEM-NAME
                   SET L0009-RETRN-OK       TO TRUE
                   SET L0009-RESULT-START-TAG       
                                            TO TRUE
      
               WHEN L0009-STATE-02
                   MOVE L0009-SAVE-ELEM-NAME TO WS-ELEMENT-NAME
                   COMPUTE WS-END-SUB = WS-SEARCH-FOUND-POS - 1
                   PERFORM  9100-GET-DATA-VALUE-RTN
                       THRU 9100-GET-DATA-VALUE-RTN-X
                   SET L0009-STATE-00       TO TRUE
                   SET L0009-RETRN-OK       TO TRUE
                   SET L0009-RESULT-CDATA   TO TRUE
      
               WHEN L0009-STATE-03
                   MOVE L0009-SAVE-ELEM-NAME 
                                            TO WS-ELEMENT-NAME
                   SET L0009-STATE-00       TO TRUE
                   SET L0009-RETRN-OK       TO TRUE
                   SET L0009-RESULT-END-TAG TO TRUE
      
               WHEN L0009-STATE-04
                   MOVE L0009-SAVE-ELEM-NAME 
                                            TO WS-ELEMENT-NAME
                   COMPUTE WS-END-SUB = WS-SEARCH-FOUND-POS - 1
                   PERFORM  9100-GET-DATA-VALUE-RTN
                       THRU 9100-GET-DATA-VALUE-RTN-X
                   MOVE +0                  TO WS-SUB2
                   PERFORM  9200-WS-ENTITY-TABLE-RTN
                       THRU 9200-WS-ENTITY-TABLE-RTN-X
                    VARYING WS-SUB1 FROM +1 BY +1
                      UNTIL WS-SUB1 > WS-LEN
                   SET L0009-STATE-01       TO TRUE
                   SET L0009-RETRN-OK       TO TRUE
                   SET L0009-RESULT-ATTRIB-VALU-PAIR   
                                            TO TRUE
                   SUBTRACT 1 FROM L0009-CHAR-PTR
      
               WHEN L0009-STATE-05
                   SET L0009-STATE-00       TO TRUE
                   SET L0009-RETRN-OK       TO TRUE
                   SET L0009-RESULT-END-TAG TO TRUE
      
               WHEN L0009-STATE-06
                   MOVE L0009-SAVE-ELEM-NAME 
                                            TO WS-ELEMENT-NAME
                   COMPUTE WS-END-SUB = WS-SEARCH-FOUND-POS - 1
                   PERFORM  9100-GET-DATA-VALUE-RTN
                       THRU 9100-GET-DATA-VALUE-RTN-X
                   MOVE +0                  TO WS-SUB2
                   PERFORM  9200-WS-ENTITY-TABLE-RTN
                       THRU 9200-WS-ENTITY-TABLE-RTN-X
                      VARYING WS-SUB1 FROM +1 BY +1
                      UNTIL WS-SUB1 > WS-LEN
                   SET L0009-STATE-00       TO TRUE
                   SET L0009-RETRN-OK       TO TRUE
                   SET L0009-RESULT-ELEMNT-VALU-PAIR  
                                            TO TRUE
                   SUBTRACT 1 FROM L0009-CHAR-PTR
      
               WHEN OTHER
                   CONTINUE
      
           END-EVALUATE.
      
           ADD +1 TO WS-SEQ-NUM.
      
           IF WS-SEQ-NUM > L0009-SAVE-INDEX
               CONTINUE
           ELSE
               GO TO 9000-PARSING-COMPLETE-X
           END-IF.
      
           SET WS-END-OF-MSG                TO TRUE.
           MOVE WS-SEQ-NUM                  TO L0009-SAVE-INDEX.
      
           MOVE SPACES                      TO L0009-XML-ELEMENT.
           MOVE SPACES                      TO L0009-XML-ATTRIBUTE.
           MOVE SPACES                      TO L0009-XML-DATA-VALUE.
      
           EVALUATE TRUE
      
               WHEN L0009-RESULT-START-TAG
               WHEN L0009-RESULT-END-TAG
                   MOVE WS-ELEMENT-NAMESPACE 
                                            TO L0009-XML-NAMESPACE
                   MOVE WS-ELEMENT-NAME-UNQUALIFIED 
                                            TO L0009-XML-ELEMENT
      
               WHEN L0009-RESULT-ATTRIB-VALU-PAIR
                   MOVE WS-ELEMENT-NAMESPACE 
                                            TO L0009-XML-NAMESPACE
                   MOVE WS-ELEMENT-NAME-UNQUALIFIED 
                                            TO L0009-XML-ELEMENT
                   MOVE WS-ATTRIBUTE-NAME TO L0009-XML-ATTRIBUTE
                   MOVE WS-DATA-VALUE-FIELD TO L0009-XML-DATA-VALUE
      
               WHEN L0009-RESULT-CDATA
               WHEN L0009-RESULT-ELEMNT-VALU-PAIR
                   MOVE WS-ELEMENT-NAMESPACE 
                                            TO L0009-XML-NAMESPACE
                   MOVE WS-ELEMENT-NAME-UNQUALIFIED 
                                            TO L0009-XML-ELEMENT
                   MOVE WS-DATA-VALUE-FIELD TO L0009-XML-DATA-VALUE
      
               WHEN OTHER
                   CONTINUE
      
           END-EVALUATE.
      
      
       9000-PARSING-COMPLETE-X.
           EXIT.
      
      /
      *--------------------------
       9100-GET-DATA-VALUE-RTN.
      *--------------------------
      
           COMPUTE WS-LEN = WS-END-SUB - WS-BASE-PTR + 1.
      **
           IF WS-LEN = ZERO
               MOVE SPACE                   TO WS-DATA-VALUE-FIELD
               GO TO 9100-GET-DATA-VALUE-RTN-X
           END-IF.
      
           MOVE LBUFR-BUFFER-TXT (WS-BASE-PTR:WS-LEN)
             TO WS-DATA-VALUE-FIELD.
      *
           SET WS-SEARCH-RESULT-NOT-FOUND   TO TRUE.
      
           PERFORM  9110-REM-TRAIL-WHITE-SPACE
               THRU 9110-REM-TRAIL-WHITE-SPACE-X
            VARYING WS-SUB1 FROM WS-LEN BY -1
              UNTIL WS-SUB1 < +1
                 OR WS-SEARCH-RESULT-FOUND.
      
           SET WS-SEARCH-RESULT-NOT-FOUND   TO TRUE.
           MOVE +0                          TO WS-LEAD-SPACE-CTR.
      
           PERFORM  9120-CNT-LEAD-SPACES
               THRU 9120-CNT-LEAD-SPACES-X
            VARYING WS-SUB1 FROM +1 BY +1
              UNTIL WS-SUB1 > WS-LEN
                 OR WS-DATA-VALUE-FIELD = SPACES
                 OR WS-SEARCH-RESULT-FOUND.
      
           IF WS-LEAD-SPACE-CTR > 0
               COMPUTE WS-SUB1 = WS-LEAD-SPACE-CTR + 1
               MOVE WS-DATA-VALUE-FIELD (WS-SUB1:
                    LENGTH OF WS-DATA-VALUE-FIELD - WS-SUB1 + 1)
                                            TO WS-DATA-VALUE-FIELD (1:
                    LENGTH OF WS-DATA-VALUE-FIELD)
           END-IF.
      
       9100-GET-DATA-VALUE-RTN-X.
           EXIT.
      
      *---------------------------
       9110-REM-TRAIL-WHITE-SPACE.
      *---------------------------
      
           MOVE WS-DATA-VALUE-CHAR (WS-SUB1) 
                                            TO WS-WHITE-SPACE-CHECK.
      
           IF  WS-WHITE-SPACE-CHECK = SPACES
           OR  WS-WHITE-SPACE-CHECK = WS-TAB
           OR  WS-WHITE-SPACE-CHECK = WS-LF
           OR  WS-WHITE-SPACE-CHECK = WS-CR
               MOVE SPACES                  TO 
                                      WS-DATA-VALUE-CHAR (WS-SUB1)
           ELSE
               SET WS-SEARCH-RESULT-FOUND   TO TRUE
               MOVE WS-SUB1                 TO WS-LEN
           END-IF.
      
       9110-REM-TRAIL-WHITE-SPACE-X.
           EXIT.
      
      /
      *---------------------
       9120-CNT-LEAD-SPACES.
      *---------------------
      
           IF WS-DATA-VALUE-CHAR (WS-SUB1) = SPACES
               ADD +1                       TO WS-LEAD-SPACE-CTR
           ELSE
               SET WS-SEARCH-RESULT-FOUND   TO TRUE
           END-IF.
      
       9120-CNT-LEAD-SPACES-X.
           EXIT.
      /
      *-------------------------
       9200-WS-ENTITY-TABLE-RTN.
      *-------------------------
      
           IF WS-DATA-VALUE-CHAR (WS-SUB1) = '&'
               CONTINUE
           ELSE
               GO TO 9200-WS-ENTITY-TABLE-RTN-X
           END-IF.
      
           SET WS-SEARCH-RESULT-NOT-FOUND   TO TRUE.
           MOVE SPACES                      TO WS-ENTITY-FIELD.
           MOVE +1                          TO WS-ENTITY-LEN.
           MOVE WS-SUB1                     TO WS-SUB2.
      
           PERFORM  9210-FIND-MARKUP-CHAR-RTN
               THRU 9210-FIND-MARKUP-CHAR-RTN-X
            VARYING WS-SUB3 FROM 1 BY 1
              UNTIL WS-SUB3 > 6
                 OR WS-SEARCH-RESULT-FOUND.
      
           IF  WS-SEARCH-RESULT-FOUND
               SET WS-SEARCH-RESULT-NOT-FOUND 
                                            TO TRUE
               MOVE SPACES                  TO WS-MARKUP-CHAR
      
               PERFORM  9220-MATCH-ENTITY
                   THRU 9220-MATCH-ENTITY-X
                VARYING WS-SUB2 FROM 1 BY 1
                  UNTIL WS-SUB2 > WS-ENTITY-TABLE-SIZE
                     OR WS-SEARCH-RESULT-FOUND
      
               IF  WS-SEARCH-RESULT-FOUND
                   MOVE WS-MARKUP-CHAR TO WS-DATA-VALUE-CHAR (WS-SUB1)
                   COMPUTE WS-START-SUB = WS-SUB1 + 1
      
                   PERFORM  9230-SHIFT-DATA-VALUE-LEFT
                       THRU 9230-SHIFT-DATA-VALUE-LEFT-X
                    VARYING WS-SUB2 FROM WS-START-SUB BY 1
                      UNTIL WS-SUB2 > WS-LEN
               END-IF
           END-IF.
      
       9200-WS-ENTITY-TABLE-RTN-X.
           EXIT.
      
      *--------------------------
       9210-FIND-MARKUP-CHAR-RTN.
      *--------------------------
      
           IF  WS-SUB2 <= WS-LEN
               CONTINUE
           ELSE
               GO TO 9210-FIND-MARKUP-CHAR-RTN-X
           END-IF.
      
           IF  WS-SEARCH-RESULT-FOUND
               GO TO 9210-FIND-MARKUP-CHAR-RTN-X
           END-IF.
      
           MOVE WS-DATA-VALUE-CHAR (WS-SUB2)
             TO WS-ENTITY-FIELD (WS-ENTITY-LEN:1).
      
           IF  WS-DATA-VALUE-CHAR (WS-SUB2) = ';'
               SET WS-SEARCH-RESULT-FOUND   TO TRUE
           ELSE
               ADD +1                       TO WS-SUB2
               ADD +1                       TO WS-ENTITY-LEN
           END-IF.
      
       9210-FIND-MARKUP-CHAR-RTN-X.
           EXIT.
      
      *------------------
       9220-MATCH-ENTITY.
      *------------------
      
           IF  WS-ENTITY-FIELD = WS-ENTITY (WS-SUB2)
               MOVE WS-ENTITY-CHAR (WS-SUB2) 
                                            TO WS-MARKUP-CHAR
               SET WS-SEARCH-RESULT-FOUND   TO TRUE
           END-IF.
      
       9220-MATCH-ENTITY-X.
           EXIT.
      
      *--------------------------
       9230-SHIFT-DATA-VALUE-LEFT.
      *--------------------------
      
           COMPUTE WS-SUB3 = WS-SUB2 + WS-ENTITY-LEN - +1.
      
           MOVE WS-DATA-VALUE-CHAR (WS-SUB3)
                                            TO 
                          WS-DATA-VALUE-CHAR (WS-SUB2).
      
       9230-SHIFT-DATA-VALUE-LEFT-X.
           EXIT.
      /
      *****************************************************************
      *    ERROR HANDLING ROUTINES                                    *
      *****************************************************************
      
       COPY XCPL0260.
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM XSDU0009                     **
      *****************************************************************
