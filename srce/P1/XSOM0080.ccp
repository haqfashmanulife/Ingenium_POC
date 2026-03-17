      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0080.


       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0080                                         **
      **  REMARKS:  PROCESS DRIVER FOR MSGM                          **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  23FEB89  SHV    CREATED FOR TPI/NBS PROCESSING.            **
53-061**  30NOV95  JJS    CODE CLEANUP                               **
53-062**  30NOV95  VK     ARCHITECTURE CHANGES TO SUPPORT GRAPHICAL  **
53-062**                  USER INTERFACE                             **
53-064**  30NOV95  TJS    SET MORE DATA INDICATOR FOR GUI            **
53-066**  30NOV95  JJS    OUTPUT FIELD REPLACED BY IND. FIELDS, ADD  **
53-066**                  BROWSE ENTER LOGIC, MSGUA & MSGPF FIELDS   **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  GLG    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  CG     CHANGE TO STANDARD                         **
557708**  30SEP97  MM     NEW CICS ABEND PROCESSING                  **
008445**  31MAR98  552    GENERATE MIR FROM TECH ARCH DATABASE       **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014660**  15DEC99  60     GLOBAL MESSAGING                           **
015648**  15DEC99  60     BLANK FIELD CHARACTER                      **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
B11089**  29AUG03  EAC    BYPASS TOKEN CHECK FOR DBLE-BYTE CHARS WITH**
B11089**                  VALUE EQUIVALENT TO @                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0080'.

       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.


       01  WS-PGM-WORK-AREA.
           05  WS-EDIT-CHECKS.
               10  WS-BUS-FCN-ID            PIC X(04).
                   88  WS-BUS-FCN-RETRIEVE  VALUE '0080'.
                   88  WS-BUS-FCN-CREATE    VALUE '0081'.
                   88  WS-BUS-FCN-UPDATE    VALUE '0082'.
                   88  WS-BUS-FCN-DELETE    VALUE '0083'.
53-066             88  WS-BUS-FCN-LIST      VALUE '0084'.
               10  WS-SEVERITY-CODE         PIC X(01).
014660*            88  VALID-SEVERITY       VALUE 'W' 'F' 'S' 'I'.
014660             88  VALID-SEVERITY       VALUE '1' '2' '3' '4' '5'.
               10  WS-MESSAGE-SOURCE.
                   15  WS-SOURCE-SYSTEM     PIC X(01).
                   15  WS-SOURCE-TYPE       PIC X(01).
                       88  VALID-SOURCE-TYPE    VALUE 'S' 'C'.
                   15  WS-SOURCE-NUMBER     PIC X(04).
               10  WS-AUDIT-IND             PIC X(01).
                   88  VALID-AUDIT-IND      VALUE 'Y' 'N'.
               10  WS-TOKENS                PIC X(01).
                   88  VALID-TOKENS         VALUE '1' '2' '3' '4'.
               10  WS-MESSAGE-SW            PIC X(01).
                   88  WS-VALID-MESSAGE     VALUE 'Y'.
                   88  WS-INVALID-MESSAGE   VALUE 'N'.
014660*        10  WS-MSIN-MSG-INQ-IND      PIC X(01).
014660*            88  VALID-INQ-IND        VALUE 'Y' 'N'.
53-066         10  WS-MSIN-MSG-GUI-IND      PIC X(01).
53-066             88  VALID-GUI-IND        VALUE 'Y' 'N'.
014660*        10  WS-MSIN-MSG-PRCES-FAIL-IND PIC X(01).
014660*            88  VALID-PRCES-FAIL-IND VALUE 'Y' 'N'.

           05  WS-SUB                       PIC S9(04) COMP.
           05  WS-MAX-LINES                 PIC S9(04) COMP
                                                       VALUE +11.
           05  WS-MORE-VALID-MSGS-SW        PIC X(01).
           05  WS-PARAMETERS-USED           PIC X(01).
           05  WS-MAX-MESSAGE-LENGTH        PIC S9(04) COMP
014660*                                                VALUE +68.
014660                                                 VALUE +120.
014660     05  WS-SAVE-SEVERITY             PIC X(01).
014660     05  WS-SAVE-AUDIT-IND            PIC X(01).
014660*    05  WS-SAVE-MSG-INQ-IND          PIC X(01).
014660     05  WS-SAVE-MSG-GUI-IND          PIC X(01).
014660*    05  WS-SAVE-MSG-PRCES-FAIL-IND   PIC X(01).
014660*    05  WS-SAVE-MESSAGE              PIC X(68).
014660     05  WS-SAVE-MESSAGE              PIC X(120).
014660*    05  WS-DESC-ARRAY                PIC X(68).
014660     05  WS-DESC-ARRAY                PIC X(120).
           05  WS-DESC-ARRAY-R              REDEFINES WS-DESC-ARRAY.
014660*        10  WS-SINGLE-CHAR           OCCURS 68 TIMES
014660         10  WS-SINGLE-CHAR           OCCURS 120 TIMES
                                            INDEXED BY CHAR-ARRAY
                                            PIC X(01).
      /
007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.

      /
       COPY XCWL0280.
      /
       COPY XCWEBLCH.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
       COPY XCFWMSGS.
       COPY XCFRMSGS.
      /
       COPY XCWWWKDT.

      /
      *****************
       LINKAGE SECTION.
      *****************

007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY XCWM0080.

      /
007766 PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
53-062                          MIR-PARM-AREA.

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
      /

      *---------------------
       2000-PROCESS-REQUEST.
      *---------------------
           SET  MIR-RETRN-OK       TO TRUE.
           MOVE MIR-BUS-FCN-ID     TO WS-BUS-FCN-ID.
      *
      *    PROCESS SCREEN FUNCTIONS
      *
           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  3000-PROCESS-RETRIEVE
                        THRU 3000-PROCESS-RETRIEVE-X

53-064         WHEN WS-BUS-FCN-LIST
53-064              PERFORM  3500-PROCESS-LIST
53-064                  THRU 3500-PROCESS-LIST-X

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
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.
      /

      *----------------------
53-066 3000-PROCESS-RETRIEVE.
      *----------------------
      ****************************************************************
      * READ MESSAGE FILE FOR SPECIFIC ERROR MESSAGE OR              *
      * GROUP LEVEL (MESSAGE NUMBER BLANK) AND DISPLAY               *
      ****************************************************************

53-066     PERFORM  9100-BLANK-DATA-FIELDS
53-066         THRU 9100-BLANK-DATA-FIELDS-X.

53-066     PERFORM  7100-BUILD-MSGE-KEY
53-066         THRU 7100-BUILD-MSGE-KEY-X.

53-066     PERFORM  MSGS-1000-READ
53-066         THRU MSGS-1000-READ-X.

53-066     IF WMSGS-IO-NOT-FOUND
53-066         MOVE WMSGS-KEY         TO WGLOB-MSG-PARM (1)
53-066         MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
53-066         PERFORM  0260-1000-GENERATE-MESSAGE
53-066             THRU 0260-1000-GENERATE-MESSAGE-X
53-066         GO TO 3000-PROCESS-RETRIEVE-X
54-001     END-IF.

53-066     PERFORM  9200-MOVE-RECORD-TO-SCREEN
53-066         THRU 9200-MOVE-RECORD-TO-SCREEN-X.
53-066     MOVE 'XS00000002'          TO WGLOB-MSG-REF-INFO.
53-066     PERFORM  0260-1000-GENERATE-MESSAGE
53-066         THRU 0260-1000-GENERATE-MESSAGE-X.

53-066 3000-PROCESS-RETRIEVE-X.
53-066     EXIT.
      /

      *------------------
53-066 3500-PROCESS-LIST.
      *------------------

53-066     PERFORM  9100-BLANK-DATA-FIELDS
53-066         THRU 9100-BLANK-DATA-FIELDS-X.

           IF  (MIR-MSG-REF-ID = SPACES)
54-001     AND (MIR-MSG-REF-NUM NOT = SPACES)
               MOVE 'XS00800009'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
53-066         GO TO 3500-PROCESS-LIST-X
54-001     END-IF.

           MOVE LOW-VALUES            TO WMSGS-KEY.
           MOVE HIGH-VALUES           TO WMSGS-ENDBR-KEY.

           MOVE MIR-MSG-REF-ID        TO WMSGS-MSG-REF-ID.
           MOVE MIR-MSG-REF-ID        TO WMSGS-ENDBR-MSG-REF-ID.
           MOVE MIR-MSG-REF-NUM       TO WMSGS-MSG-REF-NUM.

015648     IF MIR-MSG-LANG-CD = '*'
015648        MOVE SPACES TO MIR-MSG-LANG-CD
015648     END-IF.

           MOVE MIR-MSG-LANG-CD       TO WMSGS-MSG-LANG-CD.

           PERFORM  MSGS-1000-BROWSE
               THRU MSGS-1000-BROWSE-X.

           IF WMSGS-IO-EOF
               MOVE 'XS00000034'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
53-066         GO TO 3500-PROCESS-LIST-X
           ELSE
               PERFORM  MSGS-2000-READ-NEXT
                   THRU MSGS-2000-READ-NEXT-X

               IF WMSGS-IO-EOF
                   MOVE 'XS00000034'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
53-066             GO TO 3500-PROCESS-LIST-X
54-001         END-IF
54-001     END-IF.

           MOVE +1                    TO WS-SUB.
53-066     PERFORM  3600-MSGS-INQ-READ
53-066         THRU 3600-MSGS-INQ-READ-X
               UNTIL (WS-SUB  > WS-MAX-LINES)
               OR   WMSGS-IO-EOF.

           IF WMSGS-IO-EOF
53-066         MOVE 'XS00000015'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
53-061         IF MIR-MSG-LANG-CD NOT = SPACES
53-061             PERFORM  MSGS-2000-READ-NEXT
53-061                 THRU MSGS-2000-READ-NEXT-X
53-061                 UNTIL MIR-MSG-LANG-CD = RMSGS-MSG-LANG-CD
53-061                 OR WMSGS-IO-EOF
53-061         END-IF

53-061         IF WMSGS-IO-EOF
53-066             MOVE 'XS00000015'  TO WGLOB-MSG-REF-INFO
53-061         ELSE
53-061             MOVE RMSGS-MSG-REF-NUM
                                      TO MIR-MSG-REF-NUM
                   MOVE 'XS00000014'  TO WGLOB-MSG-REF-INFO
53-064             SET WGLOB-MORE-DATA-EXISTS TO TRUE
53-061         END-IF
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
54-001     END-IF.

           PERFORM  MSGS-3000-END-BROWSE
               THRU MSGS-3000-END-BROWSE-X.

53-066 3500-PROCESS-LIST-X.
           EXIT.
      /
      *-------------------
53-066 3600-MSGS-INQ-READ.
      *-------------------

           IF  (MIR-MSG-LANG-CD = SPACES)
           OR  (MIR-MSG-LANG-CD = RMSGS-MSG-LANG-CD)
53-066         MOVE RMSGS-MSG-REF-NUM TO MIR-MSG-REF-NUM-T (WS-SUB)
53-066         MOVE RMSGS-MSG-LANG-CD TO MIR-MSG-LANG-CD-T (WS-SUB)
53-066         MOVE RMSGS-MSG-SECUR-CLAS-CD
                                     TO MIR-MSG-SECUR-CLAS-CD-T (WS-SUB)
53-066         MOVE RMSGS-MSG-SEVRTY-CD
                                      TO MIR-MSG-SEVRTY-CD-T (WS-SUB)
53-066         MOVE RMSGS-MSG-AUD-IND TO MIR-MSG-AUD-IND-T (WS-SUB)
014660*        MOVE RMSGS-MSG-INQ-IND TO MIR-MSG-INQ-IND-T (WS-SUB)
53-066         MOVE RMSGS-MSG-GUI-IND TO MIR-MSG-GUI-IND-T (WS-SUB)
014660*        MOVE RMSGS-MSG-PRCES-FAIL-IND
014660*                             TO MIR-MSG-PRCES-FAIL-IND-T (WS-SUB)
53-066         MOVE RMSGS-MSG-TXT     TO MIR-MSG-TXT-T (WS-SUB)
               ADD  +1                        TO WS-SUB
54-001     END-IF.

           PERFORM  MSGS-2000-READ-NEXT
               THRU MSGS-2000-READ-NEXT-X.

53-066 3600-MSGS-INQ-READ-X.
           EXIT.
      /

      *--------------------
       4000-PROCESS-CREATE.
      *--------------------
      ****************************************************************
      * CREATE NEW MESSAGE RECORD.  THE RECORD IS CREATED WITH THE
      * KEY FIELDS ENTERED.  THE REMAINING DATA WILL BE UPDATED VIA
      * THE MAINTAIN SCREEN.
      ****************************************************************

53-066     PERFORM  9100-BLANK-DATA-FIELDS
53-066         THRU 9100-BLANK-DATA-FIELDS-X.

           PERFORM  7100-BUILD-MSGE-KEY
               THRU 7100-BUILD-MSGE-KEY-X.

           PERFORM  MSGS-1000-READ
               THRU MSGS-1000-READ-X.
           IF WMSGS-IO-OK
               MOVE WMSGS-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-PROCESS-CREATE-X
54-001     END-IF.

           PERFORM  4100-CREATE-EDITS
               THRU 4100-CREATE-EDITS-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
               GO TO 4000-PROCESS-CREATE-X
54-001     END-IF.

           PERFORM  7100-BUILD-MSGE-KEY
               THRU 7100-BUILD-MSGE-KEY-X.

           PERFORM  MSGS-1000-CREATE
               THRU MSGS-1000-CREATE-X.
           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           PERFORM  MSGS-1000-WRITE
               THRU MSGS-1000-WRITE-X.

           MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       4000-PROCESS-CREATE-X.
           EXIT.
      /

      *------------------
       4100-CREATE-EDITS.
      *------------------
      ****************************************************************
      * EDIT INPUT FIELDS.
      ****************************************************************

           MOVE MIR-MSG-REF-ID        TO WS-MESSAGE-SOURCE.
           IF VALID-SOURCE-TYPE
54-001         CONTINUE
           ELSE
               MOVE 'XS00800001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
54-001     END-IF.

      *
      * PERFORM NUMERIC EDIT ON THE MESSAGE NUMBER
      *
           MOVE 'N'                   TO L0280-SIGN-IND.
54-001     MOVE ZERO                  TO L0280-PRECISION.
           MOVE 4                     TO L0280-LENGTH.
           MOVE MIR-MSG-REF-NUM       TO L0280-INPUT-DATA.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
           IF NOT L0280-OK
               MOVE 'XS00800010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
54-001     END-IF.

           IF MIR-MSG-SECUR-CLAS-CD = SPACES
               MOVE WMSGS-KEY         TO WMSGS-ENDBR-KEY
               MOVE LOW-VALUES        TO WMSGS-MSG-SECUR-CLAS-CD
               MOVE HIGH-VALUES       TO WMSGS-ENDBR-MSG-SECUR-CLAS-CD

               PERFORM  MSGS-1000-BROWSE
                   THRU MSGS-1000-BROWSE-X

               IF WMSGS-IO-EOF
54-001             CONTINUE
               ELSE
                   PERFORM  MSGS-2000-READ-NEXT
                       THRU MSGS-2000-READ-NEXT-X
54-001             PERFORM  4150-END-BROWSE
54-001                 THRU 4150-END-BROWSE-X
54-001         END-IF

           ELSE
               MOVE SPACES            TO WMSGS-MSG-SECUR-CLAS-CD
               PERFORM  MSGS-1000-READ
                   THRU MSGS-1000-READ-X

               IF WMSGS-IO-OK
                   MOVE 'XS00800003'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           END-IF.

           MOVE MIR-MSG-LANG-CD       TO WXTAB-ETBL-VALU-ID.
           PERFORM  LANG-1000-EDIT-USER-LANGUAGE
               THRU LANG-1000-EDIT-USER-LANGUAGE-X.

           IF WXTAB-IO-OK
54-001         CONTINUE
           ELSE
               MOVE 'XS00800004'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
54-001     END-IF.

       4100-CREATE-EDITS-X.
           EXIT.
      /

54-001*----------------
54-001 4150-END-BROWSE.
54-001*----------------
54-001
54-001     IF WMSGS-IO-EOF
54-001         PERFORM  MSGS-3000-END-BROWSE
54-001             THRU MSGS-3000-END-BROWSE-X
54-001     ELSE
54-001         PERFORM  MSGS-3000-END-BROWSE
54-001             THRU MSGS-3000-END-BROWSE-X
54-001         IF WMSGS-MSG-SECUR-CLAS-CD = SPACES
54-001             CONTINUE
54-001         ELSE
54-001             MOVE 'XS00800002'  TO WGLOB-MSG-REF-INFO
54-001             PERFORM  0260-1000-GENERATE-MESSAGE
54-001                 THRU 0260-1000-GENERATE-MESSAGE-X
54-001         END-IF
54-001     END-IF.
54-001
54-001 4150-END-BROWSE-X.
54-001     EXIT.
      /

      *--------------------
       5000-PROCESS-UPDATE.
      *--------------------

           PERFORM  7100-BUILD-MSGE-KEY
               THRU 7100-BUILD-MSGE-KEY-X.

      *
      ***  A READ IS PERFORMED AT THIS POINT INSTEAD OF A
      ***  READ-FOR-UPDATE BECAUSE IF A MESSAGE IS GENERATED DURING
      ***  THE EDITS, A DEADLOCK WOULD OCCUR ON THE MESSAGE FILE.
      *
           PERFORM  MSGS-1000-READ
               THRU MSGS-1000-READ-X.

      *
014660***  THE RECORD DATA IS STORED BECAUSE ANY MESSAGES CREATED DURING
014660***  EDITS WOULD WIPE OUT THE RECORD VALUES.
014660*
014660     MOVE RMSGS-MSG-SEVRTY-CD   TO WS-SAVE-SEVERITY.
014660     MOVE RMSGS-MSG-AUD-IND     TO WS-SAVE-AUDIT-IND.
014660*    MOVE RMSGS-MSG-INQ-IND     TO WS-SAVE-MSG-INQ-IND.
014660     MOVE RMSGS-MSG-GUI-IND     TO WS-SAVE-MSG-GUI-IND.
014660*    MOVE RMSGS-MSG-PRCES-FAIL-IND
014660*                               TO WS-SAVE-MSG-PRCES-FAIL-IND.
014660     MOVE RMSGS-MSG-TXT         TO WS-SAVE-MESSAGE.

           IF WMSGS-IO-NOT-FOUND
53-061         MOVE WMSGS-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
53-066         PERFORM  9100-BLANK-DATA-FIELDS
53-066             THRU 9100-BLANK-DATA-FIELDS-X
               GO TO 5000-PROCESS-UPDATE-X
54-001     END-IF.

           PERFORM  5220-UPDATE-EDITS
               THRU 5220-UPDATE-EDITS-X.

      *
      ***  WE BUILD THE KEY AGAIN IN CASE ANOTHER MESSAGE WAS READ
      ***  DURING THE EDITS.
      *
           PERFORM  7100-BUILD-MSGE-KEY
               THRU 7100-BUILD-MSGE-KEY-X.

           PERFORM  MSGS-1000-READ-FOR-UPDATE
               THRU MSGS-1000-READ-FOR-UPDATE-X.

           IF WMSGS-IO-NOT-FOUND
53-061         MOVE WMSGS-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
53-066         PERFORM  9100-BLANK-DATA-FIELDS
53-066             THRU 9100-BLANK-DATA-FIELDS-X
               GO TO 5000-PROCESS-UPDATE-X
54-001     END-IF.

014660*
014660***  THE WS- FIELDS WILL CONTAIN THE CURRENT RECORD VALUE OR THE
014660***  MIR VALUE IF IT PASSED THE EDITS.
014660*
014660     MOVE WS-SAVE-SEVERITY      TO RMSGS-MSG-SEVRTY-CD.
014660     MOVE WS-SAVE-AUDIT-IND     TO RMSGS-MSG-AUD-IND.
014660*    MOVE WS-SAVE-MSG-INQ-IND   TO RMSGS-MSG-INQ-IND.
014660     MOVE WS-SAVE-MSG-GUI-IND   TO RMSGS-MSG-GUI-IND.
014660*    MOVE WS-SAVE-MSG-PRCES-FAIL-IND
014660*                               TO RMSGS-MSG-PRCES-FAIL-IND.
014660     MOVE WS-SAVE-MESSAGE       TO RMSGS-MSG-TXT.

           MOVE WS-PARAMETERS-USED    TO RMSGS-MSG-PARM-USE-IND.

           PERFORM  MSGS-2000-REWRITE
               THRU MSGS-2000-REWRITE-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
               MOVE 'XS00000008'      TO WGLOB-MSG-REF-INFO
           ELSE
               MOVE 'XS00000007'      TO WGLOB-MSG-REF-INFO
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
                   THRU 9200-MOVE-RECORD-TO-SCREEN-X
54-001     END-IF.

           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       5000-PROCESS-UPDATE-X.
           EXIT.
      /

      *-----------------
       5220-UPDATE-EDITS.
      *-----------------

      ****************************************************************
      * EDIT INPUT FIELDS.                                          *
      ****************************************************************

           PERFORM  5222-EDIT-SEVERITY
               THRU 5222-EDIT-SEVERITY-X.

           PERFORM  5224-EDIT-AUDIT-IND
               THRU 5224-EDIT-AUDIT-IND-X.

014660*    PERFORM  5225-EDIT-MSIN-INQ-IND
014660*        THRU 5225-EDIT-MSIN-INQ-IND-X.

53-066     PERFORM  5227-EDIT-GUI-DISPLAY-IND
53-066         THRU 5227-EDIT-GUI-DISPLAY-IND-X.

014660*    PERFORM  5228-EDIT-PROCESS-FAILURE
014660*        THRU 5228-EDIT-PROCESS-FAILURE-X.

           MOVE 'N'                   TO WS-PARAMETERS-USED.

           IF MIR-MSG-TXT = SPACES
014660         MOVE WS-SAVE-MESSAGE   TO MIR-MSG-TXT
014660         CONTINUE
           ELSE
               IF MIR-MSG-TXT = EBLCH-BLANK-FIELD-CHAR
                   MOVE SPACES        TO MIR-MSG-TXT
54-001         END-IF
54-001     END-IF.

           MOVE MIR-MSG-TXT           TO WS-DESC-ARRAY.
54-001     SET  WS-VALID-MESSAGE           TO TRUE.
           PERFORM  5226-CHECK-FOR-TOKENS
               THRU 5226-CHECK-FOR-TOKENS-X
               VARYING CHAR-ARRAY FROM 1 BY 1
54-001         UNTIL CHAR-ARRAY > WS-MAX-MESSAGE-LENGTH.

014660     IF WS-VALID-MESSAGE
014660         MOVE MIR-MSG-TXT       TO WS-SAVE-MESSAGE
014660     END-IF.

       5220-UPDATE-EDITS-X.
           EXIT.
      /

      *-------------------
       5222-EDIT-SEVERITY.
      *-------------------

      ****************************************************************
      * EDIT INPUT FIELDS - SEVERITY.                               *
      ****************************************************************

           IF MIR-MSG-SEVRTY-CD = SPACES
014660         IF WS-SAVE-SEVERITY = SPACE
014660             CONTINUE
014660         ELSE
014660             MOVE WS-SAVE-SEVERITY
014660                                TO MIR-MSG-SEVRTY-CD
014660             GO TO 5222-EDIT-SEVERITY-X
014660         END-IF
014660         CONTINUE
           ELSE
               IF MIR-MSG-SEVRTY-CD = EBLCH-BLANK-FIELD-CHAR
                   MOVE SPACES        TO MIR-MSG-SEVRTY-CD
54-001         END-IF
54-001     END-IF.

           MOVE MIR-MSG-SEVRTY-CD     TO WS-SEVERITY-CODE.

           IF VALID-SEVERITY
54-001         CONTINUE
           ELSE
               MOVE 'XS00800005'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 5222-EDIT-SEVERITY-X
54-001     END-IF.

      *
      ***  A SEVERITY CODE OF SYSTEM OR INFORMATIONAL CANNOT BE CHANGED.
      *
014660*    IF  (WS-SAVE-SEVERITY = 'S'
014660*    OR  WS-SAVE-SEVERITY  = 'I')
014660*    AND MIR-MSG-SEVRTY-CD NOT     =  WS-SAVE-SEVERITY
014660     IF  (WS-SAVE-SEVERITY = '1'
014660     OR   WS-SAVE-SEVERITY = '5')
014660     AND MIR-MSG-SEVRTY-CD NOT     =  WS-SAVE-SEVERITY
               MOVE 'XS00800006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
014660     ELSE
014660         MOVE MIR-MSG-SEVRTY-CD TO WS-SAVE-SEVERITY
54-001     END-IF.

       5222-EDIT-SEVERITY-X.
           EXIT.
      /

      *--------------------
       5224-EDIT-AUDIT-IND.
      *--------------------

      ****************************************************************
      * EDIT INPUT FIELDS - AUDIT INDICATOR.
      ****************************************************************

           IF MIR-MSG-AUD-IND = SPACES
014660         MOVE WS-SAVE-AUDIT-IND TO MIR-MSG-AUD-IND
014660         GO TO 5224-EDIT-AUDIT-IND-X
014660         CONTINUE
           ELSE
               IF MIR-MSG-AUD-IND = EBLCH-BLANK-FIELD-CHAR
                   MOVE SPACES        TO MIR-MSG-AUD-IND
54-001         END-IF
54-001     END-IF.

           MOVE MIR-MSG-AUD-IND       TO WS-AUDIT-IND.

           IF VALID-AUDIT-IND
014660         MOVE MIR-MSG-AUD-IND   TO WS-SAVE-AUDIT-IND
014660         CONTINUE
           ELSE
               MOVE 'XS00800007'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
54-001     END-IF.

       5224-EDIT-AUDIT-IND-X.
           EXIT.
      /

014660*-----------------------
014660*5225-EDIT-MSIN-INQ-IND.
014660*-----------------------
014660*
014660****************************************************************
014660* EDIT INPUT FIELDS - MSIN INQUIRY INDICATOR                   *
014660****************************************************************
014660*
014660*    IF MIR-MSG-INQ-IND = SPACES
014660*        MOVE WS-SAVE-MSG-INQ-IND
014660*                               TO MIR-MSG-INQ-IND
014660*        GO TO 5225-EDIT-MSIN-INQ-IND-X
014660*    ELSE
014660*        IF MIR-MSG-INQ-IND = EBLCH-BLANK-FIELD-CHAR
014660*            MOVE SPACES        TO MIR-MSG-INQ-IND
014660*        END-IF
014660*    END-IF.
014660*
014660*    MOVE MIR-MSG-INQ-IND       TO WS-MSIN-MSG-INQ-IND.
014660*
014660*    IF VALID-INQ-IND
014660*        MOVE MIR-MSG-INQ-IND   TO WS-SAVE-MSG-INQ-IND
014660*    ELSE
014660*        MOVE 'XS00800011'      TO WGLOB-MSG-REF-INFO
014660*        PERFORM  0260-1000-GENERATE-MESSAGE
014660*            THRU 0260-1000-GENERATE-MESSAGE-X
014660*    END-IF.
014660*
014660*5225-EDIT-MSIN-INQ-IND-X.
014660*    EXIT.
      /

      *----------------------
       5226-CHECK-FOR-TOKENS.
      *----------------------

B11089* CERTAIN DOUBLE-BYTE KANJI CHARACTERS CONTAIN A CHARACTER
B11089* IN THE 2ND BYTE THAT IS EQUIVALENT TO THE @ SYMBOL. 
B11089* THE LOGIC BELOW INTRODUCES A BYPASS TO IGNORE THE INSTANCE OF 
B11089* THIS.
B11089*
B11089     IF  WS-SINGLE-CHAR (CHAR-ARRAY) > X'7F'
B11089         SET CHAR-ARRAY UP BY 1
B11089         GO TO 5226-CHECK-FOR-TOKENS-X
B11089     END-IF.
B11089     
           IF  WS-SINGLE-CHAR (CHAR-ARRAY) = '@'
               SET CHAR-ARRAY UP BY 1
               MOVE WS-SINGLE-CHAR (CHAR-ARRAY)
                                      TO WS-TOKENS
               IF VALID-TOKENS
                   MOVE 'Y'           TO WS-PARAMETERS-USED
               ELSE
54-001             SET  WS-INVALID-MESSAGE TO TRUE
                   MOVE 'XS00800008'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
54-001         END-IF
54-001     END-IF.

       5226-CHECK-FOR-TOKENS-X.
           EXIT.
      /

      *--------------------------
53-066 5227-EDIT-GUI-DISPLAY-IND.
      *--------------------------

53-066****************************************************************
53-066* EDIT INPUT FIELDS - GUI DISPLAY INDICATOR                    *
53-066****************************************************************

53-066     IF MIR-MSG-GUI-IND = SPACES
014660         MOVE WS-SAVE-MSG-GUI-IND
014660                                TO MIR-MSG-GUI-IND
014660         GO TO 5227-EDIT-GUI-DISPLAY-IND-X
014660         CONTINUE
53-066     ELSE
53-066         IF MIR-MSG-GUI-IND = EBLCH-BLANK-FIELD-CHAR
53-066             MOVE SPACES        TO MIR-MSG-GUI-IND
53-066         END-IF
53-066     END-IF.

53-066     MOVE MIR-MSG-GUI-IND       TO WS-MSIN-MSG-GUI-IND.

53-066     IF VALID-GUI-IND
014660         MOVE MIR-MSG-GUI-IND   TO WS-SAVE-MSG-GUI-IND
014660         CONTINUE
53-066     ELSE
53-066         MOVE 'XS00800012'      TO WGLOB-MSG-REF-INFO
53-066         PERFORM  0260-1000-GENERATE-MESSAGE
53-066             THRU 0260-1000-GENERATE-MESSAGE-X
53-066     END-IF.

53-066 5227-EDIT-GUI-DISPLAY-IND-X.
53-066     EXIT.
      /

014660*--------------------------
014660*5228-EDIT-PROCESS-FAILURE.
014660*--------------------------
014660*
014660*    IF MIR-MSG-PRCES-FAIL-IND = SPACES
014660*        MOVE WS-SAVE-MSG-PRCES-FAIL-IND
014660*                               TO MIR-MSG-PRCES-FAIL-IND
014660*        GO TO 5228-EDIT-PROCESS-FAILURE-X
014660*    ELSE
014660*        IF MIR-MSG-PRCES-FAIL-IND = EBLCH-BLANK-FIELD-CHAR
014660*            MOVE SPACES        TO MIR-MSG-PRCES-FAIL-IND
014660*        END-IF
014660*    END-IF.
014660*
014660*    MOVE MIR-MSG-PRCES-FAIL-IND    TO WS-MSIN-MSG-PRCES-FAIL-IND.
014660*
014660*    IF VALID-PRCES-FAIL-IND
014660*        IF  WS-SAVE-MSG-PRCES-FAIL-IND = 'Y'
014660*        AND MIR-MSG-PRCES-FAIL-IND NOT =
014660*                           WS-SAVE-MSG-PRCES-FAIL-IND
014660*            MOVE 'XS00800013'  TO WGLOB-MSG-REF-INFO
014660*            PERFORM  0260-1000-GENERATE-MESSAGE
014660*                THRU 0260-1000-GENERATE-MESSAGE-X
014660*        ELSE
014660*            MOVE MIR-MSG-PRCES-FAIL-IND
014660*                               TO WS-SAVE-MSG-PRCES-FAIL-IND
014660*        END-IF
014660*    ELSE
014660*        MOVE 'XS00800014'      TO WGLOB-MSG-REF-INFO
014660*        PERFORM  0260-1000-GENERATE-MESSAGE
014660*            THRU 0260-1000-GENERATE-MESSAGE-X
014660*    END-IF.
014660*
014660*5228-EDIT-PROCESS-FAILURE-X.
014660*    EXIT.
      /

      *--------------------
       6000-PROCESS-DELETE.
      *--------------------

           PERFORM  7100-BUILD-MSGE-KEY
               THRU 7100-BUILD-MSGE-KEY-X.

           PERFORM  MSGS-1000-READ-FOR-UPDATE
               THRU MSGS-1000-READ-FOR-UPDATE-X.

           IF WMSGS-IO-OK
               PERFORM  MSGS-1000-DELETE
                   THRU MSGS-1000-DELETE-X
               MOVE 'XS00000011'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE SPACES            TO MIR-MSG-SEVRTY-CD
                                      MIR-MSG-AUD-IND
                                      MIR-MSG-TXT
014660*        MOVE SPACES            TO MIR-MSG-INQ-IND
53-066         MOVE SPACES            TO MIR-MSG-GUI-IND
014660*        MOVE SPACES            TO MIR-MSG-PRCES-FAIL-IND
           ELSE
               MOVE WMSGS-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 6000-PROCESS-DELETE-X
54-001     END-IF.

       6000-PROCESS-DELETE-X.
           EXIT.
      /
      *--------------------
       7100-BUILD-MSGE-KEY.
      *--------------------

      ****************************************************************
      * BUILD THE KEY.                                               *
      ****************************************************************

           MOVE MIR-MSG-REF-ID        TO WMSGS-MSG-REF-ID.
           MOVE MIR-MSG-REF-NUM       TO WMSGS-MSG-REF-NUM.
           MOVE MIR-MSG-LANG-CD       TO WMSGS-MSG-LANG-CD.
           MOVE MIR-MSG-SECUR-CLAS-CD TO WMSGS-MSG-SECUR-CLAS-CD.

       7100-BUILD-MSGE-KEY-X.
           EXIT.
      /

      *-----------------------
53-066 9100-BLANK-DATA-FIELDS.
      *-----------------------

53-066     IF WS-BUS-FCN-LIST
53-066         MOVE SPACES            TO MIR-MSG-REF-NUM-G
53-066         MOVE SPACES            TO MIR-MSG-LANG-CD-G
53-066         MOVE SPACES            TO MIR-MSG-SECUR-CLAS-CD-G
53-066         MOVE SPACES            TO MIR-MSG-SEVRTY-CD-G
53-066         MOVE SPACES            TO MIR-MSG-AUD-IND-G
014660*        MOVE SPACES            TO MIR-MSG-INQ-IND-G
53-066         MOVE SPACES            TO MIR-MSG-GUI-IND-G
014660*        MOVE SPACES            TO MIR-MSG-PRCES-FAIL-IND-G
53-066         MOVE SPACES            TO MIR-MSG-TXT-G
53-066     ELSE
53-066         MOVE SPACES            TO MIR-MSG-SEVRTY-CD
53-066         MOVE SPACES            TO MIR-MSG-AUD-IND
014660*        MOVE SPACES            TO MIR-MSG-INQ-IND
53-066         MOVE SPACES            TO MIR-MSG-GUI-IND
014660*        MOVE SPACES            TO MIR-MSG-PRCES-FAIL-IND
53-066         MOVE SPACES            TO MIR-MSG-TXT
53-066     END-IF.

53-066 9100-BLANK-DATA-FIELDS-X.
53-066     EXIT.
      /

      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RMSGS-MSG-SEVRTY-CD   TO MIR-MSG-SEVRTY-CD.
           MOVE RMSGS-MSG-AUD-IND     TO MIR-MSG-AUD-IND.
014660*    MOVE RMSGS-MSG-INQ-IND     TO MIR-MSG-INQ-IND.
53-066     MOVE RMSGS-MSG-GUI-IND     TO MIR-MSG-GUI-IND.
014660*    MOVE RMSGS-MSG-PRCES-FAIL-IND
014660*                               TO MIR-MSG-PRCES-FAIL-IND.
           MOVE RMSGS-MSG-TXT         TO MIR-MSG-TXT.

       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.
      /

      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
       COPY XCPELANG.
      /
       COPY XCPPINIT.
       COPY XCPPEXIT.
      /
      ****************************************************************
      * LINKING COPYBOOKS                                            *
      ****************************************************************

      *
      * LINK TO PROGRAM 0280 FOR NUMERIC EDITS
      *
       COPY XCPL0280.
      /
      ****************************************************************
      * MESSAGE PROCESSING COPYBOOKS
      ****************************************************************

014660*COPY XCPPMEXT.
      /
       COPY XCCL0260.
557708*COPY XCCPHNDL.
557708 COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPNXTAB.
      /
       COPY XCPAMSGS.
       COPY XCPBMSGS.
       COPY XCPCMSGS.
       COPY XCPNMSGS.
       COPY XCPUMSGS.
       COPY XCPXMSGS.

      *****************************************************************
      **                 END OF PROGRAM XSOM0080                     **
      *****************************************************************
