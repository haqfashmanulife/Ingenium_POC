      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0180.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0180                                         **
      **  REMARKS:  BROWSE,INQUIRE,CREATE,MAINTAIN AND DELETE ENTRIES**
      **            ON THE ASCL TABLE.                               **
      **            THIS MODULE ALLOWS THE USER TO INQUIRE AND       **
      **            MAINTAIN ENTRIES ON THE ASCL TABLE.  ENTRIES ARE **
      **            VALIDATED AGAINST THE COMPANY TYPE EDIT TABLE.   **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ARCHITECTURE CHANGES TO SUPPORT GRAPHICAL  **
53-062**                  USER INTERFACE                             **
53-064**  30NOV95  CG     MOREDATA (GUI) STANDARD "XS00000034"       **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
53-068**  30NOV95  DH     REMOVE HIDDEN FIELDS FROM MAP & MOVE       **
53-068**                  FIELDS TO NEW COMMON AREA                  **
54-001**  01SEP96  JLB    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  CG     CHANGE TO STANDARD                         **
557708**  30SEP97  GV     MODIFICATIONS FOR CICS ABENDS HANDLING     **
008445**  31MAR98  552    GENERATE MIR FROM TECH ARCH DATABASE:      **
008445**                  RENAME REPEATING FIELDS                    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
012624**  15DEC99  60     WGLOB AND OTHER TABLE CHANGES              **
015648**  15DEC99  60     REPLACE * TO SPACE IN MIR                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
015543**  15DEC99  60     CODE CLEANUP                               **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0180'.

       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.


       01  WS-WORKING-STORAGE.
           05  WS-SUB                       PIC S9(04) VALUE ZERO COMP.
           05  WS-SUB1                      PIC S9(04) VALUE ZERO COMP.
           05  WS-SUB2                      PIC S9(04) VALUE ZERO COMP.
           05  WS-SUB3                      PIC S9(04) VALUE ZERO COMP.
           05  WS-SUB4                      PIC S9(04) VALUE ZERO COMP.
           05  WS-CTRY-IDX1                 PIC S9(04) VALUE ZERO COMP.
           05  WS-CTRY-IDX2                 PIC S9(04) VALUE ZERO COMP.
           05  WS-CURR-IDX1                 PIC S9(04) VALUE ZERO COMP.
           05  WS-CURR-IDX2                 PIC S9(04) VALUE ZERO COMP.
           05  WS-MAX-BROWSE-LINES          PIC S9(04) VALUE +10  COMP.
INCSIZ     05  WS-MAX-ROWS                  PIC S9(04) VALUE +05  COMP.
           05  WS-BUS-FCN-ID                PIC X(04).
               88  WS-BUS-FCN-ID-VALID                 VALUES ARE
                   '1980', '1981', '1982', '1983', '1984', '1985'.
               88  WS-BUS-FCN-RETRIEVE                 VALUE '1980'.
               88  WS-BUS-FCN-CREATE                   VALUE '1981'.
               88  WS-BUS-FCN-UPDATE                   VALUE '1982'.
               88  WS-BUS-FCN-DELETE                   VALUE '1983'.
               88  WS-BUS-FCN-LIST                     VALUE '1984'.
               88  WS-BUS-FCN-KLON                     VALUE '1985'.
           05  WS-COUNT-KLON-RECS           PIC 9(04).
           05  WS-HOLD-LAST-ASCL-KEY        PIC X(14).
           05  WS-DISPLAY-NUM               PIC 9(05).
      /
007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.
      /
015648*COPY XCWEBLCH.
      /
       COPY XCFWAPPL.
       COPY XCFRAPPL.
      /
       COPY XCFWASCL.
       COPY XCFRASCL.
      /
       COPY XCFWUSCL.
       COPY XCFRUSCL.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
      *COPY XCWCCOMM.
      *COPY XCWC0180.
      /
       COPY XCWWWKDT.
      /
      *****************
       LINKAGE SECTION.
      *****************


007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY XCWM0180.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

015648     INSPECT MIR-PARM-AREA REPLACING ALL '*' BY ' '.

557708     PERFORM  ABND-1000-HANDLE-ABEND
557708         THRU ABND-1000-HANDLE-ABEND-X.
557708
           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

           PERFORM  2000-PROCESS-REQUEST
               THRU 2000-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      *---------------------
       2000-PROCESS-REQUEST.
      *---------------------

           SET  MIR-RETRN-OK       TO TRUE.
           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.
013578*
013578*    BACK OUT KLON FUNCTION
013578*
013578*    IF  (MIR-FORCE = '3') AND
013578*        NOT WS-ENTER-KLON
013578*        PERFORM  2630-PROCESS-KLON-BACKOUT
013578*            THRU 2630-PROCESS-KLON-BACKOUT-X
013578*       GO TO 2000-PROCESS-TRANSACTIONS-X
013578*    END-IF.
013578*
           IF  WGLOB-MSG-ERROR-SW > ZERO
               SET MIR-RETRN-RQST-FAILED  TO TRUE
               GO TO 2000-PROCESS-REQUEST-X
557660     END-IF.
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

               WHEN WS-BUS-FCN-KLON
                    PERFORM  2600-PROCESS-KLON
                        THRU 2600-PROCESS-KLON-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0180'   TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237' TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

      *
       2000-PROCESS-REQUEST-X.
           EXIT.
      /
      *----------------------
       2100-PROCESS-RETRIEVE.
      *----------------------
      *
           MOVE MIR-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-CO-ID.
remove*    MOVE MIR-APPL-ID           TO WASCL-APPL-ID.
557660     PERFORM ASCL-1000-READ
557660        THRU ASCL-1000-READ-X.
           IF WASCL-IO-OK
557660        PERFORM 9200-MOVE-RECORD-TO-SCREEN
557660           THRU 9200-MOVE-RECORD-TO-SCREEN-X
           ELSE
               PERFORM 9100-BLANK-DATA-FIELDS
                  THRU 9100-BLANK-DATA-FIELDS-X
               MOVE WASCL-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.
      *
       2100-PROCESS-RETRIEVE-X.
           EXIT.
      /
      *--------------------
       2200-PROCESS-CREATE.
      *--------------------
      *
           MOVE MIR-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-CO-ID.
remove*    MOVE MIR-APPL-ID           TO WASCL-APPL-ID.
           PERFORM ASCL-1000-READ
              THRU ASCL-1000-READ-X.

           IF WASCL-IO-OK
              MOVE WASCL-KEY          TO WGLOB-MSG-PARM (1)
              MOVE 'XS00000003'       TO WGLOB-MSG-REF-INFO
557660        PERFORM 0260-1000-GENERATE-MESSAGE
557660           THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2200-PROCESS-CREATE-X
557660     END-IF.

           PERFORM 2210-CREATE-EDITS
              THRU 2210-CREATE-EDITS-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
              PERFORM 9100-BLANK-DATA-FIELDS
                 THRU 9100-BLANK-DATA-FIELDS-X
              GO TO 2200-PROCESS-CREATE-X
557660     END-IF.

           MOVE MIR-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-CO-ID.
remove*    MOVE MIR-APPL-ID           TO WASCL-APPL-ID.
           PERFORM ASCL-1000-CREATE
              THRU ASCL-1000-CREATE-X.
           PERFORM 2230-WRITE-UPDATE-RELA
              THRU 2230-WRITE-UPDATE-RELA-X.
           IF WGLOB-MSG-ERROR-SW > ZERO
               PERFORM 9100-BLANK-DATA-FIELDS
                  THRU 9100-BLANK-DATA-FIELDS-X
               GO TO 2200-PROCESS-CREATE-X
557660     END-IF.
      *
           PERFORM 9200-MOVE-RECORD-TO-SCREEN
              THRU 9200-MOVE-RECORD-TO-SCREEN-X.
           MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
      *
       2200-PROCESS-CREATE-X.
           EXIT.
      /
      *------------------
       2210-CREATE-EDITS.
      *------------------
      *
           MOVE MIR-SECUR-CLAS-ID     TO WUSCL-SECUR-CLAS-ID.
           PERFORM USCL-1000-READ
              THRU USCL-1000-READ-X.
      *
           IF WUSCL-IO-OK
              NEXT SENTENCE
           ELSE
              MOVE 'XS01800001'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2210-CREATE-EDITS-X
557660     END-IF.
      *
           MOVE MIR-CO-ID             TO WXTAB-ETBL-VALU-ID.
           PERFORM COMP-1000-EDIT-COMPANY
              THRU COMP-1000-EDIT-COMPANY-X.
      *
           IF NOT WXTAB-IO-OK
              MOVE 'XS01800002'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2210-CREATE-EDITS-X
557660     END-IF.
      *
remove*    MOVE MIR-APPL-ID           TO WAPPL-APPL-ID.
           MOVE MIR-CO-ID             TO WAPPL-CO-ID.
           PERFORM APPL-1000-READ
              THRU APPL-1000-READ-X.
      *
           IF NOT WAPPL-IO-OK
              MOVE 'XS01800003'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.
      *
       2210-CREATE-EDITS-X.
           EXIT.
      /
      *-----------------------
       2230-WRITE-UPDATE-RELA.
      *-----------------------
      *
remove*    MOVE MIR-APPL-ID           TO WAPPL-APPL-ID.

      * IF WE ARE KLONING THEN USE DESTINATION CO-ID (MIR-CO-ID-2)

           IF  WS-BUS-FCN-KLON
               MOVE MIR-CO-ID-2           TO WAPPL-CO-ID
           ELSE
               MOVE MIR-CO-ID             TO WAPPL-CO-ID
           END-IF.

           PERFORM APPL-1000-READ-FOR-UPDATE
              THRU APPL-1000-READ-FOR-UPDATE-X.
      *
           IF WAPPL-IO-OK
              PERFORM ASCL-1000-WRITE
                 THRU ASCL-1000-WRITE-X
              ADD +1                TO RAPPL-APPL-ASCL-REL-CTR
              PERFORM APPL-2000-REWRITE
                 THRU APPL-2000-REWRITE-X
           ELSE
              MOVE 'XS01800003'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.
      *
       2230-WRITE-UPDATE-RELA-X.
           EXIT.
      /
      *--------------------
       2300-PROCESS-UPDATE.
      *--------------------
      *
           MOVE MIR-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-CO-ID.
012624*    MOVE MIR-APPL-ID           TO WASCL-APPL-ID.
           PERFORM ASCL-1000-READ-FOR-UPDATE
              THRU ASCL-1000-READ-FOR-UPDATE-X.

           IF WASCL-IO-NOT-FOUND
              PERFORM 9100-BLANK-DATA-FIELDS
                 THRU 9100-BLANK-DATA-FIELDS-X
              MOVE WASCL-KEY          TO WGLOB-MSG-PARM (1)
              MOVE 'XS00000006'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2300-PROCESS-UPDATE-X
557660     END-IF.

           PERFORM  2330-MAINTAIN-EDITS
               THRU 2330-MAINTAIN-EDITS-X.

           PERFORM ASCL-2000-REWRITE
              THRU ASCL-2000-REWRITE-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
              MOVE 'XS00000008'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
              MOVE 'XS00000007'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
557660        PERFORM 9200-MOVE-RECORD-TO-SCREEN
557660           THRU 9200-MOVE-RECORD-TO-SCREEN-X
557660     END-IF.
      *
       2300-PROCESS-UPDATE-X.
           EXIT.
      /
      *--------------------
       2330-MAINTAIN-EDITS.
      *--------------------
      *
           MOVE ZERO                  TO WGLOB-MSG-ERROR-SW.
      *
012624*    MOVE MIR-APPL-ID           TO WAPPL-APPL-ID.
           MOVE MIR-CO-ID             TO WAPPL-CO-ID.
           PERFORM APPL-1000-READ
              THRU APPL-1000-READ-X.
      *
           IF NOT WAPPL-IO-OK
              MOVE 'XS01800003'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2330-MAINTAIN-EDITS-X
557660     END-IF.
      *
           PERFORM 2345-EDIT-CTRY-AND-CURR
              THRU 2345-EDIT-CTRY-AND-CURR-X
              VARYING WS-SUB1 FROM +1 BY +1
INCSIZ        UNTIL   WS-SUB1 > WS-MAX-ROWS.
      *
           PERFORM 2355-CHK-DUPLICATE-CTRY-CURR
              THRU 2355-CHK-DUPLICATE-CTRY-CURR-X
              VARYING WS-CTRY-IDX1 FROM +1 BY +1
INCSIZ        UNTIL   WS-CTRY-IDX1 > WS-MAX-ROWS.

           IF WGLOB-MSG-ERROR-SW = ZERO
              MOVE ZERO               TO WS-CTRY-IDX2
              PERFORM 2390-PACK-CTRY-AND-CURR
                 THRU 2390-PACK-CTRY-AND-CURR-X
                 VARYING WS-CTRY-IDX1 FROM +1 BY +1
INCSIZ           UNTIL   WS-CTRY-IDX1 > WS-MAX-ROWS
557660     END-IF.
      *
012624*    MOVE LOW-VALUES            TO MIR-ASCL-TSCL-REL-CTR.
      *
       2330-MAINTAIN-EDITS-X.
           EXIT.
      /
      *------------------------
       2345-EDIT-CTRY-AND-CURR.
      *------------------------
      *    

015648**  CONVERT '*' RETURNED BY LISTBOX FOR A BLANK FEILD
015648*   TO SPACES

015648*    PERFORM  2346-EBLCH-TO-SPACE
015648*        THRU 2346-EBLCH-TO-SPACE-X.
      **

           IF MIR-ASCL-CTRY-1-CD-T (WS-SUB1) = SPACE
              IF MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1) = SPACE AND
                 MIR-ASCL-CRCY-2-1-CD-T (WS-SUB1) = SPACE AND
                 MIR-ASCL-CRCY-3-1-CD-T (WS-SUB1) = SPACE AND
                 MIR-ASCL-CRCY-4-1-CD-T (WS-SUB1) = SPACE AND
                 MIR-ASCL-CRCY-5-1-CD-T (WS-SUB1) = SPACE
                 GO TO 2345-EDIT-CTRY-AND-CURR-X
              ELSE
                 MOVE 'XS01800006'    TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X
                 GO TO 2345-EDIT-CTRY-AND-CURR-X
557660        END-IF
557660     END-IF.
      *
54-001     PERFORM
               VARYING WS-SUB2 FROM +1 BY +1
               UNTIL   WS-SUB2 > +5
               OR      RAPPL-APPL-CTRY-CD (WS-SUB2) =
                       MIR-ASCL-CTRY-1-CD-T (WS-SUB1)
015543         CONTINUE                       
54-001     END-PERFORM.

           IF WS-SUB2 > +5
              MOVE 'XS01800004'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
              PERFORM 2350-EDIT-CURR
                 THRU 2350-EDIT-CURR-X
557660     END-IF.
      *
       2345-EDIT-CTRY-AND-CURR-X.
           EXIT.
      /
      *------------------------
015648*2346-EBLCH-TO-SPACE.
      *------------------------

      * CONVERT '*' TO SPACES

      *    IF  MIR-ASCL-CTRY-1-CD-T (WS-SUB1) = EBLCH-BLANK-FIELD-CHAR
      *        MOVE  SPACES TO MIR-ASCL-CTRY-1-CD-T (WS-SUB1)
      *    END-IF.

      *    IF  MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1) = EBLCH-BLANK-FIELD-CHAR
      *        MOVE  SPACES TO MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1)
      *    END-IF.

      *    IF  MIR-ASCL-CRCY-2-1-CD-T (WS-SUB1) = EBLCH-BLANK-FIELD-CHAR
      *        MOVE  SPACES TO MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1)
      *    END-IF.
      
      *    IF  MIR-ASCL-CRCY-3-1-CD-T (WS-SUB1) = EBLCH-BLANK-FIELD-CHAR
      *        MOVE  SPACES TO MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1)
      *    END-IF.
      
      *    IF  MIR-ASCL-CRCY-4-1-CD-T (WS-SUB1) = EBLCH-BLANK-FIELD-CHAR
      *        MOVE  SPACES TO MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1)
      *    END-IF.
      
      *    IF  MIR-ASCL-CRCY-5-1-CD-T (WS-SUB1) = EBLCH-BLANK-FIELD-CHAR
      *        MOVE  SPACES TO MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1)
      *    END-IF.

015648*2346-EBLCH-TO-SPACE-X.
      *    EXIT.
      /
      *---------------
       2350-EDIT-CURR.
      *---------------
      *
           IF  MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1) = SPACE
               CONTINUE
557660     ELSE
54-001         PERFORM
                VARYING WS-SUB4 FROM +1 BY +1
                UNTIL   WS-SUB4 > +5
                OR      RAPPL-APPL-CRCY-CD     (WS-SUB2 WS-SUB4) =
                        MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1)
015543             CONTINUE                        
54-001         END-PERFORM
      *
               IF  WS-SUB4 > +5
                   MOVE 'XS01800005'       TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
557660         END-IF

           END-IF.
      *
           IF  MIR-ASCL-CRCY-2-1-CD-T (WS-SUB1) = SPACE
               CONTINUE
557660     ELSE
54-001         PERFORM
                VARYING WS-SUB4 FROM +1 BY +1
                UNTIL   WS-SUB4 > +5
                OR      RAPPL-APPL-CRCY-CD     (WS-SUB2 WS-SUB4) =
                        MIR-ASCL-CRCY-2-1-CD-T (WS-SUB1)
015543             CONTINUE
54-001         END-PERFORM
      *
               IF  WS-SUB4 > +5
                   MOVE 'XS01800005'       TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
557660         END-IF

           END-IF.

           IF  MIR-ASCL-CRCY-3-1-CD-T (WS-SUB1) = SPACE
               CONTINUE
557660     ELSE
54-001         PERFORM
                VARYING WS-SUB4 FROM +1 BY +1
                UNTIL   WS-SUB4 > +5
                OR      RAPPL-APPL-CRCY-CD     (WS-SUB2 WS-SUB4) =
                        MIR-ASCL-CRCY-3-1-CD-T (WS-SUB1)
015543             CONTINUE                        
54-001         END-PERFORM
      *
               IF  WS-SUB4 > +5
                   MOVE 'XS01800005'       TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
557660         END-IF

           END-IF.

           IF  MIR-ASCL-CRCY-4-1-CD-T (WS-SUB1) = SPACE
               CONTINUE
557660     ELSE
54-001         PERFORM
                VARYING WS-SUB4 FROM +1 BY +1
                UNTIL   WS-SUB4 > +5
                OR      RAPPL-APPL-CRCY-CD     (WS-SUB2 WS-SUB4) =
                        MIR-ASCL-CRCY-4-1-CD-T (WS-SUB1)
015543             CONTINUE                        
54-001         END-PERFORM
      *
               IF  WS-SUB4 > +5
                   MOVE 'XS01800005'       TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
557660         END-IF

           END-IF.

           IF  MIR-ASCL-CRCY-5-1-CD-T (WS-SUB1) = SPACE
               CONTINUE
557660     ELSE
54-001         PERFORM
                VARYING WS-SUB4 FROM +1 BY +1
                UNTIL   WS-SUB4 > +5
                OR      RAPPL-APPL-CRCY-CD     (WS-SUB2 WS-SUB4) =
                        MIR-ASCL-CRCY-5-1-CD-T (WS-SUB1)
015543             CONTINUE                        
54-001         END-PERFORM
      *
               IF  WS-SUB4 > +5
                   MOVE 'XS01800005'       TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
557660         END-IF

           END-IF.


       2350-EDIT-CURR-X.
           EXIT.
      /
      *-----------------------------
       2355-CHK-DUPLICATE-CTRY-CURR.
      *-----------------------------
      *
           IF  MIR-ASCL-CTRY-1-CD-T (WS-CTRY-IDX1) = SPACES
               GO TO 2355-CHK-DUPLICATE-CTRY-CURR-X
557660     END-IF.
      *
           ADD +1, WS-CTRY-IDX1 GIVING WS-CTRY-IDX2.
           IF  WS-CTRY-IDX2 > +5
               NEXT SENTENCE
           ELSE
               PERFORM 2360-CHK-DUP-CTRY
                  THRU 2360-CHK-DUP-CTRY-X
                   VARYING WS-CTRY-IDX2 FROM WS-CTRY-IDX2 BY +1
                     UNTIL WS-CTRY-IDX2 > +5
557660     END-IF.
      *
           PERFORM 2365-CHK-DUP-CURR-LIST
              THRU 2365-CHK-DUP-CURR-LIST-X
               VARYING WS-CURR-IDX1 FROM +1 BY +1
                 UNTIL WS-CURR-IDX1 > +5.
      *
       2355-CHK-DUPLICATE-CTRY-CURR-X.
           EXIT.
      *
      *------------------
       2360-CHK-DUP-CTRY.
      *------------------
      *
           IF  MIR-ASCL-CTRY-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CTRY-1-CD-T (WS-CTRY-IDX2)
               MOVE 'XS01800007'       TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.
      *
       2360-CHK-DUP-CTRY-X.
           EXIT.
      /
      *-----------------------
       2365-CHK-DUP-CURR-LIST.
      *-----------------------

      * CURRENCY IN FIRST COLUMN

           IF  MIR-ASCL-CRCY-1-1-CD-T (WS-CTRY-IDX1) = SPACES
               CONTINUE
           ELSE
               ADD +1, WS-CURR-IDX1 GIVING WS-CURR-IDX2

               IF  WS-CURR-IDX2 > +5
                   CONTINUE
               ELSE
                   PERFORM 2371-CHK-DUP-CURR-1
                      THRU 2371-CHK-DUP-CURR-1-X
               END-IF
           END-IF.

      * CURRENCY IN SECOND COLUMN

           IF  MIR-ASCL-CRCY-2-1-CD-T (WS-CTRY-IDX1) = SPACES
               CONTINUE
           ELSE
               ADD +1, WS-CURR-IDX1 GIVING WS-CURR-IDX2

               IF  WS-CURR-IDX2 > +5
                   CONTINUE
               ELSE
                   PERFORM 2372-CHK-DUP-CURR-2
                      THRU 2372-CHK-DUP-CURR-2-X
               END-IF
           END-IF.

      * CURRENCY IN THIRD COLUMN

           IF  MIR-ASCL-CRCY-3-1-CD-T (WS-CTRY-IDX1) = SPACES
               CONTINUE
           ELSE
               ADD +1, WS-CURR-IDX1 GIVING WS-CURR-IDX2

               IF  WS-CURR-IDX2 > +5
                   CONTINUE
               ELSE
                   PERFORM 2373-CHK-DUP-CURR-3
                      THRU 2373-CHK-DUP-CURR-3-X
               END-IF
           END-IF.

      * CURRENCY IN FOURTH COLUMN

           IF  MIR-ASCL-CRCY-4-1-CD-T (WS-CTRY-IDX1) = SPACES
               CONTINUE
           ELSE
               ADD +1, WS-CURR-IDX1 GIVING WS-CURR-IDX2

               IF  WS-CURR-IDX2 > +5
                   CONTINUE
               ELSE
                   PERFORM 2374-CHK-DUP-CURR-4
                      THRU 2374-CHK-DUP-CURR-4-X
               END-IF
           END-IF.

       2365-CHK-DUP-CURR-LIST-X.
           EXIT.
      *
      *------------------
       2371-CHK-DUP-CURR-1.
      *------------------
      *
      * CHECK THE CURRENCY IN FIRST COL WITH 2,3,4,5
 
           IF  MIR-ASCL-CRCY-1-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-2-1-CD-T (WS-CTRY-IDX1)
           OR  MIR-ASCL-CRCY-1-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-3-1-CD-T (WS-CTRY-IDX1)
           OR  MIR-ASCL-CRCY-1-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-4-1-CD-T (WS-CTRY-IDX1)
           OR  MIR-ASCL-CRCY-1-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-5-1-CD-T (WS-CTRY-IDX1)

               MOVE 'XS01800008'       TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

           END-IF.
      *
       2371-CHK-DUP-CURR-1-X.
           EXIT.
      /
      *------------------
       2372-CHK-DUP-CURR-2.
      *------------------
      *
      * CHECK THE CURRENCY IN SECOND COL WITH 3,4,5

           IF  MIR-ASCL-CRCY-2-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-3-1-CD-T (WS-CTRY-IDX1)
           OR  MIR-ASCL-CRCY-2-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-4-1-CD-T (WS-CTRY-IDX1)
           OR  MIR-ASCL-CRCY-2-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-5-1-CD-T (WS-CTRY-IDX1)

               MOVE 'XS01800008'       TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

           END-IF.
      *
       2372-CHK-DUP-CURR-2-X.
           EXIT.
      /
      *------------------
       2373-CHK-DUP-CURR-3.
      *------------------
      *
      * CHECK THE CURRENCY IN THIRD COL WITH 4,5

           IF  MIR-ASCL-CRCY-3-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-4-1-CD-T (WS-CTRY-IDX1)
           OR  MIR-ASCL-CRCY-3-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-5-1-CD-T (WS-CTRY-IDX1)

               MOVE 'XS01800008'       TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

           END-IF.
      *
       2373-CHK-DUP-CURR-3-X.
           EXIT.
      /
      *--------------------
       2374-CHK-DUP-CURR-4.
      *--------------------
      *
      * CHECK THE CURRENCY IN FOURTH COL WITH 5

           IF  MIR-ASCL-CRCY-4-1-CD-T (WS-CTRY-IDX1) =
               MIR-ASCL-CRCY-5-1-CD-T (WS-CTRY-IDX1)

               MOVE 'XS01800008'       TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

           END-IF.
      *
       2374-CHK-DUP-CURR-4-X.
           EXIT.
      /

      *------------------------
       2390-PACK-CTRY-AND-CURR.
      *------------------------
      *
           MOVE SPACE        TO RASCL-ASCL-CTRY-TBL-INFO (WS-CTRY-IDX1).

           IF   MIR-ASCL-CTRY-1-CD-T (WS-CTRY-IDX1) NOT = SPACES
                ADD  +1 TO WS-CTRY-IDX2
                MOVE MIR-ASCL-CTRY-1-CD-T (WS-CTRY-IDX1)
                                      TO
                     RASCL-ASCL-CTRY-CD (WS-CTRY-IDX2)
557660     END-IF.

           MOVE ZERO                  TO WS-CURR-IDX2.

           PERFORM 2395-MOVE-CURR
              THRU 2395-MOVE-CURR-X.
      *
       2390-PACK-CTRY-AND-CURR-X.
           EXIT.
      *
      *---------------
       2395-MOVE-CURR.
      *---------------
      *
           IF  MIR-ASCL-CRCY-1-1-CD-T (WS-CTRY-IDX1)
           NOT = SPACE
               ADD  1 TO WS-CURR-IDX2
               MOVE MIR-ASCL-CRCY-1-1-CD-T (WS-CTRY-IDX1)
                                      TO
                    RASCL-ASCL-CRCY-CD (WS-CTRY-IDX2, WS-CURR-IDX2)
557660     END-IF.

           IF  MIR-ASCL-CRCY-2-1-CD-T (WS-CTRY-IDX1)
           NOT = SPACE
               ADD  1 TO WS-CURR-IDX2
               MOVE MIR-ASCL-CRCY-2-1-CD-T (WS-CTRY-IDX1)
                                      TO
                    RASCL-ASCL-CRCY-CD (WS-CTRY-IDX2, WS-CURR-IDX2)
557660     END-IF.

           IF  MIR-ASCL-CRCY-3-1-CD-T (WS-CTRY-IDX1)
           NOT = SPACE
               ADD  1 TO WS-CURR-IDX2
               MOVE MIR-ASCL-CRCY-3-1-CD-T (WS-CTRY-IDX1)
                                      TO
                    RASCL-ASCL-CRCY-CD (WS-CTRY-IDX2, WS-CURR-IDX2)
557660     END-IF.

           IF  MIR-ASCL-CRCY-4-1-CD-T (WS-CTRY-IDX1)
           NOT = SPACE
               ADD  1 TO WS-CURR-IDX2
               MOVE MIR-ASCL-CRCY-1-1-CD-T (WS-CTRY-IDX1)
                                      TO
                    RASCL-ASCL-CRCY-CD (WS-CTRY-IDX2, WS-CURR-IDX2)
557660     END-IF.

           IF  MIR-ASCL-CRCY-5-1-CD-T (WS-CTRY-IDX1)
           NOT = SPACE
               ADD  1 TO WS-CURR-IDX2
               MOVE MIR-ASCL-CRCY-5-1-CD-T (WS-CTRY-IDX1)
                                      TO
                    RASCL-ASCL-CRCY-CD (WS-CTRY-IDX2, WS-CURR-IDX2)
557660     END-IF.

       2395-MOVE-CURR-X.
           EXIT.
      /
      *--------------------
       2400-PROCESS-DELETE.
      *--------------------
      *

           MOVE MIR-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-CO-ID.
012624*    MOVE MIR-APPL-ID           TO WASCL-APPL-ID.
           PERFORM  ASCL-1000-READ-FOR-UPDATE
               THRU ASCL-1000-READ-FOR-UPDATE-X.

           IF WASCL-IO-OK
              PERFORM 2440-UPDATE-APPL-COUNT
                 THRU 2440-UPDATE-APPL-COUNT-X
              IF WAPPL-IO-OK
                 PERFORM ASCL-1000-DELETE
                    THRU ASCL-1000-DELETE-X
                 MOVE 'XS00000011'    TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X
557660        END-IF
557660*       ELSE
557660*          NEXT SENTENCE
           ELSE
              MOVE WASCL-KEY          TO WGLOB-MSG-PARM (1)
              MOVE 'XS00000010'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.
      *
           PERFORM 9100-BLANK-DATA-FIELDS
              THRU 9100-BLANK-DATA-FIELDS-X.
      *
       2400-PROCESS-DELETE-X.
           EXIT.
      /
      *-----------------------
       2440-UPDATE-APPL-COUNT.
      *-----------------------
      *
012624*    MOVE RASCL-APPL-ID         TO  WAPPL-APPL-ID.
           MOVE RASCL-CO-ID           TO  WAPPL-CO-ID.
           PERFORM APPL-1000-READ-FOR-UPDATE
              THRU APPL-1000-READ-FOR-UPDATE-X.
      *
           IF WAPPL-IO-OK
              ADD -1               TO RAPPL-APPL-ASCL-REL-CTR
              PERFORM APPL-2000-REWRITE
                 THRU APPL-2000-REWRITE-X
           ELSE
              MOVE WAPPL-KEY          TO WGLOB-MSG-PARM (1)
              MOVE 'XS01800009'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.
      *
       2440-UPDATE-APPL-COUNT-X.
           EXIT.
      /
      *------------------
       2500-PROCESS-LIST.
      *------------------
      *
           MOVE SPACES                TO MIR-SECUR-CLAS-ID-G.
008445*    MOVE SPACES                TO MIR-APPL-ID2-G.
008445*    MOVE SPACES                TO MIR-CO-ID2-G.
012624*    MOVE SPACES                TO MIR-APPL-ID-G.
008445     MOVE SPACES                TO MIR-CO-ID-G.
           MOVE SPACES                TO MIR-ASCL-CTRY-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-1-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-2-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-3-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-4-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-5-CD-G.
      *
           MOVE LOW-VALUES            TO WASCL-KEY.
           MOVE HIGH-VALUES           TO WASCL-ENDBR-KEY.
           MOVE MIR-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-CO-ID.
012624*    MOVE MIR-APPL-ID           TO WASCL-APPL-ID.
      *
           PERFORM ASCL-1000-BROWSE
              THRU ASCL-1000-BROWSE-X.
      *
           IF WASCL-IO-EOF
53-064        MOVE 'XS00000034'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2500-PROCESS-LIST-X
557660     END-IF.
      *
           PERFORM  ASCL-2000-READ-NEXT
               THRU ASCL-2000-READ-NEXT-X.

           IF WASCL-IO-EOF
              MOVE 'XS00000025'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2500-PROCESS-LIST-X
557660     END-IF.
      *
           MOVE +1                    TO WS-SUB.
           PERFORM 2510-PROCESS-BROWSE-READ
              THRU 2510-PROCESS-BROWSE-READ-X
              UNTIL WS-SUB > WS-MAX-BROWSE-LINES
              OR    WASCL-IO-EOF.
      *
           IF WASCL-IO-EOF
              MOVE 'XS00000025'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
53-064        SET WGLOB-MORE-DATA-EXISTS  TO TRUE
              MOVE 'XS00000014'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

           PERFORM  ASCL-3000-END-BROWSE
               THRU ASCL-3000-END-BROWSE-X.
      *
       2500-PROCESS-LIST-X.
           EXIT.
      /
      *-------------------------
       2510-PROCESS-BROWSE-READ.
      *-------------------------
      *
           PERFORM 2520-DISPLAY-LINE
              THRU 2520-DISPLAY-LINE-X
              VARYING WS-SUB1 FROM +1 BY +1
              UNTIL   WS-SUB1 > +5
              OR      WS-SUB > WS-MAX-BROWSE-LINES.

           IF WS-SUB > WS-MAX-BROWSE-LINES
              MOVE MIR-SECUR-CLAS-ID-T (WS-MAX-BROWSE-LINES)
                                      TO MIR-SECUR-CLAS-ID
008445*       MOVE MIR-APPL-ID2-T (WS-MAX-BROWSE-LINES) TO MIR-APPL-ID
008445*       MOVE MIR-CO-ID2-T (WS-MAX-BROWSE-LINES) TO MIR-CO-ID
012624*       MOVE MIR-APPL-ID-T (WS-MAX-BROWSE-LINES)
012624*                               TO MIR-APPL-ID
008445        MOVE MIR-CO-ID-T (WS-MAX-BROWSE-LINES)
                                      TO MIR-CO-ID
           ELSE
              PERFORM ASCL-2000-READ-NEXT
                 THRU ASCL-2000-READ-NEXT-X
557660     END-IF.
      *
       2510-PROCESS-BROWSE-READ-X.
           EXIT.
      *
      *------------------
       2520-DISPLAY-LINE.
      *------------------
      *
           IF  RASCL-ASCL-CTRY-CD (WS-SUB1) > SPACE 
           OR  WS-SUB1 = +1

               MOVE RASCL-SECUR-CLAS-ID TO MIR-SECUR-CLAS-ID-T (WS-SUB)
008445*        MOVE RASCL-CO-ID         TO MIR-CO-ID2-T (WS-SUB)
008445*        MOVE RASCL-APPL-ID       TO MIR-APPL-ID2-T (WS-SUB)
008445         MOVE RASCL-CO-ID         TO MIR-CO-ID-T (WS-SUB)
012614*        MOVE RASCL-APPL-ID       TO MIR-APPL-ID-T (WS-SUB)

               MOVE RASCL-ASCL-CTRY-CD (WS-SUB1)
                                      TO
                   MIR-ASCL-CTRY-1-CD-T (WS-SUB)

               MOVE RASCL-ASCL-CRCY-CD     (WS-SUB1 1)
                                      TO
                   MIR-ASCL-CRCY-1-1-CD-T (WS-SUB)

               MOVE RASCL-ASCL-CRCY-CD     (WS-SUB1 2)
                                      TO
                   MIR-ASCL-CRCY-2-1-CD-T (WS-SUB)

               MOVE RASCL-ASCL-CRCY-CD     (WS-SUB1 3)
                                      TO
                   MIR-ASCL-CRCY-3-1-CD-T (WS-SUB)

               MOVE RASCL-ASCL-CRCY-CD     (WS-SUB1 4)
                                      TO
                   MIR-ASCL-CRCY-4-1-CD-T (WS-SUB)

               MOVE RASCL-ASCL-CRCY-CD     (WS-SUB1 5)
                                      TO
                   MIR-ASCL-CRCY-5-1-CD-T (WS-SUB)

              ADD +1                   TO WS-SUB

557660     END-IF.
      *
       2520-DISPLAY-LINE-X.
           EXIT.
      /
      *------------------
       2600-PROCESS-KLON.
      *------------------
      *
      *---- VALIDATION
      *
           PERFORM 2611-KLON-EDITS
               THRU 2611-KLON-EDITS-X.

           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 2600-PROCESS-KLON-X
557660     END-IF.

           PERFORM  2621-KLON-2ND-EDITS
               THRU 2621-KLON-2ND-EDITS-X.

           IF  WGLOB-MSG-ERROR-SW > ZEROS
               MOVE 'XS01800010'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2600-PROCESS-KLON-X
557660     END-IF.
      *
      *---- BROWSE ASCL WITH SOURCE - SECURITY AND COMPANY FIELD
      *
           MOVE LOW-VALUES            TO WASCL-KEY.
53-068     MOVE MIR-SECUR-CLAS-ID
                                      TO WASCL-SECUR-CLAS-ID.
53-068     MOVE MIR-CO-ID             TO WASCL-CO-ID.
           MOVE HIGH-VALUES           TO WASCL-ENDBR-KEY.
53-068     MOVE MIR-SECUR-CLAS-ID
                                      TO WASCL-ENDBR-SECUR-CLAS-ID.
53-068     MOVE MIR-CO-ID             TO WASCL-ENDBR-CO-ID.
      *
           PERFORM ASCL-1000-BROWSE
              THRU ASCL-1000-BROWSE-X.
      *
           IF WASCL-IO-EOF
53-064        MOVE 'XS00000034'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2600-PROCESS-KLON-X
           ELSE
              PERFORM  ASCL-2000-READ-NEXT
                  THRU ASCL-2000-READ-NEXT-X
              IF WASCL-IO-EOF
                 PERFORM ASCL-3000-END-BROWSE
                     THRU ASCL-3000-END-BROWSE-X
                 MOVE 'XS00000025'    TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X
                 GO TO 2600-PROCESS-KLON-X
557660        END-IF
557660     END-IF.
      *
      *---- KLON UNTIL ASCL END-OF-FILE OR OUTSIDE KLON RANGE
      *
           MOVE +0                    TO WS-COUNT-KLON-RECS.
           PERFORM  2622-KLON-ONE-REC
               THRU 2622-KLON-ONE-REC-X
                    UNTIL WASCL-IO-EOF.
      *
           PERFORM  ASCL-3000-END-BROWSE
               THRU ASCL-3000-END-BROWSE-X.
      *
           MOVE WS-COUNT-KLON-RECS    TO WGLOB-MSG-PARM (1).
           MOVE 'XS01800012'          TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.
      *
013578*    MOVE 'I' TO MIR-ENTER.
013578*    PERFORM 9400-SET-ATTRIBUTES-1
013578*       THRU 9400-SET-ATTRIBUTES-1-X.

           PERFORM 9100-BLANK-DATA-FIELDS
              THRU 9100-BLANK-DATA-FIELDS-X.

       2600-PROCESS-KLON-X.
           EXIT.
      /
      *
      *----------------
       2611-KLON-EDITS.
      *----------------
      *
      *---- CHECK KLON SOURCE EXIST OR NOT
      *
           MOVE LOW-VALUES            TO WASCL-KEY.
           MOVE MIR-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-CO-ID.
           MOVE HIGH-VALUES           TO WASCL-ENDBR-KEY.
           MOVE MIR-SECUR-CLAS-ID     TO WASCL-ENDBR-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-ENDBR-CO-ID.
      *
           PERFORM ASCL-1000-BROWSE
              THRU ASCL-1000-BROWSE-X.
      *
           IF WASCL-IO-EOF
              MOVE 'XS01800011'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2611-KLON-EDITS-X
           ELSE
              PERFORM  ASCL-2000-READ-NEXT
                  THRU ASCL-2000-READ-NEXT-X
              IF WASCL-IO-EOF
                 PERFORM ASCL-3000-END-BROWSE
                    THRU ASCL-3000-END-BROWSE-X
                 MOVE 'XS01800011'    TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X
                 GO TO 2611-KLON-EDITS-X
              ELSE
                 PERFORM ASCL-3000-END-BROWSE
                    THRU ASCL-3000-END-BROWSE-X
557660        END-IF
557660     END-IF.
      *
       2611-KLON-EDITS-X.
           EXIT.
      *
      /
      *--------------------
       2621-KLON-2ND-EDITS.
      *--------------------
      *
      *---- CHECK KLON SOURCE MUST NOT EXIST IN ASCL
      *
           MOVE LOW-VALUES            TO WASCL-KEY.
           MOVE MIR-SECUR-CLAS-ID-2   TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID-2           TO WASCL-CO-ID.
           MOVE HIGH-VALUES           TO WASCL-ENDBR-KEY.
           MOVE MIR-SECUR-CLAS-ID-2   TO WASCL-ENDBR-SECUR-CLAS-ID.
           MOVE MIR-CO-ID-2           TO WASCL-ENDBR-CO-ID.
      *
           PERFORM ASCL-1000-BROWSE
              THRU ASCL-1000-BROWSE-X.
      *
           IF  WASCL-IO-EOF
               NEXT SENTENCE
           ELSE
               PERFORM ASCL-2000-READ-NEXT
                   THRU ASCL-2000-READ-NEXT-X
               IF  WASCL-IO-EOF
                   PERFORM ASCL-3000-END-BROWSE
                      THRU ASCL-3000-END-BROWSE-X
               ELSE
                   PERFORM ASCL-3000-END-BROWSE
                      THRU ASCL-3000-END-BROWSE-X
                   MOVE 'XS01800013'  TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                   GO TO 2621-KLON-2ND-EDITS-X
557660         END-IF
557660     END-IF.
      *
      *==== VALIDATE SECURITY AND COMPANY, REUSE 2210-CREATE-EDITS LOGIC
      *
           MOVE MIR-SECUR-CLAS-ID-2     TO WUSCL-SECUR-CLAS-ID.
           PERFORM USCL-1000-READ
              THRU USCL-1000-READ-X.
      *
           IF WUSCL-IO-OK
              NEXT SENTENCE
           ELSE
013578*       MOVE 'P'                 TO LTPI-CURSOR-POS-IND
013578*       MOVE -1                  TO MIR-SECUR-CLAS-ID-L
013578*       MOVE TATRB-KEYS-ERROR    TO MIR-SECUR-CLAS-ID-A
              MOVE 'XS01800001'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2621-KLON-2ND-EDITS-X
557660     END-IF.
      *
           MOVE MIR-CO-ID-2            TO WXTAB-ETBL-VALU-ID.
           PERFORM COMP-1000-EDIT-COMPANY
              THRU COMP-1000-EDIT-COMPANY-X.
      *
           IF NOT WXTAB-IO-OK
013578*       MOVE 'P'                 TO LTPI-CURSOR-POS-IND
013578*       MOVE -1                  TO MIR-CO-ID-L
013578*       MOVE TATRB-KEYS-ERROR    TO MIR-CO-ID-A
              MOVE 'XS01800002'       TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2621-KLON-2ND-EDITS-X
557660     END-IF.
      *
       2621-KLON-2ND-EDITS-X.
           EXIT.
      *
      /
      *------------------
       2622-KLON-ONE-REC.
      *------------------
      *
      *---- END BROWSE BEFORE WRITE REC
      *
            MOVE RASCL-KEY            TO WS-HOLD-LAST-ASCL-KEY.
            PERFORM ASCL-3000-END-BROWSE
                THRU ASCL-3000-END-BROWSE-X.
      *
      *---- CREATE ASCL WITH NEW KLONED SECURITY AND COMPANY
      *----        USING SAME ROUTINE IN CREATION LOGIC
012624*     MOVE RASCL-APPL-ID        TO MIR-APPL-ID.

            MOVE MIR-SECUR-CLAS-ID-2  TO WASCL-SECUR-CLAS-ID.
            MOVE MIR-SECUR-CLAS-ID-2  TO RASCL-SECUR-CLAS-ID.
            MOVE MIR-CO-ID-2          TO WASCL-CO-ID.
            MOVE MIR-CO-ID-2          TO RASCL-CO-ID.

012624*     MOVE ZERO                 TO RASCL-ASCL-TSCL-REL-CTR.

            PERFORM 2230-WRITE-UPDATE-RELA
               THRU 2230-WRITE-UPDATE-RELA-X.

012624*     MOVE SPACES               TO MIR-APPL-ID.
      *
            IF WAPPL-IO-OK
                ADD +1 TO WS-COUNT-KLON-RECS
557660      END-IF.

      *
      *---- START BROWSE ASCL WITH WS-HOLD-LAST-ASCL-KEY,
      *---- READ NEXT TWICE
      *

            MOVE WS-HOLD-LAST-ASCL-KEY    TO WASCL-KEY.
            MOVE HIGH-VALUES          TO WASCL-ENDBR-KEY.
53-068      MOVE MIR-SECUR-CLAS-ID
                                      TO WASCL-ENDBR-SECUR-CLAS-ID.
53-068      MOVE MIR-CO-ID            TO WASCL-ENDBR-CO-ID.

            PERFORM ASCL-1000-BROWSE
               THRU ASCL-1000-BROWSE-X.
            PERFORM ASCL-2000-READ-NEXT
               THRU ASCL-2000-READ-NEXT-X.
            PERFORM ASCL-2000-READ-NEXT
               THRU ASCL-2000-READ-NEXT-X.
      *
       2622-KLON-ONE-REC-X.
           EXIT.
      *
      /
013578*--------------------------
013578*2630-PROCESS-KLON-BACKOUT.
013578*--------------------------
013578*
013578*    MOVE 'XS01800014' TO WGLOB-MSG-REF-INFO.
013578*    PERFORM 0260-1000-GENERATE-MESSAGE
013578*       THRU 0260-1000-GENERATE-MESSAGE-X.
013578*    PERFORM 9400-SET-ATTRIBUTES-1
013578*       THRU 9400-SET-ATTRIBUTES-1-X.
013578*    PERFORM 9100-BLANK-DATA-FIELDS
013578*       THRU 9100-BLANK-DATA-FIELDS-X.
013578*
013578*2630-PROCESS-KLON-BACKOUT-X.
013578*    EXIT.
013578*
      *-----------------------
       9100-BLANK-DATA-FIELDS.
      *-----------------------
      *
53-068*    MOVE SPACES                TO C0180-SECURITY-CLASS-ID.
53-068*    MOVE SPACES                TO C0180-COMPANY-ID.
012624*    MOVE SPACES                TO MIR-ASCL-TSCL-REL-CTR.
           MOVE SPACES                TO MIR-ASCL-CTRY-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-1-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-2-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-3-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-4-CD-G.
           MOVE SPACES                TO MIR-ASCL-CRCY-5-CD-G.
      *
       9100-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------
      *
           MOVE RASCL-SECUR-CLAS-ID   TO MIR-SECUR-CLAS-ID.
012624*    MOVE RASCL-APPL-ID         TO MIR-APPL-ID.
           MOVE RASCL-CO-ID           TO MIR-CO-ID.
012624*    MOVE RASCL-ASCL-TSCL-REL-CTR
012624*                               TO WS-DISPLAY-NUM.
012624*    MOVE WS-DISPLAY-NUM        TO MIR-ASCL-TSCL-REL-CTR.
           PERFORM 9220-MOVE-CTRY-AND-CURR
              THRU 9220-MOVE-CTRY-AND-CURR-X
              VARYING WS-SUB1 FROM +1 BY +1
INCSIZ        UNTIL   WS-SUB1 > WS-MAX-ROWS.
      *
       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.
      *
      *------------------------
       9220-MOVE-CTRY-AND-CURR.
      *------------------------
      *
           MOVE RASCL-ASCL-CTRY-CD (WS-SUB1)
                                   TO MIR-ASCL-CTRY-1-CD-T (WS-SUB1).
           PERFORM 9222-MOVE-CURR
              THRU 9222-MOVE-CURR-X.

       9220-MOVE-CTRY-AND-CURR-X.
           EXIT.
      *
      *---------------
       9222-MOVE-CURR.
      *---------------
      *
           MOVE RASCL-ASCL-CRCY-CD (WS-SUB1 1)
                                      TO
                MIR-ASCL-CRCY-1-1-CD-T (WS-SUB1).

           MOVE RASCL-ASCL-CRCY-CD (WS-SUB1 2)
                                      TO
                MIR-ASCL-CRCY-2-1-CD-T (WS-SUB1).

           MOVE RASCL-ASCL-CRCY-CD (WS-SUB1 3)
                                      TO
                MIR-ASCL-CRCY-3-1-CD-T (WS-SUB1).

           MOVE RASCL-ASCL-CRCY-CD (WS-SUB1 4)
                                      TO
                MIR-ASCL-CRCY-4-1-CD-T (WS-SUB1).

           MOVE RASCL-ASCL-CRCY-CD  (WS-SUB1 5)
                                      TO
                MIR-ASCL-CRCY-5-1-CD-T (WS-SUB1).

      *
       9222-MOVE-CURR-X.
           EXIT.
      *
      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------
      *
           MOVE SPACES                TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE    TO WGLOB-REF-COMPANY-CODE.
      *
       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.
      /
       COPY XCPPINIT.
      *
       COPY XCPPEXIT.
      /
       COPY XCPECOMP.
      /
       COPY XCCL0260.
      /
557708*COPY XCCPHNDL.
557708 COPY XCCPABND.
       COPY XCCP0030.
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPBASCL.
      /
       COPY XCPNASCL.
      /
       COPY XCPUASCL.
      /
       COPY XCPAASCL.
      /
       COPY XCPCASCL.
      /
       COPY XCPXASCL.
      /
       COPY XCPNAPPL.
      /
       COPY XCPUAPPL.
      /
       COPY XCPNUSCL.
      /
       COPY XCPNXTAB.
      *
      *****************************************************************
      *  END OF PROGRAM XSOM0180
      *****************************************************************
