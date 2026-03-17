      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. VSBM1200.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  VSBM1200                                         **
      **  REMARKS:  PREMIUMS DUE AND ADVANCE REPORT                  **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
      **                                                             **
      **  27JUL89  TAW     CSBM0255 CLONE FOR EVS                    **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  31DEC96  JMG    MODIFICATIONS FOR MAINTAINABILITY          **
557756**  30SEP97  LLE    ENHANCED MULTIPLE LANGUAGE SUPPORT         **
557973**  30SEP97  MSP    AMOUNT FIELD SIZING FOR INTL SUPPORT       **
008453**  31MAR98  552    IMPLEMENT MULTIPLE EXTERNAL DATE FORMAT    **
008455**  31MAR98  552    EXTENSIVE NUMERIC FORMATTING               **
010311**  30OCT98  56     CHANGED VERSION TO 5.6                     **
010418**  30OCT98  56     MULTI-COMPANY                              **
011652**  30OCT98  56     REPLACE COPYBOOK CCWWHDG WITH XCWWHDG      **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
010311**  30OCT98  56     VARIABLE VSAM-RETURN REMOVED               **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017150**  09FEB01  612J   CURRENCY SCALING                           **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       CONFIGURATION SECTION.
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       COPY CCSSPRT1.
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       COPY CCSDPRT1.
       COPY CCSRPRT1.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'VSBM1200'.
 
       COPY SQLCA.
 
       01  MS-LANG-USED                           PIC 9 VALUE 1.
 
       01  WS-CONTROL-RECORD.
           02  FILLER                             PIC X(7).
008453*    02  RUN-DATE                           PIC X(9).
008453     02  RUN-DATE                           PIC X(10).
008453*    02  VAL-DATE                           PIC X(9).
008453     02  VAL-DATE                           PIC X(10).
           02  REP-TYPE                           PIC X.
               88 VALID-REP-TYPE   VALUES 'D' 'S'.
               88 DETAIL-NEEDED    VALUE 'D'.
008453*    02  FILLER                             PIC X(54).
008453     02  FILLER                             PIC X(52).
 
       01  WORK-AREAS-DISPLAY.
           03  WS-EOF-SW   VALUE 'N'              PIC X.
               88  PREMDUE-FILE-EMPTY       VALUES 'Y'.
 
 
       01  WORK-AREAS-COMP.
           03  TOT-SUB                            PIC S9(4) COMP.
           03  TOT-SUB-PLUS-ONE                   PIC S9(4) COMP.
           03  PAGE-NUMBER   VALUE ZERO           PIC S9(4) COMP.
           03  LINE-NUMBER   VALUE +56            PIC S9(4) COMP.
 
       01  TOTAL-FIELDS.
           03  TOTAL-POLICY-COUNT OCCURS 3  PIC S9(7)     COMP-3.
557973*    03  TOTAL-PREM-DUE-1ST OCCURS 3  PIC S9(11)V99 COMP-3.
557973     03  TOTAL-PREM-DUE-1ST OCCURS 3  PIC S9(13)V99 COMP-3.
557973*    03  TOTAL-PREM-DUE-REN OCCURS 3  PIC S9(11)V99 COMP-3.
557973     03  TOTAL-PREM-DUE-REN OCCURS 3  PIC S9(13)V99 COMP-3.
557973*    03  TOTAL-PREM-ADV-1ST OCCURS 3  PIC S9(11)V99 COMP-3.
557973     03  TOTAL-PREM-ADV-1ST OCCURS 3  PIC S9(13)V99 COMP-3.
557973*    03  TOTAL-PREM-ADV-REN OCCURS 3  PIC S9(11)V99 COMP-3.
557973     03  TOTAL-PREM-ADV-REN OCCURS 3  PIC S9(13)V99 COMP-3.
557973*    03  TOTAL-NET          OCCURS 3  PIC S9(11)V99 COMP-3.
557973     03  TOTAL-NET          OCCURS 3  PIC S9(13)V99 COMP-3.
      /
       01  WS-PH1-TITLE.
           03  FILLER                            PIC X(16)
               VALUE 'VALUATION AS AT '.
008453*    03  PH1-VAL-DATE                      PIC X(9).
008453     03  PH1-VAL-DATE                      PIC X(10).
008453*    03  FILLER        VALUE SPACES        PIC X(3).
008453     03  FILLER        VALUE SPACES        PIC X(2).
           03  FILLER                            PIC X(22)
               VALUE 'DUE & ADVANCE PREMIUMS'.
      /
       01  P-HEAD-LINE-2.
           03  FILLER                      PIC X(20)
               VALUE ' LINE OF BUSINESS - '.
           03  PH2-LOB                     PIC X.
           03  FILLER                      PIC X(20)
               VALUE '              PAR - '.
           03  PH2-PAR                     PIC X.
           03  FILLER                      PIC X(90)
               VALUE SPACES.
 
       01  P-HEAD-LINE-3.
           03  FILLER                      PIC X(22)
008455*        VALUE '  POLICY    RD  MD    '.
008455         VALUE '  POLICY    RD MD     '.
           03  FILLER                      PIC X(20)
008455*        VALUE 'RD MODE      ISSUE  '.
008455         VALUE 'ISSUE      PAID TO  '.
           03  FILLER                      PIC X(20)
008455*        VALUE '   PAID TO     ADJUS'.
008455         VALUE '  ADJUSTED        PA'.
           03  FILLER                      PIC X(20)
008455*        VALUE 'TED      PREMIUMS DU'.
008455         VALUE 'YMENTS DUE        PA'.
           03  FILLER                      PIC X(20)
008455*        VALUE 'E        PREMIUMS PA'.
008455         VALUE 'YMENTS DUE          '.
           03  FILLER                      PIC X(20)
008455*        VALUE 'ID IN ADV.          '.
008455         VALUE '   PAYMENTS PAID IN '.
           03  FILLER                      PIC X(10)
008455*        VALUE SPACES.
008455         VALUE 'ADVANCE   '.
 
       01  P-HEAD-LINE-4.
           03  FILLER                      PIC X(22)
               VALUE '  NUMBER    NO        '.
           03  FILLER                      PIC X(20)
008455*        VALUE 'PREMIUM      DATE   '.
008455         VALUE 'DATE        DATE    '.
           03  FILLER                      PIC X(20)
008455*        VALUE '    DATE        DATE'.
008455         VALUE '    DATE            '.
           03  FILLER                      PIC X(20)
008455*        VALUE '      FIRST YR.    R'.
008455         VALUE ' FIRST YR.          '.
           03  FILLER                      PIC X(20)
008455*        VALUE 'ENEWAL   FIRST YR.  '.
008455         VALUE '   RENEWAL          '.
           03  FILLER                      PIC X(20)
008455*        VALUE '   RENEWAL          '.
008455         VALUE ' FIRST YR.          '.
           03  FILLER                      PIC X(10)
008455*        VALUE SPACES.
008455         VALUE '   RENEWAL'.
      /
       01  P-STATEMENT-LINE.
           03  FILLER                      PIC X(01).
           03  P-POLICY-NUMBER             PIC X(10).
           03  FILLER                      PIC X(01).
           03  P-TRAILER-NUMBER            PIC 99.
008455*    03  FILLER                      PIC X(02).
008455     03  FILLER                      PIC X(01).
           03  P-MODX                      PIC X(02).
008455*    03  FILLER                      PIC X(03).
008455     03  FILLER                      PIC X(01).
008455*    03  P-MODE-PREMIUM              PIC ZZ,ZZZ.99.
008455*    03  FILLER                      PIC X(03).
008453*    03  P-ISSUE-DATE                PIC X(09).
008453     03  P-ISSUE-DATE                PIC X(10).
008453*    03  FILLER                      PIC X(03).
008453     03  FILLER                      PIC X(02).
008453*    03  P-PAID-TO-DATE              PIC X(09).
008453     03  P-PAID-TO-DATE              PIC X(10).
008453*    03  FILLER                      PIC X(03).
008453     03  FILLER                      PIC X(02).
008453*    03  P-ADJUSTED-DATE             PIC X(09).
008453     03  P-ADJUSTED-DATE             PIC X(10).
008455*    03  FILLER                      PIC X(03).
008455*    03  P-DUE-1ST                   PIC ZZ,ZZZ.99.
008455     03  P-DUE-1ST-X                 PIC X(20).
008455*    03  FILLER                      PIC X(03).
008455*    03  P-DUE-REN                   PIC ZZ,ZZZ.99.
008455     03  P-DUE-REN-X                 PIC X(20).
008455*    03  FILLER                      PIC X(03).
008455*    03  P-ADV-1ST                   PIC ZZ,ZZZ.99.
008455     03  P-ADV-1ST-X                 PIC X(20).
008455*    03  FILLER                      PIC X(03).
008455*    03  P-ADV-REN                   PIC ZZ,ZZZ.99.
008455     03  P-ADV-REN-X                 PIC X(20).
008455*    03  FILLER                      PIC X(18).
 
 
       01  P-TOTAL-HEADER.
           03  FILLER                      PIC X(11)
               VALUE ' TOTAL FOR '.
           03  P-LOB-DESC                  PIC X(07)
               VALUE '  LOB: '.
           03  P-TOTAL-LOB                 PIC X.
           03  P-PAR-DESC                  PIC X(07)
               VALUE '  PAR: '.
           03  P-TOTAL-PAR                 PIC X.
           03  FILLER                      PIC X(13)
008455*        VALUE '    DUE 1ST Y'.
008455         VALUE '      DUE 1ST'.
           03  FILLER                      PIC X(20)
008455*        VALUE 'EAR    DUE  RENEWAL '.
008455         VALUE ' YEAR        DUE  RE'.
           03  FILLER                      PIC X(20)
008455*        VALUE '   ADV 1ST YEAR    A'.
008455         VALUE 'NEWAL        ADV 1ST'.
           03  FILLER                      PIC X(20)
008455*        VALUE 'DV  RENEWAL        N'.
008455         VALUE ' YEAR        ADV  RE'.
           03  FILLER                      PIC X(20)
008455*        VALUE 'ET         POLICIES '.
008455         VALUE 'NEWAL              N'.
           03  FILLER                      PIC X(12)
008455*        VALUE SPACES.
008455         VALUE 'ET  POLICIES'.
 
       01  P-TOTAL-VALUE-LINE.
008455*    03  FILLER                      PIC X(31).
008455     03  FILLER                      PIC X(25).
008455*    03  P-TOT-DUE-1ST               PIC Z,ZZZ,ZZZ.99.
008455     03  P-TOT-DUE-1ST-X             PIC X(20).
008455*    03  FILLER                      PIC X(04).
008455*    03  P-TOT-DUE-REN               PIC Z,ZZZ,ZZZ.99.
008455     03  P-TOT-DUE-REN-X             PIC X(20).
008455*    03  FILLER                      PIC X(04).
008455*    03  P-TOT-ADV-1ST               PIC Z,ZZZ,ZZZ.99.
008455     03  P-TOT-ADV-1ST-X             PIC X(20).
008455*    03  FILLER                      PIC X(04).
008455*    03  P-TOT-ADV-REN               PIC Z,ZZZ,ZZZ.99.
008455     03  P-TOT-ADV-REN-X             PIC X(20).
008455*    03  FILLER                      PIC X(04).
008455*    03  P-NET                       PIC Z,ZZZ,ZZZ.99.
008455     03  P-NET-X                     PIC X(20).
008455*    03  FILLER                      PIC X(05).
008455     03  FILLER                      PIC X(01).
008455*    03  P-POLICY-COUNT              PIC ZZ,ZZZ.99.
008455     03  P-POLICY-COUNT-X            PIC X(06).
008455*    03  FILLER                      PIC X(20).
      /
       01  SAVED-KEY.
           03  SAVED-LOB                   PIC X.
           03  SAVED-PAR                   PIC X.
 
       01  CURRENT-KEY.
           03  CURRENT-LOB                 PIC X.
           03  CURRENT-PAR                 PIC X.
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
       COPY CCWWCCC.
      /
 
010311 COPY XCFWXTAB.
010311 COPY XCFRXTAB.
 
       COPY XCWWWKDT.
      /
       COPY XCWLDTLK.
      /
       COPY XCWL1640.
      /
       COPY XCWTFCMD.
      /
557756*COPY VCWWHDG.
011652*COPY CCWWHDG.
011652 COPY XCWWHDG.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY VCSW1200.
       COPY VCSR1200.
      /
       COPY CCSWPRT1.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
P02229 COPY XCWL0035.

54-001 COPY CCWL0010.
      /
       COPY CCWL0950.
      /
014590*COPY XCWL0030.
      /
       COPY XCWL0040.
      /
008455 COPY XCWL0290.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.
 
           PERFORM  0200-INITIALIZE
               THRU 0200-INITIALIZE-X.
 
           PERFORM  1000-PROCESS
               THRU 1000-PROCESS-X
               UNTIL PREMDUE-FILE-EMPTY.
 
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.
 
P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.
 
       0000-MAINLINE-X.
           EXIT.
 
      *----------------
       0100-OPEN-FILES.
      *-----------------
 
           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.
 
           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
 
           PERFORM  1200-1000-OPEN-INPUT
               THRU 1200-1000-OPEN-INPUT-X.
 
           PERFORM  PRT1-3000-OPEN-OUTPUT
               THRU PRT1-3000-OPEN-OUTPUT-X.
 
       0100-OPEN-FILES-X.
           EXIT.
 
 
      *----------------
       0200-INITIALIZE.
      *-----------------
 
54-001     PERFORM  CCC-1000-PRCES-CO-CTL-CARD
54-001         THRU CCC-1000-PRCES-CO-CTL-CARD-X.
 
           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.
007684     IF  WBCF-SEQ-IO-EOF
               MOVE 'VS12000001'   TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.
 
007684     MOVE RBCF-SEQ-REC-INFO  TO WS-CONTROL-RECORD.
008453*    MOVE VAL-DATE           TO PH1-VAL-DATE.
008453     MOVE VAL-DATE           TO L1640-EXTERNAL-DATE.
008453     PERFORM  1640-6000-CTL-CARD-TO-INT
008453         THRU 1640-6000-CTL-CARD-TO-INT-X.
008453     IF  L1640-VALID
008453         PERFORM  1640-2000-INTERNAL-TO-EXT
008453             THRU 1640-2000-INTERNAL-TO-EXT-X
008453         MOVE L1640-EXTERNAL-DATE    TO PH1-VAL-DATE
008453     ELSE
008453         MOVE SPACES                 TO PH1-VAL-DATE
008453     END-IF.
 
           IF  NOT VALID-REP-TYPE
               MOVE 'VS12000002'   TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.
 
           IF  DETAIL-NEEDED
011652*        MOVE 'DETAIL '      TO HDG1-MISC
011652         MOVE 'DETAIL '          TO WHDG-PAGE-TITLE
           ELSE
011652*        MOVE 'SUMMARY'      TO HDG1-MISC
011652         MOVE 'SUMMARY'          TO WHDG-PAGE-TITLE
           END-IF.
54-001     PERFORM  0950-0000-INIT-PARM-INFO
54-001         THRU 0950-0000-INIT-PARM-INFO-X.
 
010418*    MOVE 'C'                TO L0950-COMPANY-REPORT-SW.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
 
011652*    MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
011652***** GET THE SYSTEM ID
011652     MOVE 'XS00000145'           TO WGLOB-MSG-REF-INFO.
011652     PERFORM  0260-2000-GET-MESSAGE
011652         THRU 0260-2000-GET-MESSAGE-X.
011652     MOVE WGLOB-MSG-TXT          TO L0040-SYSTEM-ID.
011652     MOVE WGLOB-MSG-TXT          TO WHDG-SYSTEM-ID.
 
           MOVE L0950-COMPANY-NAME     TO L0040-COMPANY-NAME.
           MOVE ZERO                   TO L0040-ERROR-CNT.
           MOVE SPACES                 TO L0040-PROGRAM-DESC.
011652*    MOVE 'ERROR MESSAGES '  TO L0040-HDG-LINE-3.
011652***** GET THE DETAIL HEADINGS 'ERROR MESSAGES'
011652     MOVE 'XS00000019'           TO WGLOB-MSG-REF-INFO.
011652     PERFORM  0260-2000-GET-MESSAGE
011652         THRU 0260-2000-GET-MESSAGE-X.
011652     MOVE WGLOB-MSG-TXT          TO L0040-HDG-LINE-3.
 
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
 
010311     PERFORM  VRSN-1000-EDIT
010311         THRU VRSN-1000-EDIT-X.
 
011652*    MOVE RXTAB-ETBL-DESC-TXT    TO HDG1-INGENIUM.
 
011652*    MOVE L0950-COMPANY-NAME TO HDG1-COMPANY.
011652*    MOVE 'VSBM1200'         TO HDG2-PROGRAM.
011652*    MOVE WS-PH1-TITLE       TO HDG2-TITLE.
011652*    MOVE L0950-COMPANY-DATE TO HDG2-DATE.
011652*    MOVE L0950-COMPANY-TIME TO HDG2-TIME.
011652* THIS PARAGRAPH INITIALIZES THE DATE, TIME AND PAGE TITLES
011652     PERFORM  HDG-1000-INIT-CONSTANTS
011652         THRU HDG-1000-INIT-CONSTANTS-X.
011652     MOVE L0950-COMPANY-NAME     TO WHDG-COMPANY-NAME.
011652*USE THE WORKING STORAGE VARIABLE INSTEAD OF HARD CODING
011652*THE PROGRAM NAME
011652     MOVE WPGWS-CRNT-PGM-ID      TO WHDG-PROGRAM-ID.
011652     MOVE WS-PH1-TITLE           TO WHDG-REPORT-TITLE.
011652     MOVE L0950-COMPANY-DATE     TO WHDG-DATE.
011652     MOVE L0950-COMPANY-TIME     TO WHDG-TIME.
 
008455     PERFORM  0290-1000-BUILD-PARM-INFO
008455         THRU 0290-1000-BUILD-PARM-INFO-X.
 
           PERFORM  0250-ZERO-TOTALS
               THRU 0250-ZERO-TOTALS-X
               VARYING TOT-SUB FROM 1 BY 1
               UNTIL   TOT-SUB IS GREATER THAN 3.
 
      ***  READ FIRST RECORD
 
           PERFORM  1200-1000-READ
               THRU 1200-1000-READ-X.
 
007684     IF  W1200-SEQ-IO-EOF
               MOVE 'Y'                TO WS-EOF-SW
               MOVE 'VS12000003'       TO WGLOB-MSG-REF-INFO
               MOVE WPGWS-CRNT-PGM-ID  TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
 
           PERFORM  8000-SET-UP-KEYS
               THRU 8000-SET-UP-KEYS-X.
 
           MOVE CURRENT-KEY            TO SAVED-KEY.
 
       0200-INITIALIZE-X.
           EXIT.
 
      *-----------------
       0250-ZERO-TOTALS.
      *-----------------
 
           MOVE ZEROES            TO TOTAL-POLICY-COUNT (TOT-SUB).
           MOVE ZEROES            TO TOTAL-PREM-DUE-1ST (TOT-SUB).
           MOVE ZEROES            TO TOTAL-PREM-DUE-REN (TOT-SUB).
           MOVE ZEROES            TO TOTAL-PREM-ADV-1ST (TOT-SUB).
           MOVE ZEROES            TO TOTAL-PREM-ADV-REN (TOT-SUB).
           MOVE ZEROES            TO TOTAL-NET (TOT-SUB).
 
       0250-ZERO-TOTALS-X.
           EXIT.
      /
      *---------------
       1000-PROCESS.
      *---------------
 
           IF  CURRENT-KEY NOT = SAVED-KEY
               PERFORM  1500-CONTROL-BREAK
                   THRU 1500-CONTROL-BREAK-X
           END-IF.
 
           IF  DETAIL-NEEDED
               PERFORM  8400-WRITE-LINE
                   THRU 8400-WRITE-LINE-X
           END-IF.
 
           PERFORM  8500-INCREMENT-TOTALS
               THRU 8500-INCREMENT-TOTALS-X.
 
      *** READ NEXT RECORD.
 
           PERFORM  1200-1000-READ
               THRU 1200-1000-READ-X.
 
007684     IF  W1200-SEQ-IO-EOF
               MOVE 'Y'           TO WS-EOF-SW
               PERFORM  8100-PRINT-PAR-TOTALS
                   THRU 8100-PRINT-PAR-TOTALS-X
               PERFORM  8200-PRINT-LOB-TOTALS
                   THRU 8200-PRINT-LOB-TOTALS-X
               PERFORM  8300-PRINT-GRAND-TOTALS
                   THRU 8300-PRINT-GRAND-TOTALS-X
               GO TO 1000-PROCESS-X
           END-IF.
 
           PERFORM  8000-SET-UP-KEYS
               THRU 8000-SET-UP-KEYS-X.
 
       1000-PROCESS-X.
           EXIT.
 
      *---------------------------------
       1500-CONTROL-BREAK.
      *---------------------------------
 
           IF  CURRENT-LOB NOT = SAVED-LOB
               PERFORM  8100-PRINT-PAR-TOTALS
                   THRU 8100-PRINT-PAR-TOTALS-X
               PERFORM  8200-PRINT-LOB-TOTALS
                   THRU 8200-PRINT-LOB-TOTALS-X
               PERFORM  0250-ZERO-TOTALS
                   THRU 0250-ZERO-TOTALS-X
                   VARYING TOT-SUB FROM 1 BY 1
                   UNTIL   TOT-SUB GREATER THAN 2
               MOVE CURRENT-KEY   TO SAVED-KEY
               MOVE 56            TO LINE-NUMBER
               GO TO 1500-CONTROL-BREAK-X
           END-IF.
 
           IF  CURRENT-PAR NOT = SAVED-PAR
               PERFORM  8100-PRINT-PAR-TOTALS
                   THRU 8100-PRINT-PAR-TOTALS-X
               PERFORM  0250-ZERO-TOTALS
                   THRU 0250-ZERO-TOTALS-X
                   VARYING TOT-SUB FROM 1 BY 1
                   UNTIL   TOT-SUB GREATER THAN 1
               MOVE CURRENT-KEY   TO SAVED-KEY
               MOVE 56            TO LINE-NUMBER
               GO TO 1500-CONTROL-BREAK-X
           END-IF.
 
       1500-CONTROL-BREAK-X.
           EXIT.
      /
      *-----------------
       8000-SET-UP-KEYS.
      *-----------------
 
           MOVE R1200-LOB         TO CURRENT-LOB.
           MOVE R1200-PAR         TO CURRENT-PAR.
 
       8000-SET-UP-KEYS-X.
           EXIT.
      *----------------------
       8100-PRINT-PAR-TOTALS.
      *----------------------
 
           MOVE SAVED-LOB         TO P-TOTAL-LOB.
           MOVE SAVED-PAR         TO P-TOTAL-PAR.
           MOVE '  LOB: '         TO P-LOB-DESC.
           MOVE '  PAR: '         TO P-PAR-DESC.
           MOVE 1                 TO TOT-SUB.
           MOVE 2                 TO TOT-SUB-PLUS-ONE.
 
           PERFORM  8600-WRITE-DETAIL-TOTAL
               THRU 8600-WRITE-DETAIL-TOTAL-X.
 
           PERFORM  8700-ADD-TO-NEXT-LEVEL
               THRU 8700-ADD-TO-NEXT-LEVEL-X.
 
       8100-PRINT-PAR-TOTALS-X.
           EXIT.
      /
      *----------------------
       8200-PRINT-LOB-TOTALS.
      *----------------------
 
           MOVE SAVED-LOB         TO P-TOTAL-LOB.
           MOVE '  LOB: '         TO P-LOB-DESC.
           MOVE SPACES            TO P-TOTAL-PAR.
           MOVE SPACES            TO P-PAR-DESC.
           MOVE 2                 TO TOT-SUB
           MOVE 3                 TO TOT-SUB-PLUS-ONE.
 
           PERFORM  8600-WRITE-DETAIL-TOTAL
               THRU 8600-WRITE-DETAIL-TOTAL-X.
 
           PERFORM  8700-ADD-TO-NEXT-LEVEL
               THRU 8700-ADD-TO-NEXT-LEVEL-X.
 
       8200-PRINT-LOB-TOTALS-X.
           EXIT.
      /
 
      *------------------------
       8300-PRINT-GRAND-TOTALS.
      *------------------------
 
           MOVE SAVED-LOB         TO P-TOTAL-LOB.
           MOVE ' GRAND '         TO P-LOB-DESC.
           MOVE SPACES            TO P-TOTAL-PAR.
           MOVE SPACES            TO P-PAR-DESC.
           MOVE 3                 TO TOT-SUB.
 
           PERFORM  8600-WRITE-DETAIL-TOTAL
               THRU 8600-WRITE-DETAIL-TOTAL-X.
 
       8300-PRINT-GRAND-TOTALS-X.
           EXIT.
      /
      *----------------
       8400-WRITE-LINE.
      *----------------
 
           IF  LINE-NUMBER GREATER THAN 55
               PERFORM  8450-WRITE-DETAIL-HEADING
                   THRU 8450-WRITE-DETAIL-HEADING-X
           END-IF.
 
           ADD 1                         TO LINE-NUMBER.
           MOVE SPACES                   TO P-STATEMENT-LINE.
           MOVE R1200-POLICY             TO P-POLICY-NUMBER.
           MOVE R1200-RIDER-NUM          TO P-TRAILER-NUMBER.
 
           MOVE R1200-ISSUE-DATE         TO L1640-INTERNAL-DATE.
           PERFORM  1640-2000-INTERNAL-TO-EXT
               THRU 1640-2000-INTERNAL-TO-EXT-X.
           IF  L1640-VALID
               MOVE L1640-EXTERNAL-DATE  TO P-ISSUE-DATE
           ELSE
               MOVE '*INVALID*'          TO P-ISSUE-DATE
           END-IF.
 
           MOVE R1200-PAID-TO-DATE       TO L1640-INTERNAL-DATE.
           PERFORM  1640-2000-INTERNAL-TO-EXT
               THRU 1640-2000-INTERNAL-TO-EXT-X.
           IF  L1640-VALID
               MOVE L1640-EXTERNAL-DATE  TO P-PAID-TO-DATE
           ELSE
               MOVE '*INVALID*'          TO P-PAID-TO-DATE
           END-IF.
 
           MOVE R1200-ADJUSTED-DATE      TO L1640-INTERNAL-DATE.
           PERFORM  1640-2000-INTERNAL-TO-EXT
               THRU 1640-2000-INTERNAL-TO-EXT-X.
           IF  L1640-VALID
               MOVE L1640-EXTERNAL-DATE  TO P-ADJUSTED-DATE
           ELSE
               MOVE '*INVALID*'          TO P-ADJUSTED-DATE
           END-IF.
 
           MOVE R1200-MODX               TO P-MODX.
 
008455*    MOVE R1200-MODE-PREMIUM       TO P-MODE-PREMIUM.
 
008455*    MOVE R1200-DUE-F              TO P-DUE-1ST.
008455***** OUTPUT FORMAT : Z,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              R1200-DUE-F *  100
017150               R1200-DUE-F *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-DUE-1ST-X      TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-DUE-1ST-X.
 
008455*    MOVE R1200-DUE-R              TO P-DUE-REN.
008455***** OUTPUT FORMAT : Z,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              R1200-DUE-R *  100
017150               R1200-DUE-R *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-DUE-REN-X      TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-DUE-REN-X.
 
008455*    MOVE R1200-ADV-F              TO P-ADV-1ST.
008455***** OUTPUT FORMAT : Z,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              R1200-ADV-F *  100
017150               R1200-ADV-F *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-ADV-1ST-X      TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-ADV-1ST-X.
 
008455*    MOVE R1200-ADV-R              TO P-ADV-REN.
008455***** OUTPUT FORMAT : Z,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              R1200-ADV-R *  100
017150               R1200-ADV-R *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-ADV-REN-X      TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-ADV-REN-X.
 
           MOVE +1                       TO WPRT1-NUMBER-LINES.
007684     MOVE P-STATEMENT-LINE         TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
       8400-WRITE-LINE-X.
           EXIT.
      /
      *--------------------------
       8450-WRITE-DETAIL-HEADING.
      *---------------------------
 
           ADD 1                  TO PAGE-NUMBER.
011652*    MOVE PAGE-NUMBER       TO HDG1-PAGE.
011652     MOVE PAGE-NUMBER            TO WHDG-PAGE.
 
011652*    MOVE HEADING-LINE-1    TO RPRT1-REC-INFO.
007684     MOVE WHDG-LINE-1            TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-2000-WRITE
               THRU PRT1-2000-WRITE-X.
 
           MOVE +2                     TO WPRT1-NUMBER-LINES.
011652*    MOVE HEADING-LINE-2    TO RPRT1-REC-INFO.
007684     MOVE WHDG-LINE-2            TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
           PERFORM  8800-SET-UP-P-HEAD-LINE-2
               THRU 8800-SET-UP-P-HEAD-LINE-2-X.
 
           MOVE +2                     TO WPRT1-NUMBER-LINES.
007684     MOVE P-HEAD-LINE-2          TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
           MOVE +2                     TO WPRT1-NUMBER-LINES.
007684     MOVE P-HEAD-LINE-3          TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
           MOVE +1                     TO WPRT1-NUMBER-LINES.
007684     MOVE P-HEAD-LINE-4          TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
           MOVE +1                     TO WPRT1-NUMBER-LINES.
007684     MOVE SPACES                 TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
           MOVE 10                     TO LINE-NUMBER.
 
       8450-WRITE-DETAIL-HEADING-X.
           EXIT.
 
      *----------------------
       8500-INCREMENT-TOTALS.
      *----------------------
 
           ADD 1                       TO TOTAL-POLICY-COUNT (1).
           ADD R1200-DUE-F             TO TOTAL-PREM-DUE-1ST (1).
           ADD R1200-DUE-R             TO TOTAL-PREM-DUE-REN (1).
           ADD R1200-ADV-F             TO TOTAL-PREM-ADV-1ST (1).
           ADD R1200-ADV-R             TO TOTAL-PREM-ADV-REN (1).
           ADD R1200-DUE-F R1200-DUE-R TO TOTAL-NET (1).
           SUBTRACT R1200-ADV-F R1200-ADV-R FROM TOTAL-NET (1).
 
       8500-INCREMENT-TOTALS-X.
           EXIT.
      /
      *------------------------
       8600-WRITE-DETAIL-TOTAL.
      *-------------------------
 
           IF  LINE-NUMBER GREATER THAN 50
               PERFORM  8450-WRITE-DETAIL-HEADING
                   THRU 8450-WRITE-DETAIL-HEADING-X
           END-IF.
 
           MOVE +2                TO WPRT1-NUMBER-LINES.
007684     MOVE P-TOTAL-HEADER    TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
           MOVE SPACES            TO P-TOTAL-VALUE-LINE.
 
008455*    MOVE TOTAL-POLICY-COUNT (TOT-SUB) TO P-POLICY-COUNT.
008455***** OUTPUT FORMAT : ZZ,ZZZ
008455     MOVE TOTAL-POLICY-COUNT (TOT-SUB) TO L0290-INPUT-NUMBER.
008455     MOVE ZEROS                        TO L0290-PRECISION.
008455     MOVE LENGTH OF P-POLICY-COUNT-X   TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS           TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY       TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA            TO P-POLICY-COUNT-X.
 
008455*    MOVE TOTAL-PREM-DUE-1ST (TOT-SUB) TO P-TOT-DUE-1ST.
008455***** OUTPUT FORMAT : ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              TOTAL-PREM-DUE-1ST(TOT-SUB) *  100
017150               TOTAL-PREM-DUE-1ST(TOT-SUB) *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-TOT-DUE-1ST-X  TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-TOT-DUE-1ST-X.
 
008455*    MOVE TOTAL-PREM-DUE-REN (TOT-SUB) TO P-TOT-DUE-REN.
008455***** OUTPUT FORMAT : ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              TOTAL-PREM-DUE-REN(TOT-SUB) *  100
017150               TOTAL-PREM-DUE-REN(TOT-SUB) *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-TOT-DUE-REN-X  TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-TOT-DUE-REN-X.
 
008455*    MOVE TOTAL-PREM-ADV-1ST (TOT-SUB) TO P-TOT-ADV-1ST.
008455***** OUTPUT FORMAT : ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              TOTAL-PREM-ADV-1ST(TOT-SUB) *  100
017150               TOTAL-PREM-ADV-1ST(TOT-SUB) *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-TOT-ADV-1ST-X  TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-TOT-ADV-1ST-X.
 
008455*    MOVE TOTAL-PREM-ADV-REN (TOT-SUB) TO P-TOT-ADV-REN.
008455***** OUTPUT FORMAT : ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              TOTAL-PREM-ADV-REN(TOT-SUB) *  100
017150               TOTAL-PREM-ADV-REN(TOT-SUB) *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-TOT-ADV-REN-X  TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-TOT-ADV-REN-X.
 
008455*    MOVE TOTAL-NET          (TOT-SUB) TO P-NET.
008455***** OUTPUT FORMAT : ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.99
008455     COMPUTE L0290-INPUT-NUMBER = 
017150*              TOTAL-NET(TOT-SUB) *  100
017150               TOTAL-NET(TOT-SUB) *  L0290-CRCY-MULT-FCT
017150*    MOVE 2                     TO L0290-PRECISION
017150     MOVE WGLOB-CRCY-SCALE-QTY  TO L0290-PRECISION
008455     MOVE LENGTH OF P-NET-X          TO L0290-MAX-OUT-LEN.
008455     SET L0290-SIGN-SUPPRESS         TO TRUE.
008455     SET L0290-THOUSANDS-DISPLAY     TO TRUE.
008455     PERFORM 0290-1000-NUMERIC-FORMAT
008455        THRU 0290-1000-NUMERIC-FORMAT-X.
008455     MOVE L0290-OUTPUT-DATA          TO P-NET-X.
 
           MOVE +2                 TO WPRT1-NUMBER-LINES.
007684     MOVE P-TOTAL-VALUE-LINE TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
           MOVE SPACES            TO P-STATEMENT-LINE.
           MOVE +2                TO WPRT1-NUMBER-LINES.
007684     MOVE P-STATEMENT-LINE  TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
 
           ADD 6                  TO LINE-NUMBER.
 
       8600-WRITE-DETAIL-TOTAL-X.
           EXIT.
      /
      *-----------------------
       8700-ADD-TO-NEXT-LEVEL.
      *------------------------
 
           ADD TOTAL-POLICY-COUNT (TOT-SUB)  TO TOTAL-POLICY-COUNT
                 (TOT-SUB-PLUS-ONE).
           ADD TOTAL-PREM-DUE-1ST (TOT-SUB)  TO TOTAL-PREM-DUE-1ST
                 (TOT-SUB-PLUS-ONE).
           ADD TOTAL-PREM-DUE-REN (TOT-SUB)  TO TOTAL-PREM-DUE-REN
                 (TOT-SUB-PLUS-ONE).
           ADD TOTAL-PREM-ADV-1ST (TOT-SUB)  TO TOTAL-PREM-ADV-1ST
                 (TOT-SUB-PLUS-ONE).
           ADD TOTAL-PREM-ADV-REN (TOT-SUB)  TO TOTAL-PREM-ADV-REN
                 (TOT-SUB-PLUS-ONE).
           ADD TOTAL-NET (TOT-SUB)           TO TOTAL-NET
                 (TOT-SUB-PLUS-ONE).
 
       8700-ADD-TO-NEXT-LEVEL-X.
           EXIT.
 
      *--------------------------
       8800-SET-UP-P-HEAD-LINE-2.
      *---------------------------
 
           MOVE R1200-LOB            TO PH2-LOB.
           MOVE R1200-PAR            TO PH2-PAR.
 
       8800-SET-UP-P-HEAD-LINE-2-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *------------------
 
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
 
           PERFORM  1200-4000-CLOSE
               THRU 1200-4000-CLOSE-X.
 
           PERFORM  PRT1-4000-CLOSE
               THRU PRT1-4000-CLOSE-X.
 
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
 
       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS
      ****************************************************************
       COPY CCPPCCC.
011652/
011652 COPY XCPPHDG.
      /
54-001 COPY CCPS0010.
      /
54-001 COPY CCPS0950.
      /
010311 COPY XCPEVRSN.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS
      ****************************************************************
P02229 COPY XCPL0035.

54-001 COPY CCPL0010.
      /
       COPY CCPL0950.
      /
       COPY XCPL0260.
      /
008455 COPY XCPS0290.
008455 COPY XCPL0290.
      /
       COPY XCPL0040.
      /
       COPY XCPL1640.
 
      ****************************************************************
      *  FILE I/O PROCESS MODULES
      ****************************************************************
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY VCPL1200.
       COPY VCPO1200.
       COPY VCPN1200.
      /
       COPY CCPIPRT1.
      /
010311 COPY XCPNXTAB.
      /
      ****************************************************************
      *  ERROR HANDLING ROUTINES
      ****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                   END OF PROGRAM VSBM1200                   **
      *****************************************************************
 
 
      ******************************************************************
      *
      *
