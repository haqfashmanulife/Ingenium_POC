      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMDPCO.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMDPCO                                         **
      **  REMARKS:  DEPOSIT CONFIRMATION EXTRACT                     **
      **                                                             **
      ** THIS PROGRAM GENERATES THE DEPOSIT CONFIRMATION EXTRACT FOR **
      **      DISASTER POLICIES                                      **
      **                                                             **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP771D**  16JUN20  CTS    INITIAL DRAFT                              **
125793**  31JUL20  CTS    CHANGES FOR THE PROCESS DATE CALCULATION   **
UYS001**  01MAR21  CTS    CHANGES DONE FOR ETAB                      **
      *****************************************************************
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      /


       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       COPY CCSSPRT9.
      /

      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
       COPY CCSDPRT9.
       COPY CCSRPRT9.
      /
      /
      ***************************
       WORKING-STORAGE SECTION.
      ***************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMDPCO'.

       COPY SQLCA.
       COPY CCSWPRT9.

       01  WS-DETAIL1-REC-INFO.
           05 WS-DTLS1-TYP-CD                 PIC X(01).
           05 WS-DTLS1-SMALL-PROD-CD          PIC X(03).
           05 WS-DTLS1-POL-ID                 PIC X(07).
           05 WS-DTLS1-PREM-DUE-DT            PIC X(06).
           05 WS-DTLS1-TOT-BILL-AMT           PIC 9(10).
           05 WS-DTLS1-NO-DEP                 PIC 9(03).
           05 WS-DTLS1-WIRE-XFER-DUE-DT       PIC X(08).
           05 WS-DTLS1-REMARKS                PIC X(60).
           05 FILLER                          PIC X(103).
       01  WS-DETAIL2-REC-INFO.
           05 WS-DTLS2-TYP-CD                 PIC X(03).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-SMALL-PROD-CD          PIC X(03).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-POL-ID                 PIC X(07).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-PMT-DUE-MO             PIC X(06).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-SHRT-PREM-AMT          PIC X(10).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-NO-OF-DEP              PIC X(03).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-CLM-PMT-DUE            PIC X(08).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-REMARKS                PIC X(60).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-PRCS-RSLT              PIC X(01).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-APPR-CNFRM-DT          PIC X(08).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-LRG-TYP-CD             PIC X(03).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-SML-TYP-CD             PIC X(03).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-PMT-MODE-CD            PIC X(02).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-BILL-TYP-CD            PIC X(01).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-SERV-AGT-ID            PIC X(06).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-DEPOSIT-RTE            PIC X(01).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-BAL-PMT-DT             PIC X(10).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-PMT-DUE-YR-MO          PIC X(07).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-PMT-DEPOS-AMT          PIC 9(13).9(02).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-NUM-OF-DEPOS           PIC X(03).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-TRAD-SO-JRNL-DT        PIC X(10).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-RECPT-DT               PIC X(10).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-DPOS-BR-CD             PIC X(05).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-ERR-RSN-CD             PIC X(02).
           05  FILLER                         PIC X(01) VALUE ','.
           05 WS-DTLS2-GRC-PRD-XPRY-DT        PIC X(10).
       01  WS-WORK-AREA.
           05 WS-SMALL-TYP-CD                  PIC X(03).
           05 WS-LARGE-TYP-CD                  PIC X(03).
           05 WS-BILL-TYP-CD                   PIC X(01).
           05 WS-APPR-CNFRM-DT.
              10  WS-APPR-CNFRM-DT-YY          PIC X(04).
              10  WS-APPR-CNFRM-DT-MM          PIC X(02).
              10  WS-APPR-CNFRM-DT-DY          PIC X(02).
           05 WS-PREM-DUE-MO-NUM.
              10  WS-PREM-DUE-MO-NUM-YY          PIC X(04).
              10  WS-PREM-DUE-MO-NUM-MM          PIC X(02).
           05 WS-PRCES-DT.
              10  WS-PRCES-DT-YY               PIC X(04).
              10  FILLER                       PIC X(01) VALUE '-'.
              10  WS-PRCES-DT-MM               PIC X(02).
              10  FILLER                       PIC X(01) VALUE '-'.
              10  WS-PRCES-DT-DY               PIC X(02).
           05 WS-PMT-TYP-CD                    PIC X(02).
              88 WS-POL-PMT-TYP-MONTHLY        VALUE '01'.
              88 WS-POL-PMT-TYP-SEMI-ANN       VALUE '06'.
              88 WS-POL-PMT-TYP-ANNUALLY       VALUE '12'.
           05  WS-DH-REC-IND                   PIC X(01).
               88  WS-DH-REC-YES               VALUE 'Y'.
               88  WS-DH-REC-NO                VALUE 'N'.
           05 WS-RECPT-DT                      PIC X(08).
           05 WS-RECPT-AMT                     PIC X(10).
           05 WS-POL-PREM-APPR-IND             PIC X(01).
              88 WS-POL-PREM-APPR-YES          VALUE 'Y'.
              88 WS-POL-PREM-APPR-NO           VALUE 'N'.
           05 WS-PRCS-RSLT-CD                  PIC X(01).
              88 WS-PRCS-RSLT                  VALUE '1'.
           05 WS-POL-PRCES-DT.
              10  WS-POL-PRCES-DT-YY           PIC X(04).
              10  FILLER                       PIC X(01) VALUE '-'.
              10  WS-POL-PRCES-DT-MM           PIC X(02).
              10  FILLER                       PIC X(01) VALUE '-'.
              10  WS-POL-PRCES-DT-DY           PIC X(02).
           05 WS-POL-PD-TO-DT.
              10  WS-POL-PD-TO-DT-YY           PIC X(04).
              10  WS-POL-PD-TO-DT-MM           PIC X(02).

       01  WS-COMMON-DATA.
           05 WS-GRC-PRD-XPRY-DT               PIC X(10).
       01  WS-CTL-CARD.
           05 WS-CTL-PGM                   PIC X(08).
           05 FILLER                       PIC X(01).
           05 WS-CMPNY-CD                  PIC X(10).
           05 FILLER                       PIC X(01).
           05 WS-INIT-RUN-IND              PIC X(01).
              88  WS-INIT-RUN-YES          VALUE 'Y'.
              88  WS-INIT-RUN-NO           VALUE 'N'.

      * HEADER FOR DEPOSIT CONFIRMATION NOTICE

       01  WS-HEADER-LINE.
           05 WS-HDR-TYP-CD                 PIC X(12).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-SMALL-PROD-CD          PIC X(04).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-POL-ID                 PIC X(08).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-PREM-DUE-DT            PIC X(08).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-TOT-BILL-AMT           PIC X(12).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-NO-DEP                 PIC X(08).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-WIRE-XFER-DUE-DT       PIC X(10).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-REMARKS                PIC X(04).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-PRCS-RSLT              PIC X(08).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-APPR-CNFRM-DT          PIC X(10).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-LRG-TYP-CD             PIC X(04).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-SML-TYP-CD             PIC X(04).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-PMT-MODE-CD            PIC X(04).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-BILL-TYP-CD            PIC X(02).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-SERV-AGT-ID            PIC X(04).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-DEPOSIT-RTE            PIC X(08).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-BAL-PMT-DT             PIC X(10).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-PMT-DUE-YR-MO          PIC X(08).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-PMT-DEPOS-AMT          PIC X(10).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-NUM-OF-DEPOS           PIC X(08).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-TRAD-SO-JRNL-DT        PIC X(10).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-RECPT-DT               PIC X(06).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-DPOS-BR-CD             PIC X(10).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-ERR-RSN-CD             PIC X(10).
           05  FILLER                       PIC X(01) VALUE ','.
           05 WS-HDR-GRC-PRD-XPRY-DT        PIC X(18).

      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCFHCVGS.
       COPY CCWL0010.
       COPY CCWWCCC.
       COPY CCWL0950.
       COPY CCWWINDX.
       COPY XCWTFCMD.
       COPY XCWLDTLK.
       COPY CCWLPGA.
       COPY XCWWHDG.
       COPY XCWWTIME.
       COPY XCWWWKDT.
       COPY XCWL1680.
       COPY CCWL0182.
       COPY XCWL1670.
UYS001 COPY XCWL1660.       
       COPY XCWL0290.
       COPY XCWL0289.
       COPY CCWL0951.
       COPY CCFRTRNS.
       COPY CCFWTRNS.

      ****************************************************************
      *  TABLE LAYOUT & WORK AREAS FOR EXTRACT/REPORT TABLES         *
      ****************************************************************


      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY CCFWMAST.
       COPY CCFRMAST.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
       COPY CCFWBAC.
       COPY CCFRBAC.
      /
       COPY CCFHPOL.
       COPY CCFREDIT.
       COPY CCFWEDIT.
      /
       COPY NCFWTTAB.
       COPY NCFRTTAB.
UYS001 COPY CCFRETAB.
UYS001 COPY CCFWETAB.
       COPY CCFRDH.
       COPY CCFWDH.
       COPY CCWWCVGS.
      /

       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY DPCI
                               ==':ID:'==  BY =='DPCI'==.
       COPY ZCSRDPCI.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY XCWL0040.
       COPY XCWL2490.

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

           PERFORM  1000-INITIALIZE-VALUES
               THRU 1000-INITIALIZE-VALUES-X.

           PERFORM  3000-PROCESS-EXTRACTS
               THRU 3000-PROCESS-EXTRACTS-X
              UNTIL WDPCI-SEQ-IO-EOF.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

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

           PERFORM  DPCI-1000-OPEN-INPUT
               THRU DPCI-1000-OPEN-INPUT-X.

           PERFORM  PRT9-3000-OPEN-OUTPUT
               THRU PRT9-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *-----------------------
       1000-INITIALIZE-VALUES.
      *-----------------------


      **   READ THE COMPANY CONTROL CARD

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.

           PERFORM  PGA-1000-BUILD-PARMS
               THRU PGA-1000-BUILD-PARMS-X.

           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.

           IF  WMAST-IO-OK
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           ELSE
      *    MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'ZSDPCO0001'            TO WGLOB-MSG-REF-INFO
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X
           PERFORM  0030-5000-LOGIC-ERROR
               THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

            PERFORM  BCF-1000-READ
                THRU BCF-1000-READ-X.


            IF  WBCF-SEQ-IO-NOT-FOUND
      *    MSG:  DATA CONTROL CARD MISSING
                MOVE 'CS9E250001'           TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
                GO TO 1000-INITIALIZE-VALUES-X
            END-IF.

      *    EDIT THE DATES CONTROL CARD

           MOVE RBCF-SEQ-REC-INFO           TO WS-CTL-CARD.

      *  READ THE INPUT FILE

               PERFORM  DPCI-1000-READ
                   THRU DPCI-1000-READ-X.

           IF NOT WDPCI-SEQ-IO-OK
      *    MSG:'INPUT FILE EMPTY - NO DATA TO PROCESS'
               MOVE  'ZSDPCO0002'           TO  WGLOB-MSG-REF-INFO
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-INITIALIZE-VALUES-X
           END-IF.

           IF  WS-INIT-RUN-NO
               PERFORM  DPCI-1000-READ
                   THRU DPCI-1000-READ-X
           END-IF.
      * GRACE PERIOD EXTENSION EXPIRY DATE

           MOVE 'GRCEPEREXP'                TO WTRNS-PROJ-ID.

           PERFORM  TRNS-1000-READ
               THRU TRNS-1000-READ-X.

           IF  WTRNS-IO-OK
               MOVE RTRNS-STRT-DT           TO WS-GRC-PRD-XPRY-DT
           ELSE
               MOVE WTRNS-KEY               TO WGLOB-MSG-PARM (1)
      *MSG:   'RECORD (@1) NOT FOUND'
               MOVE 'ZSDPCO0009'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           INITIALIZE WS-HEADER-LINE.

           MOVE SPACES                      TO RPRT9-SEQ-REC-INFO.

      * WRITE HEADING IN THE EXTRACT

           PERFORM  1200-PAGE-HEADING
               THRU 1200-PAGE-HEADING-X.

           MOVE WS-HEADER-LINE              TO RPRT9-SEQ-REC-INFO.
           MOVE ZERO                        TO WPRT9-NUMBER-LINES.

           PERFORM  PRT9-1000-WRITE
               THRU PRT9-1000-WRITE-X.

       1000-INITIALIZE-VALUES-X.
           EXIT.
      /

      *------------------
       1200-PAGE-HEADING.
      *------------------

           INITIALIZE WS-HEADER-LINE.
           MOVE WPGWS-CRNT-PGM-ID           TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.

           MOVE '00001'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-TYP-CD.

           MOVE '00002'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-SMALL-PROD-CD.

           MOVE '00003'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-POL-ID.

           MOVE '00004'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PREM-DUE-DT.

           MOVE '00005'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-TOT-BILL-AMT.

           MOVE '00006'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-NO-DEP.

           MOVE '00007'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-WIRE-XFER-DUE-DT.

           MOVE '00008'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-REMARKS.

           MOVE '00009'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PRCS-RSLT.

           MOVE '00010'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-APPR-CNFRM-DT.

           MOVE '00011'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-LRG-TYP-CD.

           MOVE '00012'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-SML-TYP-CD.

           MOVE '00013'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PMT-MODE-CD.

           MOVE '00014'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-BILL-TYP-CD.

           MOVE '00015'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-SERV-AGT-ID.

           MOVE '00016'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-DEPOSIT-RTE.

           MOVE '00017'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-BAL-PMT-DT.

           MOVE '00018'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PMT-DUE-YR-MO.

           MOVE '00019'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PMT-DEPOS-AMT.

           MOVE '00020'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-NUM-OF-DEPOS.

           MOVE '00021'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-TRAD-SO-JRNL-DT.

           MOVE '00022'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-RECPT-DT.

           MOVE '00023'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-DPOS-BR-CD.

           MOVE '00024'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-ERR-RSN-CD.

           MOVE '00025'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-HDR-GRC-PRD-XPRY-DT.

           1200-PAGE-HEADING-X.
           EXIT.
      /

      *---------------------
       2100-INIT-OCF-TITLES.
      *---------------------

      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT

           MOVE ZERO                        TO L0040-ERROR-CNT.

      **   GET THE SYSTEM ID
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

      *   GET THE 'RUN MESSAGES' MESSAGE TEXT
           MOVE 'ZSDPCO0003'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       2100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *---------------------
       3000-PROCESS-EXTRACTS.
      *---------------------

           INITIALIZE WS-WORK-AREA.

           INITIALIZE WS-DETAIL2-REC-INFO.

           INITIALIZE WS-DETAIL1-REC-INFO.

           IF  WS-INIT-RUN-YES
               MOVE RDPCI-SEQ-REC-INFO      TO WS-DETAIL1-REC-INFO
           ELSE
               MOVE RDPCI-SEQ-REC-INFO      TO WS-DETAIL2-REC-INFO
           END-IF.

           IF  WS-DTLS2-PRCS-RSLT <> '1'
               PERFORM  3100-GET-RECORD-DETAILS
                   THRU 3100-GET-RECORD-DETAILS-X
           END-IF.

           MOVE SPACES                      TO RPRT9-SEQ-REC-INFO.
           MOVE ZEROS                       TO WPRT9-NUMBER-LINES.
           MOVE WS-DETAIL2-REC-INFO         TO RPRT9-SEQ-REC-INFO.

           PERFORM  PRT9-1000-WRITE
               THRU PRT9-1000-WRITE-X.

      *   INPUT FILE READ

           PERFORM  DPCI-1000-READ
               THRU DPCI-1000-READ-X.



       3000-PROCESS-EXTRACTS-X.
           EXIT.
      /

      *------------------------
       3100-GET-RECORD-DETAILS.
      *------------------------

      *    NOW POPULATING THE ORIGINAL POLICY ID DETAILS

           IF  WS-INIT-RUN-YES
               MOVE WS-DTLS1-POL-ID         TO WPOL-POL-ID
           ELSE
               MOVE WS-DTLS2-POL-ID         TO WPOL-POL-ID
           END-IF.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF  WPOL-IO-NOT-FOUND
      *MSG : ' POLICY (@1) DOES NOT EXIST'
               MOVE WPOL-KEY                TO WGLOB-MSG-PARM(1)
               MOVE 'ZSDPCO0005'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO  3100-GET-RECORD-DETAILS-X
           END-IF.

      *    MSGS: NOW PROCESSING POLICY(@1)

           MOVE 'ZSDPCO0004'                TO WGLOB-MSG-REF-INFO.
           MOVE RPOL-POL-ID                 TO WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

      * PROCESS RESULTS
      * APPROPRIATION CONFIRMATION DATE
           IF  RPOL-POL-INS-TYP-UL
               MOVE RPOL-POL-PD-TO-DT-NUM   TO WS-POL-PRCES-DT
           ELSE
               MOVE RPOL-TRAD-PD-TO-DT-NUM  TO WS-POL-PRCES-DT
           END-IF.

           SET WS-POL-PREM-APPR-NO          TO TRUE.
           
           IF  WS-INIT-RUN-YES
                MOVE SPACES                 TO WS-DTLS2-PRCS-RSLT
                MOVE SPACES                 TO WS-DTLS2-APPR-CNFRM-DT
           ELSE
               IF  WS-POL-PRCES-DT >= WS-GRC-PRD-XPRY-DT
125793         OR RPOL-PREM-PMT-CMPLT-YES
                   SET WS-POL-PREM-APPR-YES TO TRUE
               END-IF
           END-IF.

           IF  WS-POL-PREM-APPR-YES
                SET WS-PRCS-RSLT            TO TRUE
                MOVE WS-PRCS-RSLT-CD        TO WS-DTLS2-PRCS-RSLT
                MOVE WGLOB-PROCESS-DATE     TO WS-PRCES-DT
                MOVE WS-PRCES-DT-YY         TO WS-APPR-CNFRM-DT-YY
                MOVE WS-PRCES-DT-MM         TO WS-APPR-CNFRM-DT-MM
                MOVE WS-PRCES-DT-DY         TO WS-APPR-CNFRM-DT-DY
                MOVE WS-APPR-CNFRM-DT       TO WS-DTLS2-APPR-CNFRM-DT
           END-IF.

           IF  WS-INIT-RUN-YES
               MOVE WS-DTLS1-TYP-CD         TO WS-DTLS2-TYP-CD
               MOVE WS-DTLS1-SMALL-PROD-CD  TO WS-DTLS2-SMALL-PROD-CD
               MOVE WS-DTLS1-POL-ID         TO WS-DTLS2-POL-ID
               MOVE WS-DTLS1-PREM-DUE-DT    TO WS-DTLS2-PMT-DUE-MO
               MOVE WS-DTLS1-TOT-BILL-AMT   TO WS-DTLS2-SHRT-PREM-AMT
               MOVE WS-DTLS1-NO-DEP         TO WS-DTLS2-NO-OF-DEP
               MOVE WS-DTLS1-WIRE-XFER-DUE-DT
                                            TO WS-DTLS2-CLM-PMT-DUE
               MOVE WS-DTLS1-REMARKS        TO WS-DTLS2-REMARKS
           END-IF.

           STRING  WS-POL-PRCES-DT-YY,WS-POL-PRCES-DT-MM 
                 DELIMITED BY SIZE          INTO WS-POL-PD-TO-DT.
      
           IF  WS-POL-PREM-APPR-NO
           AND WS-DTLS2-PMT-DUE-MO = WS-POL-PD-TO-DT
              GO TO 3100-GET-RECORD-DETAILS-X
           END-IF.

      * LARGE TYPE

           MOVE RPOL-PLAN-ID                TO WTTAB-ETBL-VALU-ID.

           PERFORM  PRLG-1000-EDIT
               THRU PRLG-1000-EDIT-X.

           IF  WTTAB-IO-OK
               MOVE RTTAB-TTBL-VALU-TXT     TO WS-LARGE-TYP-CD
           ELSE
      *MSGS: LARGE PRODUCT CODE NOT FOUND FOR PLAN(@1)
               MOVE 'ZSDPCO0006'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-PLAN-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE SPACES                  TO WS-LARGE-TYP-CD
           END-IF.

           MOVE WS-LARGE-TYP-CD             TO WS-DTLS2-LRG-TYP-CD.

      * SMALL PRODUCT CODE

           MOVE WS-DTLS2-SMALL-PROD-CD      TO WS-DTLS2-SML-TYP-CD.

      * PAYMENT MODE

           MOVE RPOL-POL-BILL-MODE-CD       TO WS-DTLS2-PMT-MODE-CD.

      * DEPOSIT ROUTE
      * PAYMENT DEPOSIT AMOUNT
      * BRANCH CODE
           MOVE RPOL-SERV-BR-ID             TO WS-DTLS2-DPOS-BR-CD.
      * SERVICE AGENT ID
           MOVE RPOL-SERV-AGT-ID            TO WS-DTLS2-SERV-AGT-ID.
      * ERROR REASON

           PERFORM  3120-GET-DEP-DTLS
               THRU 3120-GET-DEP-DTLS-X.


      * GRACE PERIOD EXTENSION EXPIRY DATE

           MOVE WS-GRC-PRD-XPRY-DT          TO
                                  WS-DTLS2-GRC-PRD-XPRY-DT.


       3100-GET-RECORD-DETAILS-X.
           EXIT.
      /
      *-------------------
       3120-GET-DEP-DTLS.
      *-------------------

           MOVE WS-DTLS2-POL-ID             TO WBAC-POL-ID.
           MOVE WGLOB-PROCESS-DATE          TO
                                        WBAC-APPL-CTL-PRCES-DT.
           MOVE HIGH-VALUES                 TO  WBAC-SEQ-NUM.

           MOVE WBAC-KEY                    TO WBAC-ENDBR-KEY.
           MOVE WWKDT-LOW-DT                TO
                                  WBAC-ENDBR-APPL-CTL-PRCES-DT.
           MOVE LOW-VALUES                  TO WBAC-ENDBR-SEQ-NUM.

           PERFORM  BAC-1000-BROWSE-PREV
               THRU BAC-1000-BROWSE-PREV-X.

           IF NOT WBAC-IO-OK
      * READ THE NEXT RECORD IN INPUT FILE
               GO TO 3120-GET-DEP-DTLS-X
           END-IF.

           PERFORM  BAC-2000-READ-PREV
               THRU BAC-2000-READ-PREV-X.


           IF NOT WBAC-IO-OK
               PERFORM  BAC-3000-END-BROWSE-PREV
                   THRU BAC-3000-END-BROWSE-PREV-X
               GO TO 3120-GET-DEP-DTLS-X
           END-IF.

           MOVE RBAC-RECPT-TYP-CD           TO WS-DTLS2-DEPOSIT-RTE.

           MOVE RBAC-UNSUCS-REASN-CD        TO WS-DTLS2-ERR-RSN-CD.

           MOVE RBAC-BILL-TYP-CD            TO WS-DTLS2-BILL-TYP-CD.

           MOVE RBAC-RECV-AMT               TO WS-DTLS2-PMT-DEPOS-AMT.

           MOVE RBAC-RECV-DT                TO WS-DTLS2-BAL-PMT-DT.

           MOVE RBAC-RECV-DT                TO WS-DTLS2-RECPT-DT.

           MOVE RBAC-PREM-DUE-MO-NUM        TO WS-DTLS2-PMT-DUE-YR-MO.

           MOVE RBAC-TRAD-SO-JRNL-DT        TO
                                            WS-DTLS2-TRAD-SO-JRNL-DT.

           MOVE RBAC-PREM-COLCT-QTY         TO WS-DTLS2-NUM-OF-DEPOS.

           PERFORM  BAC-3000-END-BROWSE-PREV
               THRU BAC-3000-END-BROWSE-PREV-X.

       3120-GET-DEP-DTLS-X.
           EXIT.
      /

      *--------------
       9900-FINALIZE.
      *--------------

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

       9900-FINALIZE-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  DPCI-4000-CLOSE
               THRU DPCI-4000-CLOSE-X.

           PERFORM  PRT9-4000-CLOSE
               THRU PRT9-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      * LINK COPYBOOKS                                                *
      *****************************************************************
       COPY CCPSPGA.
       COPY XCPL0040.
       COPY CCPPMIDT.
      /
       COPY XCPL0260.
       COPY XCPL0030.
      /
      /
       COPY XCPS2490.
       COPY XCPL2490.
      /
       COPY CCPL0951.
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY XCPL1680.
       COPY CCPS0950.
       COPY CCPL0950.
      /

       COPY CCPL0182.
       COPY CCPS0182.
       COPY XCPS0290.
       COPY XCPL0290.
       COPY XCPL0289.
UYS001 COPY XCPL1660.       
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY CCPPCCC.
      /
       COPY XCPPHDG.
       COPY XCPPTIME.
       COPY CCPNEDIT.
       COPY CCPBEDIT.
UYS001 COPY CCPBETAB.       
      /

      *****************************************************************
      *             SEQ FILE I/O PROCESS MODULE                       *
      *****************************************************************
       COPY CCPNMAST.
      /
       COPY CCPNPOL.
       COPY NCPNTTAB.
       COPY CCPNDH.
       COPY CCPBDH.
       COPY CCPVDH.
       COPY CCPADH.
       COPY CCPCDH.
       COPY CCPFDH.
       COPY CCPABAC.
       COPY CCPVBAC.
       COPY CCPCBAC.
       COPY CCPFBAC.
       COPY CCPEPRSM.
       COPY CCPEPRLG.
       COPY CCPNTRNS.
      /
       COPY CCPIPRT9.
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

       COPY XCSLFILE REPLACING ==:ID:==  BY DPCI
                               ==':PGM:'== BY =='ZSRQDPCI'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY DPCI.
       COPY XCSASEQ  REPLACING ==:ID:==  BY DPCI.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY DPCI.

      /
      ****************************************************************
      *    ERROR HANDLING ROUTINES                                   *
      ****************************************************************


      *****************************************************************
      **                 END OF PROGRAM ZSBMDPCO                     **
      *****************************************************************
