      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    XSBM3635.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSBM3635                                         **
      **  REMARKS:  LOAD PROGRAM FOR THE NEW DATAMODEL TABLES        **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
006002**  15DEC99  60     NEW IN 6.0 TO LOAD DATAMODEL DMAV & DMAD   **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSBM3635'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.
           05  WS-LINE-CNT                  PIC S9(04) COMP VALUE ZERO.
           05  WS-TOT-CNT                   PIC S9(04) COMP VALUE ZERO.
           05  WS-PAGE-CNT                  PIC S9(04) COMP VALUE ZERO.
           05  WS-SUB                       PIC S9(04) COMP VALUE ZERO.
           05  WS-CTL-CARD-CTR              PIC S9(04) COMP VALUE ZERO.
           05  WS-DISP-NUM                  PIC ZZZZZZ9.
           05  WS-COMPANY-CODE              PIC XX.

           05  WS-LANG-TABLE.
               10  WS-LANG-TBL              OCCURS 10
                                            PIC X.
           05  WS-LANG-TABLE-MAX            PIC 99     VALUE 10.
           05  WS-WORK-STRING               PIC X(30).
           05  WS-WORK-STRING-1             PIC X(80).
           05  WS-WORK-STRING-2             PIC X(80).
           05  WS-WORK-STRING-3             PIC X(80).
           05  WS-UNDERSCORE                PIC X      VALUE '_'.
           05  WS-DASH                      PIC X      VALUE '-'.
           05  WS-SEMICOLON                 PIC X      VALUE ';'.
           05  WS-BATCH-ID                  PIC X(8)   VALUE 'BATCH'.
           05  WS-PGM-BEGIN-DATE            PIC X(10).
           05  WS-PGM-BEGIN-TIME            PIC X(08).
           05  WS-3635-INPUT-CNT            PIC S9(11) COMP
                                                       VALUE ZERO.
           05  WS-DMAV-CREATE-CNT           PIC S9(11) COMP
                                                       VALUE ZERO.
           05  WS-DMAV-UPDATE-CNT           PIC S9(11) COMP
                                                       VALUE ZERO.
           05  WS-DMAD-CREATE-CNT           PIC S9(11) COMP
                                                       VALUE ZERO.
           05  WS-DMAV-CHANGE-CNT           PIC S9(11) COMP
                                                       VALUE ZERO.
           05  WS-DMAV-DELETE-CNT           PIC S9(11) COMP
                                                       VALUE ZERO.
           05  WS-TOTAL-LANG-CNT            PIC S9(04) COMP
                                                       VALUE ZERO.


       01  WS-SWITCHES.
           05  WS-FATAL-ERROR-SW            PIC X.
               88  WS-FATAL-ERROR           VALUE 'Y'.
           05  WS-PROGRAM-ID-FOUND-SW       PIC X.
               88  WS-PROGRAM-ID-FOUND      VALUE 'Y'.
           05  WS-COMPANY-FOUND-SW          PIC X.
               88  WS-COMPANY-FOUND         VALUE 'Y'.
           05  WS-DMAV-FOUND-SW             PIC X.
               88  WS-DMAV-FOUND            VALUE 'Y'.
               88  WS-DMAV-NOT-FOUND        VALUE 'N'.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY XCWTFCMD.
      /
       COPY XCWWHDG.
      /
       COPY XCWWPARM.
      /
       COPY XCWWTIME.
      /
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY XCSW3635.
       COPY XCSR3635.
      /
       COPY XCFWDMAD.
       COPY XCFRDMAD.
      /
       COPY XCFWDMAV.
       COPY XCFRDMAV.
       COPY XCFWDMAW.
      /
       COPY XCFWXTAD.
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
P02229 COPY XCWL0035.

       COPY CCWL0950.
      /
       COPY XCWL0010.
      /
014590*COPY XCWL0030.
      /
       COPY XCWL0040.
      /
       COPY XCWL1610.
      /
       COPY XCWL1640.
      /
       COPY XCWLDTLK.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.

           PERFORM 1000-INITIALIZE
              THRU 1000-INITIALIZE-X.

           PERFORM 2000-PROCESS-DATAMODEL
              THRU 2000-PROCESS-DATAMODEL-X.

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *****************
       0100-OPEN-FILES.
      *****************

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM BCF-1000-OPEN-INPUT
              THRU BCF-1000-OPEN-INPUT-X.

           PERFORM 3635-1000-OPEN-INPUT
              THRU 3635-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *****************
       1000-INITIALIZE.
      *****************

           MOVE WPGWS-CRNT-PGM-ID      TO WGLOB-MAIN-PGM-ID.

           PERFORM 0010-1000-INIT-TPI-GLOB
              THRU 0010-1000-INIT-TPI-GLOB-X.

           MOVE WGLOB-SYSTEM-DATE-INT  TO WS-PGM-BEGIN-DATE.
           MOVE WGLOB-SYSTEM-TIME-INT  TO WS-PGM-BEGIN-TIME.
           MOVE WGLOB-SYSTEM-TIME-INT  TO L1610-SYSTEM-TIME-INT.

           PERFORM 1610-1000-GET-DATE-TIME
              THRU 1610-1000-GET-DATE-TIME-X
              UNTIL WS-PGM-BEGIN-TIME NOT = L1610-SYSTEM-TIME-INT.

           MOVE L1610-SYSTEM-TIME-INT  TO WGLOB-SYSTEM-TIME-INT.
           MOVE L1610-SYSTEM-DATE-INT  TO WGLOB-SYSTEM-DATE-INT.

           PERFORM 0950-0000-INIT-PARM-INFO
              THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM 0950-1000-GET-COMPANY-NAME
              THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME     TO L0040-COMPANY-NAME.
           MOVE ZERO                   TO L0040-ERROR-CNT.
           MOVE SPACES                 TO L0040-HDG-LINE-3.

           MOVE 'XS36350001'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-PROGRAM-DESC.

           MOVE 'XS00000146'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-SYSTEM-ID.
           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.

           PERFORM 4000-EDIT-CONTROL-CARDS
              THRU 4000-EDIT-CONTROL-CARDS-X.

           IF WS-FATAL-ERROR
               PERFORM 0030-4000-CTL-CARD-ERROR
                  THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.

           PERFORM 3635-1000-READ
              THRU 3635-1000-READ-X.
           ADD 1                       TO WS-3635-INPUT-CNT.

           IF  W3635-SEQ-IO-EOF
      *MSG : DATAMODEL INPUT FILE IS EMPTY
               MOVE 'XS36350002'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
               GO TO 1000-INITIALIZE-X
           END-IF.

       1000-INITIALIZE-X.
           EXIT.
      /
      ************************
       2000-PROCESS-DATAMODEL.
      ************************

           PERFORM 3700-LOAD-LANGUAGES
              THRU 3700-LOAD-LANGUAGES-X.

           PERFORM 3000-PROCESS-3635-FILE
              THRU 3000-PROCESS-3635-FILE-X
              UNTIL W3635-SEQ-IO-EOF.

           PERFORM 3800-PRE-CLEANUP-LIST
              THRU 3800-PRE-CLEANUP-LIST-X.

           PERFORM 3900-PROCESS-CLEANUP
              THRU 3900-PROCESS-CLEANUP-X.

           PERFORM 8000-PRINT-STATISTICS
              THRU 8000-PRINT-STATISTICS-X.

       2000-PROCESS-DATAMODEL-X.
           EXIT.

      ************************
       3000-PROCESS-3635-FILE.
      ************************

           MOVE R3635-DM-AV-TBL-CD        TO WS-WORK-STRING.
           INSPECT WS-WORK-STRING
               REPLACING ALL WS-UNDERSCORE
               BY        WS-DASH.
           MOVE WS-WORK-STRING            TO WDMAV-DM-AV-TBL-CD.
           MOVE R3635-DM-AV-CD            TO WDMAV-DM-AV-CD.

           PERFORM DMAV-1000-READ-FOR-UPDATE
              THRU DMAV-1000-READ-FOR-UPDATE-X.

           IF  NOT WDMAV-IO-OK
               PERFORM 3100-CREATE-NEW-DMAV
                  THRU 3100-CREATE-NEW-DMAV-X
               SET WS-DMAV-NOT-FOUND      TO TRUE
           ELSE

               IF RDMAV-DM-AV-MODEL-TXT NOT = R3635-DM-AV-MODEL-TXT
      * MSG : DATA MODEL ATTRIBUTE @1 VALUE @2 DESCRIPTION HAS CHANGED;
      *       REVIEW DMAD TABLE DESCRIPTIONS FOR ALL LANGUAGES.
                  MOVE 'XS36350004'       TO WGLOB-MSG-REF-INFO
                  MOVE RDMAV-DM-AV-TBL-CD TO WGLOB-MSG-PARM(1)
                  MOVE RDMAV-DM-AV-CD     TO WGLOB-MSG-PARM(2)
                  PERFORM 0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X
                  ADD 1                   TO WS-DMAV-CHANGE-CNT

               END-IF

               MOVE WGLOB-SYSTEM-DATE-INT TO RDMAV-PREV-UPDT-DT
               MOVE WGLOB-SYSTEM-TIME-INT TO RDMAV-PREV-UPDT-TIME
               MOVE R3635-DM-AV-MODEL-TXT TO RDMAV-DM-AV-MODEL-TXT
               ADD  1                     TO WS-DMAV-UPDATE-CNT

               PERFORM DMAV-2000-REWRITE
                  THRU DMAV-2000-REWRITE-X

               SET WS-DMAV-FOUND          TO TRUE

           END-IF.

           MOVE R3635-DM-AV-MODEL-TXT     TO WS-WORK-STRING-3.
           UNSTRING WS-WORK-STRING-3
              DELIMITED BY WS-SEMICOLON
              INTO WS-WORK-STRING-1
                   WS-WORK-STRING-2.

           PERFORM 3200-LOOP-THRU-LANGUAGE
              THRU 3200-LOOP-THRU-LANGUAGE-X
              VARYING WS-SUB FROM 1 BY 1
              UNTIL WS-SUB > WS-TOTAL-LANG-CNT.

           PERFORM 3635-1000-READ
              THRU 3635-1000-READ-X.
           ADD 1                         TO WS-3635-INPUT-CNT.

       3000-PROCESS-3635-FILE-X.
           EXIT.


      **********************
       3100-CREATE-NEW-DMAV.
      **********************

           MOVE WS-WORK-STRING           TO RDMAV-DM-AV-TBL-CD.
           MOVE R3635-DM-AV-CD           TO RDMAV-DM-AV-CD.

           PERFORM DMAV-1000-CREATE
              THRU DMAV-1000-CREATE-X.

           MOVE WS-BATCH-ID              TO RDMAV-PREV-UPDT-USER-ID.
           MOVE WGLOB-SYSTEM-DATE-INT    TO RDMAV-PREV-UPDT-DT.
           MOVE WGLOB-SYSTEM-TIME-INT    TO RDMAV-PREV-UPDT-TIME.
           MOVE R3635-DM-AV-MODEL-TXT    TO RDMAV-DM-AV-MODEL-TXT.

           MOVE RDMAV-DM-AV-TBL-CD       TO WDMAV-DM-AV-TBL-CD.
           MOVE RDMAV-DM-AV-CD           TO WDMAV-DM-AV-CD.

           ADD 1                         TO WS-DMAV-CREATE-CNT.

      * MSG : DATA MODEL ATTRIBUTE @1 VALUE @2 ADDED TO THE DATABASE;
      *       REVIEW DMAD TABLE DESCRIPTIONS FOR ALL LANGUAGES.
           MOVE 'XS36350016'             TO WGLOB-MSG-REF-INFO.
           MOVE RDMAV-DM-AV-TBL-CD       TO WGLOB-MSG-PARM(1).
           MOVE RDMAV-DM-AV-CD           TO WGLOB-MSG-PARM(2).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM DMAV-1000-WRITE
              THRU DMAV-1000-WRITE-X.

           IF NOT WDMAV-IO-OK
      *MSG : DMAV RECORD CREATION FAILED
               MOVE 'XS36350003'         TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

       3100-CREATE-NEW-DMAV-X.
           EXIT.

      *************************
       3200-LOOP-THRU-LANGUAGE.
      *************************

           IF WS-DMAV-NOT-FOUND

              PERFORM 3300-CREATE-DMAD
                 THRU 3300-CREATE-DMAD-X
              GO TO 3200-LOOP-THRU-LANGUAGE-X
           END-IF.

           MOVE WS-COMPANY-CODE          TO WGLOB-COMPANY-CODE.
           MOVE WS-WORK-STRING           TO WDMAD-DM-AV-TBL-CD.
           MOVE R3635-DM-AV-CD           TO WDMAD-DM-AV-CD.
           MOVE WS-LANG-TBL(WS-SUB)      TO WDMAD-DM-AV-DESC-LANG-CD.

           PERFORM DMAD-1000-READ
              THRU DMAD-1000-READ-X.

           IF NOT WDMAD-IO-OK
              PERFORM 3300-CREATE-DMAD
                 THRU 3300-CREATE-DMAD-X
           END-IF.

       3200-LOOP-THRU-LANGUAGE-X.
           EXIT.

      ******************
       3300-CREATE-DMAD.
      ******************

           MOVE WS-COMPANY-CODE          TO WGLOB-COMPANY-CODE.
           MOVE WS-WORK-STRING           TO WDMAD-DM-AV-TBL-CD.
           MOVE R3635-DM-AV-CD           TO WDMAD-DM-AV-CD.
           MOVE WS-LANG-TBL(WS-SUB)      TO WDMAD-DM-AV-DESC-LANG-CD.

           PERFORM DMAD-1000-CREATE
              THRU DMAD-1000-CREATE-X.
           MOVE WS-BATCH-ID              TO RDMAD-PREV-UPDT-USER-ID.
           MOVE WGLOB-SYSTEM-DATE-INT    TO RDMAD-PREV-UPDT-DT.
           MOVE WS-WORK-STRING-1         TO RDMAD-DM-AV-DESC-TXT.
           ADD 1                         TO WS-DMAD-CREATE-CNT.

           PERFORM DMAD-1000-WRITE
              THRU DMAD-1000-WRITE-X.

           IF NOT WDMAD-IO-OK
      *MSG : DMAD RECORD ALREADY EXISTS, DATABASE OUT-OF-SYNC
              MOVE 'XS36350006'          TO WGLOB-MSG-REF-INFO
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 0030-5000-LOGIC-ERROR
                 THRU 0030-5000-LOGIC-ERROR-X
           END-IF.


       3300-CREATE-DMAD-X.
           EXIT.
      /
      *********************
       3700-LOAD-LANGUAGES.
      *********************

           MOVE LOW-VALUE                TO WXTAD-KEY.
           MOVE 'LANG'                   TO WXTAD-ETBL-TYP-ID.
           MOVE WGLOB-USER-LANG          TO WXTAD-ETBL-LANG-CD.
           MOVE WXTAD-KEY                TO WXTAD-ENDBR-KEY.
           MOVE HIGH-VALUE               TO WXTAD-ENDBR-ETBL-DESC-TXT.
           MOVE HIGH-VALUE               TO WXTAD-ENDBR-ETBL-VALU-ID.

           PERFORM XTAD-1000-BROWSE
              THRU XTAD-1000-BROWSE-X.

           IF NOT WXTAD-IO-OK
               PERFORM XTAD-3000-END-BROWSE
                  THRU XTAD-3000-END-BROWSE-X
      *MSG : INPUT LANGUAGE IS NOT DEFINED IN XTAB
               MOVE 'XS36350007'         TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
               GO TO 3700-LOAD-LANGUAGES-X
           END-IF.

           PERFORM XTAD-2000-READ-NEXT
              THRU XTAD-2000-READ-NEXT-X.

           MOVE ZERO                     TO WS-SUB.
           PERFORM
               UNTIL NOT WXTAD-IO-OK
               OR    (WS-SUB = WS-LANG-TABLE-MAX)
               ADD  1                    TO WS-SUB
               MOVE RXTAB-ETBL-VALU-ID   TO WS-LANG-TBL (WS-SUB)
               PERFORM XTAD-2000-READ-NEXT
                  THRU XTAD-2000-READ-NEXT-X
           END-PERFORM.

           MOVE WS-SUB                   TO WS-TOTAL-LANG-CNT.
           PERFORM XTAD-3000-END-BROWSE
              THRU XTAD-3000-END-BROWSE-X.

       3700-LOAD-LANGUAGES-X.
           EXIT.

      ***********************
       3800-PRE-CLEANUP-LIST.
      ***********************

           MOVE ZERO                     TO WS-DMAV-DELETE-CNT.
           MOVE WWKDT-LOW-DT             TO WDMAW-PREV-UPDT-DT.
           MOVE WWKDT-ZERO-TIME          TO WDMAW-PREV-UPDT-TIME.

           MOVE WS-PGM-BEGIN-DATE        TO WDMAW-ENDBR-PREV-UPDT-DT.
           MOVE WS-PGM-BEGIN-TIME        TO WDMAW-ENDBR-PREV-UPDT-TIME.

           PERFORM  DMAW-1000-BROWSE
               THRU DMAW-1000-BROWSE-X.

           IF NOT WDMAW-IO-OK
              GO TO 3800-PRE-CLEANUP-LIST-X
           END-IF.

           PERFORM  DMAW-2000-READ-NEXT
              THRU  DMAW-2000-READ-NEXT-X.

           PERFORM
              VARYING WS-DMAV-DELETE-CNT FROM 1 BY 1
              UNTIL   NOT WDMAW-IO-OK

      * MSG : DATA MODEL ATTRIBUTE @1 VALUE @2 DELETED FROM DATABASE
              MOVE 'XS36350015'       TO WGLOB-MSG-REF-INFO
              MOVE RDMAV-DM-AV-TBL-CD TO WGLOB-MSG-PARM(1)
              MOVE RDMAV-DM-AV-CD     TO WGLOB-MSG-PARM(2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

              PERFORM  DMAW-2000-READ-NEXT
                  THRU DMAW-2000-READ-NEXT-X
           END-PERFORM.


           PERFORM  DMAW-3000-END-BROWSE
              THRU  DMAW-3000-END-BROWSE-X.

           SUBTRACT 1                    FROM WS-DMAV-DELETE-CNT.

       3800-PRE-CLEANUP-LIST-X.
           EXIT.


      **********************
       3900-PROCESS-CLEANUP.
      **********************

           MOVE WWKDT-LOW-DT             TO WDMAW-PREV-UPDT-DT.
           MOVE WWKDT-ZERO-TIME          TO WDMAW-PREV-UPDT-TIME.

           MOVE WS-PGM-BEGIN-DATE        TO WDMAW-ENDBR-PREV-UPDT-DT.
           MOVE WS-PGM-BEGIN-TIME        TO WDMAW-ENDBR-PREV-UPDT-TIME.

           PERFORM  DMAW-1000-DELETE-KEY-RANGE
               THRU DMAW-1000-DELETE-KEY-RANGE-X.

           IF WDMAW-IO-ERROR
      *MSG:  BLOCK DELETE IS NOT SUCCESSFUL
              MOVE 'XS36350008'          TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM  0030-5000-LOGIC-ERROR
                  THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

       3900-PROCESS-CLEANUP-X.
           EXIT.
      /
       4000-EDIT-CONTROL-CARDS.

           MOVE 'N' TO WS-FATAL-ERROR-SW.
           MOVE 'N' TO WS-COMPANY-FOUND-SW.
           MOVE 'N' TO WS-PROGRAM-ID-FOUND-SW.

           PERFORM BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF WBCF-SEQ-IO-OK
               ADD 1 TO WS-CTL-CARD-CTR
           ELSE
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      ***  MESSAGE (S) CONTROL CARD FILE EMPTY, NO PROCESSING DONE
               MOVE 'XS00000151' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-EDIT-CONTROL-CARDS-X
           END-IF.

           MOVE RBCF-SEQ-REC-INFO TO WPARM-CARD-AREA.
           IF NOT WPARM-PROGRAM-ID
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      ***  MESSAGE (S) FIRST CONTROL CARD MUST BE PROGRAM ID CARD
               MOVE 'XS00000147' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM 4100-EDIT-CONTROL-CARD
               THRU 4100-EDIT-CONTROL-CARD-X
               UNTIL WBCF-SEQ-IO-EOF.

           IF NOT WS-PROGRAM-ID-FOUND
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      ***  MESSAGE (S) MISSING PROGRAM ID CARD
               MOVE 'XS00000122' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           IF NOT WS-COMPANY-FOUND
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      ***  MESSAGE (S) COMPANY CONTROL CARD MISSING
               MOVE 'XS00000134' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

      *** PRINT CONTROL CARD TOTALS
      * MESSAGE (I) TOTAL NUMBER OF PARM CARDS READ @1
           MOVE 'XS00000142' TO WGLOB-MSG-REF-INFO.
           MOVE WS-CTL-CARD-CTR     TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM 0040-4000-WRITE-ERROR-TOTAL
               THRU 0040-4000-WRITE-ERROR-TOTAL-X.

       4000-EDIT-CONTROL-CARDS-X.
           EXIT.
      /
       4100-EDIT-CONTROL-CARD.

      *** PRINT CONTROL CARD
           MOVE RBCF-SEQ-REC-INFO TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           EVALUATE TRUE
               WHEN WPARM-PROGRAM-ID
                    PERFORM 4110-EDIT-PROGRAM-ID
                       THRU 4110-EDIT-PROGRAM-ID-X

               WHEN WPARM-COMPANY-CODE
                    PERFORM 4120-EDIT-COMPANY-CODE
                       THRU 4120-EDIT-COMPANY-CODE-X

               WHEN OTHER
                    MOVE 'Y'      TO WS-FATAL-ERROR-SW
      *** MESSAGE (S) INVALID PARM CARD TYPE
                    MOVE 'XS00000152' TO WGLOB-MSG-REF-INFO
                    PERFORM 0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
           END-EVALUATE.

           PERFORM BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO TO WPARM-CARD-AREA
               ADD 1 TO WS-CTL-CARD-CTR
           END-IF.

       4100-EDIT-CONTROL-CARD-X.
           EXIT.
      /
      *---------------------
       4110-EDIT-PROGRAM-ID.
      *---------------------

           IF WS-PROGRAM-ID-FOUND
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      *** MESSAGE (S) MUST ONLY HAVE ONE PROGRAM ID CARD
               MOVE 'XS00000162' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           MOVE 'Y' TO WS-PROGRAM-ID-FOUND-SW.

           IF WPARM-VALUE = WPGWS-CRNT-PGM-ID
               NEXT SENTENCE
           ELSE
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      *** MESSAGE (S) INVALID PROGRAM ID CARD
               MOVE 'XS00000121' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       4110-EDIT-PROGRAM-ID-X.
           EXIT.
      /
      *-----------------------
       4120-EDIT-COMPANY-CODE.
      *-----------------------

           MOVE 'Y'         TO WS-COMPANY-FOUND-SW.
           MOVE WPARM-VALUE TO WXTAB-ETBL-VALU-ID.
           PERFORM COMP-1000-EDIT-COMPANY
               THRU COMP-1000-EDIT-COMPANY-X.

           IF WXTAB-IO-OK
               MOVE WXTAB-ETBL-VALU-ID TO WGLOB-COMPANY-CODE
               MOVE WXTAB-ETBL-VALU-ID TO WS-COMPANY-CODE
           ELSE
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      *** MESSAGE (S) COMPANY CODE MUST BE IN EDIT TYPE 'COMP'
               MOVE 'XS00000082' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       4120-EDIT-COMPANY-CODE-X.
           EXIT.
      /
      ***********************
       8000-PRINT-STATISTICS.
      ***********************

      * MESSAGE (I) TOTAL NUMBER OF INPUT (3635) RECORDS @1
           MOVE 'XS36350009' TO WGLOB-MSG-REF-INFO.
           SUBTRACT 1             FROM WS-3635-INPUT-CNT
           MOVE WS-3635-INPUT-CNT   TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

      * MESSAGE (I) TOTAL NUMBER OF LANGUAGES @1
           MOVE 'XS36350010' TO WGLOB-MSG-REF-INFO.
           MOVE WS-TOTAL-LANG-CNT   TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

      * MESSAGE (I) TOTAL NUMBER OF DMAV RECORDS CREATED @1
           MOVE 'XS36350011' TO WGLOB-MSG-REF-INFO.
           MOVE WS-DMAV-CREATE-CNT  TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

      * MESSAGE (I) TOTAL NUMBER OF DMAV RECORDS UPDATED @1
           MOVE 'XS36350014' TO WGLOB-MSG-REF-INFO.
           MOVE WS-DMAV-UPDATE-CNT  TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

      * MESSAGE (I) TOTAL NUMBER OF DMAD RECORDS CREATED @1
           MOVE 'XS36350012' TO WGLOB-MSG-REF-INFO.
           MOVE WS-DMAD-CREATE-CNT  TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

      * MESSAGE (I) TOTAL NUMBER OF DMAV DESCRIPTION DIFFERENCES @1
           MOVE 'XS36350013' TO WGLOB-MSG-REF-INFO.
           MOVE WS-DMAV-CHANGE-CNT  TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

      * MESSAGE (I) TOTAL NUMBER OF DMAV RECORDS DELETED @1
           MOVE 'XS36350005' TO WGLOB-MSG-REF-INFO.
           MOVE WS-DMAV-DELETE-CNT  TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.


       8000-PRINT-STATISTICS-X.
           EXIT.
      /
      *****************
       9999-CLOSE-FILES.
      *****************

           PERFORM 3635-4000-CLOSE
              THRU 3635-4000-CLOSE-X.

           PERFORM BCF-4000-CLOSE
              THRU BCF-4000-CLOSE-X.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY CCPS0950.
      /
       COPY XCPECOMP.
      /
       COPY XCPPHDG.
      /
       COPY XCPPTIME.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
P02229 COPY XCPL0035.

       COPY CCPL0950.
      /
       COPY XCPL0010.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1610.
      /
       COPY XCPL1640.
      /
      ****************************************************************
      *  FILE I/O PROCESS MODULES                                    *
      ****************************************************************
       COPY XCPNBCF.
       COPY XCPOBCF.
       COPY XCPLBCF.
      /
       COPY XCPOOCF.
       COPY XCPLOCF.
      /
       COPY XCPN3635.
       COPY XCPO3635.
       COPY XCPL3635.
      /
       COPY XCPADMAV.
       COPY XCPCDMAV.
       COPY XCPUDMAV.
      /
       COPY XCPADMAD.
       COPY XCPCDMAD.
       COPY XCPNDMAD.
       COPY XCPUDMAD.
      /
       COPY XCPBDMAW.
       COPY XCPGDMAW.
      /
       COPY XCPNXTAB.
       COPY XCPBXTAD.
      /
      /
      ****************************************************************
      *  ERROR HANDLING ROUTINES                                     *
      ****************************************************************
       COPY XCPL0030.
      ******************************************************************
      **           END OF PROGRAM XSBM3635                            **
      ******************************************************************
