      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0161.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0161                                         **
      **  REMARKS:  BROWSE, CREATE, INQUIRE, MAINTAIN, AND DELETE    **
      **            ENTRIES ON CTRY TABLE.                           **
      **            DETAILS ARE VALIDATED AGAINST THE COMPANY,       **
      **            CURRENCY, AND COUNTRY TYPE EDIT TABLES.          **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
008453**  31MAR98  552    IMPLEMENT MULTIPLE EXTERNAL DATE FORMAT    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
011927**  30OCT98  56     BLANK SEPARATOR CODE IS VALID WHEN FORMAT  **
011927**                  CODE IS "A"                                **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014660**  15DEC99  60     MESSAGE SUPPORT - REMOVAL OF XCPPMEXT      **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0161'.

       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.


       01  WS-WORKING-STORAGE.
           05  WS-SUB                       PIC S9(04) VALUE ZERO COMP.
           05  SUB1                         PIC S9(04) VALUE ZERO COMP.
           05  SUB2                         PIC S9(04) VALUE ZERO COMP.
           05  CTRY-IDX1                    PIC S9(04) VALUE ZERO COMP.
           05  CTRY-IDX2                    PIC S9(04) VALUE ZERO COMP.
           05  CURR-IDX1                    PIC S9(04) VALUE ZERO COMP.
           05  CURR-IDX2                    PIC S9(04) VALUE ZERO COMP.
           05  WS-MAX-BROWSE-LINES          PIC S9(04) VALUE +20  COMP.
           05  WS-MAX-APPL-COMP             PIC S9(04) VALUE +5   COMP.
           05  WS-APPL-COMP-COUNT           PIC S9(04)            COMP.
           05  WS-SAVE-LDZERO               PIC X(01)  VALUE SPACES.
           05  WS-SAVE-DTFMT                PIC X(01)  VALUE SPACES.
           05  WS-SAVE-DTSEP                PIC X(01)  VALUE SPACES.
           05  WS-BUS-FCN-ID                PIC X(04).
               88  WS-BUS-FCN-ID-VALID      VALUES ARE '1950' '1951'
                                                       '1952' '1953'
                                                       '1954'.
               88  WS-BUS-FCN-RETRIEVE      VALUE '1950'.
               88  WS-BUS-FCN-CREATE        VALUE '1951'.
               88  WS-BUS-FCN-UPDATE        VALUE '1952'.
               88  WS-BUS-FCN-DELETE        VALUE '1953'.
               88  WS-BUS-FCN-LIST          VALUE '1954'.

           05  WS-DATE-ORDER-FORMAT         PIC X(01).
               88  WS-DATE-ORDER-FORMAT-VALID          VALUES ARE
                   'A', 'B', 'C', 'D'.

           05  WS-SUPPRESS-LEADING-ZERO     PIC X(01).
               88  WS-SUPPRESS-LEADING-ZERO-VALID      VALUE 'Y' 'N'.


       COPY XCWEBLCH.

007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.

       COPY XCFWCTRY.
       COPY XCFRCTRY.

       COPY XCFWXTAB.
       COPY XCFRXTAB.

       COPY XCWTATRB.

       COPY XCWWWKDT.

      *****************
       LINKAGE SECTION.
      *****************


007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY XCWM0161.


       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

           SET MIR-RETRN-OK             TO  TRUE.

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

      *--------------------------
       2000-PROCESS-REQUEST.
      *--------------------------

           PERFORM  9300-SETUP-MSIN-REFERENCE
              THRU  9300-SETUP-MSIN-REFERENCE-X.
           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.

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
                    SET MIR-RETRN-INVALD-RQST       TO  TRUE
                    MOVE 'XS00000237' TO  WGLOB-MSG-REF-INFO
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0161'   TO WGLOB-MSG-PARM (2)
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.


      *---------------------
       2100-PROCESS-RETRIEVE.
      *---------------------

           MOVE MIR-CTRY-CD           TO WCTRY-CTRY-CD.
           MOVE MIR-CO-ID             TO WCTRY-CO-ID.
           PERFORM  CTRY-1000-READ
               THRU CTRY-1000-READ-X.

           IF WCTRY-IO-OK
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
                   THRU 9200-MOVE-RECORD-TO-SCREEN-X
           ELSE
               PERFORM  9100-BLANK-DATA-FIELDS
                  THRU  9100-BLANK-DATA-FIELDS-X
               MOVE WCTRY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2100-PROCESS-RETRIEVE-X.
           EXIT.

      *--------------------
       2200-PROCESS-CREATE.
      *--------------------

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

           MOVE MIR-CTRY-CD           TO WCTRY-CTRY-CD.
           MOVE MIR-CO-ID             TO WCTRY-CO-ID.
           PERFORM  CTRY-1000-READ
               THRU CTRY-1000-READ-X.

           IF WCTRY-IO-OK
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
                   THRU 9200-MOVE-RECORD-TO-SCREEN-X
               MOVE WCTRY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2200-PROCESS-CREATE-X
           END-IF.

           PERFORM  2210-CREATE-EDITS
               THRU 2210-CREATE-EDITS-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
               GO TO 2200-PROCESS-CREATE-X
           END-IF.

           MOVE MIR-CTRY-CD           TO WCTRY-CTRY-CD.
           MOVE MIR-CO-ID             TO WCTRY-CO-ID.

           PERFORM  CTRY-1000-CREATE
               THRU CTRY-1000-CREATE-X.

           PERFORM  CTRY-1000-WRITE
               THRU CTRY-1000-WRITE-X.

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

      *
       2200-PROCESS-CREATE-X.
           EXIT.

      *------------------
       2210-CREATE-EDITS.
      *------------------
      *
      * VALIDATE COUNTRY
      *
           IF MIR-CTRY-CD = SPACES
           OR MIR-CTRY-CD = LOW-VALUES
               MOVE 'XS01610001'      TO WGLOB-MSG-REF-INFO
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
               MOVE 'XS01610002'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2210-CREATE-EDITS-X.
           EXIT.

      *----------------------
       2300-PROCESS-UPDATE.
      *----------------------

           MOVE MIR-CTRY-CD           TO WCTRY-CTRY-CD.
           MOVE MIR-CO-ID             TO WCTRY-CO-ID.
           PERFORM  CTRY-1000-READ-FOR-UPDATE
               THRU CTRY-1000-READ-FOR-UPDATE-X.

           IF WCTRY-IO-NOT-FOUND
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
               MOVE WCTRY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2300-PROCESS-UPDATE-X
           END-IF.

           MOVE RCTRY-CTRY-LEAD-ZERO-IND
                                      TO WS-SAVE-LDZERO.
           MOVE RCTRY-CTRY-DT-FRMT-CD TO WS-SAVE-DTFMT.
           MOVE RCTRY-CTRY-DT-SPRT-CD TO WS-SAVE-DTSEP.

           PERFORM  2330-UPDATE-EDITS
               THRU 2330-UPDATE-EDITS-X.

           PERFORM  CTRY-2000-REWRITE
               THRU CTRY-2000-REWRITE-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
               MOVE 'XS00000008'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
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
       2330-UPDATE-EDITS.
      *--------------------

           MOVE ZERO                  TO WGLOB-MSG-ERROR-SW.

           IF MIR-CTRY-DT-FRMT-CD      NOT = SPACE
               PERFORM  2335-EDIT-DTFMT
                   THRU 2335-EDIT-DTFMT-X
           ELSE
               MOVE RCTRY-CTRY-DT-FRMT-CD
                                      TO MIR-CTRY-DT-FRMT-CD
           END-IF.

           IF MIR-CTRY-DT-SPRT-CD      NOT = SPACE
              PERFORM  2336-EDIT-DTSEP
                  THRU 2336-EDIT-DTSEP-X
           ELSE
               MOVE RCTRY-CTRY-DT-SPRT-CD
                                      TO MIR-CTRY-DT-SPRT-CD
           END-IF.

           IF MIR-CTRY-LEAD-ZERO-IND     NOT = SPACE
               PERFORM  2337-EDIT-LDZERO
                   THRU 2337-EDIT-LDZERO-X
           ELSE
               MOVE RCTRY-CTRY-LEAD-ZERO-IND
                                      TO MIR-CTRY-LEAD-ZERO-IND
           END-IF.

           PERFORM  2338-CROSS-EDIT
               THRU 2338-CROSS-EDIT-X.

       2330-UPDATE-EDITS-X.
           EXIT.


      *----------------
       2335-EDIT-DTFMT.
      *----------------

           IF MIR-CTRY-DT-FRMT-CD      = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES            TO MIR-CTRY-DT-FRMT-CD
           END-IF.

           MOVE MIR-CTRY-DT-FRMT-CD             TO WS-DATE-ORDER-FORMAT.
           IF  WS-DATE-ORDER-FORMAT-VALID
               MOVE MIR-CTRY-DT-FRMT-CD
                                      TO RCTRY-CTRY-DT-FRMT-CD
           ELSE
               MOVE 'XS01610003'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2335-EDIT-DTFMT-X.
           EXIT.

      *----------------
       2336-EDIT-DTSEP.
      *----------------
           IF MIR-CTRY-DT-SPRT-CD      = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES            TO MIR-CTRY-DT-SPRT-CD
           END-IF.

011927     IF  MIR-CTRY-DT-FRMT-CD = 'A'
011927     AND MIR-CTRY-DT-SPRT-CD = SPACES
011927         MOVE MIR-CTRY-DT-SPRT-CD
                                      TO RCTRY-CTRY-DT-SPRT-CD
011927         GO TO 2336-EDIT-DTSEP-X
011927     END-IF.

      *
      * PERFORM XTAB TABLE LOOKUP FOR DATE SEPARATOR
      *
           MOVE MIR-CTRY-DT-SPRT-CD                TO WXTAB-ETBL-VALU-ID
           PERFORM  DSEP-1000-EDIT-DATE-SEP
               THRU DSEP-1000-EDIT-DATE-SEP-X

           IF WXTAB-IO-OK
               MOVE MIR-CTRY-DT-SPRT-CD
                                      TO RCTRY-CTRY-DT-SPRT-CD
           ELSE
               MOVE WXTAB-ETBL-TYP-ID TO WGLOB-MSG-PARM (1)
               MOVE 'XS01610004'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2336-EDIT-DTSEP-X.
           EXIT.


      *-----------------
       2337-EDIT-LDZERO.
      *-----------------

           IF MIR-CTRY-LEAD-ZERO-IND     = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES            TO MIR-CTRY-LEAD-ZERO-IND
           END-IF.

           MOVE MIR-CTRY-LEAD-ZERO-IND
                                      TO WS-SUPPRESS-LEADING-ZERO
           IF  WS-SUPPRESS-LEADING-ZERO-VALID
               MOVE MIR-CTRY-LEAD-ZERO-IND
                                      TO RCTRY-CTRY-LEAD-ZERO-IND
           ELSE
               MOVE 'XS01610005'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2337-EDIT-LDZERO-X.
           EXIT.

      *----------------
       2338-CROSS-EDIT.
      *----------------

      *
      *  IF DATE SEPARATOR IS DDMMMYYYY, DATE SEPARATOR SYMBOL MUST
      *  BE SPACE
      *
           IF  MIR-CTRY-DT-FRMT-CD      = 'A'
               IF  MIR-CTRY-DT-SPRT-CD NOT = SPACE
                   MOVE WS-SAVE-DTSEP TO RCTRY-CTRY-DT-SPRT-CD
                   MOVE WS-SAVE-DTFMT TO RCTRY-CTRY-DT-FRMT-CD
                   MOVE 'XS01610006'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           ELSE
               IF  MIR-CTRY-DT-SPRT-CD = SPACE
                   MOVE WS-SAVE-DTSEP TO RCTRY-CTRY-DT-SPRT-CD
                   MOVE WS-SAVE-DTFMT TO RCTRY-CTRY-DT-FRMT-CD
011927*            MOVE 'XS01610006'     TO WGLOB-MSG-REF-INFO
011927*MSG: DATE/ORDER FORMATS B,C,D MUST HAVE A DATE SEPARATOR
011927             MOVE 'XS01610009'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           END-IF.
      *
      *  IF DATE SEPARATOR IS DDMMMYYYY, SUPPRESS LEADING ZEROS
      *  INDICATOR MUST BE 'N'
      *
           IF  MIR-CTRY-DT-FRMT-CD      = 'A'
           AND MIR-CTRY-LEAD-ZERO-IND     NOT = 'N'
               MOVE WS-SAVE-LDZERO    TO RCTRY-CTRY-LEAD-ZERO-IND
               MOVE WS-SAVE-DTFMT     TO RCTRY-CTRY-DT-FRMT-CD
               MOVE 'XS01610007'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2338-CROSS-EDIT-X.
           EXIT.

      *--------------------
       2400-PROCESS-DELETE.
      *--------------------

           IF MIR-CO-ID  = SPACES
           OR MIR-CO-ID  = LOW-VALUES
              PERFORM  2412-DELETE-KEY-RANGE
                  THRU 2412-DELETE-KEY-RANGE-X
           ELSE
              PERFORM  2411-DELETE-SINGLE
                  THRU 2411-DELETE-SINGLE-X
           END-IF.

       2400-PROCESS-DELETE-X.
           EXIT.

      *-------------------
       2411-DELETE-SINGLE.
      *-------------------

           MOVE MIR-CTRY-CD           TO WCTRY-CTRY-CD.
           MOVE MIR-CO-ID             TO WCTRY-CO-ID.
           PERFORM  CTRY-1000-READ-FOR-UPDATE
               THRU CTRY-1000-READ-FOR-UPDATE-X.

           IF WCTRY-IO-OK
               PERFORM  CTRY-1000-DELETE
                   THRU CTRY-1000-DELETE-X
               MOVE 'XS00000011'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               MOVE WCTRY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

       2411-DELETE-SINGLE-X.
           EXIT.


      *-------------------
       2412-DELETE-KEY-RANGE.
      *-------------------

           MOVE SPACES                TO MIR-CTRY-CD-G.
           MOVE SPACES                TO MIR-CO-ID-G.

           MOVE LOW-VALUES            TO WCTRY-KEY.
           MOVE HIGH-VALUES           TO WCTRY-ENDBR-KEY.
           MOVE MIR-CTRY-CD           TO WCTRY-CTRY-CD.

           PERFORM  CTRY-1000-BROWSE
               THRU CTRY-1000-BROWSE-X.

           IF WCTRY-IO-EOF
              OR  MIR-CTRY-CD NOT = WCTRY-CTRY-CD
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
               MOVE WCTRY-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2412-DELETE-KEY-RANGE-X
           END-IF.

           PERFORM  CTRY-2000-READ-NEXT
               THRU CTRY-2000-READ-NEXT-X.

           IF WCTRY-IO-EOF
              OR  MIR-CTRY-CD NOT = WCTRY-CTRY-CD
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2412-DELETE-KEY-RANGE-X
           END-IF.

           PERFORM  CTRY-3000-END-BROWSE
               THRU CTRY-3000-END-BROWSE-X.

           MOVE LOW-VALUES            TO WCTRY-KEY.
           MOVE HIGH-VALUES           TO WCTRY-ENDBR-KEY.
           MOVE MIR-CTRY-CD           TO WCTRY-CTRY-CD.
           MOVE MIR-CTRY-CD           TO WCTRY-ENDBR-CTRY-CD.

           PERFORM  CTRY-1000-DELETE-KEY-RANGE
               THRU CTRY-1000-DELETE-KEY-RANGE-X.

           MOVE 'XS00000011'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

       2412-DELETE-KEY-RANGE-X.
           EXIT.

      *--------------------
       2500-PROCESS-LIST.
      *--------------------

           MOVE SPACES                TO MIR-CTRY-CD-G.
           MOVE SPACES                TO MIR-CO-ID-G.

           MOVE LOW-VALUES            TO WCTRY-KEY.
           MOVE HIGH-VALUES           TO WCTRY-ENDBR-KEY.
           MOVE MIR-CTRY-CD           TO WCTRY-CTRY-CD.
           MOVE MIR-CO-ID             TO WCTRY-CO-ID.

           PERFORM  CTRY-1000-BROWSE
               THRU CTRY-1000-BROWSE-X.

           IF WCTRY-IO-EOF
               MOVE 'XS00000034'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2500-PROCESS-LIST-X
           END-IF.

           PERFORM  CTRY-2000-READ-NEXT
               THRU CTRY-2000-READ-NEXT-X.

           IF WCTRY-IO-EOF
               MOVE 'XS00000025'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2500-PROCESS-LIST-X
           END-IF.

           PERFORM  2510-PROCESS-LIST-READ
               THRU 2510-PROCESS-LIST-READ-X
               VARYING WS-SUB FROM +1 BY +1
               UNTIL   WS-SUB > WS-MAX-BROWSE-LINES
               OR    WCTRY-IO-EOF.

           IF WCTRY-IO-EOF
               MOVE 'XS00000025'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               SET WGLOB-MORE-DATA-EXISTS TO TRUE
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  CTRY-3000-END-BROWSE
               THRU CTRY-3000-END-BROWSE-X.

       2500-PROCESS-LIST-X.
           EXIT.

      *-------------------------
       2510-PROCESS-LIST-READ.
      *-------------------------

           MOVE RCTRY-CTRY-CD         TO MIR-CTRY-CD-T (WS-SUB).
           MOVE RCTRY-CO-ID           TO MIR-CO-ID-T   (WS-SUB).

           PERFORM  CTRY-2000-READ-NEXT
               THRU CTRY-2000-READ-NEXT-X.

           IF WS-SUB = WS-MAX-BROWSE-LINES
           AND     NOT WCTRY-IO-EOF
              MOVE RCTRY-CTRY-CD      TO MIR-CTRY-CD
              MOVE RCTRY-CO-ID        TO MIR-CO-ID
           END-IF.

       2510-PROCESS-LIST-READ-X.
           EXIT.
      /
      *-----------------------
       9100-BLANK-DATA-FIELDS.
      *-----------------------

           IF WS-BUS-FCN-LIST
               MOVE SPACE             TO MIR-CTRY-CD-G
               MOVE SPACE             TO MIR-CO-ID-G
           ELSE
               MOVE SPACE             TO MIR-CTRY-DT-FRMT-CD
               MOVE SPACE             TO MIR-CTRY-DT-SPRT-CD
               MOVE SPACE             TO MIR-CTRY-LEAD-ZERO-IND
           END-IF.

       9100-BLANK-DATA-FIELDS-X.
           EXIT.

      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RCTRY-CTRY-CD         TO MIR-CTRY-CD.
           MOVE RCTRY-CO-ID           TO MIR-CO-ID.
           MOVE RCTRY-CTRY-DT-FRMT-CD TO MIR-CTRY-DT-FRMT-CD.
           MOVE RCTRY-CTRY-DT-SPRT-CD TO MIR-CTRY-DT-SPRT-CD.
           MOVE RCTRY-CTRY-LEAD-ZERO-IND
                                      TO MIR-CTRY-LEAD-ZERO-IND.

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

       COPY XCPEDSEP.

       COPY XCCL0260.

014660*COPY XCPPMEXT.

       COPY XCCPABND.
       COPY XCCP0030.
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************

       COPY XCPACTRY.

       COPY XCPBCTRY.

       COPY XCPCCTRY.

       COPY XCPGCTRY.

       COPY XCPNCTRY.

       COPY XCPUCTRY.

       COPY XCPXCTRY.

       COPY XCPNXTAB.

      *****************************************************************
      **                 END OF PROGRAM XSOM0161                     **
      *****************************************************************
