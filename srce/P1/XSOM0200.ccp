      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0200.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0200                                         **
      **  REMARKS: THIS MODULE ALLOWS THE USER TO 'CREATE','MAINTAIN'**
      **           OR 'DELETE' ENTRIES ON EDIT TABLES WITHIN THE     **
      **           XTAB TABLE.  BEFORE DETAIL ENTRIES MAY BE ADDED,  **
      **           THE TYPE OF TABLE MUST BE ADDED TO THE XTAB TABLE **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ARCHITECTURE CHANGES TO SUPPORT GRAPHICAL  **
53-062**                  USER INTERFACE                             **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
53-064**  30NOV95  TJS    SET MORE DATA INDICATOR FOR GUI            **
54-001**  01SEP96  KRH    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  CG     CHANGE TO STANDARD                         **
557708**  30SEP97  GV     MODIFICATIONS FOR CICS ABENDS HANDLING     **
008445**  31MAR98  552    GENERATE MIR FROM TECH ARCH DATABASE       **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
006002**  15DEC99  60     USE ALT.INDEX FOR LANGUAGE BROWSE          **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
012624**  15DEC99  60     ADD SELECTED MIXED CASE SUPPORT FOR TABLES **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
016089**  30JUN00  602J   CODE CLEANUP - LIST ALL LANGUAGES          **
R10440** 10APR15    CTS   VM MIGRATION PLAN - REGARDING DUMMY        ** 
      **                  DEPLOYMENT FOR INGENIUM PRODUCTION         **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
      ***************
       DATA DIVISION.
      ***************
      *
       WORKING-STORAGE SECTION.
      *
53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0200'.

       COPY SQLCA.
007766 COPY XCWLPTR.


012624 COPY XCWL0005.
014590*COPY XCWL0030.


       01  WS-WORKING-STORAGE.
           05  WS-SUB                       PIC S9(4)  VALUE ZERO COMP.
006002*    05  WS-MAX-BROWSE-LINES          PIC S9(4)  VALUE +10  COMP.
006002     05  WS-MAX-BROWSE-LINES          PIC S9(4)  VALUE +250 COMP.
           05  WS-BUS-FCN-ID                PIC X(04).
               88  WS-BUS-FCN-ID-VALID                 VALUES ARE
                   '2000', '2001', '2002', '2003', '2004'.
               88  WS-BUS-FCN-RETRIEVE              VALUE '2000'.
               88  WS-BUS-FCN-CREATE                VALUE '2001'.
               88  WS-BUS-FCN-UPDATE                VALUE '2002'.
               88  WS-BUS-FCN-DELETE                VALUE '2003'.
               88  WS-BUS-FCN-LIST                  VALUE '2004'.
012624     05  WS-SPCL-FOR-VALU-ID                  PIC X(15).
012624         88  WS-SPCL-MIXED-CASE-VALU-ID       VALUE 'BPFID'.

      /
      *****************************************************************
      *  COMMON COPYBOOKS
      *****************************************************************
       COPY XCWWWKDT.
       COPY XCWEBLCH.
      /
      *****************************************************************
      *  I/O COPYBOOKS
      *****************************************************************
       COPY XCFRXTAB.
       COPY XCFWXTAB.
006002 COPY XCFWXTAD.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION
      *****************************************************************
      /
      *****************************************************************
      *  INPUT PARAMETER INFORMATION
      *****************************************************************
      /
007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.
      /
      *****************
       LINKAGE SECTION.
      *****************

007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY XCWM0200.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

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

           SET  MIR-RETRN-OK          TO TRUE.
           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.

           IF  WGLOB-MSG-ERROR-SW > ZERO
               SET MIR-RETRN-RQST-FAILED  TO TRUE
               GO TO 2000-PROCESS-REQUEST-X
557660     END-IF.

           IF  MIR-ETBL-LANG-CD = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES      TO MIR-ETBL-LANG-CD
           END-IF.

           IF  MIR-ETBL-TYP-ID  = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES      TO MIR-ETBL-TYP-ID
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
                    MOVE MIR-BUS-FCN-ID  TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0200'      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'    TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.
      /
      *----------------------
       2100-PROCESS-RETRIEVE.
      *----------------------

012624     PERFORM  2700-CONVERT-XTAB-KEY
012624         THRU 2700-CONVERT-XTAB-KEY-X.
           MOVE MIR-ETBL-TYP-ID       TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-ETBL-VALU-ID      TO WXTAB-ETBL-VALU-ID.
           MOVE MIR-ETBL-LANG-CD      TO WXTAB-ETBL-LANG-CD.
           PERFORM  XTAB-1000-READ
               THRU XTAB-1000-READ-X.

           IF WXTAB-IO-OK
              PERFORM  9200-MOVE-RECORD-TO-SCREEN
                  THRU 9200-MOVE-RECORD-TO-SCREEN-X

           ELSE
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X

               MOVE WXTAB-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

       2100-PROCESS-RETRIEVE-X.
           EXIT.
      /
      *--------------------
       2200-PROCESS-CREATE.
      *--------------------

012624     PERFORM  2700-CONVERT-XTAB-KEY
012624         THRU 2700-CONVERT-XTAB-KEY-X.
           MOVE MIR-ETBL-TYP-ID       TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-ETBL-VALU-ID      TO WXTAB-ETBL-VALU-ID.
           MOVE MIR-ETBL-LANG-CD      TO WXTAB-ETBL-LANG-CD.
           PERFORM  XTAB-1000-READ
               THRU XTAB-1000-READ-X.

           IF WXTAB-IO-OK
              MOVE WXTAB-KEY          TO WGLOB-MSG-PARM (1)
              MOVE 'XS00000003'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

              GO TO 2200-PROCESS-CREATE-X
557660     END-IF.

           PERFORM  2210-CREATE-EDITS
               THRU 2210-CREATE-EDITS-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
              GO TO 2200-PROCESS-CREATE-X
557660     END-IF.

           MOVE MIR-ETBL-TYP-ID       TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-ETBL-VALU-ID      TO WXTAB-ETBL-VALU-ID.
           MOVE MIR-ETBL-LANG-CD      TO WXTAB-ETBL-LANG-CD.
           PERFORM  XTAB-1000-CREATE
               THRU XTAB-1000-CREATE-X.

           PERFORM  XTAB-1000-WRITE
               THRU XTAB-1000-WRITE-X.

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       2200-PROCESS-CREATE-X.
           EXIT.
      /
      *------------------
       2210-CREATE-EDITS.
      *------------------

      *
      *     VALIADATE TYPE
      *
           IF  WXTAB-ETBL-TYP-ID     = 'XTAB'
               NEXT SENTENCE
           ELSE
               MOVE 'XTAB'            TO WXTAB-ETBL-TYP-ID
               MOVE MIR-ETBL-TYP-ID   TO WXTAB-ETBL-VALU-ID
               MOVE WGLOB-EDIT-LANG   TO WXTAB-ETBL-LANG-CD
               PERFORM  XTAB-1000-READ
                   THRU XTAB-1000-READ-X

               IF  WXTAB-IO-OK
                   NEXT SENTENCE
               ELSE
                   MOVE 'XS02000001'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

                   GO TO 2210-CREATE-EDITS-X
557660         END-IF
557660     END-IF.

      *
      *     VALIADATE LANGUAGE
      *
           MOVE 'ELANG'               TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-ETBL-LANG-CD      TO WXTAB-ETBL-VALU-ID.
           MOVE WGLOB-EDIT-LANG       TO WXTAB-ETBL-LANG-CD.
           PERFORM  XTAB-1000-READ
               THRU XTAB-1000-READ-X.

           IF  WXTAB-IO-OK
               NEXT SENTENCE
           ELSE
               MOVE 'XS02000002'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               GO TO 2210-CREATE-EDITS-X
557660     END-IF.

       2210-CREATE-EDITS-X.
           EXIT.
      /
      *--------------------
       2300-PROCESS-UPDATE.
      *--------------------

012624     PERFORM  2700-CONVERT-XTAB-KEY
012624         THRU 2700-CONVERT-XTAB-KEY-X.
           MOVE MIR-ETBL-TYP-ID       TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-ETBL-VALU-ID      TO WXTAB-ETBL-VALU-ID.
           MOVE MIR-ETBL-LANG-CD      TO WXTAB-ETBL-LANG-CD.
           PERFORM  XTAB-1000-READ-FOR-UPDATE
               THRU XTAB-1000-READ-FOR-UPDATE-X.

           IF WXTAB-IO-NOT-FOUND
              PERFORM  9100-BLANK-DATA-FIELDS
                  THRU 9100-BLANK-DATA-FIELDS-X

              MOVE WXTAB-KEY          TO WGLOB-MSG-PARM (1)
              MOVE 'XS00000006'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

              GO TO 2300-PROCESS-UPDATE-X
557660     END-IF.

           PERFORM  2330-MAINTAIN-EDITS
               THRU 2330-MAINTAIN-EDITS-X.

           PERFORM  XTAB-2000-REWRITE
               THRU XTAB-2000-REWRITE-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
              MOVE 'XS00000008'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

           ELSE
              MOVE 'XS00000007'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

       2300-PROCESS-UPDATE-X.
           EXIT.
      /
      *--------------------
       2330-MAINTAIN-EDITS.
      *--------------------

           IF MIR-ETBL-DESC-TXT NOT = SPACE
53-062        MOVE MIR-ETBL-DESC-TXT  TO RXTAB-ETBL-DESC-TXT
53-062     ELSE
53-062        MOVE RXTAB-ETBL-DESC-TXT TO MIR-ETBL-DESC-TXT
53-062     END-IF.

       2330-MAINTAIN-EDITS-X.
           EXIT.
      /
      *--------------------
       2400-PROCESS-DELETE.
      *--------------------

012624     PERFORM  2700-CONVERT-XTAB-KEY
012624         THRU 2700-CONVERT-XTAB-KEY-X.
           MOVE MIR-ETBL-TYP-ID       TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-ETBL-VALU-ID      TO WXTAB-ETBL-VALU-ID.
           MOVE MIR-ETBL-LANG-CD      TO WXTAB-ETBL-LANG-CD.
           PERFORM  XTAB-1000-READ-FOR-UPDATE
               THRU XTAB-1000-READ-FOR-UPDATE-X.

           IF WXTAB-IO-OK
              PERFORM  XTAB-1000-DELETE
                  THRU XTAB-1000-DELETE-X

              MOVE 'XS00000011'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

           ELSE
              MOVE WXTAB-KEY          TO WGLOB-MSG-PARM (1)
              MOVE 'XS00000010'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

       2400-PROCESS-DELETE-X.
           EXIT.
      /
      *------------------
       2500-PROCESS-LIST.
      *------------------

012624     PERFORM  2700-CONVERT-XTAB-KEY
012624         THRU 2700-CONVERT-XTAB-KEY-X.

           IF MIR-ETBL-TYP-ID > SPACES
              NEXT SENTENCE
           ELSE
              MOVE 'XS02000003'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

              GO TO 2500-PROCESS-LIST-X
557660     END-IF.

006002
006002* BROWSE BY DESCRIPTION ONLY FOR THE RELEASE 60
006002
016089*6002IF  MIR-ETBL-LANG-CD     = SPACE
016089*6002    MOVE WGLOB-EDIT-LANG   TO MIR-ETBL-LANG-CD
016089*6002END-IF.
006002
006002     IF  MIR-ETBL-LANG-CD NOT = SPACE
006002         PERFORM  2600-PROCESS-LIST-AIX
006002             THRU 2600-PROCESS-LIST-AIX-X
006002         GO TO 2500-PROCESS-LIST-X
006002     END-IF.
006002
           MOVE LOW-VALUES            TO WXTAB-KEY.
           MOVE HIGH-VALUES           TO WXTAB-ENDBR-KEY.
           MOVE MIR-ETBL-TYP-ID       TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-ETBL-VALU-ID      TO WXTAB-ETBL-VALU-ID.
016089*    MOVE MIR-ETBL-LANG-CD      TO WXTAB-ETBL-LANG-CD.

           PERFORM  XTAB-1000-BROWSE
               THRU XTAB-1000-BROWSE-X.

           IF WXTAB-IO-EOF
53-064        MOVE 'XS00000034'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

              GO TO 2500-PROCESS-LIST-X
           ELSE
              PERFORM  XTAB-2000-READ-NEXT
                  THRU XTAB-2000-READ-NEXT-X

              IF WXTAB-IO-EOF
                 MOVE 'XS00000025'    TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X

                 GO TO 2500-PROCESS-LIST-X
557660        END-IF
557660     END-IF.

           PERFORM  2510-PROCESS-BROWSE-READ
557660         THRU 2510-PROCESS-BROWSE-READ-X VARYING WS-SUB FROM +1
                    BY +1 UNTIL WS-SUB > WS-MAX-BROWSE-LINES OR
                    WXTAB-IO-EOF.

           IF WXTAB-IO-EOF
              MOVE 'XS00000025'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

           ELSE
              MOVE 'XS00000014'       TO WGLOB-MSG-REF-INFO
53-064        SET WGLOB-MORE-DATA-EXISTS TO TRUE
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
557660     END-IF.

           PERFORM  XTAB-3000-END-BROWSE
               THRU XTAB-3000-END-BROWSE-X.

       2500-PROCESS-LIST-X.
           EXIT.
      /
      *-------------------------
       2510-PROCESS-BROWSE-READ.
      *-------------------------

008445*    MOVE RXTAB-ETBL-TYP-ID     TO MIR-ETBL-TYP-ID-T  (WS-SUB).
008445*    MOVE RXTAB-ETBL-VALU-ID    TO MIR-ETBL-VALU-ID-T (WS-SUB).
008445*    MOVE RXTAB-ETBL-LANG-CD    TO MIR-ETBL-LANG-CD-T  (WS-SUB).
008445     MOVE RXTAB-ETBL-TYP-ID     TO MIR-ETBL-TYP-ID-T   (WS-SUB).
008445     MOVE RXTAB-ETBL-VALU-ID    TO MIR-ETBL-VALU-ID-T  (WS-SUB).
008445     MOVE RXTAB-ETBL-LANG-CD    TO MIR-ETBL-LANG-CD-T  (WS-SUB).
           MOVE RXTAB-ETBL-DESC-TXT   TO MIR-ETBL-DESC-TXT-T (WS-SUB).

           PERFORM  XTAB-2000-READ-NEXT
               THRU XTAB-2000-READ-NEXT-X.

           IF WS-SUB = WS-MAX-BROWSE-LINES
              IF WXTAB-IO-OK
                 MOVE RXTAB-ETBL-TYP-ID
                                      TO MIR-ETBL-TYP-ID
                 MOVE RXTAB-ETBL-VALU-ID
                                      TO MIR-ETBL-VALU-ID
016089*          MOVE RXTAB-ETBL-LANG-CD
016089*                               TO MIR-ETBL-LANG-CD
016089           MOVE RXTAB-ETBL-DESC-TXT
016089                                TO MIR-ETBL-DESC-TXT
557660        END-IF
557660     END-IF.

       2510-PROCESS-BROWSE-READ-X.
           EXIT.
      /
006002*----------------------
006002 2600-PROCESS-LIST-AIX.
006002*----------------------
006002
006002     MOVE LOW-VALUES             TO WXTAD-KEY.
006002     MOVE MIR-ETBL-TYP-ID        TO WXTAD-ETBL-TYP-ID.
006002     MOVE MIR-ETBL-LANG-CD       TO WXTAD-ETBL-LANG-CD.
006002     MOVE MIR-ETBL-DESC-TXT      TO WXTAD-ETBL-DESC-TXT.
006002     MOVE MIR-ETBL-VALU-ID       TO WXTAD-ETBL-VALU-ID.
006002     MOVE WXTAD-KEY              TO WXTAD-ENDBR-KEY.
006002     MOVE HIGH-VALUES            TO WXTAD-ENDBR-ETBL-DESC-TXT.
006002     MOVE HIGH-VALUES            TO WXTAD-ENDBR-ETBL-VALU-ID.
006002
006002     MOVE SPACES                 TO MIR-ETBL-VALU-ID-G.
006002     MOVE SPACES                 TO MIR-ETBL-DESC-TXT-G.
006002
006002     PERFORM  XTAD-1000-BROWSE
006002         THRU XTAD-1000-BROWSE-X.
006002
006002     IF  NOT WXTAD-IO-OK
006002         PERFORM  XTAD-3000-END-BROWSE
006002             THRU XTAD-3000-END-BROWSE-X
006002         MOVE 'XS00000034'       TO WGLOB-MSG-REF-INFO
006002         PERFORM  0260-1000-GENERATE-MESSAGE
006002             THRU 0260-1000-GENERATE-MESSAGE-X
006002         GO TO 2600-PROCESS-LIST-AIX-X
006002     END-IF.
006002
006002     PERFORM  XTAD-2000-READ-NEXT
006002         THRU XTAD-2000-READ-NEXT-X.
006002
006002     PERFORM
006002         VARYING WS-SUB FROM 1 BY 1
006002         UNTIL WXTAD-IO-EOF
006002         OR    (WS-SUB > WS-MAX-BROWSE-LINES)
006002
006002         MOVE RXTAB-ETBL-TYP-ID   TO MIR-ETBL-TYP-ID-T   (WS-SUB)
006002         MOVE RXTAB-ETBL-VALU-ID  TO MIR-ETBL-VALU-ID-T  (WS-SUB)
006002         MOVE RXTAB-ETBL-LANG-CD  TO MIR-ETBL-LANG-CD-T  (WS-SUB)
006002         MOVE RXTAB-ETBL-DESC-TXT TO MIR-ETBL-DESC-TXT-T (WS-SUB)
006002
006002         PERFORM  XTAD-2000-READ-NEXT
006002             THRU XTAD-2000-READ-NEXT-X
006002
006002     END-PERFORM.
006002
006002     IF  NOT WXTAD-IO-EOF
006002         MOVE RXTAB-ETBL-VALU-ID TO MIR-ETBL-VALU-ID
006002         MOVE RXTAB-ETBL-LANG-CD TO MIR-ETBL-LANG-CD
006002         MOVE RXTAB-ETBL-TYP-ID  TO MIR-ETBL-TYP-ID
006002         MOVE RXTAB-ETBL-DESC-TXT TO MIR-ETBL-DESC-TXT
006002         MOVE 'XS00000014'       TO WGLOB-MSG-REF-INFO
006002         SET WGLOB-MORE-DATA-EXISTS TO TRUE
006002         PERFORM  0260-1000-GENERATE-MESSAGE
006002             THRU 0260-1000-GENERATE-MESSAGE-X
006002     ELSE
006002         MOVE 'XS00000025'       TO WGLOB-MSG-REF-INFO
006002         PERFORM  0260-1000-GENERATE-MESSAGE
006002             THRU 0260-1000-GENERATE-MESSAGE-X
006002     END-IF.
006002
006002     PERFORM  XTAD-3000-END-BROWSE
006002         THRU XTAD-3000-END-BROWSE-X.
006002
006002
006002 2600-PROCESS-LIST-AIX-X.
006002     EXIT.
006002/

012624*--------------------
012624 2700-CONVERT-XTAB-KEY.
012624*--------------------
012624
012624     MOVE MIR-ETBL-TYP-ID       TO L0005-INPUT-STRING.
012624     PERFORM  0005-1000-CONVERT-STRING
012624         THRU 0005-1000-CONVERT-STRING-X.
012624     MOVE L0005-OUTPUT-STRING   TO MIR-ETBL-TYP-ID.
012624
012624     MOVE MIR-ETBL-TYP-ID       TO WS-SPCL-FOR-VALU-ID.
012624
012624     IF WS-SPCL-MIXED-CASE-VALU-ID
012624         NEXT SENTENCE
012624     ELSE
012624         MOVE MIR-ETBL-VALU-ID      TO L0005-INPUT-STRING
012624         PERFORM  0005-1000-CONVERT-STRING
012624             THRU 0005-1000-CONVERT-STRING-X
012624         MOVE L0005-OUTPUT-STRING   TO MIR-ETBL-VALU-ID
012624     END-IF.
012624
012624     MOVE MIR-ETBL-LANG-CD      TO L0005-INPUT-STRING.
012624     PERFORM  0005-1000-CONVERT-STRING
012624         THRU 0005-1000-CONVERT-STRING-X.
012624     MOVE L0005-OUTPUT-STRING   TO MIR-ETBL-LANG-CD.
012624
012624 2700-CONVERT-XTAB-KEY-X.
012624     EXIT.

      *-----------------------
       9100-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACE                 TO MIR-ETBL-DESC-TXT.

       9100-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RXTAB-ETBL-TYP-ID     TO MIR-ETBL-TYP-ID.
           MOVE RXTAB-ETBL-VALU-ID    TO MIR-ETBL-VALU-ID.
           MOVE RXTAB-ETBL-LANG-CD    TO MIR-ETBL-LANG-CD.
           MOVE RXTAB-ETBL-DESC-TXT   TO MIR-ETBL-DESC-TXT.

       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.
      /
      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------

           MOVE SPACE                 TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE    TO WGLOB-REF-COMPANY-CODE.

       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.
      /
       COPY XCPPINIT.

       COPY XCPPEXIT.
      /
012624 COPY XCPL0005.
      /
       COPY XCCL0260.
      /
557708*COPY XCCPHNDL.
557708 COPY XCCPABND.
       COPY XCCP0030.
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPBXTAB.
      /
       COPY XCPNXTAB.
      /
       COPY XCPUXTAB.
      /
       COPY XCPAXTAB.
      /
       COPY XCPCXTAB.
      /
       COPY XCPXXTAB.
006002/
006002 COPY XCPBXTAD.

      *****************************************************************
      **               END OF PROGRAM XSOM0200                       **
      *****************************************************************
