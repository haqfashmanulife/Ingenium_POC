
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9C91.

      *****************************************************************
      **  MEMBER :  ZSBM9C91                                         **
      **  REMARKS:  BATCH PROGRAM FOR THE CREDIT CARD HISTORY TABLE  **
      **            BY READING VALIDATION RESULT FILE                **
      **                                                             **
      **  THIS PROGRAM READS THE VALIDATION RESULT FILE AND UPDATE   **
      **  THE DETAILS IN NEW CREDIT CARD TABLE BASED ON THE STATUS   **
      **                                                             **
      **  DOMAIN :  AG                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
20834A**  07OCT20  CTS    INTIAL VERSION                             **
20834I**  01DEC20  CTS    IMPORT CONDITION IN TCRCH TABLE            **
20834L**  12FEB21  CTS    CHANGE DONE FOR CR07-CREDIT CARD CHANGES   **
CC1323**  01APR21  CTS    JPCRED-1323 CHANGE DONE FOR JUDGEMENT FILE **
CC1323**                  ISSUE CODE                                 **
CC1352**  07APR21  CTS    JPCRED - 1352 CHANGES DONE TO FIX THE SEQ  **
CC1352**                  NUM ISSUE IN JUDGEMENT FILE                **
CC1431**  15APR21  CTS    JPCRED - 1431 CHANGES DONE TO DELETE CRCH  **
CC1431**                  TBL WHICH IS NOT PRESENT IN JUDGEMENT FILE **
20834M**  12FEB21  CTS    CHANGES DONE DAY 2.0 CR07 CREDIT CARD      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9C91'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.
20834M*    05  WS-CRC-VAL-EXP-DATE             PIC X(04). 
20834M*20834L   88 WS-CRC-VAL-EXP-YYMM          VALUE '2107'.
20834L*        88 WS-CRC-VAL-EXP-YYMM          VALUE '2105'.
           05  WS-VAL-RQST-CREAT-DT.
               15  WS-VAL-RQST-CREAT-YR        PIC X(04).
               15  FILLER                      PIC X(01).
               15  WS-VAL-RQST-CREAT-MO        PIC X(02).
               15  FILLER                      PIC X(01).
               15  WS-VAL-RQST-CREAT-DY        PIC X(02).
           05  WS-TEMP-DATE.
               15 WS-TEMP-YR                   PIC X(02).
               15 WS-TEMP-MO                   PIC X(02).
           05  WS-CRCH-WRITE-IND               PIC X(01).
               88  WS-CRCH-WRITE-YES           VALUE 'Y'.
               88  WS-CRCH-WRITE-NO            VALUE 'N'.
           05  WS-CRC-CO-CD                    PIC X(07).
           05  WS-ISSUER-CD                    PIC X(07).
               88 WS-ISSUER-JUDGMT-VAL         VALUE 
                                               '137',
                                               '15250',
                                               '2F61100',
                                               '2S10035',
                                               '2S63046',
                                               '2A99661',
                                               '2A99662',
                                               '2A99664',
                                               '2S50001',
                                               '2S59110',
                                               '2S59681',
                                               '2S59875',
                                               '2S62781',
CC1323                                         '2S77334'.
CC1323*                                        '2A77334'.
           05  WS-PRCES-DT.
               15  WS-PRCES-YR                  PIC X(04).
               15  FILLER                       PIC X(01) VALUE '-'.
               15  WS-PRCES-MO                  PIC X(02).
               15  FILLER                       PIC X(01) VALUE '-'.
               15  WS-PRCES-DY                  PIC X(02).
CC1352     05  WS-CRCH-REC-IND                  PIC X(01).
CC1352         88 WS-CRCH-REC-NO                VALUE 'N'.
CC1352         88 WS-CRCH-REC-YES               VALUE 'Y'.
CC1431     05  WS-CRCH-CTR                      PIC X(01).
CC1431         88 WS-CRCH-CTR-VAL               VALUE '1'.
CC1431         88 WS-CRCH-CTR-EXC               VALUE '2'.


       01  WS-CVHF-WORK-AREA.
           05  WS-APP-FORM-ID.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-APP-FORM-ID         PIC X(15).
               10  FILLER                      PIC X(01).
           05  WS-CARD-SERL-NUM-ID.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-CARD-SERL-NUM-ID    PIC X(04).
               10  FILLER                      PIC X(01).
           05  WS-OLD-CARD-NUM.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-OLD-CARD-NUM        PIC X(16).
               10  FILLER                      PIC X(01).
           05  WS-OLD-XPRY-DT.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-OLD-XPRY-DT         PIC X(04).
               10  FILLER                      PIC X(01).
          05  WS-CARD-CO-NM.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-CARD-CO-NM          PIC X(10).
               10  FILLER                      PIC X(01).
           05  WS-OLD-CARD-CO-CD.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-OLD-CARD-CO-CD      PIC X(07).
               10  FILLER                      PIC X(01).
           05  WS-VALID-RSLT.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-VALID-RSLT          PIC X(01).
               10  FILLER                      PIC X(01).
           05  WS-NEW-CARD-NUM.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-NEW-CARD-NUM        PIC X(16).
               10  FILLER                      PIC X(01).
           05  WS-NEW-XPRY-DT.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-NEW-XPRY-DT         PIC X(04).
               10  FILLER                      PIC X(01).
           05  WS-VALID-CARD-CO-CD.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-VAL-CARD-CO-CD      PIC X(07).
               10  FILLER                      PIC X(01).
           05  WS-VALID-PRCES-DT.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-VAL-PRCES-DT        PIC X(10).
               10  FILLER                      PIC X(01).
           05  WS-MER-VALU.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-MER-VALU            PIC X(50).
               10  FILLER                      PIC X(01).
           05  WS-PRCES-NUM.
               10  FILLER                      PIC X(01).
               10  WS-CVHF-PRCES-NUM           PIC X(07).
               10  FILLER                      PIC X(01).

       01  WS-CXJF-WORK-AREA.
           05  WS-SHOP-ID.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-SHOP-ID             PIC X(13).
               10  FILLER                      PIC X(01).
           05  WS-LINE-NUM.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-LINE-NUM            PIC X(07).
               10  FILLER                      PIC X(01).
           05  WS-ORDER-ID.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-ORDER-ID            PIC X(27).
               10  FILLER                      PIC X(01).
           05  WS-AMT.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-AMT                 PIC X(17).
               10  FILLER                      PIC X(01).
           05  WS-TAX.
               10  FILLER                      PIC X(01).
               10 WS-CXJF-TAX                  PIC X(17).
               10  FILLER                      PIC X(01).
           05  WS-MEM-ID.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-MEM-ID              PIC X(15).
               10  FILLER                      PIC X(01).
           05  WS-SEQ-NUM.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-SEQ-NUM             PIC X(07).
               10  FILLER                      PIC X(01).
           05  WS-CARD-NUM.
               10  FILLER                      PIC X(01).
               10 WS-CXJF-CARD-NUM             PIC X(16).
               10  FILLER                      PIC X(01).
           05  WS-XPRY-DT.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-XPRY-DT             PIC X(04).
               10  FILLER                      PIC X(01).
           05  WS-ERR-CD.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-ERR-CD              PIC X(03).
               10  FILLER                      PIC X(01).
           05  WS-ERR-DETAIL-CD.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-ERR-DETAIL-CD       PIC X(09).
               10  FILLER                      PIC X(01).
           05  WS-INT-BRAND.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-INT-BRAND           PIC X(50).
               10  FILLER                      PIC X(01).
           05  WS-DOM-ISS-FLAG.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-DOM-ISS-FLAG        PIC X(01).
               10  FILLER                      PIC X(01).
           05  WS-ISSUE-CO-CD.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-ISSUE-CO-CD         PIC X(07).
               10  FILLER                      PIC X(01).
           05  WS-ISSUE-CO-NM.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-ISSUE-CO-NM         PIC X(50).
               10  FILLER                      PIC X(01).
           05  WS-DEB-PRE-FLAG.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-DEB-PRE-FLAG        PIC X(01).
               10  FILLER                      PIC X(01).
           05  WS-DEB-PRE-CARD-ISS-NM.
               10  FILLER                      PIC X(01).
               10  WS-CXJF-DEB-PRE-ISS-NM      PIC X(10).
               10  FILLER                      PIC X(01).

       01  WS-REPORT-TOTALS.
           05  WS-CVHF-RECORDS        PIC S9(07) COMP-3 VALUE +0.
           05  WS-CXJF-RECORDS        PIC S9(07) COMP-3 VALUE +0.
           05  WS-CVHF-ERROR          PIC S9(07) COMP-3 VALUE +0.
           05  WS-CXJF-ERROR          PIC S9(07) COMP-3 VALUE +0.
           05  WS-CVHF-VAL-ERR        PIC S9(07) COMP-3 VALUE +0.
           05  WS-INSERT-RECORDS      PIC S9(07) COMP-3 VALUE +0.
           05  WS-DELETE-RECORDS      PIC S9(07) COMP-3 VALUE +0.


       01  WS-COMMA-QUOTE                      PIC X(02) VALUE '",'.

      *****************************************************************
      *     COMMON COPYBOOKS                                          *
      *****************************************************************

       COPY XCWL0035.
      /
       COPY CCWLPGA.
      / 
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
      /
       COPY XCWWTIME.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
       COPY XCWL1640.
      /
      *****************************************************************
      *     I/O COPYBOOKS                                             *
      *****************************************************************
      /
       COPY CCFRCRCH.
       COPY CCFWCRCH.
      /
       COPY CCFWCCH3.
      /
       COPY CCFWPOLF.
      /      
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY NCFWTTAB.
       COPY NCFRTTAB.
      /     
       COPY CCFWMAST.
       COPY CCFRMAST.
      / 
       COPY XCSWSEQ  REPLACING ==:ID:==  BY CVHF
                               ==':ID:'==  BY =='CVHF'==.
       COPY ZCSRCVHF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY CXJF
                               ==':ID:'==  BY =='CXJF'==.
       COPY ZCSRCXJF.       

       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************

       COPY XCWL1680.
      /
       COPY XCWL1670.
      /
       COPY XCWL0040.
      /
       COPY XCWL0270.
      /
       COPY CCWL0010.
      /
       COPY XCWL0005.
      /
       COPY CCWL2430.
      /
       COPY CCWL0950.
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

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

           INITIALIZE WS-CVHF-WORK-AREA.

      * VALIDATION RESULT HISTORY FILE
           PERFORM  2000-PROCESS-CVHF
               THRU 2000-PROCESS-CVHF-X
               UNTIL WCVHF-SEQ-IO-EOF.

           INITIALIZE WS-CXJF-WORK-AREA.

      * EXCLUSION JUDGEMENT FILE
           PERFORM  3000-PROCESS-CXJF
               THRU 3000-PROCESS-CXJF-X
               UNTIL WCXJF-SEQ-IO-EOF.

CC1431     PERFORM  4000-CHECK-CRCH-REC
CC1431         THRU 4000-CHECK-CRCH-REC-X.

           PERFORM  9000-PRINT-STATS
               THRU 9000-PRINT-STATS-X.

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

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  CVHF-1000-OPEN-INPUT
               THRU CVHF-1000-OPEN-INPUT-X.

           PERFORM  CXJF-1000-OPEN-INPUT
               THRU CXJF-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           INITIALIZE WS-PGM-WORK-AREA.

      **   READ THE COMPANY CONTROL CARD

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

           PERFORM  1100-INIT-OCF-TITLES
               THRU 1100-INIT-OCF-TITLES-X.

           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.

           IF  WMAST-IO-OK
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           ELSE
      *MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'ZS9C910001'            TO WGLOB-MSG-REF-INFO

               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

           PERFORM  PGA-1000-BUILD-PARMS
               THRU PGA-1000-BUILD-PARMS-X.
           
      **GET THE TEMPORARY VALIDATION DATE **
           MOVE WGLOB-PROCESS-DATE          TO L1680-INTERNAL-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE 02                          TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.

           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.

           MOVE L1680-INTERNAL-2            TO WS-VAL-RQST-CREAT-DT.
           MOVE WS-VAL-RQST-CREAT-YR(3:2)   TO WS-TEMP-YR.
           MOVE WS-VAL-RQST-CREAT-MO        TO WS-TEMP-MO.
           
      *FIRST RECORD WILL BE HEADER IN JUDGEMENT FILE  
           PERFORM  CXJF-1000-READ
               THRU CXJF-1000-READ-X.
               
           IF NOT WCXJF-SEQ-IO-OK
      * MSG:'INVALID WRITE FOR FILE @1 STATUS = @2'
               MOVE 'ZS9C910006'            TO WGLOB-MSG-REF-INFO
               MOVE 'CXJF'                  TO WGLOB-MSG-PARM (1)
               MOVE WCXJF-SEQ-IO-STATUS     TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
           

       1000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       1100-INIT-OCF-TITLES.
      *---------------------

      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT

           MOVE ZERO                        TO L0040-ERROR-CNT.

      **   GET THE SYSTEM ID
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

      *    GET THE PROGRAM DESCRIPTION - VALIDATION RESULT CHANGES
           MOVE 'ZS9C910002'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-PROGRAM-DESC.

      *    GET THE 'RUN MESSAGES' MESSAGE TEXT
           MOVE 'ZS9C910003'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       1100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *------------------
       2000-PROCESS-CVHF.
      *------------------

           INITIALIZE WS-CVHF-WORK-AREA.
CC1431     MOVE ZEROES                      TO WS-CRCH-CTR.           
           SET WS-CRCH-WRITE-NO             TO TRUE.
20834M*    SET WS-CRC-VAL-EXP-YYMM          TO TRUE.

      * READ CREDIT CARD - VALIDATION REQUEST HISTORY FILE
           PERFORM  CVHF-1000-READ
               THRU CVHF-1000-READ-X.

           IF NOT WCVHF-SEQ-IO-OK
      * MSG:'INVALID WRITE FOR FILE @1 STATUS = @2'
               MOVE 'ZS9C910004'            TO WGLOB-MSG-REF-INFO
               MOVE 'CVHF'                  TO WGLOB-MSG-PARM (1)
               MOVE WCVHF-SEQ-IO-STATUS     TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-PROCESS-CVHF-X
           END-IF.

           ADD +1                           TO WS-CVHF-RECORDS.

      * UNSTRING THE VALIDATION RESULT HISTORY FILE

           UNSTRING RCVHF-SEQ-REC-INFO
                    DELIMITED BY WS-COMMA-QUOTE
               INTO WS-APP-FORM-ID
                    WS-CARD-SERL-NUM-ID
                    WS-OLD-CARD-NUM
                    WS-OLD-XPRY-DT
                    WS-CARD-CO-NM
                    WS-OLD-CARD-CO-CD
                    WS-VALID-RSLT
                    WS-NEW-CARD-NUM
                    WS-NEW-XPRY-DT
                    WS-VALID-CARD-CO-CD
                    WS-VALID-PRCES-DT
                    WS-MER-VALU
                    WS-PRCES-NUM
           END-UNSTRING.

      *  SET THE INDICATOR TO WRITE TCRCH TABLE.

           IF  WS-CVHF-VALID-RSLT = '0'
20834M         PERFORM  2500-WRITE-CRCH-TBL
20834M             THRU 2500-WRITE-CRCH-TBL-X
20834M*         IF  (WS-CVHF-NEW-XPRY-DT NOT = SPACES
20834L*         AND WS-CVHF-NEW-XPRY-DT <= WS-TEMP-DATE
20834M*         AND WS-CVHF-NEW-XPRY-DT <= WS-CRC-VAL-EXP-DATE)
20834M*         OR  (WS-CVHF-NEW-XPRY-DT = SPACES
20834L*         AND WS-CVHF-OLD-XPRY-DT <= WS-TEMP-DATE
20834M*         AND WS-CVHF-OLD-XPRY-DT <= WS-CRC-VAL-EXP-DATE)
20834M*             SET WS-CRCH-WRITE-YES    TO TRUE
20834M*         ELSE
20834M** MSG:' EXPIRY DATE IS NOT LESS THAN OR EQUAL TO 2021-07'
20834M*             MOVE 'ZS9C910015'        TO WGLOB-MSG-REF-INFO
20834M*             MOVE WS-CVHF-APP-FORM-ID TO WGLOB-MSG-PARM (1) 
20834M*             PERFORM  0260-1000-GENERATE-MESSAGE
20834M*                 THRU 0260-1000-GENERATE-MESSAGE-X 
20834M*             ADD 1                    TO WS-CVHF-VAL-ERR
20834M*         END-IF
           END-IF.
20834M*
20834M**    WRITE THE RECORD IN THE CREDIT CARD HISTORY TABLE
20834M*
20834M*     IF  WS-CRCH-WRITE-YES
20834M*        PERFORM  2500-WRITE-CRCH-TBL
20834M*            THRU 2500-WRITE-CRCH-TBL-X
20834M*     END-IF.

           IF  WS-CVHF-VALID-RSLT NOT = '0'
               ADD 1                        TO WS-CVHF-VAL-ERR
           END-IF.

       2000-PROCESS-CVHF-X.
           EXIT.

      /
      *--------------------
       2500-WRITE-CRCH-TBL.
      *--------------------

           IF  WS-CVHF-APP-FORM-ID = SPACES
               ADD 1                        TO WS-CVHF-ERROR
               GO TO 2500-WRITE-CRCH-TBL-X
           END-IF.

           MOVE WS-CVHF-APP-FORM-ID         TO WPOLF-POL-APP-FORM-ID.

           PERFORM  POLF-1000-READ
               THRU POLF-1000-READ-X.

           IF NOT WPOLF-IO-OK
               MOVE WS-CVHF-APP-FORM-ID     TO WGLOB-MSG-PARM (1)
               MOVE 'ZS9C910005'            TO WGLOB-MSG-REF-INFO
      * MSG: APPLICATION ID (@1) NOT EXISTS IN THE SYSTEM
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               ADD 1                        TO WS-CVHF-ERROR
               GO TO 2500-WRITE-CRCH-TBL-X
           END-IF.

           PERFORM  CRCH-1000-CREATE
               THRU CRCH-1000-CREATE-X.
           
           PERFORM  2600-CRCH-REC-INFO
               THRU 2600-CRCH-REC-INFO-X.

           PERFORM  CRCH-1000-WRITE
               THRU CRCH-1000-WRITE-X.

           ADD +1                           TO WS-INSERT-RECORDS.

       2500-WRITE-CRCH-TBL-X.
           EXIT. 
      /
      *-------------------
       2600-CRCH-REC-INFO.
      *-------------------

           MOVE ZEROES                      TO RCRCH-FILE-REC-CTR-N.
           SET RCRCH-CRC-NUM-CHNG-NO        TO TRUE.
           SET RCRCH-XPRY-DT-CHNG-NO        TO TRUE.
           SET RCRCH-CRC-CO-CHNG-NO         TO TRUE.

      * VALIDATION RESULT FILE IMPORT DATE
           MOVE WGLOB-PROCESS-DATE          TO WCRCH-VALID-RQST-DT.
           
      * POLICY ID
           MOVE RPOL-POL-ID                 TO WCRCH-POL-ID.

      * MERCHANT FREE USE
           MOVE WS-CVHF-MER-VALU            TO WCRCH-CRC-SEQ-NUM.

      * MEMBER ID
           MOVE WS-CVHF-APP-FORM-ID         TO RCRCH-POL-APP-FORM-ID.

      * CARD NUMBER
           IF  WS-CVHF-NEW-CARD-NUM NOT = SPACES
               SET RCRCH-CRC-NUM-CHNG       TO TRUE
               MOVE WS-CVHF-NEW-CARD-NUM    TO RCRCH-CRC-NUM
           ELSE
               MOVE WS-CVHF-OLD-CARD-NUM    TO RCRCH-CRC-NUM
           END-IF.

      * EXPIRY DATE
           IF  WS-CVHF-NEW-XPRY-DT NOT = SPACES
               SET RCRCH-XPRY-DT-CHNG       TO TRUE
               MOVE WS-CVHF-NEW-XPRY-DT     TO RCRCH-CRC-XPRY-DT
           ELSE
               MOVE WS-CVHF-OLD-XPRY-DT     TO RCRCH-CRC-XPRY-DT
           END-IF.

      * DESTINATION CODE
           IF  WS-CVHF-VAL-CARD-CO-CD NOT = SPACES
               SET RCRCH-CRC-CO-CHNG        TO TRUE
               MOVE WS-CVHF-VAL-CARD-CO-CD  TO WS-CRC-CO-CD                                            
           ELSE
               MOVE WS-CVHF-OLD-CARD-CO-CD  TO WS-CRC-CO-CD
           END-IF.

           PERFORM  0005-1000-BUILD-PARM-INFO
               THRU 0005-1000-BUILD-PARM-INFO-X

           SET L0005-FORCE-UPPER            TO TRUE
           MOVE WS-CRC-CO-CD                TO L0005-INPUT-STRING

           PERFORM  0005-1000-CONVERT-STRING
               THRU 0005-1000-CONVERT-STRING-X

           IF  L0005-RETRN-OK
               MOVE L0005-OUTPUT-STRING     TO RCRCH-CRC-CO-CD
           ELSE 
               MOVE WS-CRC-CO-CD            TO RCRCH-CRC-CO-CD
           END-IF
               
      * VALIDATION JUDGEMENT RESULT
           MOVE WS-CVHF-VALID-RSLT          TO RCRCH-VALID-RSLT-CD.

      * VALIDATION PROCESS DATE

           MOVE WS-CVHF-VAL-PRCES-DT(1:4)   TO WS-PRCES-YR.
           MOVE WS-CVHF-VAL-PRCES-DT(5:2)   TO WS-PRCES-MO.
           MOVE WS-CVHF-VAL-PRCES-DT(7:2)   TO WS-PRCES-DY.

           MOVE WS-PRCES-DT                 TO RCRCH-VALID-PRCES-DT.

      * CLIENT ID
           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.

           PERFORM  2430-2100-GET-OWNER
               THRU 2430-2100-GET-OWNER-X.

           IF  L2430-RELATIONSHIP-FOUND
               MOVE L2430-CLI-ID            TO RCRCH-CLI-ID
           END-IF.

CC1431* RECORD COUNTER
CC1431     ADD +1                           TO RCRCH-FILE-REC-CTR-N.
CC1431
       2600-CRCH-REC-INFO-X.
           EXIT. 
      /
      *-----------------
       3000-PROCESS-CXJF.
      *-----------------

           INITIALIZE WS-CXJF-WORK-AREA.

      *    READ EXCLUSION JUDGEMENT FILE

           PERFORM  CXJF-1000-READ
               THRU CXJF-1000-READ-X.
               
           IF NOT WCXJF-SEQ-IO-OK
      * MSG:'INVALID WRITE FOR FILE @1 STATUS = @2'
               MOVE 'ZS9C910006'            TO WGLOB-MSG-REF-INFO
               MOVE 'CXJF'                  TO WGLOB-MSG-PARM (1)
               MOVE WCXJF-SEQ-IO-STATUS     TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3000-PROCESS-CXJF-X
           END-IF.

           ADD +1                           TO WS-CXJF-RECORDS.

      *    UNSTRING THE VALIDATION RESULT HISTORY FILE

           UNSTRING RCXJF-SEQ-REC-INFO
                    DELIMITED BY WS-COMMA-QUOTE
               INTO WS-SHOP-ID
                    WS-LINE-NUM
                    WS-ORDER-ID                    
                    WS-AMT
                    WS-TAX
                    WS-MEM-ID
                    WS-SEQ-NUM                        
                    WS-CARD-NUM
                    WS-XPRY-DT                
                    WS-ERR-CD
                    WS-ERR-DETAIL-CD
                    WS-INT-BRAND
                    WS-DOM-ISS-FLAG
                    WS-ISSUE-CO-CD
                    WS-ISSUE-CO-NM
                    WS-DEB-PRE-FLAG
                    WS-DEB-PRE-CARD-ISS-NM
           END-UNSTRING.

           MOVE WS-CXJF-MEM-ID              TO WPOLF-POL-APP-FORM-ID.

           PERFORM  POLF-1000-READ
               THRU POLF-1000-READ-X.

           IF NOT WPOLF-IO-OK
               MOVE WS-CXJF-MEM-ID          TO WGLOB-MSG-PARM (1)
               MOVE 'ZS9C910007'            TO WGLOB-MSG-REF-INFO
      * MSG: APPLICATION ID (@1) NOT EXISTS IN THE SYSTEM
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               ADD 1                        TO WS-CXJF-ERROR
               GO TO 3000-PROCESS-CXJF-X
           END-IF.

CC1352**BROWSE THE TCRCH TABLE TO GET THE LATEST SEQUENCE NUMBER  **
CC1352
CC1352     MOVE HIGH-VALUES                 TO WCRCH-KEY.
           MOVE RPOL-POL-ID                 TO WCRCH-POL-ID.
CC1352*    MOVE WS-CXJF-SEQ-NUM             TO WCRCH-CRC-SEQ-NUM.
CC1352     MOVE +999                        TO WCRCH-CRC-SEQ-NUM-N.
           MOVE WGLOB-PROCESS-DATE          TO WCRCH-VALID-RQST-DT.
           
CC1352     MOVE LOW-VALUES                  TO WCRCH-ENDBR-KEY.
CC1352     MOVE RPOL-POL-ID                 TO WCRCH-ENDBR-POL-ID.
CC1352     MOVE ZEROS                       TO 
CC1352                                    WCRCH-ENDBR-CRC-SEQ-NUM-N.
CC1352     MOVE WGLOB-PROCESS-DATE          TO 
CC1352                                      WCRCH-ENDBR-VALID-RQST-DT.
CC1352     SET WS-CRCH-REC-NO               TO TRUE.

CC1352*    PERFORM  CRCH-1000-READ
CC1352*        THRU CRCH-1000-READ-X.
               
CC1352     PERFORM  CRCH-1000-BROWSE-PREV
CC1352         THRU CRCH-1000-BROWSE-PREV-X.
CC1352
           IF  NOT WCRCH-IO-OK
               MOVE WS-CXJF-MEM-ID          TO WGLOB-MSG-PARM (1)
               MOVE 'ZS9C910016'            TO WGLOB-MSG-REF-INFO
      * MSG: CREDIT CARD ID FOR APPLICATION (@1) NOT EXISTS IN THE TCRCH
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X           
               ADD 1                        TO WS-CXJF-ERROR
               GO TO 3000-PROCESS-CXJF-X
           END-IF.
           
CC1352     PERFORM  CRCH-2000-READ-PREV
CC1352         THRU CRCH-2000-READ-PREV-X.
CC1352
CC1352     IF  WCRCH-IO-OK
CC1352         SET WS-CRCH-REC-YES  TO TRUE
CC1352     END-IF.
CC1352
CC1352     PERFORM  CRCH-3000-END-BROWSE-PREV
CC1352         THRU CRCH-3000-END-BROWSE-PREV-X.
CC1352
CC1352     IF  WS-CRCH-REC-NO
CC1352         MOVE WS-CXJF-MEM-ID          TO WGLOB-MSG-PARM (1)
CC1352         MOVE 'ZS9C910016'            TO WGLOB-MSG-REF-INFO
CC1352* MSG: CREDIT CARD ID FOR APPLICATION (@1) NOT EXISTS IN THE TCRCH
CC1352         PERFORM  0260-1000-GENERATE-MESSAGE
CC1352             THRU 0260-1000-GENERATE-MESSAGE-X 
CC1352         ADD 1                        TO WS-CXJF-ERROR
CC1352         GO TO 3000-PROCESS-CXJF-X
CC1352     END-IF.
CC1431
CC1431     MOVE RCRCH-POL-ID                TO WCRCH-POL-ID.
CC1431     MOVE RCRCH-CRC-SEQ-NUM           TO WCRCH-CRC-SEQ-NUM.
CC1431     MOVE RCRCH-VALID-RQST-DT         TO WCRCH-VALID-RQST-DT.
CC1431
CC1431     PERFORM  CRCH-1000-READ-FOR-UPDATE
CC1431         THRU CRCH-1000-READ-FOR-UPDATE-X.
CC1431
CC1431     IF  WCRCH-IO-OK
CC1431         ADD +1                       TO RCRCH-FILE-REC-CTR-N
CC1431         PERFORM  CRCH-2000-REWRITE
CC1431             THRU CRCH-2000-REWRITE-X
CC1431     END-IF.
CC1431
           IF  RCRCH-POL-APP-FORM-ID = WS-CXJF-MEM-ID

               PERFORM  0005-1000-BUILD-PARM-INFO
                   THRU 0005-1000-BUILD-PARM-INFO-X

               SET L0005-FORCE-UPPER        TO TRUE
               MOVE WS-CXJF-ISSUE-CO-CD     TO L0005-INPUT-STRING

               PERFORM  0005-1000-CONVERT-STRING
                   THRU 0005-1000-CONVERT-STRING-X

               IF  L0005-RETRN-OK
                   MOVE L0005-OUTPUT-STRING  TO WS-ISSUER-CD
               ELSE 
                   MOVE WS-CXJF-ISSUE-CO-CD  TO WS-ISSUER-CD
               END-IF

20834I         IF  WS-ISSUER-CD = '2S63046'
20834I         AND WS-CXJF-INT-BRAND = 'JCB'
20834I             GO TO 3000-PROCESS-CXJF-X
20834I         END-IF

               IF  WS-ISSUER-JUDGMT-VAL
                   MOVE WS-CXJF-MEM-ID      TO 
                                        WCCH3-POL-APP-FORM-ID
                   MOVE WS-CXJF-MEM-ID      TO 
                                        WCCH3-ENDBR-POL-APP-FORM-ID
                   MOVE WGLOB-PROCESS-DATE  TO 
                                        WCCH3-VALID-RQST-DT
                   MOVE WGLOB-PROCESS-DATE  TO 
                                        WCCH3-ENDBR-VALID-RQST-DT
                   PERFORM  CCH3-1000-DELETE-KEY-RANGE
                       THRU CCH3-1000-DELETE-KEY-RANGE-X
                   ADD +1                   TO WS-DELETE-RECORDS
               END-IF
           END-IF.


       3000-PROCESS-CXJF-X.
           EXIT. 
      /
CC1431*--------------------
CC1431 4000-CHECK-CRCH-REC.
CC1431*--------------------
CC1431
CC1431     MOVE LOW-VALUES                  TO WCCH3-KEY.
CC1431     MOVE HIGH-VALUES                 TO WCCH3-ENDBR-KEY.
CC1431     MOVE WGLOB-PROCESS-DATE          TO WCCH3-VALID-RQST-DT 
CC1431                                      WCCH3-ENDBR-VALID-RQST-DT.
CC1431
CC1431     PERFORM  CCH3-1000-TBL-BROWSE
CC1431         THRU CCH3-1000-TBL-BROWSE-X.
CC1431
CC1431     IF NOT WCCH3-IO-OK
CC1431         PERFORM  CCH3-3000-TBL-END-BROWSE
CC1431             THRU CCH3-3000-TBL-END-BROWSE-X
CC1431         GO TO 4000-CHECK-CRCH-REC-X
CC1431     END-IF.
CC1431
CC1431     PERFORM  CCH3-2000-TBL-READ-NEXT
CC1431         THRU CCH3-2000-TBL-READ-NEXT-X.
CC1431
CC1431     IF  WCCH3-IO-EOF
CC1431         PERFORM  CCH3-3000-TBL-END-BROWSE
CC1431             THRU CCH3-3000-TBL-END-BROWSE-X
CC1431         GO TO 4000-CHECK-CRCH-REC-X 
CC1431     END-IF.
CC1431
CC1431     PERFORM  4500-GET-CRCH-RECORDS
CC1431         THRU 4500-GET-CRCH-RECORDS-X
CC1431         UNTIL NOT WCCH3-IO-OK
CC1431                OR WCCH3-IO-EOF. 
CC1431
CC1431     PERFORM  CCH3-3000-TBL-END-BROWSE
CC1431         THRU CCH3-3000-TBL-END-BROWSE-X.
CC1431
CC1431 4000-CHECK-CRCH-REC-X.
CC1431     EXIT. 
CC1431/
CC1431*---------------------
CC1431 4500-GET-CRCH-RECORDS.
CC1431*---------------------
CC1431
CC1431     MOVE RCRCH-FILE-REC-CTR-N        TO WS-CRCH-CTR.
CC1431
CC1431     IF  WS-CRCH-CTR-VAL
CC1431         MOVE RCRCH-POL-APP-FORM-ID   TO 
CC1431                                  WCCH3-POL-APP-FORM-ID
CC1431         MOVE RCRCH-POL-APP-FORM-ID   TO 
CC1431                                  WCCH3-ENDBR-POL-APP-FORM-ID
CC1431         MOVE WGLOB-PROCESS-DATE      TO 
CC1431                                  WCCH3-VALID-RQST-DT
CC1431         MOVE WGLOB-PROCESS-DATE      TO 
CC1431                                  WCCH3-ENDBR-VALID-RQST-DT
CC1431         PERFORM  CCH3-1000-DELETE-KEY-RANGE
CC1431             THRU CCH3-1000-DELETE-KEY-RANGE-X
CC1431         ADD +1                       TO WS-DELETE-RECORDS
CC1431     END-IF.
CC1431
CC1431     PERFORM  CCH3-2000-TBL-READ-NEXT
CC1431         THRU CCH3-2000-TBL-READ-NEXT-X.
CC1431
CC1431 4500-GET-CRCH-RECORDS-X.
CC1431     EXIT.
CC1431/ 
      *-----------------
       9000-PRINT-STATS.
      *-----------------

           MOVE SPACES                      TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF RECORDS READ FROM CVHF INPUT FILE...... @1'
           MOVE 'ZS9C910008'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-CVHF-RECORDS             TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF RECORDS READ FROM CXJF INPUT FILE...... @1'
           MOVE 'ZS9C910009'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-CXJF-RECORDS             TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF ERROR RECORDS IN CVHF FILE ...... @1'
           MOVE 'ZS9C910010'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-CVHF-ERROR              TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF ERROR RECORDS IN CXJF FILE ...... @1'
           MOVE 'ZS9C910011'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-CXJF-ERROR              TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF RECORDS FAIL DUE TO VALIDATION FILE...... @1'
           MOVE 'ZS9C910012'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-CVHF-VAL-ERR             TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.


      **   MSG:'NUMBER OF RECORDS INSERT INTO TCRCH TABLE ...... @1'
           MOVE 'ZS9C910013'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-INSERT-RECORDS             TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF RECORDS DELETE FROM TCRCH TABLE...... @1'
           MOVE 'ZS9C910014'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-DELETE-RECORDS           TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

       9000-PRINT-STATS-X.
           EXIT.
      /  
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  CVHF-4000-CLOSE
               THRU CVHF-4000-CLOSE-X.

           PERFORM  CXJF-4000-CLOSE
               THRU CXJF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      * LINK COPYBOOKS
      *****************************************************************

       COPY XCPL0035.

       COPY XCPL1680.

       COPY XCPL1640.

       COPY CCPS0010.
       COPY CCPL0010.

       COPY CCPS2430.
       COPY CCPL2430.

       COPY CCPS0950.
       COPY CCPL0950.

       COPY XCPS0005.
       COPY XCPL0005.

       COPY XCPL0040.

       COPY XCPL0260.

       COPY XCPL0270.

       COPY XCPL0030.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************

       COPY CCPPCCC.
      /
      *****************************************************************
      *  FILE I/O COPYBOOKS
      *****************************************************************

       COPY CCPSPGA.
       COPY CCPACRCH.
       COPY CCPCCRCH.
       COPY CCPBCRCH.
       COPY CCPGCCH3.
CC1431 COPY CCPTCCH3.
CC1431 COPY CCPUCRCH.
       COPY CCPNCRCH.
CC1352 COPY CCPVCRCH.
       COPY CCPNPOL.
       COPY CCPNPOLF.     
       COPY NCPNTTAB.
       COPY CCPNMAST.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY CVHF
                               ==':PGM:'== BY =='ZSRQCVHF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CVHF.
       COPY XCSASEQ  REPLACING ==:ID:==  BY CVHF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY CVHF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY CXJF
                               ==':PGM:'== BY =='ZSRQCXJF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CXJF.
       COPY XCSASEQ  REPLACING ==:ID:==  BY CXJF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY CXJF.
      /      
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY OCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBM9C91                     **
      *****************************************************************
      