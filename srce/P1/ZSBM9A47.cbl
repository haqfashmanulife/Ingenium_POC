      *****************************************************************
      **  MEMBER :  ZSBM9A47                                         **
      **  REMARKS:  CREATES ADV PMT STRT (1910) ACTV IN PHST TABLE   **
      **            FOR PREMIUM PAYING REGULAR ADV PMT POLICIES      **
      **            CREATED BEFORE DAY 1.10 RELEASE                  **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
NWLPPT**  02OCT10  CTS    INITIAL VERSION                            **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9A47.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9A47'.
      /
       COPY SQLCA.
      /
       01  WS-PGM-WORK-AREA.
           05  WS-USER-NWLPPT                        PIC X(08)
                                                     VALUE 'NWLPPT'.
           05  WS-ACTV-TYP-1910                      PIC X(04)
                                                     VALUE '1910'.
           05  WS-SEQ-NUM                            PIC 9(03)
                                                     VALUE 998.
           05  WS-INPUT-POL-COUNT                    PIC 9(08) VALUE 0.
           05  WS-ADV-PMT-POL-COUNT                  PIC 9(08) VALUE 0.
           05  WS-ADV-PMT-PHST-CREAT-COUNT           PIC 9(08) VALUE 0.
           05  WS-VALUE-TXT.
               10  WS-VALUE-APMT-STRT-DT-YYYY        PIC X(04).
               10  WS-VALUE-APMT-STRT-DT-MM          PIC X(02).
               10  WS-VALUE-APMT-STRT-DT-DD          PIC X(02).
               10  WS-VALUE-APMT-DUR                 PIC X(03).
               10  WS-VALUE-APMT-TYP-CD              PIC X(01).
               10  WS-VALUE-APMT-EFF-DT-YYYY         PIC X(04).
               10  WS-VALUE-APMT-EFF-DT-MM           PIC X(02).
               10  WS-VALUE-APMT-EFF-DT-DD           PIC X(02).
           05  WS-MSGS-TXT                           PIC X(80).
               88  WS-MSGS-ZS9A470001                VALUE
               'ONE-TIME TRANSITION JOB FOR PREPAYMENT'.
               88  WS-MSGS-ZS9A470002                VALUE
               'NO RECORDS TO PROCESS'.
               88  WS-MSGS-ZS9A470003                VALUE
               'PROCESSING POLICY NO '.
               88  WS-MSGS-ZS9A470004                VALUE
               'ADVANCE PAYMENT DURATION IS INVALID'.
               88  WS-MSGS-ZS9A470005                VALUE
               'ERROR WHILE BROWSING POLICY CHANGE HISTORY'.
               88  WS-MSGS-ZS9A470006                VALUE
               'ERROR WHILE WRITING POLICY CHANGE HISTORY'.
               88  WS-MSGS-ZS9A470007                VALUE
               '# OF INPUT POLICIES PROCESSED: '.
               88  WS-MSGS-ZS9A470008                VALUE
               '# OF ADVANCE PAYMENT POLICIES PROCESSED: '.
               88  WS-MSGS-ZS9A470009                VALUE
               '# OF ADVANCE PAYMENT START ACTIVITIES CREATED: '.
               88  WS-MSGS-ZS9A470010                VALUE
               'POLICY INELIGIBLE FOR THE PROCESSING...SKIPPED'.
      /
      * FOR INPUT FILE REC LAYOUT
       01  WS-INPUT-REC-INFO                         PIC X(42).
       01  WS-INPUT-REC-INFO-R                       REDEFINES
           WS-INPUT-REC-INFO.
           05  FILLER                                PIC X(01).
           05  WS-POL-ID                             PIC X(10).
           05  FILLER                                PIC X(03).
           05  WS-POL-CSTAT-CD                       PIC X(04).
           05  WS-POL-CSTAT-CD-R                     REDEFINES
               WS-POL-CSTAT-CD.
               10  WS-POL-STAT-CD                    PIC X(01).
                   88  WS-POL-STAT-PREM-PAY-REG      VALUE '1'.
               10  FILLER                            PIC X(03).
           05  FILLER                                PIC X(03).
           05  WS-POL-ISS-EFF-DT.
               10  WS-POL-ISS-EFF-DT-YYYY            PIC 9(04).
               10  FILLER                            PIC X(01).
               10  WS-POL-ISS-EFF-DT-MM              PIC 9(02).
               10  FILLER                            PIC X(01).
               10  WS-POL-ISS-EFF-DT-DD              PIC 9(02).
           05  FILLER                                PIC X(03).
           05  WS-ADV-PMT-TYP-CD                     PIC X(01).
               88  WS-ADV-PMT-TYP-PREPAY             VALUE 'P'.
           05  FILLER                                PIC X(03).
           05  WS-ADV-PMT-DUR                        PIC X(03).
           05  WS-ADV-PMT-DUR-N                      REDEFINES
               WS-ADV-PMT-DUR                        PIC 9(03).
           05  FILLER                                PIC X(01).
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFRPHST.
       COPY CCFWPHST.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    9A47
                               ==':ID:'==  BY =='9A47'==.
      /
      *CODE EQUIVALENT OF COPYBOOK ZCSR9A47
       01 R9A47-SEQ-REC-INFO                   PIC X(42).
      /
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0035.
      /
       COPY XCWL0040.
      /
       COPY XCWL1660.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      /
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

           PERFORM  2000-PRCES-INPUT-RECORDS
               THRU 2000-PRCES-INPUT-RECORDS-X
               UNTIL W9A47-SEQ-IO-EOF.

           PERFORM  3000-DISPLAY-TOTALS
               THRU 3000-DISPLAY-TOTALS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  9A47-1000-OPEN-INPUT
               THRU 9A47-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE WPGWS-CRNT-PGM-ID           TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-0000-INIT-PARM-INFO
               THRU 0010-0000-INIT-PARM-INFO-X.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

      ***  GET THE SYSTEM ID ***
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

      *** GET THE PROGRAM DESCRIPTION ***
           SET  WS-MSGS-ZS9A470001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.

           MOVE ZERO                        TO L0040-ERROR-CNT.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE WS-USER-NWLPPT              TO WGLOB-USER-ID.

           INITIALIZE WS-INPUT-POL-COUNT
                      WS-ADV-PMT-POL-COUNT
                      WS-ADV-PMT-PHST-CREAT-COUNT.

           PERFORM  9A47-1000-READ
               THRU 9A47-1000-READ-X.

           IF  NOT W9A47-SEQ-IO-OK
      *MSG: NO RECORDS TO PROCESS
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A470002      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.

       1000-INITIALIZE-X.
           EXIT.
      /
      *-------------------------
       2000-PRCES-INPUT-RECORDS.
      *-------------------------

           INITIALIZE WS-INPUT-REC-INFO.
           MOVE R9A47-SEQ-REC-INFO          TO WS-INPUT-REC-INFO.
           ADD +1                           TO WS-INPUT-POL-COUNT.

           MOVE WS-POL-ID                   TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

      *MSG: PROCESSING POLICY NO @1
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A470003          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  WS-POL-ID                 INTO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           IF  ((NOT (WS-POL-STAT-PREM-PAY-REG
           AND WS-ADV-PMT-TYP-PREPAY))
           OR  NOT WPOL-IO-OK)
      *MSG: POLICY INELIGIBLE FOR THE PROCESSING...SKIPPED
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A470010      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               PERFORM  9A47-1000-READ
                   THRU 9A47-1000-READ-X
               GO TO 2000-PRCES-INPUT-RECORDS-X
           END-IF.

           ADD +1                           TO WS-ADV-PMT-POL-COUNT.

           IF  WS-ADV-PMT-DUR IS NOT NUMERIC
      *MSG: ADVANCE PAYMENT DURATION IS INVALID
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A470004      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               PERFORM  9A47-1000-READ
                   THRU 9A47-1000-READ-X
               GO TO 2000-PRCES-INPUT-RECORDS-X
           END-IF.

           PERFORM  2100-CREAT-1910-ACTV
               THRU 2100-CREAT-1910-ACTV-X.

           PERFORM  9A47-1000-READ
               THRU 9A47-1000-READ-X.

       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *---------------------
       2100-CREAT-1910-ACTV.
      *---------------------

      * BROWSE & FETCH LATEST RECORD IN PHST TABLE ON POL-ISS-EFF-DT  
           MOVE LOW-VALUES                  TO WPHST-KEY.
           MOVE HIGH-VALUES                 TO WPHST-ENDBR-KEY.
           MOVE WS-POL-ID                   TO WPHST-POL-ID.
           MOVE WS-POL-ISS-EFF-DT           TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.
           MOVE 000                         TO WPHST-PCHST-SEQ-NUM.
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 9999999                     TO
                                        WPHST-ENDBR-PCHST-EFF-IDT-NUM.
           MOVE 999                         TO
                                            WPHST-ENDBR-PCHST-SEQ-NUM.

           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.

           IF  NOT WPHST-IO-OK
      *MSG: ERROR WHILE BROWSING POLICY CHANGE HISTORY
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A470005      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 2100-CREAT-1910-ACTV-X
           END-IF.

           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.

      * IDENTIFY SEQ-NUM FOR THE 1910 ACTV
           IF  WPHST-IO-EOF
               MOVE WS-SEQ-NUM              TO WPHST-PCHST-SEQ-NUM
           ELSE
               COMPUTE WPHST-PCHST-SEQ-NUM = RPHST-PCHST-SEQ-NUM
                                           - 1
           END-IF.

           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.

      * CREATE 1910 ACTV IN PHST
           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.

           PERFORM  2200-MOVE-PHST-VALUES
               THRU 2200-MOVE-PHST-VALUES-X.

           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.

           IF  WPHST-IO-OK
               ADD +1                       TO
                                            WS-ADV-PMT-PHST-CREAT-COUNT
           ELSE
      *MSG: ERROR WHILE WRITING POLICY CHANGE HISTORY
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A470006      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.

       2100-CREAT-1910-ACTV-X.
           EXIT.
      /
      *----------------------
       2200-MOVE-PHST-VALUES.
      *----------------------

           MOVE WS-POL-ISS-EFF-DT           TO RPHST-PCHST-EFF-DT
                                               RPHST-PREV-PRCES-DT.
           MOVE ZEROES                      TO RPHST-CVG-NUM.
           SET  RPHST-PCHST-STAT-ACTIVE     TO TRUE.
           MOVE WS-ACTV-TYP-1910            TO RPHST-POL-ACTV-TYP-ID.

      * PHST OLD VALUE TEXT
           MOVE ZEROES                      TO
                                            WS-VALUE-APMT-STRT-DT-YYYY.
           MOVE ZEROES                      TO WS-VALUE-APMT-STRT-DT-MM.
           MOVE ZEROES                      TO WS-VALUE-APMT-STRT-DT-DD.
           MOVE ZEROES                      TO WS-VALUE-APMT-DUR.
           MOVE SPACES                      TO WS-VALUE-APMT-TYP-CD.
           MOVE ZEROES                      TO
                                            WS-VALUE-APMT-EFF-DT-YYYY.
           MOVE ZEROES                      TO WS-VALUE-APMT-EFF-DT-MM.
           MOVE ZEROES                      TO WS-VALUE-APMT-EFF-DT-DD.

           MOVE WS-VALUE-TXT                TO RPHST-PCHST-OLD-VALU-TXT.

      * PHST NEW VALUE TEXT
           MOVE WS-POL-ISS-EFF-DT-YYYY      TO
                                            WS-VALUE-APMT-STRT-DT-YYYY.
           MOVE WS-POL-ISS-EFF-DT-MM        TO WS-VALUE-APMT-STRT-DT-MM.
           MOVE WS-POL-ISS-EFF-DT-DD        TO WS-VALUE-APMT-STRT-DT-DD.
           MOVE WS-ADV-PMT-DUR              TO WS-VALUE-APMT-DUR.
           MOVE WS-ADV-PMT-TYP-CD           TO WS-VALUE-APMT-TYP-CD.
           MOVE WS-POL-ISS-EFF-DT-YYYY      TO
                                            WS-VALUE-APMT-EFF-DT-YYYY.
           MOVE WS-POL-ISS-EFF-DT-MM        TO WS-VALUE-APMT-EFF-DT-MM.
           MOVE WS-POL-ISS-EFF-DT-DD        TO WS-VALUE-APMT-EFF-DT-DD.

           MOVE WS-VALUE-TXT                TO RPHST-PCHST-NEW-VALU-TXT.

       2200-MOVE-PHST-VALUES-X.
           EXIT.
      /
      *--------------------
       3000-DISPLAY-TOTALS.
      *--------------------

      * # OF INPUT POLICIES PROCESSED: @1
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A470007          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  WS-INPUT-POL-COUNT        INTO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      * # OF ADVANCE PAYMENT POLICIES PROCESSED: @1
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A470008          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  WS-ADV-PMT-POL-COUNT      INTO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      * # OF ADVANCE PAYMENT START ACTIVITIES CREATED: @1
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A470009          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                WS-ADV-PMT-PHST-CREAT-COUNT INTO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       3000-DISPLAY-TOTALS-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  9A47-4000-CLOSE
               THRU 9A47-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
       COPY CCPAPHST.
       COPY CCPBPHST.
       COPY CCPCPHST.
      /
       COPY CCPNPOL.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 9A47
                               ==':PGM:'== BY =='ZSRQ9A47'==.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY  ==9A47==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9A47.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPL0030.
      /
       COPY XCPL0035.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
      /
      *****************************************************************
      *                END OF PROGRAM ZSBM9A47                        *
      *****************************************************************