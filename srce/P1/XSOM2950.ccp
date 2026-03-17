      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSOM2950.
 
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSOM2950                                         **
      **  REMARKS:  PROCESS DRIVER FOR TXTL                          **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
557756** 30SEP97   MSP    INITIAL PROGRAM DESIGN                     **
557708** 30SEP97   JWC    CICS ABEND ROUTINE                         **
      **                                                             **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
013578** 15DEC99   60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM2950'.
 
       COPY SQLCA.
007766 COPY XCWLPTR.
 
014590*COPY XCWL0030.
 
       01  WS-PGM-WORK-AREA.
           05  WS-EDIT-CHECKS.
               10  WS-BUS-FCN-ID            PIC  X(04).
                   88  WS-VALID-BUS-FCN-ID  VALUE '2040' THRU '2044'.
                   88  WS-BUS-FCN-RETRIEVE  VALUE '2040'.
                   88  WS-BUS-FCN-CREATE    VALUE '2041'.
                   88  WS-BUS-FCN-UPDATE    VALUE '2042'.
                   88  WS-BUS-FCN-DELETE    VALUE '2043'.
                   88  WS-BUS-FCN-LIST      VALUE '2044'.
               10  WS-TOKENS                PIC  X(01).
                   88  WS-TOKENS-VALID      VALUE '1' '2' '3' '4'.
               10  WS-MESSAGE-SW            PIC  X(01).
                   88  WS-MESSAGE-VALID     VALUE 'Y'.
                   88  WS-MESSAGE-INVALID   VALUE 'N'.
           05  WS-SUB                       PIC S9(04) COMP.
           05  WS-MAXLEN-N-3                PIC  9(03) VALUE ZEROS.
           05  WS-MAX-LINES                 PIC S9(04) COMP
?                                                      VALUE +06.
           05  WS-PARAMETERS-USED           PIC  X(01).
           05  WS-MAX-MESSAGE-LENGTH        PIC S9(04) COMP
                                                       VALUE +132.
?          05  WS-DSC-TXT                   PIC  X(132).
?     *    05  WS-DSC-TXT.
?     *        10 WS-DSC1                   PIC  X(66).
?     *        10 WS-DSC2                   PIC  X(66).
           05  WS-DESC-ARRAY                PIC  X(132).
           05  WS-DESC-ARRAY-R              REDEFINES WS-DESC-ARRAY.
               10  WS-SINGLE-CHAR           OCCURS 132 TIMES
                                            INDEXED BY CHAR-ARRAY
                                            PIC  X(01).
      *
007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.
 
      *
       COPY XCWL0280.
      *
?      COPY XCWEBLCH.
      *
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      *
       COPY XCFWTEXT.
       COPY XCFRTEXT.
      *
       COPY XCWWWKDT.
 
 
      **************************************************
      *
      *****************
       LINKAGE SECTION.
      *****************
 
007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY XCWM2950.
      *
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA 
                                MIR-PARM-AREA.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
557708     PERFORM  ABND-1000-HANDLE-ABEND
557708         THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.
 
           PERFORM  2000-PROCESS-REQUEST
               THRU 2000-PROCESS-REQUEST-X.
 
           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.
           
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      
      *
      *---------------------
       2000-PROCESS-REQUEST.
      *---------------------
 
           MOVE MIR-BUS-FCN-ID         TO WS-BUS-FCN-ID.
           
      *
      *    PROCESS SCREEN FUNCTIONS
      *
 
           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  3000-PROCESS-RETRIEVE
                        THRU 3000-PROCESS-RETRIEVE-X
 
               WHEN WS-BUS-FCN-LIST
                    PERFORM  3500-PROCESS-LIST
                        THRU 3500-PROCESS-LIST-X
 
               WHEN WS-BUS-FCN-CREATE
                    PERFORM  4000-PROCESS-CREATE
                        THRU 4000-PROCESS-CREATE-X
 
               WHEN WS-BUS-FCN-UPDATE
                    PERFORM  5000-PROCESS-UPDATE
                        THRU 5000-PROCESS-UPDATE-X
 
               WHEN WS-BUS-FCN-DELETE
                    PERFORM  6000-PROCESS-DELETE
                        THRU 6000-PROCESS-DELETE-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID           TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM2950'               TO WGLOB-MSG-PARM (2)
?need               MOVE 'XS29500010'             TO WGLOB-MSG-REF-INFO
?or   *             MOVE 'XS00009999'             TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST TO TRUE

           END-EVALUATE.
 
       2000-PROCESS-REQUEST-X.
           EXIT.
      
      *
      *----------------------
       3000-PROCESS-RETRIEVE.
      *----------------------
      ****************************************************************
      * READ TEXT FILE FOR SPECIFIC TEXT OR                          *
      * GROUP LEVEL (REFERENCE NUMBER BLANK) AND DISPLAY             *
      ****************************************************************
 
           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.
 
           PERFORM  7100-BUILD-TEXT-KEY
               THRU 7100-BUILD-TEXT-KEY-X.
 
           PERFORM  TEXT-1000-READ
               THRU TEXT-1000-READ-X.
 
           IF  WTEXT-IO-NOT-FOUND
               MOVE WTEXT-KEY          TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3000-PROCESS-RETRIEVE-X
           END-IF.
 
           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.
           MOVE 'XS00000002'           TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
 
       3000-PROCESS-RETRIEVE-X.
           EXIT.
      
      *
      *------------------
       3500-PROCESS-LIST.
      *------------------
 
           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.
 
      *
      * EDIT LANGUAGE SOURCE
      *
           PERFORM  4200-EDIT-SRCE
               THRU 4200-EDIT-SRCE-X.
      *
           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 3500-PROCESS-LIST-X
           END-IF.
      *
      * EDIT LANGUAGE SOURCE AND REFERENCE NUMBER
      *
           IF  (MIR-TXT-SRC-ID = SPACES)
           AND (MIR-TXT-SRC-REF-ID NOT = SPACES)
               MOVE 'XS29500009'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3500-PROCESS-LIST-X
           END-IF.
      *
      * EDIT THE MESSAGE REFERENCE NUMBER
      *
           IF  MIR-TXT-SRC-REF-ID NOT = SPACES
               PERFORM  4300-EDIT-RFER
                   THRU 4300-EDIT-RFER-X
               IF  WGLOB-MSG-ERROR-SW > ZERO
                   GO TO 3500-PROCESS-LIST-X
               END-IF
           END-IF.
      *
      * EDIT LANGUAGE CODE
      *
           IF  MIR-TXT-LANG-CD NOT = SPACES
               PERFORM  4400-EDIT-LANG
                   THRU 4400-EDIT-LANG-X
               IF  WGLOB-MSG-ERROR-SW > ZERO
                   GO TO 3500-PROCESS-LIST-X
               END-IF
           END-IF.
 
           MOVE LOW-VALUES             TO WTEXT-KEY.
           MOVE HIGH-VALUES            TO WTEXT-ENDBR-KEY.
 
           MOVE MIR-TXT-SRC-ID         TO WTEXT-TXT-SRC-ID.
           MOVE MIR-TXT-SRC-ID         TO WTEXT-ENDBR-TXT-SRC-ID.
           MOVE MIR-TXT-SRC-REF-ID     TO WTEXT-TXT-SRC-REF-ID.
           MOVE MIR-TXT-LANG-CD        TO WTEXT-TXT-LANG-CD.
 
           PERFORM  TEXT-1000-BROWSE
               THRU TEXT-1000-BROWSE-X.
 
           IF  WTEXT-IO-EOF
               MOVE 'XS00000034'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3500-PROCESS-LIST-X
           ELSE
               PERFORM  TEXT-2000-READ-NEXT
                   THRU TEXT-2000-READ-NEXT-X
 
               IF  WTEXT-IO-EOF
                   MOVE 'XS00000034'   TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   GO TO 3500-PROCESS-LIST-X
               END-IF
           END-IF.
 
           MOVE +1                     TO WS-SUB.
           PERFORM  3600-TEXT-INQ-READ
               THRU 3600-TEXT-INQ-READ-X
               UNTIL (WS-SUB  > WS-MAX-LINES)
                  OR WTEXT-IO-EOF.
 
 
           IF  WTEXT-IO-EOF
               MOVE 'XS00000015'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               IF  MIR-TXT-LANG-CD NOT = SPACES
                   PERFORM  TEXT-2000-READ-NEXT
                       THRU TEXT-2000-READ-NEXT-X
                       UNTIL MIR-TXT-LANG-CD = RTEXT-TXT-LANG-CD
                          OR WTEXT-IO-EOF
               END-IF
 
               IF  WTEXT-IO-EOF
                   MOVE 'XS00000015'   TO WGLOB-MSG-REF-INFO
               ELSE
                   MOVE RTEXT-TXT-SRC-REF-ID     
                                       TO MIR-TXT-SRC-REF-ID
                   MOVE 'XS00000014'   TO WGLOB-MSG-REF-INFO
                   SET WGLOB-MORE-DATA-EXISTS TO TRUE
               END-IF
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
 
           PERFORM  TEXT-3000-END-BROWSE
               THRU TEXT-3000-END-BROWSE-X.
 
       3500-PROCESS-LIST-X.
           EXIT.
      
      *
      *-------------------
       3600-TEXT-INQ-READ.
      *-------------------
 
           IF  (MIR-TXT-LANG-CD = SPACES)
           OR  (MIR-TXT-LANG-CD = RTEXT-TXT-LANG-CD)
               MOVE RTEXT-TXT-SRC-REF-ID     
                                       TO MIR-TXT-SRC-REF-ID-T (WS-SUB)
               MOVE RTEXT-TXT-LANG-CD  TO MIR-TXT-LANG-CD-T (WS-SUB)
?              MOVE RTEXT-TXT-STR-TXT  TO MIR-TXT-STR-TXT-T (WS-SUB)
?     ***      MOVE RTEXT-TXT-STR-TXT TO WS-DSC-TXT
?     ***      MOVE WS-DSC1           TO MIR-TXT-STR-TXT-T (WS-SUB)
?     ***      MOVE WS-DSC2           TO MIR-DSC2-T (WS-SUB)
               ADD  +1                        TO WS-SUB
           END-IF.
 
           PERFORM  TEXT-2000-READ-NEXT
               THRU TEXT-2000-READ-NEXT-X.
 
       3600-TEXT-INQ-READ-X.
           EXIT.
      
      *
      *--------------------
       4000-PROCESS-CREATE.
      *--------------------
      ****************************************************************
      * CREATE NEW MESSAGE RECORD.  THE RECORD IS CREATED WITH THE
      * KEY FIELDS ENTERED.  THE REMAINING DATA WILL BE UPDATED VIA
      * THE MAINTAIN SCREEN.
      ****************************************************************
 
           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.
 
           PERFORM  7100-BUILD-TEXT-KEY
               THRU 7100-BUILD-TEXT-KEY-X.
           
           PERFORM  TEXT-1000-READ
               THRU TEXT-1000-READ-X.
           IF  WTEXT-IO-OK
               MOVE WTEXT-KEY          TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-PROCESS-CREATE-X
           END-IF.
 
           PERFORM  4100-CREATE-EDITS
               THRU 4100-CREATE-EDITS-X.
 
           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 4000-PROCESS-CREATE-X
           END-IF.
 
           PERFORM  7100-BUILD-TEXT-KEY
               THRU 7100-BUILD-TEXT-KEY-X.
 
           PERFORM  TEXT-1000-CREATE
               THRU TEXT-1000-CREATE-X.
           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.
 
           PERFORM  TEXT-1000-WRITE
               THRU TEXT-1000-WRITE-X.
 
           MOVE 'XS00000004'           TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
 
       4000-PROCESS-CREATE-X.
           EXIT.
      *
      *------------------
       4100-CREATE-EDITS.
      *------------------
      ****************************************************************
      * EDIT INPUT FIELDS.
      ****************************************************************
      *
      * EDIT LANGUAGE SOURCE
      *
           PERFORM  4200-EDIT-SRCE
               THRU 4200-EDIT-SRCE-X.
      *
           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 4100-CREATE-EDITS-X
           END-IF.
      *
      * EDIT THE MESSAGE REFERENCE NUMBER
      *
           PERFORM  4300-EDIT-RFER
               THRU 4300-EDIT-RFER-X.
      *
           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 4100-CREATE-EDITS-X
           END-IF.
      *
      * EDIT LANGUAGE CODE
      *
           PERFORM  4400-EDIT-LANG
               THRU 4400-EDIT-LANG-X.
 
       4100-CREATE-EDITS-X.
           EXIT.
      *
      *---------------
       4200-EDIT-SRCE.
      *---------------
      *
           IF  MIR-TXT-SRC-ID = SPACES
               MOVE 'XS29500001'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
 
       4200-EDIT-SRCE-X.
           EXIT.
      *
      *----------------
       4300-EDIT-RFER.
      *----------------
      *
           IF  MIR-TXT-SRC-REF-ID = SPACES
               MOVE 'XS29500002'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4300-EDIT-RFER-X
           END-IF.
 
       4300-EDIT-RFER-X.
           EXIT.
      *
      *---------------
       4400-EDIT-LANG.
      *---------------
      *
           MOVE MIR-TXT-LANG-CD        TO WXTAB-ETBL-VALU-ID.
           PERFORM  LANG-1000-EDIT-USER-LANGUAGE
               THRU LANG-1000-EDIT-USER-LANGUAGE-X.
 
           IF  WXTAB-IO-OK
               CONTINUE
           ELSE
               MOVE 'XS29500004'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
 
       4400-EDIT-LANG-X.
           EXIT.
      
      *
      *--------------------
       5000-PROCESS-UPDATE.
      *--------------------
 
           PERFORM  7100-BUILD-TEXT-KEY
               THRU 7100-BUILD-TEXT-KEY-X.
 
           PERFORM  TEXT-1000-READ-FOR-UPDATE
               THRU TEXT-1000-READ-FOR-UPDATE-X.
 
           PERFORM  5220-MAINTAIN-EDITS
               THRU 5220-MAINTAIN-EDITS-X.
 
           PERFORM  TEXT-2000-REWRITE
               THRU TEXT-2000-REWRITE-X.
 
           IF WGLOB-MSG-ERROR-SW > ZERO
               MOVE 'XS00000008'      TO WGLOB-MSG-REF-INFO
           ELSE
               MOVE 'XS00000007'      TO WGLOB-MSG-REF-INFO
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
                   THRU 9200-MOVE-RECORD-TO-SCREEN-X
           END-IF.
 
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
 
       5000-PROCESS-UPDATE-X.
           EXIT.
      

      *--------------------
       5220-MAINTAIN-EDITS.
      *--------------------
 
      ****************************************************************
      * EDIT INPUT FIELDS.                                          *
      ****************************************************************
 
 
           MOVE 'N'                    TO WS-PARAMETERS-USED.
 
           IF  MIR-TXT-STR-TXT = SPACES
               MOVE RTEXT-TXT-STR-TXT  TO WS-DSC-TXT
           ELSE
               IF  MIR-TXT-STR-TXT = EBLCH-BLANK-FIELD-CHAR
                   MOVE SPACES         TO MIR-TXT-STR-TXT
?     *    IF MIR-TXT-STR-TXT = SPACES AND
?     *       MIR-TXTDSC2 = SPACES
?     *        MOVE RTEXT-TXT-STR-TXT TO WS-DSC-TXT
?     *        MOVE WS-DSC1           TO MIR-TXT-STR-TXT
?     *        MOVE WS-DSC2           TO MIR-TXTDSC2
?     *    ELSE
?     *        IF MIR-TXT-STR-TXT = EBLCH-BLANK-FIELD-CHAR
?     *            MOVE SPACES        TO MIR-TXT-STR-TXT
?     *            MOVE SPACES        TO MIR-TXTDSC2
?     *        END-IF
?     *        IF MIR-TXTDSC2 = EBLCH-BLANK-FIELD-CHAR
?     *            MOVE SPACES        TO MIR-TXTDSC2
               END-IF
           END-IF.
 
           MOVE MIR-TXT-STR-TXT        TO WS-DESC-ARRAY
                                          WS-DSC-TXT.
?     *    MOVE MIR-TXT-STR-TXT       TO WS-DSC1.
?     *    MOVE MIR-TXTDSC2           TO WS-DSC2.
?     *    MOVE WS-DSC-TXT            TO WS-DESC-ARRAY.
           SET  WS-MESSAGE-VALID           TO TRUE.
           PERFORM  5226-CHECK-FOR-TOKENS
               THRU 5226-CHECK-FOR-TOKENS-X
               VARYING CHAR-ARRAY FROM 1 BY 1
                 UNTIL CHAR-ARRAY > WS-MAX-MESSAGE-LENGTH.
 
           IF  WS-MESSAGE-VALID
               MOVE WS-DSC-TXT         TO RTEXT-TXT-STR-TXT
               MOVE WS-PARAMETERS-USED TO RTEXT-TXT-PARM-USE-IND
           ELSE
               GO TO 5220-MAINTAIN-EDITS-X
           END-IF.
      *
      * PERFORM NUMERIC EDIT ON THE TEXT DESCRIPTION LENGTH
      *
           IF  MIR-TXT-MAX-STR-LEN = SPACES
               MOVE RTEXT-TXT-MAX-STR-LEN 
                                       TO WS-MAXLEN-N-3
               MOVE WS-MAXLEN-N-3      TO MIR-TXT-MAX-STR-LEN
           END-IF.
 
           MOVE 'N'                    TO L0280-SIGN-IND.
           MOVE ZERO                   TO L0280-PRECISION.
           MOVE 3                      TO L0280-LENGTH.
           MOVE MIR-TXT-MAX-STR-LEN    TO L0280-INPUT-DATA.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
           IF  NOT L0280-OK
               MOVE 'XS29500005'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 5220-MAINTAIN-EDITS-X
           ELSE
               MOVE MIR-TXT-MAX-STR-LEN      
                                       TO WS-MAXLEN-N-3
               MOVE WS-MAXLEN-N-3      TO RTEXT-TXT-MAX-STR-LEN
           END-IF.
 
           IF  WS-MAXLEN-N-3 = ZEROS
               MOVE 'XS29500006'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 5220-MAINTAIN-EDITS-X
           END-IF.
 
           IF  WS-MAXLEN-N-3 > 132
               MOVE 'XS29500007'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 5220-MAINTAIN-EDITS-X
           END-IF.
 
           IF  MIR-TXT-COMNT-TXT NOT = SPACE
           OR  RTEXT-TXT-COMNT-TXT = SPACE
               PERFORM  5228-EDIT-COMMENT
                   THRU 5228-EDIT-COMMENT-X
           ELSE
               MOVE RTEXT-TXT-COMNT-TXT
                                       TO MIR-TXT-COMNT-TXT
           END-IF.
 
       5220-MAINTAIN-EDITS-X.
           EXIT.
      
      *
      *----------------------
       5226-CHECK-FOR-TOKENS.
      *----------------------
 
           IF  WS-SINGLE-CHAR (CHAR-ARRAY) = '@'
               SET CHAR-ARRAY UP BY 1
               MOVE WS-SINGLE-CHAR (CHAR-ARRAY)
                                       TO WS-TOKENS
               IF  WS-TOKENS-VALID
                   MOVE 'Y'            TO WS-PARAMETERS-USED
               ELSE
                   SET WS-MESSAGE-INVALID TO TRUE
                   MOVE 'XS29500008'   TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           END-IF.
 
       5226-CHECK-FOR-TOKENS-X.
           EXIT.

      
      *********************
       5228-EDIT-COMMENT.
      *********************
 
      *    CHECK FOR BLANK FIELD CHARACTER
           IF  MIR-TXT-COMNT-TXT = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES             TO MIR-TXT-COMNT-TXT
               MOVE SPACES             TO RTEXT-TXT-COMNT-TXT
               GO TO 5228-EDIT-COMMENT-X
           END-IF.
 
      *    CHECK FOR BLANK INPUT
           IF  MIR-TXT-COMNT-TXT = SPACES
               MOVE RTEXT-TXT-COMNT-TXT
                                       TO MIR-TXT-COMNT-TXT
               GO TO 5228-EDIT-COMMENT-X
           END-IF.
 
           MOVE MIR-TXT-COMNT-TXT      TO RTEXT-TXT-COMNT-TXT.
 
       5228-EDIT-COMMENT-X.
           EXIT.
 
      *
      *--------------------
       6000-PROCESS-DELETE.
      *--------------------
 
           PERFORM  7100-BUILD-TEXT-KEY
               THRU 7100-BUILD-TEXT-KEY-X.
 
           PERFORM  TEXT-1000-READ-FOR-UPDATE
               THRU TEXT-1000-READ-FOR-UPDATE-X.
 
           IF  WTEXT-IO-OK
               PERFORM  TEXT-1000-DELETE
                   THRU TEXT-1000-DELETE-X
               MOVE 'XS00000011'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
?n             MOVE SPACES             TO MIR-TXT-STR-TXT
? e   *        MOVE SPACES             TO MIR-TXTDSC2
?  e           MOVE SPACES             TO MIR-TXT-MAX-STR-LEN
?   d          MOVE SPACES             TO MIR-TXT-COMNT-TXT
           ELSE
               MOVE WTEXT-KEY          TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 6000-PROCESS-DELETE-X
           END-IF.
 
       6000-PROCESS-DELETE-X.
           EXIT.
 
      *
      *--------------------
       7100-BUILD-TEXT-KEY.
      *--------------------
 
      ****************************************************************
      * BUILD THE KEY.                                               *
      ****************************************************************
 
           MOVE MIR-TXT-SRC-ID         TO WTEXT-TXT-SRC-ID.
           MOVE MIR-TXT-SRC-REF-ID     TO WTEXT-TXT-SRC-REF-ID.
           MOVE MIR-TXT-LANG-CD        TO WTEXT-TXT-LANG-CD.
       
       7100-BUILD-TEXT-KEY-X.
           EXIT.
 

      

      *-----------------------
???    9100-BLANK-DATA-FIELDS.
      *-----------------------
 
               MOVE SPACES             TO MIR-TXT-STR-TXT.
               MOVE SPACES             TO MIR-TXT-MAX-STR-LEN.
               MOVE SPACES             TO MIR-TXT-COMNT-TXT.
               
               MOVE SPACES             TO MIR-TXT-SRC-REF-ID-G.
               MOVE SPACES             TO MIR-TXT-LANG-CD-G.
               MOVE SPACES             TO MIR-TXT-STR-TXT-G.

?     *        MOVE SPACES            TO MIR-DSC2-G       .
?     *        MOVE SPACES            TO MIR-TXTDSC2      .
 
       9100-BLANK-DATA-FIELDS-X.
           EXIT.


 
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------
 
?          MOVE RTEXT-TXT-STR-TXT      TO MIR-TXT-STR-TXT.
 ?    ***  MOVE RTEXT-TXT-STR-TXT     TO WS-DSC-TXT.
 ?    ***  MOVE WS-DSC1               TO MIR-TXT-STR-TXT.
 ?    ***  MOVE WS-DSC2               TO MIR-TXTDSC2.
           
           MOVE RTEXT-TXT-MAX-STR-LEN  TO WS-MAXLEN-N-3.
           MOVE WS-MAXLEN-N-3          TO MIR-TXT-MAX-STR-LEN.
           
           MOVE RTEXT-TXT-COMNT-TXT    TO MIR-TXT-COMNT-TXT.
 
       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.
      
      *
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
       COPY XCPELANG.
       
       COPY XCPPINIT.
       COPY XCPPEXIT.
      
      ****************************************************************
      * LINKING COPYBOOKS                                            *
      ****************************************************************
      *
      * LINK TO PROGRAM 0280 FOR NUMERIC EDITS
      *
       COPY XCPL0280.
      
      *
      ****************************************************************
      * MESSAGE PROCESSING COPYBOOKS
      ****************************************************************
       COPY XCCL0260.

557708*COPY XCCPHNDL.
557708 COPY XCCPABND.
       
       COPY XCCP0030.
      *
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPNXTAB.
      
       COPY XCPATEXT.
       COPY XCPBTEXT.
       COPY XCPCTEXT.
       COPY XCPNTEXT.
       COPY XCPUTEXT.
       COPY XCPXTEXT.
 
      *****************************************************************
      **                 END OF PROGRAM XSOM2950                     **
      *****************************************************************
