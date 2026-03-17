      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0162.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0162                                         **
      **  REMARKS:  BROWSE, CREATE, INQUIRE, MAINTAIN, AND DELETE    **
      **            ENTRIES ON CURRENCY TABLE, TCRCY.                **
      **            DETAILS ARE VALIDATED AGAINST THE COMPANY,       **
      **            CURRENCY, COUNTRY TYPE, CURRENCY SYMBOL, DECIMAL **
      **            SEPARATOR, THOUSAND SEPARATOR FROM THE EDIT      **
      **            TABLE.                                           **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
008455**  31MAR98  552    EXTENSIVE NUMERIC FORMATTING               **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0162'.

       COPY SQLCA.
007766 COPY XCWLPTR.
017150 COPY XCWL0280.
017150 COPY XCWL0290.

014590*COPY XCWL0030.

       01  WS-WORKING-STORAGE.
           05  WS-SUB                       PIC S9(04) VALUE ZERO COMP.
           05  SUB1                         PIC S9(04) VALUE ZERO COMP.
           05  SUB2                         PIC S9(04) VALUE ZERO COMP.
           05  WS-MAX-BROWSE-LINES          PIC S9(04) VALUE +20  COMP.
           05  WS-SAVE-THSSP                PIC X(01)  VALUE SPACES.
           05  WS-SAVE-DECSP                PIC X(01)  VALUE SPACES.
           05  WS-BUS-FCN-ID                PIC X(04).
               88  WS-BUS-FCN-ID-VALID                 VALUES ARE
                   '1960', '1961', '1962', '1963', '1964'.
               88  WS-BUS-FCN-RETRIEVE                 VALUE '1960'.
               88  WS-BUS-FCN-CREATE                   VALUE '1961'.
               88  WS-BUS-FCN-UPDATE                   VALUE '1962'.
               88  WS-BUS-FCN-DELETE                   VALUE '1963'.
               88  WS-BUS-FCN-LIST                     VALUE '1964'.

           05  WS-CRCY-NEG-PLACE-CD         PIC X(01).
               88  WS-CRCY-NEG-PLACE-CD-VALID          VALUES ARE
                   'R', 'L', 'B'.

           05  WS-CRCY-PLACE-CD             PIC X(01).
               88  WS-CRCY-PLACE-CD-VALID              VALUES ARE
                   'R', 'L'.
017150     05  WS-CRCY-SCALE-QTY            PIC 9(01).
017150         88  WS-CRCY-SCALE-QTY-VALID             VALUES ARE
017150             0, 1, 2.

       COPY XCWEBLCH.

007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.

       COPY XCFWCRCY.
       COPY XCFRCRCY.

       COPY XCFWXTAB.
       COPY XCFRXTAB.

       COPY XCWWWKDT.

      *****************
       LINKAGE SECTION.
      *****************

007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY XCWM0162.

       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

           PERFORM  2000-PROCESS-REQUEST
               THRU 2000-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.

      *---------------------
       2000-PROCESS-REQUEST.
      *---------------------

           SET  MIR-RETRN-OK       TO TRUE.
           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.

017150     PERFORM  0290-1000-BUILD-PARM-INFO
017150         THRU 0290-1000-BUILD-PARM-INFO-X.

           PERFORM  9300-SETUP-MSIN-REFERENCE
              THRU  9300-SETUP-MSIN-REFERENCE-X.

           IF  WGLOB-MSG-ERROR-SW > ZERO
               SET MIR-RETRN-RQST-FAILED  TO TRUE
               GO TO 2000-PROCESS-REQUEST-X
           END-IF.

      *
      *    PROCESS SCREEN FUNCTIONS
      *

           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  2100-PROCESS-RETRIEVE
                        THRU 2100-PROCESS-RETRIEVE-X

               WHEN WS-BUS-FCN-CREATE
                    PERFORM  2200-PROCESS-CREATE
                        THRU 2200-PROCESS-CREATE-X

               WHEN WS-BUS-FCN-UPDATE
                    PERFORM  2300-PROCESS-UPDATE
                        THRU 2300-PROCESS-UPDATE-X

               WHEN WS-BUS-FCN-DELETE
                    PERFORM  2400-PROCESS-DELETE
                        THRU 2400-PROCESS-DELETE-X

               WHEN WS-BUS-FCN-LIST
                    PERFORM  2500-PROCESS-LIST
                        THRU 2500-PROCESS-LIST-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0162'   TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237' TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.

      *----------------------
       2100-PROCESS-RETRIEVE.
      *----------------------

           MOVE MIR-CRCY-CD           TO WCRCY-CRCY-CD.
           MOVE MIR-CO-ID             TO WCRCY-CO-ID.
           PERFORM  CRCY-1000-READ
               THRU CRCY-1000-READ-X.

           IF WCRCY-IO-OK
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
                   THRU 9200-MOVE-RECORD-TO-SCREEN-X
           ELSE
               PERFORM  9100-BLANK-DATA-FIELDS
                  THRU  9100-BLANK-DATA-FIELDS-X
               MOVE WCRCY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED  TO TRUE
           END-IF.

       2100-PROCESS-RETRIEVE-X.
           EXIT.

      *--------------------
       2200-PROCESS-CREATE.
      *--------------------

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

           MOVE MIR-CRCY-CD           TO WCRCY-CRCY-CD.
           MOVE MIR-CO-ID             TO WCRCY-CO-ID.
           PERFORM  CRCY-1000-READ
               THRU CRCY-1000-READ-X.

           IF WCRCY-IO-OK
               MOVE WCRCY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED  TO TRUE
               GO TO 2200-PROCESS-CREATE-X
           END-IF.

           PERFORM  2210-CREATE-EDITS
               THRU 2210-CREATE-EDITS-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
               SET MIR-RETRN-EDIT-ERROR      TO TRUE
               GO TO 2200-PROCESS-CREATE-X
           END-IF.

           MOVE MIR-CRCY-CD           TO WCRCY-CRCY-CD.
           MOVE MIR-CO-ID             TO WCRCY-CO-ID.

           PERFORM  CRCY-1000-CREATE
               THRU CRCY-1000-CREATE-X.

           PERFORM  CRCY-1000-WRITE
               THRU CRCY-1000-WRITE-X.

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       2200-PROCESS-CREATE-X.
           EXIT.

      *------------------
       2210-CREATE-EDITS.
      *------------------
      *
      * CURRENCY FIELD MUST BE ENTERED
      *
           IF MIR-CRCY-CD = SPACES
           OR MIR-CRCY-CD = SPACES
               MOVE 'XS01620001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
      *
      * PERFORM XTAB TABLE LOOKUP FOR COMPANY
      *
           MOVE MIR-CO-ID             TO WXTAB-ETBL-VALU-ID.
           PERFORM  COMP-1000-EDIT-COMPANY
               THRU COMP-1000-EDIT-COMPANY-X.

           IF NOT WXTAB-IO-OK
               MOVE WXTAB-ETBL-TYP-ID TO WGLOB-MSG-PARM (1)
               MOVE 'XS01620002'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2210-CREATE-EDITS-X.
           EXIT.

      *--------------------
       2300-PROCESS-UPDATE.
      *--------------------

           MOVE MIR-CRCY-CD           TO WCRCY-CRCY-CD.
           MOVE MIR-CO-ID             TO WCRCY-CO-ID.
           PERFORM  CRCY-1000-READ-FOR-UPDATE
               THRU CRCY-1000-READ-FOR-UPDATE-X.

           IF WCRCY-IO-NOT-FOUND
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
               MOVE WCRCY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED  TO TRUE
               GO TO 2300-PROCESS-UPDATE-X
           END-IF.

      *-
      *-SAVE FIELDS WHICH REQUIRES CROSS-EDIT
      *-
           MOVE RCRCY-CRCY-THOU-SPRT-CD 
                                      TO WS-SAVE-THSSP.
           MOVE RCRCY-CRCY-DCML-SPRT-CD 
                                      TO WS-SAVE-DECSP.

           PERFORM  2330-MAINTAIN-EDITS
               THRU 2330-MAINTAIN-EDITS-X.

           PERFORM  CRCY-2000-REWRITE
               THRU CRCY-2000-REWRITE-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
               MOVE 'XS00000008'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-EDIT-ERROR      TO TRUE
           ELSE
               MOVE 'XS00000007'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
                   THRU 9200-MOVE-RECORD-TO-SCREEN-X
           END-IF.

       2300-PROCESS-UPDATE-X.
           EXIT.

      *--------------------
       2330-MAINTAIN-EDITS.
      *--------------------

           MOVE ZERO                  TO WGLOB-MSG-ERROR-SW.

017150*- EDIT CURRENCY SCALE
017150
017150     IF MIR-CRCY-SCALE-QTY   NOT = SPACE
017150         PERFORM  2334-EDIT-CRCY-SCALE
017150             THRU 2334-EDIT-CRCY-SCALE-X
017150     ELSE
017150         MOVE RCRCY-CRCY-SCALE-QTY
017150                                TO MIR-CRCY-SCALE-QTY
017150     END-IF.

      *- EDIT CURRENCY SYMBOL

           IF MIR-CRCY-SYMBL-CD   NOT = SPACE
               PERFORM  2335-EDIT-CSYMB
                   THRU 2335-EDIT-CSYMB-X
           ELSE
               MOVE RCRCY-CRCY-SYMBL-CD
                                      TO MIR-CRCY-SYMBL-CD
           END-IF.


      *- EDIT CURRENCY PLACEMENT

           IF MIR-CRCY-PLACE-CD   NOT = SPACE
               PERFORM  2336-EDIT-CURR-PLACEMENT
                   THRU 2336-EDIT-CURR-PLACEMENT-X
           ELSE
               MOVE RCRCY-CRCY-PLACE-CD
                                      TO MIR-CRCY-PLACE-CD
           END-IF.


      *- EDIT THOUSAND SEPARATOR

           IF MIR-CRCY-THOU-SPRT-CD   NOT = SPACE
               PERFORM  2337-EDIT-1000-SEPARATOR
                   THRU 2337-EDIT-1000-SEPARATOR-X
           ELSE
               MOVE RCRCY-CRCY-THOU-SPRT-CD
                                      TO MIR-CRCY-THOU-SPRT-CD
           END-IF.


      *- EDIT DECIMAL SEPARATOR

           IF MIR-CRCY-DCML-SPRT-CD   NOT = SPACE
               PERFORM  2338-EDIT-DEC-SEPARATOR
                   THRU 2338-EDIT-DEC-SEPARATOR-X
           ELSE
               MOVE RCRCY-CRCY-DCML-SPRT-CD
                                      TO MIR-CRCY-DCML-SPRT-CD
           END-IF.


      *- EDIT NEGATIVE PLACEMENT

           IF MIR-CRCY-NEG-PLACE-CD   NOT = SPACE
               PERFORM  2339-EDIT-NEGATIVE-PLACEMENT
                   THRU 2339-EDIT-NEGATIVE-PLACEMENT-X
           ELSE
               MOVE RCRCY-CRCY-NEG-PLACE-CD
                                      TO MIR-CRCY-NEG-PLACE-CD
           END-IF.

           PERFORM  2340-CROSS-EDIT
               THRU 2340-CROSS-EDIT-X.

       2330-MAINTAIN-EDITS-X.
           EXIT.


017150*---------------------
017150 2334-EDIT-CRCY-SCALE.
017150*---------------------
017150
017150     IF  MIR-CRCY-SCALE-QTY  = EBLCH-BLANK-FIELD-CHAR
017150         MOVE ZERO                   TO MIR-CRCY-SCALE-QTY
017150     END-IF.
017150
017150     MOVE ZERO                       TO L0280-PRECISION.
017150     MOVE LENGTH OF MIR-CRCY-SCALE-QTY
017150                                     TO L0280-INPUT-SIZE.
017150     MOVE L0280-INPUT-SIZE           TO L0280-LENGTH.
017150     MOVE MIR-CRCY-SCALE-QTY         TO L0280-INPUT-DATA.
017150
017150     PERFORM  0280-1000-NUMERIC-EDIT
017150         THRU 0280-1000-NUMERIC-EDIT-X.
017150
017150     IF  L0280-OK
017150         MOVE L0280-OUTPUT           TO L0290-INPUT-NUMBER
017150         MOVE ZERO                   TO L0290-PRECISION
017150         MOVE LENGTH OF MIR-CRCY-SCALE-QTY
017150                                     TO L0290-MAX-OUT-LEN
017150         PERFORM  0290-1000-NUMERIC-FORMAT
017150             THRU 0290-1000-NUMERIC-FORMAT-X
017150         MOVE L0290-OUTPUT-DATA      TO WS-CRCY-SCALE-QTY
017150         IF  WS-CRCY-SCALE-QTY-VALID
017150             MOVE WS-CRCY-SCALE-QTY  TO RCRCY-CRCY-SCALE-QTY
017150         ELSE
017150* MSG:   CURRENCY SCALE MUST BE 0,1 OR 2.
017150             MOVE 'XS01620009'       TO WGLOB-MSG-REF-INFO
017150             PERFORM  0260-1000-GENERATE-MESSAGE
017150                 THRU 0260-1000-GENERATE-MESSAGE-X
017150             SET MIR-RETRN-EDIT-ERROR TO TRUE
017150         END-IF
017150     ELSE
017150* MSG:   CURRENCY SCALE MUST BE 0,1 OR 2.
017150         MOVE 'XS01620009'          TO WGLOB-MSG-REF-INFO
017150         PERFORM  0260-1000-GENERATE-MESSAGE
017150             THRU 0260-1000-GENERATE-MESSAGE-X
017150         SET MIR-RETRN-EDIT-ERROR   TO TRUE
017150     END-IF.
017150
017150 2334-EDIT-CRCY-SCALE-X.
017150     EXIT.


      *----------------
       2335-EDIT-CSYMB.
      *----------------

           IF MIR-CRCY-SYMBL-CD  = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES            TO MIR-CRCY-SYMBL-CD
           END-IF.
      *
      * PERFORM XTAB TABLE LOOKUP FOR CURRENCY SYMBOL
      *
           MOVE MIR-CRCY-SYMBL-CD     TO WXTAB-ETBL-VALU-ID.
           PERFORM  CSYM-1000-EDIT-CURR-SYMBOL
               THRU CSYM-1000-EDIT-CURR-SYMBOL-X.

           IF WXTAB-IO-OK
               MOVE MIR-CRCY-SYMBL-CD TO RCRCY-CRCY-SYMBL-CD
           ELSE
               MOVE WXTAB-ETBL-TYP-ID TO WGLOB-MSG-PARM (1)
               MOVE 'XS01620003'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-EDIT-ERROR TO TRUE
           END-IF.

       2335-EDIT-CSYMB-X.
           EXIT.


      *-------------------------
       2336-EDIT-CURR-PLACEMENT.
      *-------------------------

           IF MIR-CRCY-PLACE-CD  = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES            TO MIR-CRCY-PLACE-CD
           END-IF.

           MOVE MIR-CRCY-PLACE-CD     TO WS-CRCY-PLACE-CD.
           IF  WS-CRCY-PLACE-CD-VALID
               MOVE MIR-CRCY-PLACE-CD TO RCRCY-CRCY-PLACE-CD
           ELSE
               MOVE 'XS01620004'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-EDIT-ERROR TO TRUE
           END-IF.

       2336-EDIT-CURR-PLACEMENT-X.
           EXIT.


      *-------------------------
       2337-EDIT-1000-SEPARATOR.
      *-------------------------

           IF MIR-CRCY-THOU-SPRT-CD  = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES            TO MIR-CRCY-THOU-SPRT-CD
           END-IF.
      *
      * PERFORM XTAB TABLE LOOKUP FOR CURRENCY SYMBOL
      *
           MOVE MIR-CRCY-THOU-SPRT-CD TO WXTAB-ETBL-VALU-ID.
           PERFORM  THSP-1000-EDIT-1000-SEP
               THRU THSP-1000-EDIT-1000-SEP-X.

           IF WXTAB-IO-OK
               MOVE MIR-CRCY-THOU-SPRT-CD        
                                      TO RCRCY-CRCY-THOU-SPRT-CD
           ELSE
               MOVE WXTAB-ETBL-TYP-ID TO WGLOB-MSG-PARM (1)
               MOVE 'XS01620005'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-EDIT-ERROR TO TRUE
           END-IF.

       2337-EDIT-1000-SEPARATOR-X.
           EXIT.


      *------------------------
       2338-EDIT-DEC-SEPARATOR.
      *------------------------

           IF MIR-CRCY-DCML-SPRT-CD  = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES            TO MIR-CRCY-DCML-SPRT-CD
           END-IF.
      *
      * PERFORM XTAB TABLE LOOKUP FOR DECIMAL SEPARATOR
      *
           MOVE MIR-CRCY-DCML-SPRT-CD TO WXTAB-ETBL-VALU-ID.
           PERFORM  DECS-1000-EDIT-DECIMAL-SEP
               THRU DECS-1000-EDIT-DECIMAL-SEP-X.

           IF WXTAB-IO-OK
               MOVE MIR-CRCY-DCML-SPRT-CD        
                                      TO RCRCY-CRCY-DCML-SPRT-CD
           ELSE
               MOVE WXTAB-ETBL-TYP-ID TO WGLOB-MSG-PARM (1)
               MOVE 'XS01620006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-EDIT-ERROR TO TRUE
           END-IF.

       2338-EDIT-DEC-SEPARATOR-X.
           EXIT.


      *-----------------------------
       2339-EDIT-NEGATIVE-PLACEMENT.
      *-----------------------------

           IF MIR-CRCY-NEG-PLACE-CD  = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES            TO MIR-CRCY-NEG-PLACE-CD
           END-IF.

           MOVE MIR-CRCY-NEG-PLACE-CD TO WS-CRCY-NEG-PLACE-CD.
           IF  WS-CRCY-NEG-PLACE-CD-VALID
               MOVE MIR-CRCY-NEG-PLACE-CD         
                                      TO RCRCY-CRCY-NEG-PLACE-CD
           ELSE
               MOVE 'XS01620007'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-EDIT-ERROR TO TRUE
           END-IF.

       2339-EDIT-NEGATIVE-PLACEMENT-X.
           EXIT.


      *----------------
       2340-CROSS-EDIT.
      *----------------

      *
      *  DECIMAL SEPARATOR AND THOUSAND SEPARATOR CANNOT BE THE SAME
      *
           IF  MIR-CRCY-DCML-SPRT-CD   =  MIR-CRCY-THOU-SPRT-CD
               MOVE WS-SAVE-THSSP     TO RCRCY-CRCY-THOU-SPRT-CD
               MOVE WS-SAVE-DECSP     TO RCRCY-CRCY-DCML-SPRT-CD
               MOVE 'XS01620008'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-EDIT-ERROR TO TRUE
           END-IF.

       2340-CROSS-EDIT-X.
           EXIT.


      *--------------------
       2400-PROCESS-DELETE.
      *--------------------

           IF MIR-CO-ID  = SPACES
           OR MIR-CO-ID  = LOW-VALUES
              PERFORM  2422-DELETE-KEY-RANGE
                  THRU 2422-DELETE-KEY-RANGE-X
           ELSE
              PERFORM  2421-DELETE-KEY-SINGLE
                  THRU 2421-DELETE-KEY-SINGLE-X
           END-IF.

       2400-PROCESS-DELETE-X.
           EXIT.


      *-----------------------
       2421-DELETE-KEY-SINGLE.
      *-----------------------

           MOVE MIR-CRCY-CD           TO WCRCY-CRCY-CD.
           MOVE MIR-CO-ID             TO WCRCY-CO-ID.
           PERFORM  CRCY-1000-READ-FOR-UPDATE
               THRU CRCY-1000-READ-FOR-UPDATE-X.

           IF WCRCY-IO-OK
               PERFORM  CRCY-1000-DELETE
                   THRU CRCY-1000-DELETE-X
               MOVE 'XS00000011'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               MOVE WCRCY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED  TO TRUE
           END-IF.

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

       2421-DELETE-KEY-SINGLE-X.
           EXIT.


      *----------------------
       2422-DELETE-KEY-RANGE.
      *----------------------

           MOVE LOW-VALUES            TO WCRCY-KEY.
           MOVE HIGH-VALUES           TO WCRCY-ENDBR-KEY.
           MOVE MIR-CRCY-CD           TO WCRCY-CRCY-CD.

           PERFORM  CRCY-1000-BROWSE
               THRU CRCY-1000-BROWSE-X.

           IF  WCRCY-IO-EOF
           OR  MIR-CRCY-CD NOT = WCRCY-CRCY-CD
               MOVE WCRCY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED  TO TRUE
               GO TO 2422-DELETE-KEY-RANGE-X
           END-IF.

           PERFORM  CRCY-2000-READ-NEXT
               THRU CRCY-2000-READ-NEXT-X.

           IF  WCRCY-IO-EOF
           OR  MIR-CRCY-CD NOT = WCRCY-CRCY-CD
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED  TO TRUE
               GO TO 2422-DELETE-KEY-RANGE-X
           END-IF.

           PERFORM  CRCY-3000-END-BROWSE
               THRU CRCY-3000-END-BROWSE-X.

           MOVE LOW-VALUES            TO WCRCY-KEY.
           MOVE HIGH-VALUES           TO WCRCY-ENDBR-KEY.
           MOVE MIR-CRCY-CD           TO WCRCY-CRCY-CD.
           MOVE MIR-CRCY-CD           TO WCRCY-ENDBR-CRCY-CD.

           PERFORM  CRCY-1000-DELETE-KEY-RANGE
               THRU CRCY-1000-DELETE-KEY-RANGE-X.

           MOVE 'XS00000011'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

       2422-DELETE-KEY-RANGE-X.
           EXIT.


      *------------------
       2500-PROCESS-LIST.
      *------------------

           MOVE SPACES                TO MIR-CRCY-CD-G.
           MOVE SPACES                TO MIR-CO-ID-G.

           MOVE LOW-VALUES            TO WCRCY-KEY.
           MOVE HIGH-VALUES           TO WCRCY-ENDBR-KEY.
           MOVE MIR-CRCY-CD           TO WCRCY-CRCY-CD.
           MOVE MIR-CO-ID             TO WCRCY-CO-ID.

           PERFORM  CRCY-1000-BROWSE
               THRU CRCY-1000-BROWSE-X.

           IF WCRCY-IO-EOF
               MOVE 'XS00000034'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED TO TRUE
               GO TO 2500-PROCESS-LIST-X
           END-IF.

           PERFORM  CRCY-2000-READ-NEXT
               THRU CRCY-2000-READ-NEXT-X.

           IF WCRCY-IO-EOF
               MOVE 'XS00000025'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED TO TRUE
               GO TO 2500-PROCESS-LIST-X
           END-IF.

           PERFORM  2510-PROCESS-BROWSE-READ
               THRU 2510-PROCESS-BROWSE-READ-X
               VARYING WS-SUB FROM +1 BY +1
               UNTIL   WS-SUB > WS-MAX-BROWSE-LINES
               OR    WCRCY-IO-EOF.

           IF WCRCY-IO-EOF
               MOVE 'XS00000025'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               SET WGLOB-MORE-DATA-EXISTS TO TRUE
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  CRCY-3000-END-BROWSE
               THRU CRCY-3000-END-BROWSE-X.

       2500-PROCESS-LIST-X.
           EXIT.

      *-------------------------
       2510-PROCESS-BROWSE-READ.
      *-------------------------

           MOVE RCRCY-CRCY-CD         TO MIR-CRCY-CD-T   (WS-SUB).
           MOVE RCRCY-CO-ID           TO MIR-CO-ID-T   (WS-SUB).

           PERFORM  CRCY-2000-READ-NEXT
               THRU CRCY-2000-READ-NEXT-X.

           IF WS-SUB = WS-MAX-BROWSE-LINES
              AND NOT  WCRCY-IO-EOF
              MOVE RCRCY-CRCY-CD      TO MIR-CRCY-CD
              MOVE RCRCY-CO-ID        TO MIR-CO-ID
           END-IF.

       2510-PROCESS-BROWSE-READ-X.
           EXIT.
      /

      *-----------------------
       9100-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACE                 TO MIR-CRCY-CD-G.
           MOVE SPACE                 TO MIR-CO-ID-G.
           MOVE SPACE                 TO MIR-CRCY-SYMBL-CD.
           MOVE SPACE                 TO MIR-CRCY-PLACE-CD.
           MOVE SPACE                 TO MIR-CRCY-THOU-SPRT-CD.
           MOVE SPACE                 TO MIR-CRCY-DCML-SPRT-CD.
           MOVE SPACE                 TO MIR-CRCY-NEG-PLACE-CD.
017150     MOVE ZERO                  TO MIR-CRCY-SCALE-QTY.

       9100-BLANK-DATA-FIELDS-X.
           EXIT.

      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RCRCY-CRCY-CD         TO MIR-CRCY-CD.
           MOVE RCRCY-CO-ID           TO MIR-CO-ID.
           MOVE RCRCY-CRCY-SYMBL-CD   TO MIR-CRCY-SYMBL-CD.
           MOVE RCRCY-CRCY-PLACE-CD   TO MIR-CRCY-PLACE-CD.
           MOVE RCRCY-CRCY-THOU-SPRT-CD
                                      TO MIR-CRCY-THOU-SPRT-CD.
           MOVE RCRCY-CRCY-DCML-SPRT-CD
                                      TO MIR-CRCY-DCML-SPRT-CD.
           MOVE RCRCY-CRCY-NEG-PLACE-CD
                                      TO MIR-CRCY-NEG-PLACE-CD.
017150     MOVE RCRCY-CRCY-SCALE-QTY  TO L0290-INPUT-NUMBER.
017150     MOVE ZERO                  TO L0290-PRECISION.
017150     MOVE LENGTH OF MIR-CRCY-SCALE-QTY
017150                                TO L0290-MAX-OUT-LEN.
017150     PERFORM  0290-1000-NUMERIC-FORMAT
017150         THRU 0290-1000-NUMERIC-FORMAT-X.
017150     MOVE L0290-OUTPUT-DATA     TO MIR-CRCY-SCALE-QTY.

       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.


      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------

           MOVE SPACES                TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE    TO WGLOB-REF-COMPANY-CODE.

       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.


       COPY XCPPINIT.

       COPY XCPPEXIT.

       COPY XCPECOMP.

       COPY XCPECSYM.

       COPY XCPEDECS.

       COPY XCPETHSP.

       COPY XCCL0260.

       COPY XCCPABND.
       COPY XCCP0030.

017150 COPY XCPL0280.
017150 COPY XCPS0290.
017150 COPY XCPL0290.

      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************

       COPY XCPACRCY.

       COPY XCPBCRCY.

       COPY XCPCCRCY.

       COPY XCPGCRCY.

       COPY XCPNCRCY.

       COPY XCPUCRCY.

       COPY XCPXCRCY.

       COPY XCPNXTAB.

      *****************************************************************
      **                 END OF PROGRAM XSOM0162                     **
      *****************************************************************
