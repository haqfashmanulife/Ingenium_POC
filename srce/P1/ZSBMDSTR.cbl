      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMDSTR.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMDSTR                                         **
      **  REMARKS:  PROCESSING TRANSFER SLIP FOR DISASTER AFFECTED   **
      **            POLICIES                                         **
      ** THIS PROGRAM GENERATES THEN TRANSFER SLIP FOR THE  DISASTER **
      **      AFFECTED POLICIES                                       **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
MP771D**  19JUN20  CTS    INTIAL VERSION                             **
125759**  27JUL20  CTS    CHANGES FOR TRAD WITH POLICY PAID TO DATE  **
125781**  30JUL20  CTS    CHANGES FOR USAGE OF TRAD PD TO POL PD DATE**
125847**  11AUG20  CTS    CHANGES FOR FUND AMOUNT FOR UL PRODUCTS    **
UYS001**  01MAR21  CTS    CHANGES DONE FOR ETAB                      **
      *****************************************************************
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
      ***************************
       WORKING-STORAGE SECTION.
      ***************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMDSTR'.

       COPY SQLCA.

      * DETAILS OF THE RECORDS.

       01  WS-MISC-FIELDS.
           05  WS-CURR-MNTH-END-DT              PIC X(10).
           05  WS-PREV-MNTH-END-DT              PIC X(10).
           05  WS-NO-OF-COI-DED                 PIC 9(02).
           05  WS-FND-AMT                       PIC S9(13)V9(02)
                                                COMP-3.
           05  WS-GRCE-PREM-SHRT-AMT            PIC S9(16).
           05  WS-UNPAID-MODE                   PIC 9(02).
           05  WS-FRGN-XCHNG-4-RT               PIC S9(9)V9(9) COMP-3.
           05  WS-NO-OF-MNTHS                   PIC 9(02).
           05  WS-CALC-SHRT-AMT-IND             PIC X(01).
               88 WS-CALC-SHRT-AMT-YES          VALUE 'Y'.
               88 WS-CALC-SHRT-AMT-NO           VALUE 'N'.
           05  WS-COI-AMT                       PIC S9(13)V9(02)
                                                COMP-3.
           05  WS-SUB                           PIC S9(8)  COMP.
           05  WS-COI-BEFR-UPDT-MO              PIC 9(02).
           05  WS-COI-AFTR-UPDT-MO              PIC 9(02).
           05  WS-MPREM-BEFR-UPDT-MO            PIC 9(02).
           05  WS-MPREM-AFTR-UPDT-MO            PIC 9(02).
           05  WS-AUTO-RENW-IND                 PIC X(01).
               88 WS-AUTO-RENW-YES              VALUE 'Y'.
               88 WS-AUTO-RENW-NO               VALUE 'N'.
           05  WS-NEW-RENW-PREM-AMT             PIC 9(10).
           05  WS-TRNS-STRT-DT                  PIC X(10).
           05  WS-TRNS-STRT-DT-R                REDEFINES
               WS-TRNS-STRT-DT.
               15  WS-TRNS-STRT-YR              PIC X(04).
               15  FILLER                       PIC X(01).
               15  WS-TRNS-STRT-MO              PIC X(02).
               15  FILLER                       PIC X(01).
               15  WS-TRNS-STRT-DY              PIC X(02).
           05  WS-CVG-PREM-CHNG-DT              PIC X(10).
           05  WS-NXT-ME-GRC-PRD-DT             PIC X(10).


      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWL0950.
       COPY CCWLPGA.
       COPY CCWWCCC.
       COPY XCWWHDG.
       COPY CCWL0010.
       COPY CCWWINDX.
       COPY XCWL0015.
       COPY XCWL0035.
       COPY XCWL1640.
       COPY XCWLDTLK.
       COPY XCWWTIME.
       COPY XCWWWKDT.
       COPY XCWTFCMD.
       COPY CCWW9B65.
       COPY CCWL9B65.
UYS001 COPY XCWL1660.
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY CCFWMAST.
       COPY CCFRMAST.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWCVG.
       COPY CCFRCVG.
      /
       COPY CCWLCRCV.
      /
       COPY CCFRTRNS.
       COPY CCFWTRNS.
       COPY CCWWCVGS.
      /
UYS001 COPY CCFRETAB.
UYS001 COPY CCFWETAB.
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY ZCSRDSTR.
       COPY XCSWSEQ  REPLACING ==:ID:==  BY ACEN
                                     ==':ID:'==  BY =='ACEN'==.
       COPY CCSRACEN.
       COPY XCSWSEQ  REPLACING ==:ID:==  BY DSTR
                               ==':ID:'==  BY =='DSTR'==.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
       COPY NCFWTTAB.
       COPY NCFRTTAB.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY XCWL0040.
       COPY XCWL2490.
       COPY CCWL0182.
       COPY XCWL1680.
       COPY CCWL9215.
       COPY XCWL1670.
      /
      *****************************************************************
      *  INPUT PARAMETER INFORMATION                                  *
      *****************************************************************
       COPY CCFHPOL.
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
              UNTIL WDSTR-SEQ-IO-EOF.

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

           PERFORM  DSTR-1000-OPEN-INPUT
               THRU DSTR-1000-OPEN-INPUT-X.

           PERFORM  ACEN-3000-OPEN-OUTPUT
               THRU ACEN-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *-----------------------
       1000-INITIALIZE-VALUES.
      *-----------------------

           MOVE SPACES                      TO WGLOB-COMPANY-CODE.

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
               MOVE 'ZSDSTR0001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

      *  READ THE INPUT FILE

           PERFORM  DSTR-1000-READ
               THRU DSTR-1000-READ-X.

           IF NOT WDSTR-SEQ-IO-OK
      *    MSG:'INPUT FILE EMPTY'
               MOVE  'ZSDSTR0002'           TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-INITIALIZE-VALUES-X
           END-IF.

           MOVE 'GRCEPEREXP'                TO WTRNS-PROJ-ID.

           PERFORM  TRNS-1000-READ
               THRU TRNS-1000-READ-X.

           IF  WTRNS-IO-OK
               MOVE RTRNS-STRT-DT           TO WS-TRNS-STRT-DT
           ELSE
               MOVE WTRNS-KEY               TO WGLOB-MSG-PARM (1)
      *MSG:   'RECORD (@1) NOT FOUND'
               MOVE 'ZSDSTR0006'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       1000-INITIALIZE-VALUES-X.
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

      *   GET THE PROGRAM DESCRIPTION

           MOVE '00001'                     TO L2490-TXT-SRC-REF-ID.
           MOVE WPGWS-CRNT-PGM-ID           TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO L0040-PROGRAM-DESC.

      *   GET THE 'RUN MESSAGES' MESSAGE TEXT

           MOVE 'ZSDSTR0003'                TO WGLOB-MSG-REF-INFO.

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

      *    MSGS: NOW PROCESSING POLICY(@1)

           MOVE 'ZSDSTR0004'                TO WGLOB-MSG-REF-INFO.
           MOVE RDSTR-POL-ID                TO WGLOB-MSG-PARM (1).

           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM  3100-GET-RECORD-DETAILS
               THRU 3100-GET-RECORD-DETAILS-X.

      *   INPUT FILE READ

           PERFORM  DSTR-1000-READ
               THRU DSTR-1000-READ-X.

       3000-PROCESS-EXTRACTS-X.
           EXIT.
      /
      *------------------------
       3100-GET-RECORD-DETAILS.
      *------------------------

           INITIALIZE RACEN-SEQ-REC-DTL.

      ** RECORD TYPE CD
           SET RACEN-REC-TYP-DATA           TO TRUE.

      ** PLAN AND POLICY ID

           MOVE  RDSTR-POL-ID               TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF  WPOL-IO-NOT-FOUND
      *MSG : ' POLICY (@1) DOES NOT EXIST'
               MOVE WPOL-KEY                TO WGLOB-MSG-PARM(1)
               MOVE 'ZSDSTR0005'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO  3100-GET-RECORD-DETAILS-X
           END-IF.

           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
      ** SMALL PRODUCT CODE

           MOVE  RPOL-PLAN-ID               TO WTTAB-ETBL-VALU-ID.

           PERFORM  PRSM-1000-EDIT
               THRU PRSM-1000-EDIT-X.

           IF  WTTAB-IO-OK
               MOVE RTTAB-TTBL-VALU-TXT     TO RACEN-SMALL-PROD-CD
           ELSE
               MOVE SPACES                  TO RACEN-SMALL-PROD-CD
           END-IF.

      ** POLICY ID DETAILS

           MOVE RPOL-POL-ID                 TO RACEN-POL-ID.

      ** PAYMENT DUE MONTH

           IF  RPOL-POL-INS-TYP-UL
               MOVE RPOL-POL-PD-TO-DT-NUM-YR
                                            TO RACEN-PREM-DUE-YR
               MOVE RPOL-POL-PD-TO-DT-NUM-MO
                                            TO RACEN-PREM-DUE-MO
           ELSE
               MOVE RPOL-TRAD-PD-TO-DT-NUM-YR
                                            TO RACEN-PREM-DUE-YR
               MOVE RPOL-TRAD-PD-TO-DT-NUM-MO
                                            TO RACEN-PREM-DUE-MO
           END-IF.

      * TOTAL BILLED AMOUNT

           IF  RPOL-POL-INS-TYP-TRAD

               MOVE WWKDT-HIGH-DT           TO WS-CVG-PREM-CHNG-DT
               PERFORM
               VARYING  WS-SUB FROM 1 BY 1
                  UNTIL WS-SUB > RPOL-POL-CVG-REC-CTR-N
                   IF  WCVGS-CVG-STAT-PREM-PAYING(WS-SUB)
                       IF  WCVGS-CVG-PREM-CHNG-DT (WS-SUB) <
                                              WS-CVG-PREM-CHNG-DT
                        AND WCVGS-CVG-PREM-CHNG-DT (WS-SUB) NOT =
                                                     WWKDT-ZERO-DT
                        AND  WCVGS-CVG-PREM-CHNG-DT(WS-SUB) <
                        WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM)
                           MOVE WCVGS-CVG-PREM-CHNG-DT (WS-SUB)
                                            TO WS-CVG-PREM-CHNG-DT
                       END-IF
                   END-IF
               END-PERFORM
           END-IF.


           IF  RPOL-POL-INS-TYP-UL

               MOVE WWKDT-HIGH-DT           TO WS-CVG-PREM-CHNG-DT

               PERFORM
               VARYING  WS-SUB FROM 1 BY 1
                  UNTIL WS-SUB > RPOL-POL-CVG-REC-CTR-N
                   IF  WCVGS-CVG-STAT-PREM-PAYING(WS-SUB)
                       IF  WCVGS-CVG-PREM-CHNG-DT (WS-SUB) <
                                              WS-CVG-PREM-CHNG-DT
                        AND WCVGS-CVG-PREM-CHNG-DT (WS-SUB) NOT =
                                                     WWKDT-ZERO-DT
                           MOVE WCVGS-CVG-PREM-CHNG-DT (WS-SUB)
                                            TO WS-CVG-PREM-CHNG-DT
                       END-IF
                   END-IF
               END-PERFORM
           END-IF.

      * SHORTAGE PREMIUM

      * COI AFTER AUTOMATIC UPDATE OF RIDER

      * MODAL PREMIUM AFTER AUTOMATIC UPDATE OF RIDER


           MOVE RPOL-REC-INFO               TO HPOL-REC-INFO.

           SET RPOL-POL-STAT-PREM-PAYING
                                            TO TRUE.

           PERFORM  9B65-1000-BUILD-PARM-INFO
               THRU 9B65-1000-BUILD-PARM-INFO-X.

           MOVE RPOL-POL-ID                 TO L9B65-POL-ID.
           MOVE WS-CVG-PREM-CHNG-DT         TO L9B65-EFF-DT.

           MOVE WS-TRNS-STRT-DT             TO L1680-INTERNAL-1.
           MOVE 1                           TO L1680-INT-DD-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE 2                           TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.

           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.

           MOVE L1680-INTERNAL-2            TO L1680-INTERNAL-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                        TO L1680-NUMBER-OF-MONTHS.
           MOVE 1                           TO L1680-NUMBER-OF-DAYS.

           PERFORM  1680-4000-SUB-YMD-FROM-DATE
               THRU 1680-4000-SUB-YMD-FROM-DATE-X.

           MOVE L1680-INTERNAL-2            TO WS-NXT-ME-GRC-PRD-DT.

           IF  WS-CVG-PREM-CHNG-DT < WS-NXT-ME-GRC-PRD-DT
           AND WS-CVG-PREM-CHNG-DT <> SPACES
           AND WS-CVG-PREM-CHNG-DT <> WWKDT-HIGH-DT
           AND RPOL-POL-INS-TYP-UL
               PERFORM  9B65-1000-CALC-DFLT
                   THRU 9B65-1000-CALC-DFLT-X
           END-IF.

           IF  WS-CVG-PREM-CHNG-DT < WS-TRNS-STRT-DT
           AND WS-CVG-PREM-CHNG-DT <> SPACES
           AND WS-CVG-PREM-CHNG-DT <> WWKDT-HIGH-DT
           AND RPOL-POL-INS-TYP-TRAD
               PERFORM  9B65-1000-CALC-DFLT
                   THRU 9B65-1000-CALC-DFLT-X
           END-IF.
           
           MOVE HPOL-REC-INFO           TO RPOL-REC-INFO

      * CHANGES FOR THE DISASTER GRACE PERIOD EXTENSION
      * FOR THE SHORTAGE AMOUNT CALCULATION FOR UL
           EVALUATE TRUE

               WHEN  RPOL-POL-INS-TYP-UL

                    PERFORM  3300-UL-SHRT-AMT-CALC
                        THRU 3300-UL-SHRT-AMT-CALC-X

      * CALCULATION OF DISASTER SHORTAGE AMOUNT
      * FOR TRAD PRODUCTS

               WHEN  RPOL-POL-INS-TYP-TRAD
               AND RPOL-PREM-CRCY-CD='JP'

                    PERFORM  3400-JPY-PREM-SHRT-AMT-CALC
                        THRU 3400-JPY-PREM-SHRT-AMT-CALC-X

      * CALCULATION OF DISASTER SHORTAGE AMOUNT
      * FOR FXWL AND FFF PRODUCTS

               WHEN  RPOL-POL-INS-TYP-TRAD
               AND RPOL-PREM-CRCY-CD <> 'JP'

                    PERFORM  3500-FRGN-PREM-SHRT-AMT-CALC
                        THRU 3500-FRGN-PREM-SHRT-AMT-CALC-X

           END-EVALUATE.

      ** DAYS TO CLAIM PAYMENT DUE

           MOVE WS-TRNS-STRT-YR             TO RACEN-WIRE-XFER-DUE-YR
           MOVE WS-TRNS-STRT-MO             TO RACEN-WIRE-XFER-DUE-MO
           MOVE WS-TRNS-STRT-DY             TO RACEN-WIRE-XFER-DUE-DY


      ** REMARKS

           MOVE '00002'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMDSTR'                  TO L2490-TXT-SRC-ID.
           MOVE  WGLOB-USER-LANG            TO L2490-TXT-LANG-CD.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO RACEN-REMARKS.

      * WRITE ACEN

           PERFORM  ACEN-1000-WRITE
               THRU ACEN-1000-WRITE-X.

       3100-GET-RECORD-DETAILS-X.
           EXIT.

      *----------------------
       3300-UL-SHRT-AMT-CALC.
      *----------------------

           MOVE ZEROS                       TO WS-FND-AMT.
           MOVE WWKDT-ZERO-DT               TO WS-CURR-MNTH-END-DT.
           MOVE ZEROS                       TO WS-NO-OF-COI-DED.
           MOVE ZEROS                       TO WS-GRCE-PREM-SHRT-AMT.
           MOVE ZEROS                       TO WS-COI-AMT.
           MOVE ZEROS                       TO WS-NEW-RENW-PREM-AMT.
           MOVE ZEROS                       TO WS-COI-AFTR-UPDT-MO.
           MOVE ZEROS                       TO WS-COI-BEFR-UPDT-MO.

      * FUND AMOUNT


           IF  RPOL-UL-LAPS-STRT-DT <> WWKDT-ZERO-DT
               COMPUTE WS-FND-AMT = RPOL-POL-UL-SHRT-AMT * -1
           ELSE
               MOVE RPOL-REC-INFO           TO HPOL-REC-INFO


               SET RPOL-POL-STAT-PREM-PAYING
                                            TO TRUE

               PERFORM  0182-1000-BUILD-PARM-INFO
                   THRU 0182-1000-BUILD-PARM-INFO-X
               MOVE WGLOB-PROCESS-DATE      TO L0182-EFF-DT
               SET L0182-CALC-IF-TERMINATED TO TRUE
               PERFORM  0182-1000-CALC-CSV-POL
                   THRU 0182-1000-CALC-CSV-POL-X
               MOVE HPOL-REC-INFO           TO RPOL-REC-INFO
125847*        MOVE L0182-POL-ACUM-VALU-AMT TO WS-FND-AMT
125847         MOVE L0182-CVG-ACUM-VALU-AMT (RPOL-POL-BASE-CVG-NUM)
125847                                      TO WS-FND-AMT
           END-IF.

      * CALCULATION FOR THE LAST DATE OF MONTH

           MOVE RPOL-POL-PD-TO-DT-NUM       TO L1680-INTERNAL-1.
           MOVE WS-NXT-ME-GRC-PRD-DT        TO L1680-INTERNAL-2.

           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.

           COMPUTE WS-NO-OF-COI-DED = (L1680-NUMBER-OF-MONTHS)
                                    + (L1680-NUMBER-OF-YEARS * 12).
           COMPUTE WS-NO-OF-COI-DED = WS-NO-OF-COI-DED + 1.
           COMPUTE WS-COI-AMT       = (RPOL-POL-MPREM-AMT
                                    / RPOL-POL-BILL-MODE-CD-N).

      * CALCULATION OF GRACE PERIOD PREMIUM SHORTAGE AMOUNT

           COMPUTE WS-GRCE-PREM-SHRT-AMT = (WS-FND-AMT
                                         - (WS-COI-AMT
                                         * WS-NO-OF-COI-DED)
                                         + (RPOL-POL-BT-SUSP-AMT
                                         + RPOL-POL-PD-SUSP-AMT
                                         + RPOL-POL-CC-SUSP-AMT)).

      * TO CHECK AUTOMATIC RENEWAL OF UL RIDER

           SET WS-AUTO-RENW-NO              TO TRUE.

           IF  WS-CVG-PREM-CHNG-DT < WS-NXT-ME-GRC-PRD-DT
           AND WS-CVG-PREM-CHNG-DT <> SPACES
               SET WS-AUTO-RENW-YES         TO TRUE
               PERFORM  3165-POL-RENW-AMT
                   THRU 3165-POL-RENW-AMT-X
           END-IF.

           IF  WS-AUTO-RENW-YES
               MOVE RPOL-POL-PD-TO-DT-NUM   TO L1680-INTERNAL-1
               MOVE WS-CVG-PREM-CHNG-DT
                                            TO L1680-INTERNAL-2

               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-COI-BEFR-UPDT-MO = ( L1680-NUMBER-OF-MONTHS )
                                  + ( L1680-NUMBER-OF-YEARS * 12 )


               
               MOVE WS-NXT-ME-GRC-PRD-DT
                                            TO L1680-INTERNAL-1
               MOVE WS-CVG-PREM-CHNG-DT     TO L1680-INTERNAL-2                                            

               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-COI-AFTR-UPDT-MO =
                                   ( L1680-NUMBER-OF-MONTHS ) +
                                   ( L1680-NUMBER-OF-YEARS * 12 )

               COMPUTE WS-COI-AFTR-UPDT-MO = WS-COI-AFTR-UPDT-MO + 1


               COMPUTE WS-NEW-RENW-PREM-AMT = (WS-NEW-RENW-PREM-AMT /
                               RPOL-POL-BILL-MODE-CD-N)

      * CALCULATION OF GRACE PERIOD PREMIUM SHORTAGE AMOUNT FOR UL
      * RENEWAL
               COMPUTE WS-GRCE-PREM-SHRT-AMT =
                  (WS-FND-AMT - ((WS-COI-AMT * WS-COI-BEFR-UPDT-MO)+
                  (WS-NEW-RENW-PREM-AMT * WS-COI-AFTR-UPDT-MO))+
                  (RPOL-POL-BT-SUSP-AMT + RPOL-POL-PD-SUSP-AMT +
                                RPOL-POL-CC-SUSP-AMT))
           END-IF.


           IF  WS-GRCE-PREM-SHRT-AMT > 0
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.

           IF  WS-GRCE-PREM-SHRT-AMT < 0
               COMPUTE WS-GRCE-PREM-SHRT-AMT = (-1)
                                             * WS-GRCE-PREM-SHRT-AMT
           END-IF.

      * FOR TERMINATED POLICIES

           IF  RPOL-POL-STAT-TERMINATED
           AND NOT RPOL-POL-STAT-LAPSED
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.

           MOVE WS-GRCE-PREM-SHRT-AMT       TO RACEN-TOT-BILL-AMT.
           MOVE WS-NO-OF-COI-DED            TO RACEN-NO-DEP.

       3300-UL-SHRT-AMT-CALC-X.
           EXIT.
      /
      *---------------------------
       3400-JPY-PREM-SHRT-AMT-CALC.
      *---------------------------

           MOVE ZEROS                       TO WS-NO-OF-MNTHS.
           MOVE ZEROS                       TO WS-UNPAID-MODE.
           MOVE ZEROS                       TO WS-GRCE-PREM-SHRT-AMT.
           MOVE ZEROS                       TO WS-NEW-RENW-PREM-AMT.
           MOVE ZEROS                       TO WS-MPREM-BEFR-UPDT-MO.
           MOVE ZEROS                       TO WS-MPREM-AFTR-UPDT-MO.
           SET WS-CALC-SHRT-AMT-YES         TO TRUE.

           PERFORM  3600-MNTH-END-DT-CALC
               THRU 3600-MNTH-END-DT-CALC-X.

           IF  WS-CALC-SHRT-AMT-YES
               COMPUTE WS-GRCE-PREM-SHRT-AMT =
                (( RPOL-POL-MPREM-AMT * WS-UNPAID-MODE ) -
                (RPOL-POL-BT-SUSP-AMT + RPOL-POL-PD-SUSP-AMT +
125781          RPOL-POL-CC-SUSP-AMT) - RPOL-OVR-SHRT-PREM-AMT) 
125781*                 RPOL-POL-CC-SUSP-AMT) - RPOL-OVR-SHRT-PREM-AMT) -
125781*                 RPOL-POL-PREM-SUSP-AMT

           END-IF.
      * TO CHECK AUTOMATIC RENEWAL OF TRAD RIDER

           SET WS-AUTO-RENW-NO              TO TRUE.

           IF  WS-CVG-PREM-CHNG-DT < WS-TRNS-STRT-DT
           AND WS-CVG-PREM-CHNG-DT <> SPACES
               SET WS-AUTO-RENW-YES         TO TRUE
               PERFORM  3165-POL-RENW-AMT
                   THRU 3165-POL-RENW-AMT-X
           END-IF.

           IF  WS-AUTO-RENW-YES
125759*        MOVE RPOL-TRAD-PD-TO-DT-NUM  TO L1680-INTERNAL-1
125781*125759  MOVE RPOL-POL-PD-TO-DT-NUM   TO L1680-INTERNAL-1   
125781         MOVE RPOL-TRAD-PD-TO-DT-NUM  TO L1680-INTERNAL-1   
               MOVE WS-CVG-PREM-CHNG-DT
                                            TO L1680-INTERNAL-2

               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-MPREM-BEFR-UPDT-MO =
                                   ( L1680-NUMBER-OF-MONTHS )
                                  + ( L1680-NUMBER-OF-YEARS * 12 )

               MOVE WS-CVG-PREM-CHNG-DT
                                            TO L1680-INTERNAL-1
               MOVE WS-TRNS-STRT-DT         TO L1680-INTERNAL-2


               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-MPREM-AFTR-UPDT-MO =
                                   ( L1680-NUMBER-OF-MONTHS ) +
                                   ( L1680-NUMBER-OF-YEARS * 12 )


               COMPUTE WS-MPREM-AFTR-UPDT-MO =
               WS-MPREM-AFTR-UPDT-MO /  RPOL-POL-BILL-MODE-CD-N

               COMPUTE WS-MPREM-AFTR-UPDT-MO =
                                     WS-MPREM-AFTR-UPDT-MO + 1

      * CALCULATION OF GRACE PERIOD PREMIUM SHORTAGE AMOUNT FOR 
      * TRAD RENEWAL
               COMPUTE WS-GRCE-PREM-SHRT-AMT =
                ((( RPOL-POL-MPREM-AMT * WS-MPREM-BEFR-UPDT-MO ) +
                ( WS-NEW-RENW-PREM-AMT * WS-MPREM-AFTR-UPDT-MO ))
              - (RPOL-POL-BT-SUSP-AMT + RPOL-POL-PD-SUSP-AMT +
125781           RPOL-POL-CC-SUSP-AMT) - RPOL-OVR-SHRT-PREM-AMT)              
125781*                 RPOL-POL-CC-SUSP-AMT) - RPOL-OVR-SHRT-PREM-AMT) -
125781*                RPOL-POL-PREM-SUSP-AMT
      	   END-IF.

      * FOR TERMINATED POLICIES

           IF  RPOL-POL-STAT-TERMINATED
           AND NOT RPOL-POL-STAT-LAPSED
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.

           IF  WS-GRCE-PREM-SHRT-AMT < 0
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.

           MOVE WS-GRCE-PREM-SHRT-AMT       TO RACEN-TOT-BILL-AMT.

       3400-JPY-PREM-SHRT-AMT-CALC-X.
           EXIT.
      /
      *----------------------------
       3500-FRGN-PREM-SHRT-AMT-CALC.
      *----------------------------

           MOVE WWKDT-ZERO-DT               TO WS-PREV-MNTH-END-DT.
           MOVE ZEROS                       TO WS-NO-OF-MNTHS.
           MOVE ZEROS                       TO WS-UNPAID-MODE.
           MOVE ZEROS                       TO WS-GRCE-PREM-SHRT-AMT.
           MOVE ZEROS                       TO WS-FRGN-XCHNG-4-RT.

      *CALCULATE FOREIGN CURRENCY PREMIUM AMOUNT

           PERFORM  CRCV-1000-BUILD-PARM
               THRU CRCV-1000-BUILD-PARM-X.

           MOVE WGLOB-PROCESS-DATE          TO L9215-INTERNAL-1.
           MOVE 01                          TO L9215-INT-DD-1.
           MOVE 01                          TO L9215-NUMBER-OF-DAYS.

           PERFORM  9215-1100-GET-PAST-BUS-DT
               THRU 9215-1100-GET-PAST-BUS-DT-X.

           IF  L9215-RETRN-OK
               MOVE L9215-INTERNAL-2        TO WS-PREV-MNTH-END-DT
           END-IF.

           MOVE RPOL-POL-MPREM-AMT          TO LCRCV-XCHNG-INPUT-AMT.
           MOVE WS-PREV-MNTH-END-DT         TO LCRCV-XCHNG-EFF-DT.
           MOVE RPOL-PREM-CRCY-CD           TO
                                            LCRCV-XCHNG-FROM-CRCY-CD.
           MOVE RPOL-PMT-CRCY-CD            TO LCRCV-XCHNG-TO-CRCY-CD.

           PERFORM  CRCV-2000-PAYOUT-CRCY-CNVR
               THRU CRCV-2000-PAYOUT-CRCY-CNVR-X.

           IF  LCRCV-RETRN-OK
               MOVE LCRCV-XCHNG-4-RT        TO WS-FRGN-XCHNG-4-RT
           END-IF.

           COMPUTE WS-GRCE-PREM-SHRT-AMT ROUNDED =
                          (RPOL-POL-MPREM-AMT * WS-FRGN-XCHNG-4-RT ).

           PERFORM  3600-MNTH-END-DT-CALC
               THRU 3600-MNTH-END-DT-CALC-X.

           COMPUTE WS-GRCE-PREM-SHRT-AMT = (WS-GRCE-PREM-SHRT-AMT
                                         * WS-UNPAID-MODE).

      * FOR TERMINATED POLICIES

           IF  RPOL-POL-STAT-TERMINATED
           AND NOT RPOL-POL-STAT-LAPSED
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.

           MOVE WS-GRCE-PREM-SHRT-AMT       TO RACEN-TOT-BILL-AMT.

       3500-FRGN-PREM-SHRT-AMT-CALC-X.
           EXIT.
      /
      *----------------------
       3600-MNTH-END-DT-CALC.
      *----------------------

      * CALCULATION FOR THE LAST DATE OF MONTH

           MOVE WS-TRNS-STRT-DT             TO WS-CURR-MNTH-END-DT.

           IF  WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM)
               < WS-CURR-MNTH-END-DT
           AND WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM)
               NOT= WWKDT-ZERO-DT
               MOVE WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM)
                                            TO L1680-INTERNAL-1
               MOVE 01                      TO L1680-INT-DD-1
               MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
               MOVE 1                       TO L1680-NUMBER-OF-DAYS
               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X
               MOVE L1680-INTERNAL-2        TO WS-CURR-MNTH-END-DT
           END-IF.

           IF  WCVGS-CVG-MAT-XPRY-DT (RPOL-POL-BASE-CVG-NUM)
               NOT= WWKDT-ZERO-DT
           AND WCVGS-CVG-MAT-XPRY-DT (RPOL-POL-BASE-CVG-NUM)
               < WS-CURR-MNTH-END-DT
               MOVE WCVGS-CVG-MAT-XPRY-DT (RPOL-POL-BASE-CVG-NUM)
                                            TO L1680-INTERNAL-1
               MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
               MOVE 1                       TO L1680-NUMBER-OF-DAYS
               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X
               MOVE L1680-INTERNAL-2        TO WS-CURR-MNTH-END-DT

           END-IF.

125759*    IF  WS-CURR-MNTH-END-DT < RPOL-TRAD-PD-TO-DT-NUM
125781*125759     IF  WS-CURR-MNTH-END-DT < RPOL-POL-PD-TO-DT-NUM      
125781     IF  WS-CURR-MNTH-END-DT < RPOL-TRAD-PD-TO-DT-NUM
               SET WS-CALC-SHRT-AMT-NO      TO TRUE
           END-IF.

125759*    IF  WS-CURR-MNTH-END-DT >= RPOL-TRAD-PD-TO-DT-NUM
125781*125759     IF  WS-CURR-MNTH-END-DT >= RPOL-POL-PD-TO-DT-NUM
125781     IF  WS-CURR-MNTH-END-DT >= RPOL-TRAD-PD-TO-DT-NUM
               MOVE WS-CURR-MNTH-END-DT     TO L1680-INTERNAL-1
125759*        MOVE RPOL-TRAD-PD-TO-DT-NUM
125759*                                     TO L1680-INTERNAL-2
125781*125759         MOVE RPOL-POL-PD-TO-DT-NUM
125781*125759                                     TO L1680-INTERNAL-2
125781         MOVE RPOL-TRAD-PD-TO-DT-NUM
125781                                      TO L1680-INTERNAL-2
               MOVE 01                      TO L1680-INT-DD-2
               MOVE 01                      TO L1680-INT-DD-1
               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X
               COMPUTE WS-NO-OF-MNTHS = ( L1680-NUMBER-OF-MONTHS )
                                      + ( L1680-NUMBER-OF-YEARS * 12 )
               COMPUTE WS-UNPAID-MODE = (WS-NO-OF-MNTHS
                                      / RPOL-POL-BILL-MODE-CD-N)
               COMPUTE WS-UNPAID-MODE = WS-UNPAID-MODE + 1
           END-IF.

125781*125759*    MOVE WS-UNPAID-MODE              TO RACEN-NO-DEP.
125781     MOVE WS-UNPAID-MODE              TO RACEN-NO-DEP.

125781*125759     IF  WS-CURR-MNTH-END-DT >= RPOL-TRAD-PD-TO-DT-NUM
125781*125759         MOVE WS-CURR-MNTH-END-DT     TO L1680-INTERNAL-1
125781*125759         MOVE RPOL-TRAD-PD-TO-DT-NUM
125781*125759                                      TO L1680-INTERNAL-2
125781*125759         MOVE 01                      TO L1680-INT-DD-2
125781*125759         MOVE 01                      TO L1680-INT-DD-1
125781*125759
125781*125759         PERFORM  1680-2000-COMP-DAYS-BETWEEN
125781*125759             THRU 1680-2000-COMP-DAYS-BETWEEN-X
125781*125759
125781*125759         COMPUTE WS-NO-OF-MNTHS = ( L1680-NUMBER-OF-MONTHS ) +
125781*125759                             ( L1680-NUMBER-OF-YEARS * 12 )
125781*125759         COMPUTE WS-NO-OF-MNTHS = (WS-NO-OF-MNTHS /
125781*125759                            RPOL-POL-BILL-MODE-CD-N)
125781*125759
125781*125759         COMPUTE WS-NO-OF-MNTHS = WS-NO-OF-MNTHS + 1
125759*125759     END-IF.
125759*125759
125759*125759         MOVE WS-NO-OF-MNTHS          TO RACEN-NO-DEP.

       3600-MNTH-END-DT-CALC-X.
           EXIT.
      /

      *-----------------
       3165-POL-RENW-AMT.
      *-----------------

           MOVE ZEROES                      TO WS-NEW-RENW-PREM-AMT.
           PERFORM
           VARYING  WS-SUB FROM 1 BY 1
              UNTIL WS-SUB > RPOL-POL-CVG-REC-CTR-N
               COMPUTE WS-NEW-RENW-PREM-AMT = WS-NEW-RENW-PREM-AMT +
                           L9B65-RENW-MPREM-AMT-T(WS-SUB)
           END-PERFORM.

       3165-POL-RENW-AMT-X.
           EXIT.
      /

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  DSTR-4000-CLOSE
               THRU DSTR-4000-CLOSE-X.

           PERFORM  ACEN-4000-CLOSE
               THRU ACEN-4000-CLOSE-X.

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
      /
       COPY XCPL0260.
      /
       COPY XCPS2490.
       COPY XCPL2490.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY CCPS0182.
      /
       COPY CCPL0182.
      /
       COPY CCPSCRCV.
       COPY CCPLCRCV.
      /
       COPY CCPS9215.
       COPY CCPL9215.
      /
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPL9B65.
       COPY CCPS9B65.
      /
UYS001 COPY XCPL1660.      
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY XCPPHDG.
       COPY XCPPTIME.
       COPY NCPPCVGS.
UYS001 COPY CCPBETAB.       
       COPY CCPPCCC.
       COPY CCPEPRSM.
      /
      *****************************************************************
      *             SEQ FILE I/O PROCESS MODULE                       *
      *****************************************************************
       COPY CCPNMAST.
      /
       COPY CCPNPOL.
       COPY CCPNCVG.
       COPY XCPL1680.
       COPY CCPNTRNS.
       COPY NCPNTTAB.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY DSTR
                               ==':PGM:'== BY =='ZSRQDSTR'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY DSTR.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY DSTR.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY ACEN
                              ==':PGM:'== BY =='CSRQACEN'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY ACEN.
       COPY XCSASEQ  REPLACING ==:ID:==  BY ACEN.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY ACEN.
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
      ****************************************************************
      *    ERROR HANDLING ROUTINES                                   *
      ****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBMDSTR                     **
      *****************************************************************
