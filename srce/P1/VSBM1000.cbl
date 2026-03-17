      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. VSBM1000.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : VSBM1000                                          **
      **  REMARKS: VALUATION EXTRACT                                 **
      **                                                             **
      ** DOMAIN  : AT                                                **
      ** CLASS   : PD                                                **
      *****************************************************************
      **  DATE     AUTHOR DESCRIPTION                                **
      **                                                             **
52-047**  30NOV94  SLB    GLOBAL NAME CHANGE                         **
52-061**  30NOV94  SLB    REMOVE UNUSED CFCO COPYBOOKS               **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  31DEC96  JG     MODIFICATIONS FOR MAINTAINABILITY          **
54-900**  31DEC96  MHB    ADD SUBSCRIPT                              **
557659**  30SEP97  SC     DATA ARCHITECTURE MODIFICATIONS            **
557660**  30SEP97  JT     CODE CLEANUP                               **
557973**  30SEP97  MSP    AMOUNT FIELD SIZING FOR INTL SUPPORT       **
557756**  30SEP97  LLE    ENHANCED MULTIPLE LANGUAGE SUPPORT         **
008453**  31MAR98  552    MULTIPLE EXTERNAL DATE FORMATS             **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
010302**  30OCT98  56     REMOVE PREMIUM RATE CODE, UNUSED PH FIELDS **
010311**  30OCT98  56     CHANGED VERSION TO 5.6                     **
010314**  30OCT98  56     ALLOW EQUITY INDEXED PRODUCTS TO CONTINUE  **
010418**  30OCT98  56     MULTI-COMPANY                              **
011652**  30OCT98  56     REPLACE COPYBOOK CCWWHDG WITH XCWWHDG      **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014591**  15DEC99  60     COMBINE TWO PART FIELDS                    **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
015543**  15DEC99  60     CODE CLEANUP                               **
017205**  09FEB01  612J   REPORT TRANSLATION                         **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

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
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSBM1000'.


       COPY SQLCA.

014590*COPY XCWL0030.
      /

010311 COPY XCFWXTAB.
010311 COPY XCFRXTAB.

       COPY XCWTFCMD.
      /
       COPY CCWWCCC.
      /
       01  MISC-WORK-AREA.
           03  WS-EXTRACT-WRITE-IND      PIC X     VALUE  'N'.
               88  EXTRACT-NOT-WRITTEN             VALUE  'N'.
               88  EXTRACT-WRITTEN                 VALUE  'Y'.
           03  WS-ACCESS-ERR-SW          PIC X     VALUE  'N'.
               88  ACCESS-ERRORS                   VALUE  'Y'.
           03  WS-1ST-TIME-IND           PIC X     VALUE  'N'.
               88  WS-1ST-TIME-IN                  VALUE  'Y'.
           03  WS-CF-1ST-TIME-IND        PIC X     VALUE  'N'.
               88  WS-CF-1ST-TIME-IN               VALUE  'Y'.
           03  WS-1ST-GIA-WRITE-IND      PIC X     VALUE  'N'.
               88  WS-1ST-GIA-WRITE                VALUE  'Y'.
           03  WS-BASE-WRITTEN-SW        PIC X     VALUE  'N'.
               88  WS-BASE-WRITTEN                 VALUE  'Y'.
               88  WS-BASE-NOT-WRITTEN             VALUE  'N'.

           03  R1200-RECORDS-OUT         PIC S9(9) COMP-3 VALUE +0.
           03  R1100-RECORDS-OUT         PIC S9(9) COMP-3 VALUE +0.
           03  WS-RI-MODE                PIC 9(2)  VALUE  12.
010302*    03  WS-PH-BAND-NUMBER         PIC X(2)  VALUE  SPACES.

           03  WS-STORE-COMP-TYPE-3      PIC X(3)  VALUE  SPACES.
           03  WS-STORE-COMP-TYPE        PIC X(1)  VALUE  SPACES.
           03  WS-STORE-VALN-LABEL       PIC X(6)  VALUE  SPACES.

           03  WS-COMP-TYPE-3            PIC XXX.
               88  WS-COMP-TYPE-ADE              VALUES  'ADE'.
               88  WS-COMP-TYPE-BAS              VALUE   'BAS'.
               88  WS-COMP-TYPE-ETI              VALUE   'ETI'.
               88  WS-COMP-TYPE-FE               VALUE   'FE '.
               88  WS-COMP-TYPE-MRE              VALUE   'MRE'.
               88  WS-COMP-TYPE-OYT              VALUE   'OYT'.
               88  WS-COMP-TYPE-PUA              VALUE   'PUA'.
               88  WS-COMP-TYPE-RPU              VALUES  'RPU'.
               88  WS-COMP-TYPE-WPE              VALUES  'WPE'.
               88  WS-COMP-TYPE-FE-MRE           VALUES  'FE '  'MRE'.
               88  WS-COMP-TYPE-OYT-PUA          VALUES  'OYT'  'PUA'.
               88  WS-COMP-TYPE-ADE-WPE          VALUES  'ADE'  'WPE'.

           03  WS-HI-DUR-ADJ-PTD         PIC S999.
           03  WS-ATT-AGE-ADJ-PTD        PIC S999.
      /
       01  FILLER.
           03  WS-OFF                    PIC X  VALUE  'N'.
           03  WS-ON                     PIC X  VALUE  'Y'.
      /
       01  FILLER  VALUE 'MISCELLANEOUS WORK AREA '    PIC X(24).

       01  WORK-AREAS-DISPLAY.
           03  ERROR-SW    VALUE 'N'     PIC X.
               88  NO-ERRORS-FOUND  VALUE 'N'.
               88  ERRORS-FOUND     VALUE 'Y'.
           03  I                         PIC S9(8)      COMP.
           03  J                         PIC S9(8)      COMP.
           03  HOLD-RUN-ID               PIC X(01) VALUE '1'.
           03  N20                       PIC S9(8)      COMP.
           03  EDIT-3                    PIC Z,ZZZ,ZZ9.
           03  EDIT-1                    PIC 9(7).
557973*    03  DUE-F                     PIC S9(5)V99   COMP-3.
557973     03  DUE-F                     PIC S9(11)V99   COMP-3.
557973*    03  DUE-R                     PIC S9(5)V99   COMP-3.
557973     03  DUE-R                     PIC S9(11)V99   COMP-3.
557973*    03  ADV-F                     PIC S9(5)V99   COMP-3.
557973     03  ADV-F                     PIC S9(11)V99   COMP-3.
557973*    03  ADV-R                     PIC S9(5)V99   COMP-3.
557973     03  ADV-R                     PIC S9(11)V99   COMP-3.
      /
       01  WORKING-COUNTERS-COMP3.
           03  POLICIES-READ          VALUE ZERO   PIC S9(7) COMP-3.
           03  SUSPENDED-POLS-READ    VALUE ZERO   PIC S9(7) COMP-3.
           03  POLICIES-NOT-PROCESS   VALUE ZERO   PIC S9(7) COMP-3.
           03  COVS-READ              VALUE ZERO   PIC S9(7) COMP-3.
           03  COVS-NOT-PROCESSED     VALUE ZERO   PIC S9(7) COMP-3.
           03  REINSURANCE-COUNTER    VALUE ZERO   PIC S9(7) COMP-3.
           03  CASH-FLOW-COUNTER      VALUE ZERO   PIC S9(7) COMP-3.
           03  IMM-ANN-COUNTER        VALUE ZERO   PIC S9(7) COMP-3.
           03  AD-COUNTER             VALUE ZERO   PIC S9(7) COMP-3.
           03  BASE-COUNTER           VALUE ZERO   PIC S9(7) COMP-3.
           03  ETI-COUNTER            VALUE ZERO   PIC S9(7) COMP-3.
           03  OYT-COUNTER            VALUE ZERO   PIC S9(7) COMP-3.
           03  PUA-COUNTER            VALUE ZERO   PIC S9(7) COMP-3.
           03  RPU-COUNTER            VALUE ZERO   PIC S9(7) COMP-3.
           03  FE-COUNTER             VALUE ZERO   PIC S9(7) COMP-3.
           03  MRE-COUNTER            VALUE ZERO   PIC S9(7) COMP-3.
           03  WP-COUNTER             VALUE ZERO   PIC S9(7) COMP-3.
           03  TOTAL-COUNTER          VALUE ZERO   PIC S9(7) COMP-3.

       01  WS-TITLE.
017205*    03  FILLER                              PIC X(37) VALUE
017205*        'E.V.S. VALUATION EXTRACT PRINT AS AT '.
017205     03  WS-TITLE-HEADING                    PIC X(37).
008453*    03  WS-TITLE-DATE                       PIC X(9).
008453     03  WS-TITLE-DATE                       PIC X(10).

54-001 01  WS-RI-KEY.
54-001     05  WS-RI-POL-ID                        PIC X(10).
54-001     05  WS-RI-CVG-NUM                       PIC 9(02).
54-001     05  WS-RI-CSN-REC-NUM                   PIC 9(02).

54-001 01  WS-PH-KEY.
54-001     05  WS-PLAN-ID-BASE                     PIC X(05).
54-001     05  WS-PLAN-ID-RS                       PIC X(01).

       01  PRINT-LINE.
           02  FILLER PICTURE X.
           02  PRINT-LIN.
               03  PRINT-DESCRIPTION.
                   05  PRINT-DESC-1      PIC X(30).
                   05  PRINT-NUMBER      PIC Z9.
                   05  PRINT-DESC-2      PIC X(11).
                   05  FILLER            PIC X(07).
               03  PRINT-VALUE-1.
                   05  PRINT-VAL-1       PIC X(11).
                   05  FILLER            PIC X(09).
               03  PRINT-VALUE-2.
                   05  PRINT-VAL-2       PIC X(11).
               03  FILLER                PIC X(51).
           02  PRINT-LIN-R  REDEFINES PRINT-LIN.
               03  FILLER                PIC X(39).
               03  PRINTB                PIC X(11).
               03  FILLER                PIC X(10).
               03  PRINTBB               PIC X(20).
               03  PRINTBB-R    REDEFINES PRINTBB.
                   05  FILLER            PIC X(04).
                   05  PRINT-VAL-3       PIC X(12).
                   05  PRINTC            PIC X(04).
               03  FILLER                PIC X(52).
           02  PRINT-LIN-TOT REDEFINES PRINT-LIN.
               03  PRINT-DESC-4          PIC X(34).
               03  PRINT-VAL-4           PIC Z(8)9.
               03  FILLER                PIC X(89).
      /
       01  WS-CONTROL-RECORD.
           03  FILLER              PIC X(7).
008453*    03  EXTRACT-DATE        PIC X(9).
008453     03  EXTRACT-DATE        PIC X(10).
008453*    03  FILLER              PIC X(64).
008453     03  FILLER              PIC X(63).

       01  DATE-FIELDS.
           05  EXT-DATE.
               07  EXT-YEAR      PICTURE 9999.
               07  FILLER        PICTURE X.
               07  EXT-MONTH     PICTURE 99.
               07  FILLER        PICTURE X.
               07  EXT-DAY       PICTURE 99.
           05  ADJUSTED-PAID-TO-DATE.
               07  ADJ-PTD-YEAR  PICTURE 9999.
               07  FILLER        PICTURE X.
               07  ADJ-PTD-MONTH PICTURE 99.
               07  FILLER        PICTURE X.
               07  ADJ-PTD-DAY   PICTURE 99.
           05  FIRST-ANN.
               07  YEAR-FA       PICTURE 9999.
               07  FILLER        PICTURE X.
               07  MONTH-FA      PICTURE 99.
               07  FILLER        PICTURE X.
               07  DAY-FA        PICTURE 99.

           05  WS-DURATION       PIC     9(7)    VALUE ZERO.
           05  WS-EXPIRY-AGE     PIC     9(7)    VALUE ZERO.
           05  WS-ISSUE-DAT      PIC     X(10) VALUE '0000-00-00'.
           05  WS-RATE-AGE       PIC     9(7)    VALUE ZERO.
           05  WS-CO-MAT-EXP-DATE   PIC  X(10) VALUE '0000-00-00'.
           05  WS-PH-PDUP-DATE   PIC     X(10) VALUE '0000-00-00'.

      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
557756*COPY VCWWHDG.
011652*COPY CCWWHDG.
011652 COPY XCWWHDG.
      /
       COPY CCSWPRT1.
      /
       COPY XCWWWKDT.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************

       COPY VCSW1100.
       COPY VCSR1100.
      /
       COPY VCSW1200.
       COPY VCSR1200.
      /
       COPY VCSW2000.
       COPY VCSR2000.
      /
       COPY VCSWPOLQ.
       COPY VCSRPOLQ.
      /
       COPY VCSWCVGQ.
       COPY VCSRCVGQ.
      /
       COPY VCSWSPOQ.
       COPY VCSRSPOQ.
      /
       COPY VCSWSCVQ.
       COPY VCSRSCVQ.
      /
       COPY CCFWCC.
       COPY CCFRCC.
      /
       COPY CCFWCFLW.
       COPY CCFRCFLW.
      /
       COPY CCFWCVG.
       COPY CCFRCVG.
      /
       COPY CCFWIH.
       COPY CCFRIH.
      /
       COPY CCFWIR.
       COPY CCFRIR.
      /
       COPY CCFWMD.
       COPY CCFRMD.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY CCFWPCOM.
       COPY CCFRPCOM.
      /
       COPY CCFWPH.
       COPY CCFRPH.
      /
       COPY CCFWPOL.
      /
       COPY CCFWQT.
       COPY CCFRQT.
      /
       COPY CCFWRH.
       COPY CCFRRH.
      /
       COPY CCFWRT.
557660*COPY CCFRRT.
      /
010418*COPY CCFRUSER.
      /
       COPY CCFWUV.
       COPY CCFRUV.
      /
       COPY SCFWFC.
       COPY SCFRFC.
      /
       COPY SCFWFD.
       COPY SCFRFD.
      /
       COPY SCFWFH.
       COPY SCFRFH.
      /
       COPY SCFWFR.
       COPY SCFRFR.
      /
       COPY SCFWFS.
       COPY SCFRFS.
      /
       COPY SCFWFV.
       COPY SCFRFV.
      /
       COPY SCFWFX.
       COPY SCFRFX.
      /
       COPY VCFWVL.
       COPY VCFRVL.
      /
       COPY CCFRPOL.
      /
       COPY CCWWCVGS.
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
      /
P02229 COPY XCWL0035.

       COPY XCWL1670.
      /
       COPY XCWL1680.
      /
017205 COPY XCWL2490.
      /
       COPY XCWLDTLK.
      /
       COPY XCWL1640.
      /
54-001 COPY CCWL0010.
      /
54-001 COPY CCWL0386.
      /
       COPY CCWL0950.
      /
       COPY XCWL0040.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.

       COPY CCWLPGA.
      /
       COPY CCWL0182.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

           PERFORM  2000-PROCESS-POLICIES
               THRU 2000-PROCESS-POLICIES-X
007684         UNTIL WPOLQ-SEQ-IO-EOF.

           PERFORM  8000-TERMINATION
               THRU 8000-TERMINATION-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
       0100-OPEN-FILES.

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  POLQ-1000-OPEN-INPUT
               THRU POLQ-1000-OPEN-INPUT-X.

           PERFORM  CVGQ-1000-OPEN-INPUT
               THRU CVGQ-1000-OPEN-INPUT-X.

           PERFORM  SPOQ-1000-OPEN-INPUT
               THRU SPOQ-1000-OPEN-INPUT-X.

           PERFORM  SCVQ-1000-OPEN-INPUT
               THRU SCVQ-1000-OPEN-INPUT-X.

           PERFORM  1100-3000-OPEN-OUTPUT
               THRU 1100-3000-OPEN-OUTPUT-X.

           PERFORM  1200-3000-OPEN-OUTPUT
               THRU 1200-3000-OPEN-OUTPUT-X.

           PERFORM  2000-3000-OPEN-OUTPUT
               THRU 2000-3000-OPEN-OUTPUT-X.

           PERFORM  PRT1-3000-OPEN-OUTPUT
               THRU PRT1-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /

      *-------------------
       1000-INITIALIZE.
      *-------------------

           PERFORM  1100-INITIALIZE-FILES
               THRU 1100-INITIALIZE-FILES-X.

           PERFORM  1200-PRINT-HDR-ERR-REPORT
               THRU 1200-PRINT-HDR-ERR-REPORT-X.

           PERFORM  1900-WRITE-EXTRACT-HDR-REC
               THRU 1900-WRITE-EXTRACT-HDR-REC-X.

           PERFORM  1400-READ-FIRST-POLICY
               THRU 1400-READ-FIRST-POLICY-X.

           PERFORM  1500-INIT-XTRAK-REC-WS
               THRU 1500-INIT-XTRAK-REC-WS-X.

       1000-INITIALIZE-X.
           EXIT.
      /
      *-----------------------
       1100-INITIALIZE-FILES.
      *-----------------------

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.
007684     IF  WBCF-SEQ-IO-EOF
               MOVE 'VS10000001'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.

007684     MOVE RBCF-SEQ-REC-INFO TO WS-CONTROL-RECORD.
           MOVE EXTRACT-DATE      TO L1640-EXTERNAL-DATE.

008453*    PERFORM  1640-3000-EXTERNAL-TO-INT
008453*        THRU 1640-3000-EXTERNAL-TO-INT-X.
008453     PERFORM  1640-6000-CTL-CARD-TO-INT
008453         THRU 1640-6000-CTL-CARD-TO-INT-X.

           IF  L1640-VALID
               MOVE L1640-INTERNAL-DATE TO EXT-DATE
           ELSE
               MOVE 'VS10000002'   TO WGLOB-MSG-REF-INFO
               MOVE EXTRACT-DATE   TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.

       1100-INITIALIZE-FILES-X.
           EXIT.
      /
      *---------------------------
       1200-PRINT-HDR-ERR-REPORT.
      *---------------------------

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
010418*    MOVE 'C'                TO L0950-COMPANY-REPORT-SW.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

557756*    MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
011652***** GET THE SYSTEM ID
557756     MOVE 'XS00000145'        TO WGLOB-MSG-REF-INFO.
557756     PERFORM  0260-2000-GET-MESSAGE
557756         THRU 0260-2000-GET-MESSAGE-X.
557756     MOVE WGLOB-MSG-TXT       TO L0040-SYSTEM-ID.
011652     MOVE WGLOB-MSG-TXT          TO WHDG-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME     TO L0040-COMPANY-NAME.
           MOVE ZERO                   TO L0040-ERROR-CNT.
           MOVE SPACES                 TO L0040-PROGRAM-DESC.
557756*    MOVE 'ERROR MESSAGES '      TO L0040-HDG-LINE-3.
011652***** GET THE DETAIL HEADINGS 'ERROR MESSAGES'
557756     MOVE 'XS00000019'           TO WGLOB-MSG-REF-INFO.
557756     PERFORM  0260-2000-GET-MESSAGE
557756         THRU 0260-2000-GET-MESSAGE-X.
557756     MOVE WGLOB-MSG-TXT          TO L0040-HDG-LINE-3.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

010311     PERFORM  VRSN-1000-EDIT
010311         THRU VRSN-1000-EDIT-X.

011652*    MOVE RXTAB-ETBL-DESC-TXT    TO HDG1-INGENIUM.

011652*    MOVE L0950-COMPANY-NAME     TO HDG1-COMPANY.
011652     MOVE L0950-COMPANY-NAME     TO WHDG-COMPANY-NAME.
011652*    MOVE WPGWS-CRNT-PGM-ID      TO HDG2-PROGRAM.
011652     MOVE WPGWS-CRNT-PGM-ID      TO WHDG-PROGRAM-ID.
008453*    MOVE EXTRACT-DATE           TO WS-TITLE-DATE.
008453     MOVE EXTRACT-DATE           TO L1640-EXTERNAL-DATE.
008453     PERFORM  1640-6000-CTL-CARD-TO-INT
008453         THRU 1640-6000-CTL-CARD-TO-INT-X.
008453*    ASSUME DATE VALID, IT IS CHECKED IN INITIALIZATION
008453     PERFORM  1640-2000-INTERNAL-TO-EXT
008453         THRU 1640-2000-INTERNAL-TO-EXT-X.
008453     MOVE L1640-EXTERNAL-DATE    TO WS-TITLE-DATE.
011652*    MOVE L0950-COMPANY-DATE     TO HDG2-DATE.
011652     MOVE L0950-COMPANY-DATE     TO WHDG-DATE.
011652*    MOVE L0950-COMPANY-TIME     TO HDG2-TIME.
011652     MOVE L0950-COMPANY-TIME     TO WHDG-TIME.
011652*    MOVE WS-TITLE               TO HDG2-TITLE.
017205     PERFORM  2490-1000-BUILD-PARM-INFO
017205         THRU 2490-1000-BUILD-PARM-INFO-X.
017205     MOVE WPGWS-CRNT-PGM-ID      TO L2490-TXT-SRC-ID.
017205     MOVE '00031'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO WS-TITLE-HEADING.
011652     MOVE WS-TITLE               TO WHDG-REPORT-TITLE.
011652*    MOVE 1                      TO HDG1-PAGE.
011652     MOVE 1                      TO WHDG-PAGE.

011652*    MOVE HEADING-LINE-1         TO RPRT1-REC-INFO.
007684     MOVE WHDG-LINE-1            TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-2000-WRITE
               THRU PRT1-2000-WRITE-X.

           MOVE 2                      TO WPRT1-NUMBER-LINES.
011652*    MOVE HEADING-LINE-2         TO RPRT1-REC-INFO.
007684     MOVE WHDG-LINE-2            TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE 'CONTROL-RECORD --->'  TO PRINT-DESC-1
017205     MOVE '00001'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE WS-CONTROL-RECORD      TO PRINT-LIN.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE L0950-COMPANY-DATE     TO L1640-EXTERNAL-DATE.
           PERFORM  1640-3000-EXTERNAL-TO-INT
               THRU 1640-3000-EXTERNAL-TO-INT-X.
           MOVE L1640-INTERNAL-DATE    TO WGLOB-PROCESS-DATE.

       1200-PRINT-HDR-ERR-REPORT-X.
           EXIT.
      /
      *-----------------------
       1400-READ-FIRST-POLICY.
      *-----------------------

           PERFORM  5000-POLICY-READ
               THRU 5000-POLICY-READ-X.

007684     IF  WPOLQ-SEQ-IO-EOF
               MOVE 'VS10000003'   TO WGLOB-MSG-REF-INFO
               MOVE 'VSPOLQ'       TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

       1400-READ-FIRST-POLICY-X.
           EXIT.
      /
      *-----------------------
       1500-INIT-XTRAK-REC-WS.
      *-----------------------

      *
      *    VALUES ARE ALWAYS MOVED INTO THE: R2000-SORT-AREA
      *                                      R2000-POLICY-INFO
      *                                      R2000-COV-GENERAL-INFO.
      *    HOWEVER, ONLY CERTAIN SECTIONS OF THE REST OF THE RECORD
      *          ARE FILLED IN DEPENDING ON THE CONDITIONS.
      *    THUS, ONLY NEED TO RE-INITIALIZE THE REST OF THE RECORD.
      *

007684     MOVE SPACES            TO R2000-SEQ-REC-INFO.
           MOVE ZERO              TO R2000-PO-MODE.
           MOVE ZERO              TO R2000-PO-MODE-FACTOR.
           MOVE ZERO              TO R2000-PO-POLFEE-FACTOR.
           MOVE WWKDT-ZERO-DT     TO R2000-PO-PAID-TO-DATE.
           MOVE WWKDT-ZERO-DT     TO R2000-PO-ISSUE-DATE.
           MOVE ZERO              TO R2000-CO-COVERAGE-NUMBER.
           MOVE ZERO              TO R2000-CO-ISSUE-AGE.
           MOVE ZERO              TO R2000-PH-SETBACK-YRS.
           MOVE ZERO              TO R2000-PH-SET-ST-AGE.

           PERFORM  1600-RE-INIT-XTRAK-WS
               THRU 1600-RE-INIT-XTRAK-WS-X.

       1500-INIT-XTRAK-REC-WS-X.
           EXIT.
      /
      *----------------------
       1600-RE-INIT-XTRAK-WS.
      *----------------------

      *
      *    VALUES ARE ALWAYS MOVED INTO THE: R2000-SORT-AREA
      *                                      R2000-POLICY-INFO
      *                                      R2000-COV-GENERAL-INFO.
      *    HOWEVER, ONLY CERTAIN SECTIONS OF THE REST OF THE RECORD
      *          ARE FILLED IN DEPENDING ON THE CONDITIONS.
      *    THUS, ONLY NEED TO RE-INITIALIZE THE REST OF THE RECORD.
      *

           MOVE SPACES            TO R2000-COV-SHARED-INFO.
           MOVE ZERO              TO R2000-CO-FACE-AMOUNT.
           MOVE ZERO              TO R2000-CO-SUM-INSURED.
           MOVE ZERO              TO R2000-CO-GROSS-ANN-PREM.
           MOVE WWKDT-ZERO-DT     TO R2000-CO-ISSUE-DATE.
           MOVE WWKDT-ZERO-DT     TO R2000-CO-MAT-EXP-DATE.

           PERFORM  1700-RE-INIT-AFTER-BAS-XTRAK
               THRU 1700-RE-INIT-AFTER-BAS-XTRAK-X.

       1600-RE-INIT-XTRAK-WS-X.
           EXIT.
      /
      *-----------------------------
       1700-RE-INIT-AFTER-BAS-XTRAK.
      *-----------------------------

      *
      *    VALUES ARE ALWAYS MOVED INTO THE: R2000-SORT-AREA
      *                                      R2000-POLICY-INFO
      *                                      R2000-COV-GENERAL-INFO.
      *    HOWEVER, ONLY CERTAIN SECTIONS OF THE REST OF THE RECORD
      *          ARE FILLED IN DEPENDING ON THE CONDITIONS.
      *    THUS, ONLY NEED TO RE-INITIALIZE THE REST OF THE RECORD.
      *

           MOVE SPACES            TO R2000-COV-PREMIUM-INFO.
           MOVE SPACES            TO R2000-COV-VALUES-INFO.
           MOVE SPACES            TO R2000-COV-COMM-INFO.
           MOVE SPACES            TO R2000-CASH-FLOW-GEN-INFO.
           MOVE SPACES            TO R2000-CASH-FLOW-GIA-INFO.
           MOVE SPACES            TO R2000-IMM-ANNUITY-INFO.
           MOVE 'N'               TO R2000-CF-INDICATOR.
           MOVE 'N'               TO R2000-QT-INDICATOR.
           MOVE ZERO              TO R2000-PH-PREM-CHGE-YRS.
           MOVE WWKDT-ZERO-DT     TO R2000-PH-PDUP-DATE.
010302*    MOVE ZERO              TO R2000-PH-SEL-PERIOD.
           MOVE ZERO              TO R2000-CO-MODE-PREM.
           MOVE ZERO              TO R2000-CO-POLICY-FEE.
           MOVE ZERO              TO R2000-PH-MODE-CONSTANT.
           MOVE ZERO              TO R2000-CO-UNIT-VALUE.
           MOVE ZERO              TO R2000-PH-REFUND-RATE.
           MOVE SPACES            TO R2000-CO-COMM-PATTERN  (1).
           MOVE SPACES            TO R2000-CO-COMM-PATTERN  (2).
           MOVE SPACES            TO R2000-CO-COMM-PATTERN  (3).
           MOVE ZERO              TO R2000-CO-COMM-AG-SHARE (1).
           MOVE ZERO              TO R2000-CO-COMM-AG-SHARE (2).
           MOVE ZERO              TO R2000-CO-COMM-AG-SHARE (3).
           MOVE WWKDT-ZERO-DT     TO R2000-CF-EFF-DATE.
           MOVE WWKDT-ZERO-DT     TO R2000-CF-ROLL-DATE.
           MOVE ZERO              TO R2000-CF-GROSS-CASH-VAL.
           MOVE ZERO              TO R2000-CF-NET-CASH-VAL.
           MOVE ZERO              TO R2000-CF-TERM-MONTHS.
           MOVE ZERO              TO R2000-CF-TERM-DAYS.
           MOVE ZERO              TO R2000-CF-INTEREST-RATE.
           MOVE ZERO              TO R2000-CF-CURRENT-AMOUNT.
           MOVE WWKDT-ZERO-DT     TO R2000-CF-NXT-INT-DATE.
           MOVE ZERO              TO R2000-QT-GUAR-YRS.
           MOVE ZERO              TO R2000-QT-GUAR-MTHS.
           MOVE ZERO              TO R2000-QT-INC-ADJ-FACTOR1.
           MOVE ZERO              TO R2000-QT-INC-ADJ-FACTOR2.
           MOVE ZERO              TO R2000-QT-INC-AMT.
           MOVE WWKDT-ZERO-DT     TO R2000-QT-INC-STRT-DATE.
           MOVE WWKDT-ZERO-DT     TO R2000-QT-DOB1.
           MOVE WWKDT-ZERO-DT     TO R2000-QT-DOB2.
           MOVE ZERO              TO R2000-QT-INT-RATE1.
           MOVE ZERO              TO R2000-QT-INT-TERM-MTHS.
           MOVE ZERO              TO R2000-QT-INT-TERM-DAYS.
           MOVE ZERO              TO R2000-QT-INT-RATE2.

           PERFORM  1800-RE-INIT-RE-INS-WS
               THRU 1800-RE-INIT-RE-INS-WS-X.

       1700-RE-INIT-AFTER-BAS-XTRAK-X.
           EXIT.
      /
      *-----------------------
       1800-RE-INIT-RE-INS-WS.
      *-----------------------

      *      THE REINSURANCE FIELDS FIELDS NEED RE-INITIALIZING
      *      IN CASE IT IS DONE BEFORE WRITING THE BASIC EXTRACT

           MOVE SPACES            TO R2000-REIN-GENERAL-INFO.
           MOVE SPACES            TO R2000-REIN-PREM-INFO.
           MOVE SPACES            TO R2000-REIN-SHARED-INFO.
           MOVE 'N'               TO R2000-RI-INDICATOR.
           MOVE ZERO              TO R2000-RI-NUMBER.
           MOVE ZERO              TO R2000-RI-ISS-AGE.
           MOVE WWKDT-ZERO-DT     TO R2000-RI-ISS-DATE.
           MOVE WWKDT-ZERO-DT     TO R2000-RI-PAID-TO-DATE.
           MOVE WWKDT-ZERO-DT     TO R2000-RI-ME-DATE.
           MOVE ZERO              TO R2000-RI-MODE.
           MOVE ZERO              TO R2000-PH-RI-PREM-CHGE-YRS.
010302*    MOVE ZERO              TO R2000-PH-RI-SEL-PERIOD.
           MOVE ZERO              TO R2000-RI-DUR-OFFSET.
           MOVE ZERO              TO R2000-RI-POLICY-FEE.
           MOVE ZERO              TO R2000-RI-DECREMENT.
           MOVE ZERO              TO R2000-RI-FACE-AMOUNT.
           MOVE ZERO              TO R2000-RI-GROSS-ANN-PREM.
           MOVE ZERO              TO R2000-RI-AMT-AT-RISK.

       1800-RE-INIT-RE-INS-WS-X.
           EXIT.
      /
      *---------------------------
       1900-WRITE-EXTRACT-HDR-REC.
      *---------------------------

      *   WRITE OUT AN EXTRACT HEADER RECORD TO CARRY THE
      *   EXTRACT DATE FOR COMPARISON IN THE CALCULATION
      *   PROGRAM.  FILL R2000-REC-INFO WITH LOW-VALUES
      *   TO ENSURE IT WILL ALWAYS BE THE FIRST RECORD OF ANY
      *   ASCENDING SORT.

007684     MOVE LOW-VALUES        TO R2000-SEQ-REC-INFO.
           MOVE EXT-DATE          TO R2000-PO-PAID-TO-DATE.

           PERFORM  4000-WRITE-VALUATION-EXTRACT
               THRU 4000-WRITE-VALUATION-EXTRACT-X.

           SUBTRACT 1 FROM TOTAL-COUNTER.

010311*    MOVE 'N'               TO WS-EXTRACT-WRITE-IND.
010311     SET EXTRACT-NOT-WRITTEN   TO TRUE.

       1900-WRITE-EXTRACT-HDR-REC-X.
           EXIT.
      /
      *----------------------
       2000-PROCESS-POLICIES.
      *----------------------

           IF  RPOL-CO-ID      NOT = WGLOB-COMPANY-CODE
               PERFORM  5000-POLICY-READ
                   THRU 5000-POLICY-READ-X
               GO TO 2000-PROCESS-POLICIES-X
           END-IF.

           IF  RPOL-POL-STAT-PENDING
           OR  RPOL-POL-STAT-REJECTED
           OR  RPOL-POL-STAT-COMPLETE
           OR  RPOL-POL-STAT-TERMINATED
           OR  RPOL-POL-ISS-EFF-DT > EXT-DATE
           OR  RPOL-POL-CVG-REC-CTR-N = 0
017205*        MOVE ' PO PEND, TERM OR ISS-DATE > EXT-DATE!!' TO
017205*              PRINT-LINE
017205         MOVE '00002'                TO L2490-TXT-SRC-REF-ID
017205         PERFORM  2490-1000-RETRIEVE-TEXT
017205             THRU 2490-1000-RETRIEVE-TEXT-X
017205         MOVE L2490-TXT-STR-TXT      TO PRINT-LINE
               MOVE RPOL-POL-ID     TO PRINTB
               PERFORM  9000-PRINT
                   THRU 9000-PRINT-X
               ADD 1                TO POLICIES-NOT-PROCESS
               PERFORM  5000-POLICY-READ
                   THRU 5000-POLICY-READ-X
               GO TO 2000-PROCESS-POLICIES-X
           END-IF.

           PERFORM  5500-CO-READ-SEQUENTIAL
               THRU 5500-CO-READ-SEQUENTIAL-X
               UNTIL RCVG-POL-ID = RPOL-POL-ID
               OR    RCVG-POL-ID > RPOL-POL-ID
007684         OR    WCVGQ-SEQ-IO-EOF.

007684     IF  WCVGQ-SEQ-IO-EOF
007684         IF  WPOLQ-SEQ-IO-EOF
                   GO TO 2000-PROCESS-POLICIES-X
               ELSE
017205*            MOVE ' POLICY AND COVERAGE FILES OUT OF SYNC!'
017205*                                 TO PRINT-LINE
017205             MOVE '00003'                TO L2490-TXT-SRC-REF-ID
017205             PERFORM  2490-1000-RETRIEVE-TEXT
017205                 THRU 2490-1000-RETRIEVE-TEXT-X
017205             MOVE L2490-TXT-STR-TXT      TO PRINT-LINE
                   MOVE RPOL-POL-ID     TO PRINTB
                   PERFORM  9000-PRINT
                       THRU 9000-PRINT-X
                   ADD 1                TO POLICIES-NOT-PROCESS
007684             MOVE 8               TO WPOLQ-SEQ-IO-STATUS
                   GO TO 2000-PROCESS-POLICIES-X
               END-IF
           END-IF.

           IF  RCVG-POL-ID > RPOL-POL-ID
017205*        MOVE ' PO/CO READ - MATCH ON POLICY NOT MADE' TO
017205*              PRINT-LINE
017205         MOVE '00004'                TO L2490-TXT-SRC-REF-ID
017205         PERFORM  2490-1000-RETRIEVE-TEXT
017205             THRU 2490-1000-RETRIEVE-TEXT-X
017205         MOVE L2490-TXT-STR-TXT      TO PRINT-LINE
               MOVE RPOL-POL-ID     TO PRINTB
               PERFORM  9000-PRINT
                   THRU 9000-PRINT-X
               ADD 1                TO POLICIES-NOT-PROCESS
               PERFORM  5000-POLICY-READ
                   THRU 5000-POLICY-READ-X
               GO TO 2000-PROCESS-POLICIES-X
           END-IF.

           IF  RCVG-POL-ID = RPOL-POL-ID
               IF  RCVG-CVG-NUM-N = 01
                   ADD 1               TO COVS-READ
                   MOVE RCVG-CVG-INFO  TO WCVGS-CVG-INFO (01)
                   MOVE RCVG-CVG-NUM-N TO WCVGS-CVG-SEQ-NUM-N (01)
               ELSE
017205*            MOVE ' PO/CO READ - MATCH ON COV. 01 NOT MADE'
017205*                                TO PRINT-LINE
017205             MOVE '00005'                TO L2490-TXT-SRC-REF-ID
017205             PERFORM  2490-1000-RETRIEVE-TEXT
017205                 THRU 2490-1000-RETRIEVE-TEXT-X
017205             MOVE L2490-TXT-STR-TXT      TO PRINT-LINE
                   MOVE RPOL-POL-ID    TO PRINTB
017205*            MOVE '   COV NO. '  TO PRINT-VAL-1
017205             MOVE '00006'                TO L2490-TXT-SRC-REF-ID
017205             PERFORM  2490-1000-RETRIEVE-TEXT
017205                 THRU 2490-1000-RETRIEVE-TEXT-X
017205             MOVE L2490-TXT-STR-TXT      TO PRINT-VAL-1
                   MOVE RCVG-CVG-NUM-N TO PRINTBB
                   PERFORM  9000-PRINT
                       THRU 9000-PRINT-X
                   ADD 1               TO POLICIES-NOT-PROCESS
                   PERFORM  5000-POLICY-READ
                       THRU 5000-POLICY-READ-X
                   GO TO 2000-PROCESS-POLICIES-X
               END-IF
           END-IF.

           MOVE 01                     TO N20.

           PERFORM  2100-READ-COVERAGE-IN
               THRU 2100-READ-COVERAGE-IN-X
               UNTIL RCVG-POL-ID > RPOL-POL-ID
007684         OR    WCVGQ-SEQ-IO-EOF.

           MOVE WS-ON                  TO WS-1ST-TIME-IND.
           MOVE WS-ON                  TO WS-CF-1ST-TIME-IND.

           PERFORM  1600-RE-INIT-XTRAK-WS
               THRU 1600-RE-INIT-XTRAK-WS-X.

           PERFORM  2500-PO-INFO-MOVE
               THRU 2500-PO-INFO-MOVE-X.

           PERFORM  2300-COVERAGES-EXTRACT
               THRU 2300-COVERAGES-EXTRACT-X
               VARYING I FROM 1 BY 1
               UNTIL   I > N20.

           PERFORM  5000-POLICY-READ
               THRU 5000-POLICY-READ-X.

       2000-PROCESS-POLICIES-X.
           EXIT.
      /
      *----------------------
       2100-READ-COVERAGE-IN.
      *----------------------

           PERFORM  2110-READ-COVERAGE-FILE
               THRU 2110-READ-COVERAGE-FILE-X.

007684     IF  NOT WCVGQ-SEQ-IO-EOF
               ADD 1                   TO N20
               IF  (RCVG-POL-ID = RPOL-POL-ID)
               AND (RCVG-CVG-NUM-N = N20)
                   ADD 1               TO COVS-READ
                   MOVE RCVG-CVG-INFO  TO WCVGS-CVG-INFO (N20)
                   MOVE RCVG-CVG-NUM-N TO WCVGS-CVG-SEQ-NUM-N (N20)
               ELSE
      *  ASSUMING A NEW RECORD CONDITION
                   SUBTRACT 1 FROM N20
               END-IF
           END-IF.

       2100-READ-COVERAGE-IN-X.
           EXIT.
      *
      *------------------------
       2110-READ-COVERAGE-FILE.
      *------------------------

           IF  RPOL-POL-SUSPENDED
               PERFORM  5600-SUSP-CVG-READ
                   THRU 5600-SUSP-CVG-READ-X
           ELSE
               PERFORM  5500-CO-READ-SEQUENTIAL
                   THRU 5500-CO-READ-SEQUENTIAL-X
           END-IF.

       2110-READ-COVERAGE-FILE-X.
           EXIT.
      /
      *-----------------------
       2300-COVERAGES-EXTRACT.
      *-----------------------

      *                                                       *
      *        PROCESS POLICIES THAT ARE IN FORCE ONLY        *
      *                                                       *

           MOVE 'N'               TO WS-BASE-WRITTEN-SW.

           IF  WCVGS-CVG-STAT-PENDING (I)
           OR  WCVGS-CVG-STAT-REJECTED (I)
           OR  WCVGS-CVG-ERROR-NO-DATA (I)
           OR  WCVGS-CVG-STAT-TERMINATED (I)
           OR  WCVGS-CVG-ISS-EFF-DT (I) > EXT-DATE
               ADD 1              TO COVS-NOT-PROCESSED
               GO TO 2300-COVERAGES-EXTRACT-X
           END-IF.

54-001     PERFORM  PLIN-1000-PLAN-HEADER-IN
54-001         THRU PLIN-1000-PLAN-HEADER-IN-X.

           IF  WPH-IO-OK
               PERFORM  9100-VAL-LABEL-IN
                   THRU 9100-VAL-LABEL-IN-X
               IF  NOT WVL-IO-OK
                   ADD 1          TO COVS-NOT-PROCESSED
                   GO TO 2300-COVERAGES-EXTRACT-X
               END-IF
           ELSE
               ADD 1              TO COVS-NOT-PROCESSED
               GO TO 2300-COVERAGES-EXTRACT-X
           END-IF.

           IF  WCVGS-CVG-STAT-PREM-PAYING (I)
           AND NOT RPOL-POL-INS-TYP-CD = 'N'
           AND NOT RPOL-POL-INS-TYP-CD = 'C'
           AND NOT RPOL-POL-INS-TYP-SEG-FUND
           AND NOT WCVGS-CVG-INS-TYP-CD (I) = 'N'
           AND NOT WCVGS-CVG-INS-TYP-SEG-FUND (I)
               PERFORM  2350-ADJ-PTD-CALC
                   THRU 2350-ADJ-PTD-CALC-X
               IF  DUE-F NOT = 0
               OR DUE-R  NOT = 0
               OR  ADV-F NOT = 0
               OR ADV-R  NOT = 0
                   PERFORM  2380-WRITE-ADJ-PTD-CALC
                       THRU 2380-WRITE-ADJ-PTD-CALC-X
               END-IF
           END-IF.

           PERFORM  2550-CO-GEN-INFO-MOVE
               THRU 2550-CO-GEN-INFO-MOVE-X.

           IF  WS-1ST-TIME-IN
           AND RPOL-PUA-LTD-FACE-AMT NOT = ZERO
010311*        MOVE 'PUA'         TO WS-COMP-TYPE-3
010311         SET  WS-COMP-TYPE-PUA    TO TRUE
010311*        MOVE '3'           TO R2000-COMP-TYPE
010311         SET R2000-COMP-TYPE-3    TO TRUE
               MOVE RVL-VALN-LBL-CD (4) TO R2000-VALN-LABEL

               PERFORM  2600-CO-SHARED-INFO-MOVE
                   THRU 2600-CO-SHARED-INFO-MOVE-X
               PERFORM  4000-WRITE-VALUATION-EXTRACT
                   THRU 4000-WRITE-VALUATION-EXTRACT-X
           END-IF.

           IF  WS-1ST-TIME-IN
           AND RPOL-POL-OYT-AMT NOT = ZERO
010311*        MOVE 'OYT'         TO WS-COMP-TYPE-3
010311         SET  WS-COMP-TYPE-OYT    TO TRUE
010311*        MOVE '4'           TO R2000-COMP-TYPE
010311         SET R2000-COMP-TYPE-4    TO TRUE
               MOVE RVL-VALN-LBL-CD (5) TO R2000-VALN-LABEL
               PERFORM  2600-CO-SHARED-INFO-MOVE
                   THRU 2600-CO-SHARED-INFO-MOVE-X
               PERFORM  4000-WRITE-VALUATION-EXTRACT
                   THRU 4000-WRITE-VALUATION-EXTRACT-X
           END-IF.

           MOVE WS-OFF            TO WS-1ST-TIME-IND.

           IF  (WCVGS-PLAN-ID-BASE-3-5 (I) = 'ETI')
           AND (WCVGS-CVG-STAT-IN-FORCE (I))
010311*        MOVE 'ETI'         TO WS-COMP-TYPE-3
010311         SET WS-COMP-TYPE-ETI     TO TRUE
010311*        MOVE '2'           TO R2000-COMP-TYPE
010311         SET R2000-COMP-TYPE-2    TO TRUE
               MOVE RVL-VALN-LBL-CD (3) TO R2000-VALN-LABEL
014591*        MOVE WCVGS-ORIG-PLAN-BASE-ID (I) TO R2000-CO-PLAN-CODE
014591         MOVE WCVGS-ORIG-PLAN-ID (I) TO R2000-CO-PLAN-CODE
               PERFORM  2600-CO-SHARED-INFO-MOVE
                   THRU 2600-CO-SHARED-INFO-MOVE-X
               PERFORM  2620-CO-VALUES-INFO-MOVE
                   THRU 2620-CO-VALUES-INFO-MOVE-X
               PERFORM  3000-GENERAL-EXTRACT-FILL
                   THRU 3000-GENERAL-EXTRACT-FILL-X
               GO TO 2300-COVERAGES-EXTRACT-X
           END-IF.

           IF  (WCVGS-PLAN-ID-BASE-3-5 (I) = 'RPU')
           AND (WCVGS-CVG-STAT-IN-FORCE (I))
010311*        MOVE 'RPU'         TO WS-COMP-TYPE-3
010311         SET WS-COMP-TYPE-RPU     TO TRUE
010311*        MOVE '1'           TO R2000-COMP-TYPE
010311         SET R2000-COMP-TYPE-1    TO TRUE
               MOVE RVL-VALN-LBL-CD (2) TO R2000-VALN-LABEL
014591*        MOVE WCVGS-ORIG-PLAN-BASE-ID (I) TO R2000-CO-PLAN-CODE
014591         MOVE WCVGS-ORIG-PLAN-ID (I) TO R2000-CO-PLAN-CODE
               PERFORM  2600-CO-SHARED-INFO-MOVE
                   THRU 2600-CO-SHARED-INFO-MOVE-X
               PERFORM  2620-CO-VALUES-INFO-MOVE
                   THRU 2620-CO-VALUES-INFO-MOVE-X
               PERFORM  3000-GENERAL-EXTRACT-FILL
                   THRU 3000-GENERAL-EXTRACT-FILL-X
               GO TO 2300-COVERAGES-EXTRACT-X
           END-IF.
      *
      *    A 'BAS' OR '0' COMPONENT TYPE IS SET UP AS THE DEFAULT
      *    OR AS A PROCESS OF DEDUCTION.
      *
010311*    MOVE 'BAS'             TO WS-COMP-TYPE-3.
010311     SET  WS-COMP-TYPE-BAS     TO TRUE.
010311*    MOVE '0'               TO R2000-COMP-TYPE.
010311     SET R2000-COMP-TYPE-0     TO TRUE.
           MOVE RVL-VALN-LBL-CD (1) TO R2000-VALN-LABEL.

           PERFORM  2600-CO-SHARED-INFO-MOVE
               THRU 2600-CO-SHARED-INFO-MOVE-X.

54-001     IF  NOT WCVGS-CVG-INS-TYP-IMMED-ANTY (I)
54-001     AND NOT WCVGS-CVG-INS-TYP-UL-INS-ANTY (I)
54-001     AND NOT WCVGS-CVG-INS-TYP-ISWL (I)
           AND NOT WCVGS-CVG-INS-TYP-SEG-FUND (I)
           AND NOT WCVGS-CVG-CF-TYP-DIA (I)
           AND NOT WCVGS-CVG-CF-TYP-GIA (I)
010314     AND NOT WCVGS-CVG-CF-TYP-EIA (I)
               PERFORM  2620-CO-VALUES-INFO-MOVE
                   THRU 2620-CO-VALUES-INFO-MOVE-X
           END-IF.

           IF WCVGS-CVG-STAT-PREM-PAYING (I)
           AND NOT WCVGS-CVG-INS-TYP-SEG-FUND (I)
           AND NOT WCVGS-CVG-CF-TYP-DIA (I)
           AND NOT WCVGS-CVG-CF-TYP-GIA (I)
010314     AND NOT WCVGS-CVG-CF-TYP-EIA (I)
               PERFORM  2610-CO-PREM-INFO-MOVE
                   THRU 2610-CO-PREM-INFO-MOVE-X
               PERFORM  2630-CO-COMM-INFO-MOVE
                   THRU 2630-CO-COMM-INFO-MOVE-X
           END-IF.

           PERFORM  3000-GENERAL-EXTRACT-FILL
               THRU 3000-GENERAL-EXTRACT-FILL-X.

           MOVE 'Y'               TO WS-BASE-WRITTEN-SW.

      *                                                                *
      *    AT THIS POINT A "BASIC" COVERAGE EXTRACT HAS BEEN WRITTEN   *
      *        REINITIALIZE FOR OTHER POSSIBLE COVERAGE EXTRACTS       *
      *                                                                *

           PERFORM  1700-RE-INIT-AFTER-BAS-XTRAK
               THRU 1700-RE-INIT-AFTER-BAS-XTRAK-X.
           PERFORM  2450-DUR-AND-ATT-AGE-CALCS
               THRU 2450-DUR-AND-ATT-AGE-CALCS-X.

           IF (WCVGS-CVG-FE-PREM-AMT (I) > 0 AND
               WCVGS-CVG-FE-DUR   (I) > WS-HI-DUR-ADJ-PTD)
010311*        MOVE 'FE '         TO WS-COMP-TYPE-3
010311         SET WS-COMP-TYPE-FE   TO TRUE
010311*        MOVE '7'           TO R2000-COMP-TYPE
010311         SET R2000-COMP-TYPE-7    TO TRUE
               MOVE RVL-VALN-LBL-CD (8) TO R2000-VALN-LABEL
               PERFORM  2600-CO-SHARED-INFO-MOVE
                   THRU 2600-CO-SHARED-INFO-MOVE-X
               PERFORM  3000-GENERAL-EXTRACT-FILL
                   THRU 3000-GENERAL-EXTRACT-FILL-X
           END-IF.

           IF (WCVGS-CVG-ME-FCT       (I) > 0 AND
               WCVGS-CVG-ME-DUR         (I) > WS-HI-DUR-ADJ-PTD)
010311*        MOVE 'MRE'         TO WS-COMP-TYPE-3
010311         SET WS-COMP-TYPE-MRE     TO TRUE
010311*        MOVE '8'           TO R2000-COMP-TYPE
010311         SET R2000-COMP-TYPE-8    TO TRUE
               MOVE RVL-VALN-LBL-CD (9) TO R2000-VALN-LABEL
               PERFORM  2600-CO-SHARED-INFO-MOVE
                   THRU 2600-CO-SHARED-INFO-MOVE-X
               PERFORM  3000-GENERAL-EXTRACT-FILL
                   THRU 3000-GENERAL-EXTRACT-FILL-X
           END-IF.
      *
      *    EMBEDDED ADB AND WP FOLLOW
      *
           IF  (WCVGS-CVG-AD-MULT-FCT (I) NOT = ZERO)
           AND (WCVGS-CVG-FACE-AMT (I) NOT = ZERO)
           AND (WS-ATT-AGE-ADJ-PTD LESS THAN RPH-PLAN-ADB-XPRY-AGE-N)
010311*        MOVE 'ADE'         TO WS-COMP-TYPE-3
010311         SET  WS-COMP-TYPE-ADE    TO TRUE
010311*        MOVE '5'           TO R2000-COMP-TYPE
010311         SET R2000-COMP-TYPE-5    TO TRUE
               MOVE RVL-VALN-LBL-CD (6) TO R2000-VALN-LABEL
               PERFORM  2600-CO-SHARED-INFO-MOVE
                   THRU 2600-CO-SHARED-INFO-MOVE-X
               PERFORM  2620-CO-VALUES-INFO-MOVE
                   THRU 2620-CO-VALUES-INFO-MOVE-X
               MOVE WCVGS-CVG-AD-FACE-AMT (I) TO R2000-CO-FACE-AMOUNT
               PERFORM  3000-GENERAL-EXTRACT-FILL
                   THRU 3000-GENERAL-EXTRACT-FILL-X
           END-IF.

           IF  (WCVGS-CVG-WP-MULT-FCT (I) NOT = ZERO)
           AND (WCVGS-CVG-STAT-PREM-PAYING (I))
           AND (WS-ATT-AGE-ADJ-PTD LESS THAN RPH-PLAN-WP-XPRY-AGE-N)
010311*        MOVE 'WPE'         TO WS-COMP-TYPE-3
010311         SET WS-COMP-TYPE-WPE       TO TRUE
010311*        MOVE '6'           TO R2000-COMP-TYPE
010311         SET R2000-COMP-TYPE-6    TO TRUE
               MOVE RVL-VALN-LBL-CD (7) TO R2000-VALN-LABEL
               MOVE WCVGS-CVG-MPREM-AMT     (I) TO R2000-CO-MODE-PREM
               PERFORM  2600-CO-SHARED-INFO-MOVE
                   THRU 2600-CO-SHARED-INFO-MOVE-X
               PERFORM  2620-CO-VALUES-INFO-MOVE
                   THRU 2620-CO-VALUES-INFO-MOVE-X
               PERFORM  3000-GENERAL-EXTRACT-FILL
                   THRU 3000-GENERAL-EXTRACT-FILL-X
           END-IF.

       2300-COVERAGES-EXTRACT-X.
           EXIT.
      /
      *------------------
       2350-ADJ-PTD-CALC.
      *------------------

      *                                                               *
      * THE EFFECT OF THE FOLLOWING IS TO PUT THE PTD TO A DATE       *
      * WHICH FALLS AFTER THE EXT-DATE (IE. A MODE PAST THE EXT-DATE) *
      * IT SEEMS EASIER TO BRING THE DATE BACK UNTIL IT FALLS A MODE  *
      * BEFORE THE EXT-DATE.  AFTERWARDS IT CAN EASILY BE ADVANCED    *
      * ONE MODE TO PLACE THE PTD THE NEXT MODE AFTER THE EXT-DATE.   *
      *                                                               *

           MOVE ZEROES            TO DUE-F.
           MOVE ZEROES            TO DUE-R.
           MOVE ZEROES            TO ADV-F.
           MOVE ZEROES            TO ADV-R.
           MOVE WCVGS-CVG-ISS-EFF-DT (I) TO FIRST-ANN.
           ADD 1                  TO YEAR-FA.

           IF  RPOL-POL-PD-TO-DT-NUM > EXT-DATE
               PERFORM  2360-ADJ-PTD-CALC-ADV
                   THRU 2360-ADJ-PTD-CALC-ADV-X
           ELSE
               PERFORM  2370-ADJ-PTD-CALC-DUE
                   THRU 2370-ADJ-PTD-CALC-DUE-X
           END-IF.

           IF  RPOL-POL-BILL-MODE-CD-N > 12
               MOVE WCVGS-CVG-ISS-EFF-DT (I) TO ADJUSTED-PAID-TO-DATE
               MOVE EXT-YEAR      TO ADJ-PTD-YEAR
               IF  ADJUSTED-PAID-TO-DATE < EXT-DATE
                   ADD 1          TO ADJ-PTD-YEAR
               END-IF
           END-IF.

       2350-ADJ-PTD-CALC-X.
           EXIT.

      *----------------------
       2360-ADJ-PTD-CALC-ADV.
      *----------------------

           MOVE RPOL-POL-PD-TO-DT-NUM TO ADJUSTED-PAID-TO-DATE.
           MOVE RPOL-POL-PD-TO-DT-NUM TO WWKDT-INT-DT-1.

       CHECK-FOR-MORE-ADV.

           SUBTRACT RPOL-POL-BILL-MODE-CD-N
               FROM WWKDT-INT-DT-MO-1
             GIVING WWKDT-NUM-MO.

       PAC-SUB-LOOP.

           IF  WWKDT-NUM-MO < 1
               ADD 12             TO WWKDT-NUM-MO
               SUBTRACT 1 FROM WWKDT-INT-DT-YR-1
               GO TO PAC-SUB-LOOP
557660     END-IF.

           MOVE WWKDT-NUM-MO      TO WWKDT-INT-DT-MO-1.
           IF  WWKDT-INT-DT-1 > EXT-DATE
               MOVE WWKDT-INT-DT-1 TO ADJUSTED-PAID-TO-DATE
               IF  ADJUSTED-PAID-TO-DATE < FIRST-ANN
                   ADD WCVGS-CVG-MPREM-AMT     (I) TO ADV-F
               ELSE
                   ADD WCVGS-CVG-MPREM-AMT     (I) TO ADV-R
               END-IF
           END-IF.

           IF  WWKDT-INT-DT-1 > EXT-DATE
               GO TO CHECK-FOR-MORE-ADV
           END-IF.

       2360-ADJ-PTD-CALC-ADV-X.
           EXIT.

      *----------------------
       2370-ADJ-PTD-CALC-DUE.
      *----------------------

           MOVE RPOL-POL-PD-TO-DT-NUM TO ADJUSTED-PAID-TO-DATE.

       CHECK-FOR-MORE-DUE.

           IF  ADJUSTED-PAID-TO-DATE < FIRST-ANN
               ADD WCVGS-CVG-MPREM-AMT     (I) TO DUE-F
           ELSE
               ADD WCVGS-CVG-MPREM-AMT     (I) TO DUE-R
           END-IF.

           ADD RPOL-POL-BILL-MODE-CD-N TO ADJ-PTD-MONTH.

       PDC-ADD-LOOP.

           IF  ADJ-PTD-MONTH > 12
               SUBTRACT 12 FROM ADJ-PTD-MONTH
               ADD 1              TO ADJ-PTD-YEAR
               GO TO PDC-ADD-LOOP
           END-IF.

           IF  ADJUSTED-PAID-TO-DATE < EXT-DATE
               GO TO CHECK-FOR-MORE-DUE
           END-IF.

       2370-ADJ-PTD-CALC-DUE-X.
           EXIT.

      *------------------------
       2380-WRITE-ADJ-PTD-CALC.
      *------------------------

007684     MOVE SPACES                    TO R1200-SEQ-REC-INFO.
           MOVE WCVGS-CVG-ACCT-TYP-CD (I) TO R1200-LOB.
           MOVE '64'                      TO R1200-REC-ID.
           MOVE WCVGS-CVG-PAR-CD (I)      TO R1200-PAR.
           MOVE RPOL-POL-ID               TO R1200-POLICY.
           MOVE WCVGS-CVG-SEQ-NUM-N (I)   TO R1200-RIDER-NUM.
           MOVE RPOL-CLI-CRNT-LOC-CD      TO R1200-PROV.
           MOVE WCVGS-CVG-ISS-EFF-DT (I)  TO R1200-ISSUE-DATE.
           MOVE RPOL-POL-PD-TO-DT-NUM     TO R1200-PAID-TO-DATE.
           MOVE ADJUSTED-PAID-TO-DATE     TO R1200-ADJUSTED-DATE.
           MOVE RPOL-POL-BILL-MODE-CD-N   TO R1200-MODX.
           MOVE WCVGS-CVG-MPREM-AMT (I)   TO R1200-MODE-PREMIUM.
           MOVE DUE-F                     TO R1200-DUE-F.
           MOVE DUE-R                     TO R1200-DUE-R.
           MOVE ADV-F                     TO R1200-ADV-F.
           MOVE ADV-R                     TO R1200-ADV-R.
           ADD 1                          TO R1200-RECORDS-OUT.
           PERFORM  1200-1000-WRITE
               THRU 1200-1000-WRITE-X.

       2380-WRITE-ADJ-PTD-CALC-X.
           EXIT.
      /
      *---------------------------
       2450-DUR-AND-ATT-AGE-CALCS.
      *---------------------------

           MOVE WCVGS-CVG-ISS-EFF-DT (I) TO L1680-INTERNAL-1.
           MOVE WGLOB-PROCESS-DATE       TO L1680-INTERNAL-2.

           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.

           IF  L1680-NUMBER-OF-YEARS < ZERO
               MOVE ZERO                 TO L1680-NUMBER-OF-YEARS
           END-IF.

           ADD 1 L1680-NUMBER-OF-YEARS GIVING WS-HI-DUR-ADJ-PTD.
           ADD WCVGS-CVG-RT-AGE-N (I) L1680-NUMBER-OF-YEARS GIVING
                 WS-ATT-AGE-ADJ-PTD.

       2450-DUR-AND-ATT-AGE-CALCS-X.
           EXIT.
      /
      *------------------
       2500-PO-INFO-MOVE.
      *------------------
      *
      *****              GENERAL INFO     *****
      *
           MOVE RPOL-CO-ID              TO R2000-CODE-COMPANY.
      *
      *****             POLICY   INFO     *****
      *
           MOVE RPOL-POL-ID             TO R2000-PO-POLICY-NUMBER.
           MOVE RPOL-POL-CSTAT-CD       TO R2000-PO-STATUS.
           MOVE RPOL-CLI-CRNT-LOC-CD    TO R2000-PO-STATE-CODE.
           MOVE RPOL-POL-ACCT-PAR-CD    TO R2000-PO-PAR-DIGIT.
           MOVE RPOL-POL-CRCY-CD        TO R2000-PO-CURRENCY-CODE.
           MOVE RPOL-POL-BILL-MODE-CD-N TO R2000-PO-MODE.
           MOVE RPOL-POL-CRNT-MODE-FCT  TO R2000-PO-MODE-FACTOR.
           MOVE RPOL-POL-PFEE-FCT       TO R2000-PO-POLFEE-FACTOR.
           MOVE RPOL-POL-PD-TO-DT-NUM   TO R2000-PO-PAID-TO-DATE.
           MOVE RPOL-POL-ISS-EFF-DT     TO R2000-PO-ISSUE-DATE.
           MOVE RPOL-POL-DB-OPT-CD      TO R2000-PO-DEATH-BEN-OPTION.

           IF  RPOL-POL-NON-REGISTERED
               MOVE 'N'                 TO R2000-PO-REG-IND
           ELSE
               MOVE 'Y'                 TO R2000-PO-REG-IND
           END-IF.

           MOVE RPOL-POL-INS-TYP-CD     TO R2000-PO-TYPE-INSURANCE.

       2500-PO-INFO-MOVE-X.
           EXIT.
      /
      *----------------------
       2550-CO-GEN-INFO-MOVE.
      *----------------------
      *
      *****     COVERAGE-GENERAL-INFO     *****
      *
           MOVE WCVGS-CVG-SEQ-NUM-N (I)  TO R2000-CO-COVERAGE-NUMBER.
           MOVE WCVGS-CVG-CSTAT-CD (I)   TO R2000-CO-STATUS.
           MOVE RPH-MAJ-LN-SORT-CD       TO R2000-PH-MAJOR-LINE.
           MOVE WCVGS-CVG-INS-TYP-CD (I) TO R2000-CO-TYPE-INSURANCE

54-001     IF  WCVGS-PLAN-ID-BASE-3-5 (I) = 'RPU'
54-001     OR  WCVGS-PLAN-ID-BASE-3-5 (I) = 'ETI'
014591*        MOVE WCVGS-ORIG-PLAN-BASE-ID (I) TO R2000-CO-PLAN-CODE
014591         MOVE WCVGS-ORIG-PLAN-ID (I) TO R2000-CO-PLAN-CODE
           ELSE
               MOVE WCVGS-PLAN-ID-BASE (I) TO R2000-CO-PLAN-CODE
           END-IF.

           MOVE WCVGS-PLAN-ID-RS (I)     TO R2000-CO-RATE-SCALE.
           MOVE SPACE                    TO R2000-CO-UW-CODE.
           MOVE WCVGS-CVG-SMKR-CD (I)    TO R2000-CO-SMOKER.

           IF  WCVGS-CVG-PAR-CD (I) = SPACES
               MOVE 'N'                  TO R2000-CO-PAR
           ELSE
               MOVE WCVGS-CVG-PAR-CD (I) TO R2000-CO-PAR
           END-IF.

           MOVE WCVGS-CVG-SEX-CD (I)     TO R2000-CO-SEX.
           MOVE WCVGS-CVG-STBL-1-CD (I)  TO R2000-CO-SUB-TBL-1.
           MOVE WCVGS-CVG-STBL-2-CD (I)  TO R2000-CO-SUB-TBL-2.
           MOVE WCVGS-CVG-RT-AGE-N (I)   TO R2000-CO-ISSUE-AGE.
           MOVE WCVGS-CVG-ORIG-CD (I)    TO R2000-CO-ORIGIN-CODE.
           MOVE WCVGS-CVG-SUPP-BNFT-CD (I) TO R2000-CO-BENEFIT-TYPE.
           MOVE RPH-PLAN-AGE-STBCK-CD    TO R2000-PH-SETBACK-IND.
           MOVE RPH-PLAN-AGE-STBCK-QTY-N TO R2000-PH-SETBACK-YRS.
           MOVE RPH-AGE-STBCK-STRT-AGE-N TO R2000-PH-SET-ST-AGE.

54-001     IF  RPH-MAT-DT-CALC-NUMBER-OF-YR
54-001     OR  RPH-MAT-DT-CALC-ATTAINED-AGE
54-001     OR  RPH-MAT-DT-CALC-ATTAIN-YR-END
               MOVE 'M'                  TO R2000-CO-MAT-EXP-TYPE
           ELSE
               MOVE 'E'                  TO R2000-CO-MAT-EXP-TYPE
           END-IF.

       2550-CO-GEN-INFO-MOVE-X.
           EXIT.
      /
      *-------------------------
       2600-CO-SHARED-INFO-MOVE.
      *-------------------------
      *
      *****     COVERAGE-SHARED-INFO     *****
      *
           IF  WS-COMP-TYPE-OYT-PUA
               MOVE RPOL-POL-ISS-EFF-DT      TO R2000-CO-ISSUE-DATE
           ELSE
               MOVE WCVGS-CVG-ISS-EFF-DT (I) TO R2000-CO-ISSUE-DATE
           END-IF.

           MOVE WCVGS-CVG-MAT-XPRY-DT (I)    TO R2000-CO-MAT-EXP-DATE.

           MOVE ZERO                         TO WS-DURATION.
           MOVE ZERO                         TO WS-EXPIRY-AGE.

           IF  WS-COMP-TYPE-ADE
               MOVE RPH-PLAN-ADB-XPRY-AGE-N  TO WS-EXPIRY-AGE
           ELSE
               IF WS-COMP-TYPE-WPE
                   MOVE RPH-PLAN-WP-XPRY-AGE-N   TO WS-EXPIRY-AGE
               END-IF
           END-IF.

           IF  WS-COMP-TYPE-ADE-WPE
               MOVE WCVGS-CVG-ISS-EFF-DT (I) TO WS-ISSUE-DAT
               MOVE WCVGS-CVG-RT-AGE-N (I)   TO WS-RATE-AGE
               MOVE WS-ISSUE-DAT             TO WWKDT-INT-DT-1
               COMPUTE WWKDT-INT-DT-YR-1 = WWKDT-INT-DT-YR-1
                             + WS-EXPIRY-AGE - WS-RATE-AGE
               MOVE WWKDT-INT-DT-1           TO WS-CO-MAT-EXP-DATE
               IF  WS-CO-MAT-EXP-DATE > WCVGS-CVG-MAT-XPRY-DT (I)
                   MOVE WCVGS-CVG-MAT-XPRY-DT (I)
                                             TO R2000-CO-MAT-EXP-DATE
               ELSE
                   MOVE WS-CO-MAT-EXP-DATE   TO R2000-CO-MAT-EXP-DATE
               END-IF
           END-IF.

           IF  WS-COMP-TYPE-FE
               MOVE WCVGS-CVG-FE-DUR   (I)   TO WS-DURATION
           ELSE
               IF  WS-COMP-TYPE-MRE
                   MOVE WCVGS-CVG-ME-DUR         (I) TO WS-DURATION
               END-IF
           END-IF.

           IF  WS-COMP-TYPE-FE-MRE
               MOVE WCVGS-CVG-ISS-EFF-DT (I) TO WS-ISSUE-DAT
               MOVE WS-ISSUE-DAT             TO WWKDT-INT-DT-1
               ADD WS-DURATION               TO WWKDT-INT-DT-YR-1
               MOVE WWKDT-INT-DT-1           TO WS-CO-MAT-EXP-DATE
               IF  WS-CO-MAT-EXP-DATE > WCVGS-CVG-MAT-XPRY-DT (I) OR
                   WCVGS-CVG-FE-DUR   (I) = 999 OR
                   WCVGS-CVG-ME-DUR   (I) = 999
                   MOVE WCVGS-CVG-MAT-XPRY-DT (I)
                                             TO R2000-CO-MAT-EXP-DATE
               ELSE
                   MOVE WS-CO-MAT-EXP-DATE   TO R2000-CO-MAT-EXP-DATE
               END-IF
           END-IF.

           IF  WS-COMP-TYPE-OYT-PUA
               MOVE RPOL-POL-CEAS-DT         TO R2000-CO-MAT-EXP-DATE
           END-IF.

           PERFORM  2605-CO-SHARED-AMTS-INFO
               THRU 2605-CO-SHARED-AMTS-INFO-X.

           EVALUATE TRUE

               WHEN WS-COMP-TYPE-PUA
                    MOVE RPH-DIV-PUA-TBAC-ID   TO R2000-CO-MXDX-TABLE

               WHEN WS-COMP-TYPE-OYT
                   MOVE RPH-DIV-OYT-TBAC-ID    TO R2000-CO-MXDX-TABLE

               WHEN WS-COMP-TYPE-ETI
                    MOVE RPH-ETI-TBAC-ID       TO R2000-CO-MXDX-TABLE

               WHEN WS-COMP-TYPE-RPU
                    MOVE RPH-RPU-TBAC-ID       TO R2000-CO-MXDX-TABLE

               WHEN OTHER
                   MOVE SPACE                  TO R2000-CO-MXDX-TABLE

           END-EVALUATE.

           EVALUATE TRUE

               WHEN WS-COMP-TYPE-ADE
                    MOVE RPH-ADB-PLAN-ID      TO R2000-CO-SUPP-BEN-PLAN

               WHEN WS-COMP-TYPE-WPE
                    MOVE RPH-WP-PLAN-ID       TO R2000-CO-SUPP-BEN-PLAN

               WHEN OTHER
                    MOVE SPACES               TO R2000-CO-SUPP-BEN-PLAN

           END-EVALUATE.

       2600-CO-SHARED-INFO-MOVE-X.
           EXIT.
      /
      *-------------------------
       2605-CO-SHARED-AMTS-INFO.
      *-------------------------

           IF WS-COMP-TYPE-ADE
               MOVE WCVGS-CVG-AD-FACE-AMT (I) TO R2000-CO-FACE-AMOUNT
           END-IF.

           IF WS-COMP-TYPE-PUA
               MOVE RPOL-PUA-LTD-FACE-AMT     TO R2000-CO-FACE-AMOUNT
           END-IF.

           IF WS-COMP-TYPE-OYT
               MOVE RPOL-POL-OYT-AMT          TO R2000-CO-FACE-AMOUNT
           ELSE
               MOVE WCVGS-CVG-FACE-AMT (I)    TO R2000-CO-FACE-AMOUNT
           END-IF.

           IF WS-COMP-TYPE-BAS
               MOVE WCVGS-CVG-SUM-INS-AMT (I) TO R2000-CO-SUM-INSURED
           ELSE
               MOVE R2000-CO-FACE-AMOUNT      TO R2000-CO-SUM-INSURED
           END-IF.

           MOVE WCVGS-CVG-BASIC-PREM-AMT (I) TO R2000-CO-GROSS-ANN-PREM

           IF  WS-COMP-TYPE-PUA
           OR  WS-COMP-TYPE-OYT
           OR  WS-COMP-TYPE-RPU
           OR  WS-COMP-TYPE-ETI
               MOVE ZERO                     TO R2000-CO-GROSS-ANN-PREM
           END-IF.

           IF WS-COMP-TYPE-ADE
               MOVE WCVGS-CVG-AD-PREM-AMT (I) TO R2000-CO-GROSS-ANN-PREM
           END-IF.

           IF WS-COMP-TYPE-WPE
               MOVE WCVGS-CVG-WP-PREM-AMT (I) TO R2000-CO-GROSS-ANN-PREM
           END-IF.

           IF WS-COMP-TYPE-FE
               MOVE WCVGS-CVG-FE-PREM-AMT (I) TO R2000-CO-GROSS-ANN-PREM
           END-IF.

           IF WS-COMP-TYPE-MRE
               MOVE WCVGS-CVG-ME-PREM-AMT (I) TO
                                              R2000-CO-GROSS-ANN-PREM
           END-IF.

       2605-CO-SHARED-AMTS-INFO-X.
           EXIT.
      /
      *-----------------------
       2610-CO-PREM-INFO-MOVE.
      *-----------------------
      *
      *         COVERAGE-PREMIUM-INFO
      *
010302*    PERFORM  2612-CALC-BAND-NUMBER
010302*        THRU 2612-CALC-BAND-NUMBER-X.
010302*
010302*    MOVE WS-PH-BAND-NUMBER         TO R2000-PH-BAND-NUMBER.
           MOVE RPH-PREM-CHNG-DT-CD       TO R2000-PH-PREM-CHGE-TYPE.
           MOVE RPH-PREM-CHNG-AGE-DUR-N   TO R2000-PH-PREM-CHGE-YRS.
010302*    MOVE RPH-PREM-RT-TBAC-ID       TO R2000-PH-PR-ACCESS-CODE.
010302     MOVE 'PREMS'                   TO R2000-PLRT-PR-ACCESS-CODE.
010302*    MOVE RPH-PREM-RT-TBAC-CD       TO R2000-PH-PREMIUM-INDICATOR.

           IF  WCVGS-CVG-STAT-PREM-PAYING (I)
               MOVE WCVGS-CVG-MAT-XPRY-DT (I) TO R2000-PH-PDUP-DATE
54-001         IF RPH-PREM-CHNG-DT-NUMBER-OF-YR
54-001         OR RPH-PREM-CHNG-DT-ATTAINED-AGE
                  MOVE WCVGS-CVG-PREM-CHNG-DT (I) TO R2000-PH-PDUP-DATE
               END-IF
           END-IF.

010302*    IF  RPH-PREM-CHNG-DT-RENW-TERM
010302*    OR  RPH-PREM-CHNG-DT-STEP-RATED
010302*        MOVE RPH-SELCT-PERI-DUR-N  TO R2000-PH-SEL-PERIOD
010302*    END-IF.

           MOVE WCVGS-CVG-MPREM-AMT (I)   TO R2000-CO-MODE-PREM.
           MOVE WCVGS-CVG-PFEE-AMT (I)    TO R2000-CO-POLICY-FEE.

           IF  RPOL-POL-BILL-TYP-PAC
               MOVE RPH-PAC-MODE-FEE-AMT  TO R2000-PH-MODE-CONSTANT
           ELSE
               MOVE RPH-PLAN-MODE-FEE-AMT TO R2000-PH-MODE-CONSTANT
           END-IF.

       2610-CO-PREM-INFO-MOVE-X.
           EXIT.
      /
010302*----------------------
010302*2612-CALC-BAND-NUMBER.
010302*----------------------

010302*          IN CASE THE 1ST OCCURRENCE IS ZERO
010302*          THE 2ND OCCURRENCE IS NON ZERO
010302*          AND THE 3RD AND 4TH OCCURRENCES ARE ZERO,
010302*    IF RPH-FACE-BAND-AMT (1) > ZERO CHECK IS NOT DONE

010302*    MOVE SPACES                       TO WS-PH-BAND-NUMBER.

010302*    IF RPH-PLAN-PREM-BAND-IND = 'Y'
010302*        IF RPH-FACE-BAND-AMT (4) > ZERO
010302*        AND
010302*         R2000-CO-FACE-AMOUNT > RPH-FACE-BAND-AMT (4)
010302*            MOVE '05'                 TO WS-PH-BAND-NUMBER
010302*        END-IF
010302*    END-IF.

010302*    IF RPH-FACE-BAND-AMT (3) > ZERO
010302*    AND R2000-CO-FACE-AMOUNT > RPH-FACE-BAND-AMT (3)
010302*        MOVE '04'                 TO WS-PH-BAND-NUMBER
010302*    END-IF.

010302*    IF RPH-FACE-BAND-AMT (2) > ZERO
010302*    AND R2000-CO-FACE-AMOUNT > RPH-FACE-BAND-AMT (2)
010302*        MOVE '03'                 TO WS-PH-BAND-NUMBER
010302*    END-IF.

010302*    IF R2000-CO-FACE-AMOUNT > RPH-FACE-BAND-AMT (1)
010302*        MOVE '02'                 TO WS-PH-BAND-NUMBER
010302*    ELSE
010302*        MOVE '01'                 TO WS-PH-BAND-NUMBER
010302*    END-IF.

010302*2612-CALC-BAND-NUMBER-X.
010302*    EXIT.
      /
      *-------------------------
       2620-CO-VALUES-INFO-MOVE.
      *-------------------------

      *
      *         COVERAGE-VALUES-INFO
      *

           MOVE WCVGS-CVG-UNIT-VALU-AMT (I) TO R2000-CO-UNIT-VALUE.
           MOVE RPH-CSV-CALC-MTHD-CD      TO R2000-PH-CSV-METHOD.
           MOVE RPH-SUM-INS-CALC-CD       TO R2000-PH-SUM-INS-TYPE.
           MOVE RPH-DB-CALC-TYP-CD        TO R2000-PH-DB-TYPE.
           MOVE RPH-PREM-PAY-UVAL-ID      TO R2000-PH-UV-ACCESS-PR-PAY.
           MOVE RPH-PU-UVAL-ID            TO R2000-PH-UV-ACCESS-PD-UP.
           MOVE RPH-TRM-PREM-RFND-RT      TO R2000-PH-REFUND-RATE.

       2620-CO-VALUES-INFO-MOVE-X.
           EXIT.
      /
      *-----------------------
       2630-CO-COMM-INFO-MOVE.
      *-----------------------

      *
      *         COVERAGE COMMISSION INFO
      *         WILL REQUIRE TAPE/DISC COPY
      *         OF COVERAGE FILE IF NEEDED
      *
           MOVE RPH-COMM-RT-LOOP-IND     TO R2000-PH-COMM-LOOP.

       2630-CO-COMM-INFO-MOVE-X.
           EXIT.
      /
      *------------------------
       2640-REIN-GEN-INFO-MOVE.
      *------------------------

      *
      *         REINSURANCE GENERAL INFO
      *
           MOVE 'Y'                        TO R2000-RI-INDICATOR.
           MOVE L0386-CSN-REC-NUM          TO R2000-RI-NUMBER.
           MOVE L0386-CSN-STAT-CD          TO R2000-RI-STATUS.
           MOVE L0386-ASSUM-CO-ID          TO R2000-RI-COMPANY.

           IF  WS-COMP-TYPE-BAS
               MOVE L0386-CSN-REINS-TYP-CD TO R2000-RI-TYPE
           ELSE
               MOVE 'C'                    TO R2000-RI-TYPE
           END-IF.
54-001     MOVE L0386-CSN-PLAN-ID          TO WS-PH-KEY.
54-001     MOVE WS-PLAN-ID-BASE            TO R2000-RI-PLAN-CODE.
54-001     MOVE WS-PLAN-ID-RS              TO R2000-RI-RATE-SCALE.
           MOVE L0386-CSN-SMKR-CD          TO R2000-RI-SMOKER.
           MOVE L0386-CSN-PAR-CD           TO R2000-RI-PAR.
           MOVE L0386-CSN-SEX-CD           TO R2000-RI-SEX.
           MOVE L0386-CSN-RT-AGE           TO R2000-RI-ISS-AGE.
           MOVE L0386-CSN-EFF-DT           TO R2000-RI-ISS-DATE.
           MOVE L0386-CSN-PD-TO-DT         TO R2000-RI-PAID-TO-DATE.
           MOVE L0386-CSN-MAT-XPRY-DT      TO R2000-RI-ME-DATE.
           MOVE L0386-CSN-RSK-CALC-CD        TO R2000-RI-RISK-IND.
           MOVE WS-RI-MODE                 TO R2000-RI-MODE.

       2640-REIN-GEN-INFO-MOVE-X.
           EXIT.
      /
      *------------------------
       2650-REIN-PREM-INFO-MOVE.
      *------------------------

      *
      *         REINSURANCE PREMIUM INFO
      *
010302*    MOVE RPH-PREM-RT-TBAC-ID      TO R2000-PH-RI-PR-ACCESS-CODE.
010302     MOVE 'PREMS'               TO R2000-PLRT-RI-PR-ACCESS-CODE.

010302*    PERFORM  2612-CALC-BAND-NUMBER
010302*        THRU 2612-CALC-BAND-NUMBER-X.
010302*
010302*    MOVE WS-PH-BAND-NUMBER        TO R2000-PH-RI-BAND-NUMBER.
           MOVE RPH-PREM-CHNG-AGE-DUR-N  TO R2000-PH-RI-PREM-CHGE-YRS.
010302*    MOVE RPH-SELCT-PERI-DUR-N     TO R2000-PH-RI-SEL-PERIOD.
           MOVE L0386-CSN-PREM-OFFST-DUR   TO R2000-RI-DUR-OFFSET.
           MOVE L0386-CSN-PFEE-AMT         TO R2000-RI-POLICY-FEE.
           MOVE L0386-CSN-RSK-DECR-AMT     TO R2000-RI-DECREMENT.

       2650-REIN-PREM-INFO-MOVE-X.
           EXIT.
      /
      *---------------------------
       2660-REIN-SHARED-INFO-MOVE.
      *---------------------------

      *
      *         REINSURANCE SHARED INFO
      *
           EVALUATE TRUE

               WHEN WS-COMP-TYPE-ADE
                    MOVE L0386-CSN-AD-ALLOW-ID TO R2000-RI-TREATY
                    MOVE L0386-CSN-AD-FACE-AMT TO R2000-RI-FACE-AMOUNT
                    MOVE L0386-CSN-AD-PREM-AMT
                                             TO R2000-RI-GROSS-ANN-PREM

               WHEN WS-COMP-TYPE-FE
                    MOVE L0386-CSN-FE-ALLOW-ID TO R2000-RI-TREATY
                    MOVE L0386-CSN-FE-FCT      TO R2000-RI-FACE-AMOUNT
                    MOVE L0386-CSN-FE-PREM-AMT
                                             TO R2000-RI-GROSS-ANN-PREM

               WHEN WS-COMP-TYPE-MRE
                    MOVE L0386-CSN-ME-ALLOW-ID TO R2000-RI-TREATY
                    MOVE L0386-CSN-ME-FCT      TO R2000-RI-FACE-AMOUNT
                    MOVE L0386-CSN-ME-PREM-AMT
                                            TO R2000-RI-GROSS-ANN-PREM

               WHEN WS-COMP-TYPE-WPE
                    MOVE L0386-CSN-WP-ALLOW-ID TO R2000-RI-TREATY
                    MOVE L0386-CSN-WP-FACE-AMT TO R2000-RI-FACE-AMOUNT
                    MOVE L0386-CSN-WP-PREM-AMT
                                            TO R2000-RI-GROSS-ANN-PREM

               WHEN OTHER
                    MOVE L0386-CSN-LIFE-ALLOW-ID TO R2000-RI-TREATY
                    MOVE L0386-CSN-ORIG-RSK-AMT TO R2000-RI-FACE-AMOUNT
                    MOVE L0386-CSN-BASIC-PREM-AMT
                                           TO R2000-RI-GROSS-ANN-PREM

           END-EVALUATE.

           IF  WS-COMP-TYPE-BAS
               MOVE L0386-CSN-CRNT-RSK-AMT   TO R2000-RI-AMT-AT-RISK
           ELSE
               MOVE R2000-RI-FACE-AMOUNT   TO R2000-RI-AMT-AT-RISK
           END-IF.

       2660-REIN-SHARED-INFO-MOVE-X.
           EXIT.
      /
      *---------------------------
       2670-CASH-FL-GEN-INFO-MOVE.
      *---------------------------

      *
      *         CASH FLOW GENERAL INFO
      *
           MOVE 'Y'                           TO R2000-CF-INDICATOR.

           IF  WCVGS-CVG-INS-TYP-SEG-FUND (I)
               MOVE 'F'                       TO R2000-CF-TYPE
           ELSE
               MOVE WCVGS-CVG-CF-TYP-CD (I)   TO R2000-CF-TYPE
           END-IF.

           IF  NOT WCVGS-CVG-CF-TYP-GIA (I)
010314     AND NOT WCVGS-CVG-CF-TYP-EIA (I)
               MOVE WCVGS-CVG-ISS-EFF-DT (I)  TO R2000-CF-EFF-DATE
               MOVE WCVGS-CVG-MAT-XPRY-DT (I) TO R2000-CF-ROLL-DATE
           END-IF.

54-001     MOVE L0182-CVG-ACUM-VALU-AMT (I)  TO R2000-CF-GROSS-CASH-VAL.
54-001     MOVE L0182-CVG-CV-AMT   (I)       TO R2000-CF-NET-CASH-VAL.

       2670-CASH-FL-GEN-INFO-MOVE-X.
           EXIT.
      /
      *---------------------------
       2680-CASH-FL-GIA-INFO-MOVE.
      *---------------------------

      *
      *         CASH FLOW GIA INFO
      *
           MOVE RCFLW-CF-STAT-CD           TO R2000-CF-STATUS.

           IF  RCFLW-CF-TRXN-DEPOSIT
           AND (RCFLW-CF-REASN-ROLLOVER
           OR RCFLW-CF-REASN-INTEREST)
               MOVE 'R'                    TO R2000-CF-INIT-ROLL
           ELSE
               MOVE 'I'                    TO R2000-CF-INIT-ROLL
           END-IF.

           MOVE RCFLW-CF-DPOS-TRM-MO-DUR-N TO R2000-CF-TERM-MONTHS.
           MOVE RCFLW-CF-DPOS-TRM-DY-DUR-N TO R2000-CF-TERM-DAYS.
           MOVE RCFLW-CF-INT-PCT           TO R2000-CF-INTEREST-RATE.
           MOVE RCFLW-CF-FND-BAL-AMT       TO R2000-CF-CURRENT-AMOUNT.
           MOVE RPH-CF-INT-CALC-TYP-CD     TO R2000-PH-INT-CALC-TYPE.
           MOVE WCVGS-CVG-INT-PAYO-CD (I)  TO R2000-CO-INT-HANDLING.
           MOVE RPH-CF-INT-MODE-CD         TO R2000-PH-INT-MODE.
           MOVE RCFLW-CF-INT-PAYO-DT       TO R2000-CF-NXT-INT-DATE.
      *
      *   SET R2000-CF-EFFECTIVE-DATE & R2000-CF-ROLL-DATE HERE
      *   RATHER THAN PERFORMING PARA 2670-CASH-FL-GEN-INFO-MOVE,
      *   SINCE CF DATES ONLY REQUIRED FOR GIA'S.
      *
           MOVE RCFLW-CF-EFF-DT            TO R2000-CF-EFF-DATE.
           MOVE RCFLW-ROLOVR-CF-DT         TO R2000-CF-ROLL-DATE.
      *
      *   IF IT IS NOT THE FIRST GIA WRITE, ZERO THE CASH FLOW FIELDS
      *
           IF  NOT WS-1ST-GIA-WRITE
               MOVE ZERO                   TO R2000-CF-GROSS-CASH-VAL
               MOVE ZERO                   TO R2000-CF-NET-CASH-VAL
           ELSE
               MOVE WS-OFF                 TO WS-1ST-GIA-WRITE-IND
           END-IF.

       2680-CASH-FL-GIA-INFO-MOVE-X.
           EXIT.
      /
      *---------------------------
       2690-IMM-ANNUITY-INFO-MOVE.
      *---------------------------

      *
      *         IMMEDIATE ANNUITY INFO
      *
           MOVE 'Y'                      TO R2000-QT-INDICATOR.
           MOVE RQT-IA-QUOT-TYP-CD       TO R2000-QT-TYPE.
           MOVE RQT-IA-QUOT-STAT-CD      TO R2000-QT-STATUS.

           MOVE RQT-IA-GUAR-YR-DUR-N     TO R2000-QT-GUAR-YRS.
           MOVE RQT-IA-GUAR-MO-DUR-N     TO R2000-QT-GUAR-MTHS.
           MOVE RQT-IA-INCM-1-ADJ-FCT    TO R2000-QT-INC-ADJ-FACTOR1.
           MOVE RQT-IA-INCM-2-ADJ-FCT    TO R2000-QT-INC-ADJ-FACTOR2.
           MOVE RQT-IA-QUOT-INCM-AMT     TO R2000-QT-INC-AMT.
           MOVE RQT-IA-INCM-STRT-DT      TO R2000-QT-INC-STRT-DATE.
           MOVE RQT-ANUTNT-1-SEX-CD      TO R2000-QT-SEX1.
           MOVE RQT-ANUTNT-1-BTH-DT      TO R2000-QT-DOB1.
           MOVE RQT-ANUTNT-2-SEX-CD      TO R2000-QT-SEX2.
           MOVE RQT-ANUTNT-2-BTH-DT      TO R2000-QT-DOB2.
           MOVE RQT-IA-QUOT-INT-1-PCT    TO R2000-QT-INT-RATE1.
           MOVE RQT-IA-INT-1-RT-MO-DUR-N TO R2000-QT-INT-TERM-MTHS.
           MOVE RQT-IA-INT-1-RT-DY-DUR-N TO R2000-QT-INT-TERM-DAYS.
           MOVE RQT-IA-QUOT-INT-2-PCT    TO R2000-QT-INT-RATE2.
           MOVE RQT-IA-QUOT-JNT-DTH-CD   TO R2000-QT-JOINT-DEATH-CODE.
           MOVE RQT-IA-MORT-PREM-ID      TO R2000-QT-ANN-MORT-PR-SCAL.
           MOVE RQT-IA-MORT-UVAL-ID      TO R2000-QT-ANN-MORT-CODE.
           MOVE RPOL-POL-ANPAYO-MODE-CD-N TO R2000-PO-MODE.
      *
      *    SET R2000-CO-ISSUE-DATE = RQT-IA-PREM-PMT-DT HERE RATHER
      *    THAN PERFORMING PARA 2600-CO-SHARED-INFO-MOVE, SINCE
      *    QT FILE JUST READ AND RPOL-POL-ISS-EFF-DT IS ONLY CHANGE
      *    REQUIRED TO CO-SHARED-INFO.
      *
           MOVE RQT-IA-PREM-PMT-DT       TO R2000-CO-ISSUE-DATE.

      *
      * WRITE OUT 'DUE & PAID-IN-ADVANCE' ANNUITY PAYMENT RECORD
      *
           PERFORM  2700-ADJ-PTD-CALC-IMM
               THRU 2700-ADJ-PTD-CALC-IMM-X.

           IF  DUE-F NOT = 0
           OR  DUE-R NOT = 0
           OR  ADV-F NOT = 0
           OR  ADV-R NOT = 0
               PERFORM  2800-WRITE-IMM-ANN
                   THRU 2800-WRITE-IMM-ANN-X
           END-IF.

       2690-IMM-ANNUITY-INFO-MOVE-X.
           EXIT.
      /
      *----------------------
       2700-ADJ-PTD-CALC-IMM.
      *----------------------

      *
      * THE EFFECT OF THE FOLLOWING IS TO PUT THE PTD TO A DATE
      * WHICH FALLS AFTER THE EXT-DATE (IE. A MODE PAST THE EXT-DATE)
      * IT SEEMS EASIER TO BRING THE DATE BACK UNTIL IT FALLS A MODE
      * BEFORE THE EXT-DATE.  AFTERWARDS IT CAN EASILY BE ADVANCED
      * ONE MODE TO PLACE THE PTD THE NEXT MODE AFTER THE EXT-DATE.
      *

           MOVE ZEROES            TO DUE-F.
           MOVE ZEROES            TO DUE-R.
           MOVE ZEROES            TO ADV-F.
           MOVE ZEROES            TO ADV-R.
           MOVE WCVGS-CVG-ISS-EFF-DT (I) TO FIRST-ANN.
           ADD 1                  TO YEAR-FA.

           IF  RPOL-POL-PD-TO-DT-NUM > EXT-DATE
               PERFORM  2710-ADJ-PTD-CALC-ADV
                   THRU 2710-ADJ-PTD-CALC-ADV-X
           ELSE
               PERFORM  2720-ADJ-PTD-CALC-DUE
                   THRU 2720-ADJ-PTD-CALC-DUE-X
           END-IF.

           IF  RPOL-POL-ANPAYO-MODE-CD-N > 12
               MOVE WCVGS-CVG-ISS-EFF-DT (I) TO ADJUSTED-PAID-TO-DATE
               MOVE EXT-YEAR      TO ADJ-PTD-YEAR
               IF  ADJUSTED-PAID-TO-DATE < EXT-DATE
                   ADD 1          TO ADJ-PTD-YEAR
               END-IF
           END-IF.

       2700-ADJ-PTD-CALC-IMM-X.
           EXIT.

      *----------------------
       2710-ADJ-PTD-CALC-ADV.
      *----------------------

           MOVE RPOL-POL-PD-TO-DT-NUM TO ADJUSTED-PAID-TO-DATE.
           MOVE RPOL-POL-PD-TO-DT-NUM TO WWKDT-INT-DT-1.

       2710-CHECK-FOR-MORE-ADV.

           SUBTRACT RPOL-POL-ANPAYO-MODE-CD-N
               FROM WWKDT-INT-DT-MO-1
             GIVING WWKDT-NUM-MO.

       2710-PAC-SUB-LOOP.

           IF  WWKDT-NUM-MO < 1
               ADD 12             TO WWKDT-NUM-MO
               SUBTRACT 1 FROM WWKDT-INT-DT-YR-1
               GO TO 2710-PAC-SUB-LOOP
           END-IF.

           MOVE WWKDT-NUM-MO      TO WWKDT-INT-DT-MO-1.
           IF  WWKDT-INT-DT-1 > EXT-DATE
               MOVE WWKDT-INT-DT-1 TO ADJUSTED-PAID-TO-DATE
               IF  ADJUSTED-PAID-TO-DATE < FIRST-ANN
                   ADD RQT-IA-QUOT-INCM-AMT TO ADV-F
               ELSE
                   ADD RQT-IA-QUOT-INCM-AMT TO ADV-R
               END-IF
           END-IF.

           IF  WWKDT-INT-DT-1 > EXT-DATE
               GO TO 2710-CHECK-FOR-MORE-ADV
           END-IF.

       2710-ADJ-PTD-CALC-ADV-X.
           EXIT.

      *----------------------
       2720-ADJ-PTD-CALC-DUE.
      *----------------------

           MOVE RPOL-POL-PD-TO-DT-NUM TO ADJUSTED-PAID-TO-DATE.

       2720-CHECK-FOR-MORE-DUE.

           IF  ADJUSTED-PAID-TO-DATE < FIRST-ANN
               ADD RQT-IA-QUOT-INCM-AMT TO DUE-F
           ELSE
               ADD RQT-IA-QUOT-INCM-AMT TO DUE-R
           END-IF.

           ADD RPOL-POL-ANPAYO-MODE-CD-N TO ADJ-PTD-MONTH.

       2720-PDC-ADD-LOOP.

           IF  ADJ-PTD-MONTH > 12
               SUBTRACT 12 FROM ADJ-PTD-MONTH
               ADD 1              TO ADJ-PTD-YEAR
               GO TO 2720-PDC-ADD-LOOP
           END-IF.

           IF  ADJUSTED-PAID-TO-DATE < EXT-DATE
               GO TO 2720-CHECK-FOR-MORE-DUE
           END-IF.

       2720-ADJ-PTD-CALC-DUE-X.
           EXIT.
      /
      *------------------------
       2800-WRITE-IMM-ANN.
      *------------------------

007684     MOVE SPACES                    TO R1100-SEQ-REC-INFO.
           MOVE WCVGS-CVG-ACCT-TYP-CD (I) TO R1100-LOB.
           MOVE '99'                      TO R1100-REC-ID.
           MOVE WCVGS-CVG-PAR-CD (I)      TO R1100-PAR.
           MOVE RPOL-POL-ID               TO R1100-POLICY.
           MOVE WCVGS-CVG-SEQ-NUM-N (I)   TO R1100-RIDER-NUM.
           MOVE RPOL-CLI-CRNT-LOC-CD      TO R1100-PROV.
           MOVE WCVGS-CVG-ISS-EFF-DT (I)  TO R1100-ISSUE-DATE.
           MOVE RPOL-POL-PD-TO-DT-NUM     TO R1100-PAID-TO-DATE.
           MOVE ADJUSTED-PAID-TO-DATE     TO R1100-ADJUSTED-DATE.
           MOVE RPOL-POL-ANPAYO-MODE-CD-N TO R1100-MODX.
           MOVE RQT-IA-QUOT-INCM-AMT      TO R1100-MODE-PREMIUM.
           MOVE DUE-F                     TO R1100-DUE-F.
           MOVE DUE-R                     TO R1100-DUE-R.
           MOVE ADV-F                     TO R1100-ADV-F.
           MOVE ADV-R                     TO R1100-ADV-R.

           ADD 1                          TO R1100-RECORDS-OUT.
           PERFORM  1100-1000-WRITE
               THRU 1100-1000-WRITE-X.

       2800-WRITE-IMM-ANN-X.
           EXIT.
      /
      *--------------------------
       3000-GENERAL-EXTRACT-FILL.
      *--------------------------

010311*    MOVE 'N'               TO WS-EXTRACT-WRITE-IND.
010311     SET EXTRACT-NOT-WRITTEN   TO  TRUE.

           IF  (WCVGS-CVG-CSN-REC-CTR-N (I) > ZERO)
               PERFORM  3600-REINSURANCE-INFO-FILL
                   THRU 3600-REINSURANCE-INFO-FILL-X
                   VARYING J FROM 1 BY 1
                   UNTIL   J > WCVGS-CVG-CSN-REC-CTR-N (I)
               PERFORM  3650-RELOAD-PHDR
                   THRU 3650-RELOAD-PHDR-X
               PERFORM  1800-RE-INIT-RE-INS-WS
                   THRU 1800-RE-INIT-RE-INS-WS-X
010311*        MOVE 'N'           TO WS-EXTRACT-WRITE-IND
010311         SET EXTRACT-NOT-WRITTEN  TO  TRUE
               IF  WS-COMP-TYPE-BAS
                   MOVE RVL-VALN-LBL-CD (1) TO R2000-VALN-LABEL
               END-IF
           END-IF.

54-001     IF WCVGS-CVG-INS-TYP-FPA (I)
54-001     OR WCVGS-CVG-INS-TYP-SEG-FUND (I)
54-001     OR WCVGS-CVG-INS-TYP-UL-INS-ANTY (I)
54-001     OR WCVGS-CVG-INS-TYP-ISWL (I)
           AND (WCVGS-CVG-CF-REC-CTR-N (I) > ZERO
54-001     OR  WCVGS-CVG-INS-TYP-SEG-FUND (I))
54-001     AND (WS-BASE-NOT-WRITTEN)
               PERFORM  3800-CASH-FLOW-PART-FILL
                   THRU 3800-CASH-FLOW-PART-FILL-X
               IF  NOT WCVGS-CVG-CF-TYP-GIA (I)
010314         AND NOT WCVGS-CVG-CF-TYP-EIA (I)
010311*            MOVE 'N'       TO WS-EXTRACT-WRITE-IND
010311             SET EXTRACT-NOT-WRITTEN   TO  TRUE
               END-IF
           END-IF.

54-900*    IF WCVGS-CVG-INS-TYP-IMMED-ANTY
54-900     IF WCVGS-CVG-INS-TYP-IMMED-ANTY (I)
               MOVE WCVGS-IA-QUOT-NUM-N (I) TO WQT-IA-QUOT-NUM-N
               PERFORM  QT-1000-READ
                   THRU QT-1000-READ-X
               PERFORM  2690-IMM-ANNUITY-INFO-MOVE
                   THRU 2690-IMM-ANNUITY-INFO-MOVE-X
           END-IF.

           IF  (EXTRACT-NOT-WRITTEN)
           AND (NOT ACCESS-ERRORS)
               PERFORM  4000-WRITE-VALUATION-EXTRACT
                   THRU 4000-WRITE-VALUATION-EXTRACT-X
           END-IF.

           MOVE 'N'               TO WS-ACCESS-ERR-SW.

       3000-GENERAL-EXTRACT-FILL-X.
           EXIT.
      /
      *---------------------------
       3600-REINSURANCE-INFO-FILL.
      *---------------------------

54-001     MOVE RPOL-POL-ID              TO L0386-POL-ID.
54-001     MOVE I                        TO L0386-CVG-NUM.
54-001     MOVE J                        TO L0386-CSN-REC-NUM.
54-001     SET L0386-TREATY-INFO-REQD    TO TRUE.

54-001     PERFORM  0386-1000-OBT-CEDED-REINS
54-001         THRU 0386-1000-OBT-CEDED-REINS-X.

54-001     IF L0386-RETRN-NOT-FOUND
54-001     OR L0386-RETRN-ERROR
               MOVE SPACES           TO PRINT-LIN-R
017205*        MOVE 'POLICY NUMBER NOT FOUND IN "RI" FILE!!' TO
017205*                                              PRINT-LINE
017205         MOVE '00007'                TO L2490-TXT-SRC-REF-ID
017205         PERFORM  2490-1000-RETRIEVE-TEXT
017205             THRU 2490-1000-RETRIEVE-TEXT-X
017205         MOVE L2490-TXT-STR-TXT      TO PRINT-LINE
54-001         MOVE L0386-POL-ID     TO WS-RI-POL-ID
54-001         MOVE L0386-CVG-NUM    TO WS-RI-CVG-NUM
54-001         MOVE L0386-CSN-REC-NUM TO WS-RI-CSN-REC-NUM
54-001         MOVE WS-RI-KEY          TO PRINTB
               PERFORM  9000-PRINT
                   THRU 9000-PRINT-X
               MOVE 'Y'              TO WS-ACCESS-ERR-SW
               GO TO 3600-REINSURANCE-INFO-FILL-X
           END-IF.

54-001     IF  NOT L0386-CSN-STAT-IN-FORCE
54-001     OR  L0386-CSN-CRNT-RSK-AMT  = ZERO
54-001     OR  L0386-CSN-EFF-DT    > EXT-DATE
               GO TO 3600-REINSURANCE-INFO-FILL-X
           END-IF.

           IF  WS-COMP-TYPE-BAS
54-001         IF  L0386-CSN-REINS-TYP-YRT
                   MOVE RVL-VALN-LBL-CD (10) TO R2000-VALN-LABEL
54-001             MOVE L0386-CSN-PLAN-ID     TO WPH-PLAN-ID
                   PERFORM  PH-1000-READ
                       THRU PH-1000-READ-X
                   PERFORM  2650-REIN-PREM-INFO-MOVE
                       THRU 2650-REIN-PREM-INFO-MOVE-X
               ELSE
                   MOVE RVL-VALN-LBL-CD (11) TO R2000-VALN-LABEL
               END-IF
           END-IF.

           PERFORM  2640-REIN-GEN-INFO-MOVE
               THRU 2640-REIN-GEN-INFO-MOVE-X.

           PERFORM  2660-REIN-SHARED-INFO-MOVE
               THRU 2660-REIN-SHARED-INFO-MOVE-X.

           IF  NOT ACCESS-ERRORS
               PERFORM  4000-WRITE-VALUATION-EXTRACT
                   THRU 4000-WRITE-VALUATION-EXTRACT-X
           END-IF.

           MOVE 'N'                      TO WS-ACCESS-ERR-SW.
010311*    MOVE 'Y'                      TO WS-EXTRACT-WRITE-IND.
010311*    SET EXTRACT-WRITTEN           TO TRUE.

       3600-REINSURANCE-INFO-FILL-X.
           EXIT.
      /
      *-----------------
       3650-RELOAD-PHDR.
      *-----------------

           IF  L0386-CSN-REINS-TYP-YRT
           AND WS-COMP-TYPE-BAS
54-001         PERFORM  PLIN-1000-PLAN-HEADER-IN
54-001             THRU PLIN-1000-PLAN-HEADER-IN-X
               PERFORM  2650-REIN-PREM-INFO-MOVE
                   THRU 2650-REIN-PREM-INFO-MOVE-X
           END-IF.

       3650-RELOAD-PHDR-X.
           EXIT.
      /
      *-------------------------
       3800-CASH-FLOW-PART-FILL.
      *-------------------------

           IF  WS-CF-1ST-TIME-IN
               PERFORM  PCOM-1000-READ
                   THRU PCOM-1000-READ-X
               PERFORM  PGA-1000-BUILD-PARMS
                   THRU PGA-1000-BUILD-PARMS-X
               MOVE EXT-DATE                TO L0182-EFF-DT
               MOVE WS-OFF                  TO WS-CF-1ST-TIME-IND

54-001         PERFORM  0182-1000-BUILD-PARM-INFO
54-001             THRU 0182-1000-BUILD-PARM-INFO-X

54-001         PERFORM  0182-1000-CALC-CSV-POL
54-001             THRU 0182-1000-CALC-CSV-POL-X

           END-IF.

           PERFORM  2670-CASH-FL-GEN-INFO-MOVE
               THRU 2670-CASH-FL-GEN-INFO-MOVE-X.

           IF  (WCVGS-CVG-INS-TYP-CD (I) = 'D')
557660     OR  (WCVGS-CVG-INS-TYP-CD (I) = 'S')
               MOVE RVL-VALN-LBL-CD (12)    TO R2000-VALN-LABEL
               PERFORM  4000-WRITE-VALUATION-EXTRACT
                   THRU 4000-WRITE-VALUATION-EXTRACT-X
               PERFORM  3880-INIT-CF-GEN-INFO
                   THRU 3880-INIT-CF-GEN-INFO-X
               MOVE RVL-VALN-LBL-CD (1)     TO R2000-VALN-LABEL
               PERFORM  2620-CO-VALUES-INFO-MOVE
                   THRU 2620-CO-VALUES-INFO-MOVE-X
               GO TO 3800-CASH-FLOW-PART-FILL-X
           END-IF.

           IF  NOT WCVGS-CVG-CF-TYP-GIA (I)
010314     AND NOT WCVGS-CVG-CF-TYP-EIA (I)
               GO TO 3800-CASH-FLOW-PART-FILL-X
           END-IF.

           MOVE WS-ON                       TO WS-1ST-GIA-WRITE-IND.
54-001     PERFORM  CINB-1000-INIT-CF-BROWSE-KEY
54-001         THRU CINB-1000-INIT-CF-BROWSE-KEY-X.
           MOVE WCFLW-KEY                   TO WCFLW-ENDBR-KEY.
557659*    MOVE WWKDT-HIGH-DT               TO WCFLW-ENDBR-CF-DT.
557659     MOVE WWKDT-HIGH-DT               TO WCFLW-ENDBR-CF-EFF-DT.
           MOVE 999                         TO WCFLW-ENDBR-CF-SEQ-NUM.
           PERFORM  CFLW-1000-BROWSE
               THRU CFLW-1000-BROWSE-X.

           IF  WCFLW-IO-OK
               PERFORM  CFLW-2000-READ-NEXT
                   THRU CFLW-2000-READ-NEXT-X
               IF  WCFLW-IO-OK
                   PERFORM  3900-CF-PART-GIA-FILL
                       THRU 3900-CF-PART-GIA-FILL-X
                       UNTIL NOT WCFLW-IO-OK
                   PERFORM  CFLW-3000-END-BROWSE
                       THRU CFLW-3000-END-BROWSE-X
               ELSE
                   PERFORM  CFLW-3000-END-BROWSE
                       THRU CFLW-3000-END-BROWSE-X
               END-IF
           END-IF.

       3800-CASH-FLOW-PART-FILL-X.
           EXIT.
      /
      *----------------------
       3880-INIT-CF-GEN-INFO.
      *----------------------

           MOVE 'N'                  TO R2000-CF-INDICATOR.
           MOVE ' '                  TO R2000-CF-TYPE.
           MOVE WWKDT-ZERO-DT        TO R2000-CF-EFF-DATE.
           MOVE WWKDT-ZERO-DT        TO R2000-CF-ROLL-DATE.
           MOVE ZERO                 TO R2000-CF-GROSS-CASH-VAL.
           MOVE ZERO                 TO R2000-CF-NET-CASH-VAL.

       3880-INIT-CF-GEN-INFO-X.
           EXIT.
      /
      *----------------------
       3900-CF-PART-GIA-FILL.
      *----------------------

015543*    IF (RCFLW-CF-STAT-CD = ('1' OR '5')
015543     IF (RCFLW-CF-STAT-CD =  '1' OR '5'
           AND
              (RCFLW-CF-TRXN-CD = 'DEP'))
               NEXT SENTENCE
           ELSE
               PERFORM  CFLW-2000-READ-NEXT
                   THRU CFLW-2000-READ-NEXT-X
               GO TO 3900-CF-PART-GIA-FILL-X
           END-IF.

           MOVE 'Y'               TO R2000-CF-INDICATOR.

           PERFORM  2680-CASH-FL-GIA-INFO-MOVE
               THRU 2680-CASH-FL-GIA-INFO-MOVE-X.

           IF  NOT ACCESS-ERRORS
               PERFORM  4000-WRITE-VALUATION-EXTRACT
                   THRU 4000-WRITE-VALUATION-EXTRACT-X
           END-IF.

           MOVE 'N'               TO WS-ACCESS-ERR-SW.

           PERFORM  CFLW-2000-READ-NEXT
               THRU CFLW-2000-READ-NEXT-X.

       3900-CF-PART-GIA-FILL-X.
           EXIT.
      /
      *-----------------------------
       4000-WRITE-VALUATION-EXTRACT.
      *-----------------------------

           IF  R2000-RI-INDICATOR = 'Y'
               ADD 1              TO REINSURANCE-COUNTER
           END-IF.

           IF  R2000-CF-INDICATOR = 'Y'
               ADD 1              TO CASH-FLOW-COUNTER
           END-IF.

           IF  R2000-QT-INDICATOR = 'Y'
               ADD 1              TO IMM-ANN-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '5'
010311     IF  R2000-COMP-TYPE-5
               ADD 1              TO AD-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '0'
010311     IF  R2000-COMP-TYPE-0
               ADD 1              TO BASE-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '2'
010311     IF  R2000-COMP-TYPE-2
               ADD 1              TO ETI-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '4'
010311     IF  R2000-COMP-TYPE-4
               ADD 1              TO OYT-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '3'
010311     IF  R2000-COMP-TYPE-3
               ADD 1              TO PUA-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '1'
010311     IF  R2000-COMP-TYPE-1
               ADD 1              TO RPU-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '7'
010311     IF  R2000-COMP-TYPE-7
               ADD 1              TO FE-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '8'
010311     IF  R2000-COMP-TYPE-8
               ADD 1              TO MRE-COUNTER
           END-IF.

010311*    IF  R2000-COMP-TYPE = '6'
010311     IF  R2000-COMP-TYPE-6
               ADD 1              TO WP-COUNTER
           END-IF.

           ADD 1                  TO TOTAL-COUNTER.

           PERFORM  2000-1000-WRITE
               THRU 2000-1000-WRITE-X.

010311*    MOVE 'Y'               TO WS-EXTRACT-WRITE-IND.
010311     SET EXTRACT-WRITTEN    TO TRUE.

       4000-WRITE-VALUATION-EXTRACT-X.
           EXIT.
      /
      *-----------------
       5000-POLICY-READ.
      *-----------------

           ADD 1                       TO POLICIES-READ.

           PERFORM  POLQ-1000-READ
               THRU POLQ-1000-READ-X.

007684     IF  WPOLQ-SEQ-IO-EOF
               SUBTRACT 1 FROM POLICIES-READ
           ELSE
007684         MOVE RPOLQ-SEQ-REC-INFO TO RPOL-REC-INFO
               IF  RPOL-POL-SUSPENDED
                   PERFORM  5100-SUSP-POLICY-READ
                       THRU 5100-SUSP-POLICY-READ-X
               END-IF
           END-IF.

       5000-POLICY-READ-X.
           EXIT.

      *----------------------
       5100-SUSP-POLICY-READ.
      *------------------------

           ADD 1                   TO SUSPENDED-POLS-READ.

           PERFORM  SPOQ-1000-READ
               THRU SPOQ-1000-READ-X.

007684     IF  WSPOQ-SEQ-IO-EOF
               SUBTRACT 1 FROM SUSPENDED-POLS-READ
           ELSE
007684         MOVE RSPOQ-SEQ-REC-INFO TO RPOL-REC-INFO
           END-IF.

       5100-SUSP-POLICY-READ-X.
           EXIT.

      *------------------------
       5500-CO-READ-SEQUENTIAL.
      *------------------------


           PERFORM  CVGQ-1000-READ
               THRU CVGQ-1000-READ-X.

007684     IF  WCVGQ-SEQ-IO-EOF
               GO TO 5500-CO-READ-SEQUENTIAL-X
           ELSE
007684         MOVE RCVGQ-SEQ-REC-INFO TO RCVG-REC-INFO
           END-IF.

       5500-CO-READ-SEQUENTIAL-X.
           EXIT.

      *------------------
       5600-SUSP-CVG-READ.
      *-------------------

           PERFORM  SCVQ-1000-READ
               THRU SCVQ-1000-READ-X.
007684     IF  WSCVQ-SEQ-IO-EOF
               GO TO 5600-SUSP-CVG-READ-X
           ELSE
007684         MOVE RSCVQ-SEQ-REC-INFO TO RCVG-REC-INFO
           END-IF.

       5600-SUSP-CVG-READ-X.
           EXIT.
      /
      *--------------------------
       6000-PRINT-PROCESS-REPORT.
      *--------------------------

           MOVE SPACES            TO PRINT-LINE.
017205*    MOVE 'RECORDS WRITTEN  TO IMMANN FILE  =' TO PRINT-DESC-4.
017205     MOVE '00008'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-4.
           MOVE R1100-RECORDS-OUT TO PRINT-VAL-4.
           MOVE 3                 TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE        TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES            TO PRINT-LINE.
017205*    MOVE 'RECORDS WRITTEN  TO PREMDUE FILE =' TO PRINT-DESC-4.
017205     MOVE '00009'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-4.
           MOVE R1200-RECORDS-OUT TO PRINT-VAL-4.
           MOVE 2                 TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE        TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

011652*    MOVE 0002                   TO HDG1-PAGE.
011652     MOVE 0002                   TO WHDG-PAGE.
011652*    MOVE HEADING-LINE-1         TO RPRT1-REC-INFO.
007684     MOVE WHDG-LINE-1            TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-2000-WRITE
               THRU PRT1-2000-WRITE-X.

           MOVE 2                      TO WPRT1-NUMBER-LINES.
011652*    MOVE HEADING-LINE-2         TO RPRT1-REC-INFO.
007684     MOVE WHDG-LINE-2            TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
           MOVE 1                      TO WPRT1-NUMBER-LINES.
007684     MOVE SPACES                 TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE ALL '*'                TO PRINT-LIN.
           MOVE 1                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE 'PROCESS DETAILS'      TO PRINT-DESC-1.
017205     MOVE '00010'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
017205*    MOVE '  POLICIES '          TO PRINT-VAL-1.
017205     MOVE '00011'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-VAL-1.
017205*    MOVE ' COVERAGES '          TO PRINT-VAL-2.
017205     MOVE '00012'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-VAL-2.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - READ            '  TO PRINT-DESC-1.
017205     MOVE '00013'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE POLICIES-READ          TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE COVS-READ              TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-2.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - NOT PROCESSED   '  TO PRINT-DESC-1.
017205     MOVE '00014'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE POLICIES-NOT-PROCESS   TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE COVS-NOT-PROCESSED     TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-2.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE 'EXTRACTS DETAILS   '  TO PRINT-DESC-1.
017205     MOVE '00015'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE 5                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - PAID-UP ADDITIONS :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00016'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE PUA-COUNTER            TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - ONE YEAR TERM     :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00017'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE OYT-COUNTER            TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - REDUCED PAID-UP   :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00018'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE RPU-COUNTER            TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - EXTENDED-TERM INS :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00019'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE ETI-COUNTER            TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - BASE COMPONENT    :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00020'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE BASE-COUNTER           TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - ACCIDENTAL DEATH  :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00021'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE AD-COUNTER             TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - WAIVER OF PREMIUM :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00022'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE WP-COUNTER             TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - SUBSTANDARD (FE)  :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00023'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE FE-COUNTER             TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - SUBSTANDARD (MRE) :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00024'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE MRE-COUNTER            TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - GRAND TOTAL       :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00025'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE TOTAL-COUNTER          TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 3                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' EXTRACT FOR  :       '
017205*                                TO PRINT-DESC-1.
017205     MOVE '00026'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE 4                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - REINSURANCE-PART  :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00027'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE REINSURANCE-COUNTER TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - CASH-FLOW-PART    :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00028'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE CASH-FLOW-COUNTER      TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE SPACES                 TO PRINT-LINE.
017205*    MOVE ' - IMM-ANN-PART      :'
017205*                                TO PRINT-DESC-1.
017205     MOVE '00029'                TO L2490-TXT-SRC-REF-ID.
017205     PERFORM  2490-1000-RETRIEVE-TEXT
017205         THRU 2490-1000-RETRIEVE-TEXT-X.
017205     MOVE L2490-TXT-STR-TXT      TO PRINT-DESC-1.
           MOVE IMM-ANN-COUNTER        TO EDIT-1.
           MOVE EDIT-1                 TO EDIT-3.
           MOVE EDIT-3                 TO PRINT-VAL-1.
           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

           MOVE ALL '*'                TO PRINT-LIN.

           MOVE 2                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

       6000-PRINT-PROCESS-REPORT-X.
           EXIT.
      /
      *-----------------
       8000-TERMINATION.
      *-----------------

           PERFORM  6000-PRINT-PROCESS-REPORT
               THRU 6000-PRINT-PROCESS-REPORT-X.

       8000-TERMINATION-X.
           EXIT.

      *
       9000-PRINT.

           MOVE 1                      TO WPRT1-NUMBER-LINES.
007684     MOVE PRINT-LINE             TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

       9000-PRINT-X.
           EXIT.
      /
      *****************************************************************
      **   VALUATION  LABEL                                          **
      *****************************************************************

       9100-VAL-LABEL-IN.

           MOVE RPH-VALN-LBL-ID        TO WVL-VALN-LBL-ID.
           IF  WVL-KEY NOT = RVL-KEY
               PERFORM  VL-1000-READ
                   THRU VL-1000-READ-X
               IF  NOT WVL-IO-OK
                   MOVE SPACES         TO PRINT-LIN-R
017205*            MOVE ' VALUATION LABEL RECORD NOT FOUND:' TO
017205*                  PRINT-LINE
017205             MOVE '00030'                TO L2490-TXT-SRC-REF-ID
017205             PERFORM  2490-1000-RETRIEVE-TEXT
017205                 THRU 2490-1000-RETRIEVE-TEXT-X
017205             MOVE L2490-TXT-STR-TXT      TO PRINT-LINE
                   MOVE WVL-KEY        TO PRINTB
                   PERFORM  9000-PRINT
                       THRU 9000-PRINT-X
               END-IF
           END-IF.

       9100-VAL-LABEL-IN-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  1100-4000-CLOSE
               THRU 1100-4000-CLOSE-X.

           PERFORM  1200-4000-CLOSE
               THRU 1200-4000-CLOSE-X.

           PERFORM  2000-4000-CLOSE
               THRU 2000-4000-CLOSE-X.

           PERFORM  POLQ-4000-CLOSE
               THRU POLQ-4000-CLOSE-X.

           PERFORM  CVGQ-4000-CLOSE
               THRU CVGQ-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      * PROCESSING COPYBOOKS                                          *
      *****************************************************************

       COPY CCPSPGA.
      /
54-001 COPY CCPS0010.
      /
54-001 COPY CCPS0182.
      /
54-001 COPY CCPS0950.
      /
       COPY CCPPCINB.
      /
       COPY CCPPCCC.
      /
       COPY CCPPPLIN.
      /
       COPY CCPIPRT1.
      /
010311 COPY XCPEVRSN.
      /
      *****************************************************************
      * LINKAGE PROCESSING COPYBOOKS                                  *
      *****************************************************************

P02229 COPY XCPL0035.

       COPY CCPL0010.
      /
       COPY CCPL0182.
      /
54-001 COPY CCPL0386.
      /
       COPY CCPL0950.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.

       COPY XCPL1640.
      /
       COPY XCPL1680.
      /
017205 COPY XCPL2490.
017205 COPY XCPS2490.

      *****************************************************************
      * FILE I/O PROCESSING MODULES                                   *
      *****************************************************************

       COPY CCPBCFLW.
      /
       COPY CCPCPCOM.
       COPY CCPNPCOM.
      /
       COPY CCPNPH.
      /
       COPY CCPNQT.
      /
       COPY VCPNVL.
      /
       COPY VCPOPOLQ.
       COPY VCPLPOLQ.
       COPY VCPNPOLQ.
      /
       COPY VCPOSPOQ.
       COPY VCPLSPOQ.
       COPY VCPNSPOQ.
      /
       COPY VCPOCVGQ.
       COPY VCPLCVGQ.
       COPY VCPNCVGQ.
      /
       COPY VCPOSCVQ.
       COPY VCPLSCVQ.
       COPY VCPNSCVQ.
      /
       COPY VCPO1100.
       COPY VCPL1100.
       COPY VCPA1100.
      /
       COPY VCPO1200.
       COPY VCPL1200.
       COPY VCPA1200.
      /
       COPY VCPO2000.
       COPY VCPL2000.
       COPY VCPA2000.
      /
       COPY XCPOOCF.
       COPY XCPLOCF.
      /
       COPY XCPOBCF.
       COPY XCPLBCF.
       COPY XCPNBCF.

010311 COPY XCPNXTAB.

      *****************************************************************
      * ERROR HANDLING ROUTINES                                       *
      *****************************************************************
       COPY XCPL0030.
      *
      *****************************************************************
      **                 END OF PROGRAM VSBM1000                     **
      *****************************************************************
