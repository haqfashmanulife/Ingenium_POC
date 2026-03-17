      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMCFSA.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBMCFSA                                          **
      **  REMARKS: CLAIM EXTRACT PROCESSING                          **
      **                                                             **
      **           THIS PROGRAM CREATES CLAIM FSA UL EXTRACT RECORDS **
      **                                                             **
      **  DOMAIN :  AC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
EN1607**  30MAY07  CTS    CLAIM FSA UL EXTRACT                       **
ANU002**  11JUL07  CTS    CORRECT COMPANY INSURANCE DETAILS          **
MP0044**  29OCT07  CTS    PAYMENT DAYS SET TO ZERO FOR SURGERY AND   **
MP0044**		  CANCER SURGERY                             **
MP0044**                  RECEIPENT ADDRESS CODE ADDED TO THE EXTRACT**
MP0044**                  ALL CLAIM DATA PAID DURING 2006/4/1 TO     **
MP0044**                  2007/11/30 ARE ONLY EXTRACTED              ** 
ANU003**  16NOV07  CTS    CALCULATE MULTIPLIER SET TO ZERO FOR SURG  **
ANU003**                  AND CASUR                                  **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.

      ***************
       DATA DIVISION.
      ***************

      *------------------------
       WORKING-STORAGE SECTION.
      *------------------------

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCFSA'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.

           05  WS-FLAGS.
               10  WS-INSRD-IND             PIC X(01).
                   88  WS-INSRD-YES         VALUE 'Y'.
                   88  WS-INSRD-NO          VALUE 'N'.
MP0044         10  WS-CLM-RPT-WRIT-IND      PIC X(01).
MP0044             88 WS-CLM-RPT-WRIT-YES   VALUE 'Y'.
MP0044             88 WS-CLM-RPT-WRIT-NO    VALUE 'N'.
                   

           05  WS-MISC-WORK-AREAS.
               10  WS-SAVED-POL-ID          PIC X(10).
               10  WS-SAVED-CVG-NUM         PIC X(02).
               10  WS-CLM-AGG-NUM           PIC S9(03) COMP-3.
               10  WS-CALC-MULTIPLIER       PIC S9(06) COMP-3.
               10  WS-STRT-DT               PIC X(10).
               10  WS-END-DT                PIC X(10).
MP0044         10  WS-CORP-POL              PIC 9(01).               
MP0044         10  WS-BNFT-ID               PIC X(05).
MP0044             88 WS-BNFT-VALID         VALUES 'SURG','CASUR'.
MP0044         10  WS-CLI-ADDR-TYP-CD       PIC X(02)
MP0044                                      VALUE 'PR'.
ANF002         10  WS-CLI-ADDR-GR-CD        PIC X(02)
ANF002                                      VALUE 'KJ'.
MP0044         10  WS-CLAIM-EVNT-STRT-DT    PIC X(10)
MP0044                                      VALUE '2006-04-01'.
MP0044         10  WS-CLAIM-EVNT-END-DT     PIC X(10)
MP0044                                      VALUE '2007-11-30'. 

           05  WS-COUNTERS.
               10  WS-REC-CTR-IN            PIC 9(10).
               10  WS-REC-CTR-OUT           PIC 9(10).               

       01  WS-ERROR-CTR-LINE.
           05  WS-ERROR-CTR-LABEL           PIC X(40).
           05  FILLER                       PIC X(01).
           05  WS-ERROR-CTR-NUM             PIC 9(10).
           05  FILLER                       PIC X(82).
      /
      *****************************************************************
      *     COMMON COPYBOOKS                                          *
      *****************************************************************
      /
       COPY XCWL0035.
      /
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
       COPY XCWTFCMD.
      /
       COPY XCWWWKDT.
      /
      *****************************************************************
      *     I/O COPYBOOKS                                             *
      *****************************************************************
      /
      * SEQUENTIAL IO
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY CFSA
                               ==':ID:'==  BY =='CFSA'==.
       COPY ZCSRCFSA.
      /
      * POLICY TABLES
      *
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWPOLC.
       COPY CCFRPOLC.
      /
      * COVERAGE TABLES
      *
       COPY CCFWCVG.
       COPY CCFRCVG.
      /
MP0044 COPY CCFWCVGC.
MP0044 COPY CCFRCVGC.
MP0044/
      
      * CLIENT TABLES
      *
       COPY CCFWCLI.
       COPY CCFRCLI.
      /
MP0044 COPY CCFWCLIA.
MP0044 COPY CCFRCLIA.
MP0044/
      
      * CLAIMS TABLES
      *
      * CLMA IS THE TABLE THAT DRIVES THIS WHOLE PROCESS
      *
       COPY CCFWCLMA.
       COPY CCFRCLMA.
      /
       COPY CCFWCLA2.
       COPY CCFRCLAP.
      /
       COPY CCFWCLB3.
       COPY CCFRCLBD.
      /
       COPY CCFWCLBN.
       COPY CCFRCLBN.
      /
       COPY CCFWCLAH.
       COPY CCFRCLAH.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY CCWL2435.
      /
       COPY XCWL0040.
      /
       COPY XCWL0290.
      /
       COPY XCWL1640.
       COPY XCWLDTLK.
      /
       COPY XCWL1660.
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

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

      ***
      ***  READ FIRST RECORD FROM CLMA
      ***
           PERFORM  1500-GET-FIRST-CLAIM-RECORD
               THRU 1500-GET-FIRST-CLAIM-RECORD-X.

           PERFORM  2000-PROCESS-EACH-CLAIM
               THRU 2000-PROCESS-EACH-CLAIM-X
               UNTIL NOT WCLMA-IO-OK.

           PERFORM  9000-FINALIZE
               THRU 9000-FINALIZE-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           PERFORM  1100-OPEN-FILES
               THRU 1100-OPEN-FILES-X.

      *GET PROGRAM ID AND COMPANY CODE FROM BCF
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

      *GET COMPANY NAME FROM PCOM
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

      * GET THE SYSTEM ID ***
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.

      *GET THE PROGRAM DESCRIPTION - CLAIM FSA UL EXTRACT
           MOVE 'CLAIM FSA UL EXTRACT'      TO L0040-PROGRAM-DESC.

      *GET THE TEXT "RUN MESSAGES"
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

      *WRITE THE DETAILS TO OCF FILE
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           SET WS-INSRD-NO                  TO TRUE.
           MOVE ZEROES                      TO WS-REC-CTR-IN.
           MOVE ZEROES                      TO WS-REC-CTR-OUT.
           INITIALIZE RCFSA-SEQ-REC-INFO.


       1000-INITIALIZE-X.
           EXIT.
      /
      *----------------
       1100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  CFSA-3000-OPEN-OUTPUT
               THRU CFSA-3000-OPEN-OUTPUT-X.


       1100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------------
       1500-GET-FIRST-CLAIM-RECORD.
      *----------------------------

      * GET THE CLAIM RECORDS.

           MOVE LOW-VALUES                  TO WCLMA-KEY.
           MOVE HIGH-VALUES                 TO WCLMA-ENDBR-KEY.

           PERFORM  CLMA-1000-BROWSE
               THRU CLMA-1000-BROWSE-X.

           IF  WCLMA-IO-OK
               PERFORM  CLMA-2000-READ-NEXT
                   THRU CLMA-2000-READ-NEXT-X
               IF  WCLMA-IO-OK
                   CONTINUE
               ELSE
      * MSG: ZSBMCFSA - NO CLAIM RECORDS FOUND.
                   MOVE 'ZSCFSA0001'        TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           END-IF.


       1500-GET-FIRST-CLAIM-RECORD-X.
           EXIT.
      /
      *------------------------
       2000-PROCESS-EACH-CLAIM.
      *------------------------

           SET WS-INSRD-NO                  TO TRUE.
           ADD 1                            TO WS-REC-CTR-IN.
MP0044     MOVE ZEROES                      TO WS-CORP-POL.           

      * IF THE CLAIM IS HISTORICAL CLAIM, READ NEXT CLAIM

           IF  NOT RCLMA-CLMA-HIST-CLM-NO
               PERFORM  CLMA-2000-READ-NEXT
                   THRU CLMA-2000-READ-NEXT-X
               GO TO 2000-PROCESS-EACH-CLAIM-X
           END-IF.

      * GET THE CLIENT'S PERSONAL DETAILS
      *
           PERFORM  2100-GET-CLIENT-REC
               THRU 2100-GET-CLIENT-REC-X.

           IF NOT WCLI-IO-OK
               GO TO 2000-PROCESS-EACH-CLAIM-X
           END-IF.                   

      *
      * LOOP THROUGH THE BENEFIT RECORDS FOR THIS CLAIM
      *
           MOVE SPACES                      TO WS-SAVED-POL-ID.
           MOVE SPACES                      TO WS-SAVED-CVG-NUM.

           MOVE LOW-VALUES                  TO WCLBN-KEY.
           MOVE RCLMA-CLM-ID                TO WCLBN-CLM-ID.

           MOVE HIGH-VALUES                 TO WCLBN-ENDBR-KEY.
           MOVE RCLMA-CLM-ID                TO WCLBN-ENDBR-CLM-ID.

           PERFORM  CLBN-1000-BROWSE
               THRU CLBN-1000-BROWSE-X.

           IF  WCLBN-IO-OK
               PERFORM  CLBN-2000-READ-NEXT
                   THRU CLBN-2000-READ-NEXT-X

               IF  WCLBN-IO-OK
                   PERFORM  2200-PROCESS-EACH-BNFT-REC
                       THRU 2200-PROCESS-EACH-BNFT-REC-X
                       UNTIL NOT WCLBN-IO-OK
               END-IF

               PERFORM  CLBN-3000-END-BROWSE
                   THRU CLBN-3000-END-BROWSE-X

           END-IF.

           PERFORM  CLMA-2000-READ-NEXT
               THRU CLMA-2000-READ-NEXT-X.

       2000-PROCESS-EACH-CLAIM-X.
           EXIT.
      /
      *--------------------
       2100-GET-CLIENT-REC.
      *--------------------

           MOVE RCLMA-CLMA-INSRD-CLI-ID     TO WCLI-CLI-ID.

           PERFORM  CLI-1000-READ
               THRU CLI-1000-READ-X.

           IF  NOT WCLI-IO-OK
      *MSG: CLIENT RECORD (@1) FOR CLAIM RECORD (@2) NOT FOUND
               MOVE 'ZSCFSA0002'            TO WGLOB-MSG-REF-INFO
               MOVE WCLI-CLI-ID             TO WGLOB-MSG-PARM (1)
               MOVE RCLMA-CLM-ID            TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
      *CLIENT IS NOT FOUND; TAKE THE NEXT CLAIM
               PERFORM  CLMA-2000-READ-NEXT
                   THRU CLMA-2000-READ-NEXT-X

           END-IF.

       2100-GET-CLIENT-REC-X.
           EXIT.
      /
      *---------------------------
       2200-PROCESS-EACH-BNFT-REC.
      *---------------------------

      * IF THE PREVIOUS CLAIM BENEFIT DECISION IS NOT PAID, READ THE
      * NEXT RECORD

           IF  NOT RCLBN-CLBN-BNFT-DECSN-PAID
               PERFORM  CLBN-2000-READ-NEXT
                   THRU CLBN-2000-READ-NEXT-X
               GO TO 2200-PROCESS-EACH-BNFT-REC-X
           END-IF.

      * GET POLICY DETAILS

           PERFORM  2300-GET-POLICY-REC
               THRU 2300-GET-POLICY-REC-X.

           IF NOT WPOL-IO-OK
               GO TO 2200-PROCESS-EACH-BNFT-REC-X
           END-IF.

      * GET COVERAGE DETAILS

           PERFORM  2400-GET-COVERAGE-REC
               THRU 2400-GET-COVERAGE-REC-X.

           IF NOT WCVG-IO-OK
               GO TO 2200-PROCESS-EACH-BNFT-REC-X
           END-IF.

           PERFORM  2500-PROC-EACH-BNFT-REC
               THRU 2500-PROC-EACH-BNFT-REC-X.

           PERFORM  CLBN-2000-READ-NEXT
               THRU CLBN-2000-READ-NEXT-X.


       2200-PROCESS-EACH-BNFT-REC-X.
           EXIT.
      /
      *--------------------
       2300-GET-POLICY-REC.
      *--------------------

           IF  WS-SAVED-POL-ID = RCLBN-POL-ID
               GO TO 2300-GET-POLICY-REC-X
           END-IF.

           INITIALIZE WPOL-KEY.
           MOVE RCLBN-POL-ID                TO WPOL-POL-ID.
           MOVE WPOL-KEY                    TO WPOL-ENDBR-KEY.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF NOT WPOL-IO-OK
      * MSG: POLICY (@1) NOT FOUND FOR CLAIM (@2)
               MOVE 'ZSCFSA0003'            TO WGLOB-MSG-REF-INFO
               MOVE RCLBN-POL-ID            TO WGLOB-MSG-PARM (1)
               MOVE RCLMA-CLM-ID            TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               PERFORM  CLBN-2000-READ-NEXT
                   THRU CLBN-2000-READ-NEXT-X
           ELSE
               MOVE RPOL-POL-ID             TO WS-SAVED-POL-ID
           END-IF.

       2300-GET-POLICY-REC-X.
           EXIT.
      /
      *----------------------
       2400-GET-COVERAGE-REC.
      *----------------------

           IF  WS-SAVED-CVG-NUM = RCLBN-CVG-NUM
               GO TO 2400-GET-COVERAGE-REC-X
           END-IF.

           MOVE SPACES                      TO WCVG-KEY.
           MOVE RPOL-POL-ID                 TO WCVG-POL-ID.
           MOVE RCLBN-CVG-NUM               TO WCVG-CVG-NUM.
           MOVE WCVG-KEY                    TO WCVG-ENDBR-KEY.

           PERFORM  CVG-1000-READ
               THRU CVG-1000-READ-X.

           IF NOT WCVG-IO-OK
      * MSG: COVERAGE (@1) OF POLICY (@2) OF CLAIM (@3) NOT FOUND
               MOVE 'ZSCFSA0004'            TO WGLOB-MSG-REF-INFO
               MOVE RCLBN-CVG-NUM           TO WGLOB-MSG-PARM (1)
               MOVE RCLBN-POL-ID            TO WGLOB-MSG-PARM (2)
               MOVE RCLMA-CLM-ID            TO WGLOB-MSG-PARM (3)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               PERFORM  CLBN-2000-READ-NEXT
                   THRU CLBN-2000-READ-NEXT-X
           ELSE
               MOVE RCVG-CVG-NUM            TO WS-SAVED-CVG-NUM
           END-IF.

       2400-GET-COVERAGE-REC-X.
           EXIT.
      /
      *------------------------
       2500-PROC-EACH-BNFT-REC.
      *------------------------

      * BROWSE THE CLAIM BENEFIT DETAIL RECORDS USING ALTERNATE INDEX.

           MOVE LOW-VALUES                  TO WCLB3-KEY.
           MOVE RCLMA-CLM-ID                TO WCLB3-CLM-ID.
           MOVE RPOL-POL-ID                 TO WCLB3-POL-ID.
           MOVE RCVG-CVG-NUM                TO WCLB3-CVG-NUM.
           MOVE RCLBN-BNFT-NM-ID            TO WCLB3-BNFT-NM-ID.
           MOVE ZEROES                      TO WCLB3-CLM-AGG-NUM.
           MOVE WWKDT-LOW-DT                TO WCLB3-EVNT-STRT-DT.

           MOVE HIGH-VALUES                 TO WCLB3-ENDBR-KEY.
           MOVE RCLMA-CLM-ID                TO WCLB3-ENDBR-CLM-ID.
           MOVE RPOL-POL-ID                 TO WCLB3-ENDBR-POL-ID.
           MOVE RCVG-CVG-NUM                TO WCLB3-ENDBR-CVG-NUM.
           MOVE RCLBN-BNFT-NM-ID            TO WCLB3-ENDBR-BNFT-NM-ID.
           MOVE 999                         TO WCLB3-ENDBR-CLM-AGG-NUM.
           MOVE WWKDT-HIGH-DT               TO WCLB3-ENDBR-EVNT-STRT-DT.

           PERFORM  CLB3-1000-BROWSE
               THRU CLB3-1000-BROWSE-X.

           IF  WCLB3-IO-OK
               PERFORM  CLB3-2000-READ-NEXT
                   THRU CLB3-2000-READ-NEXT-X

               IF  WCLB3-IO-OK

                   MOVE ZEROES              TO WS-CLM-AGG-NUM
ANF002*MP0044             SET WS-CLM-RPT-WRIT-NO   TO TRUE                   
                   
                       PERFORM  2600-CLBD-LOOP
                           THRU 2600-CLBD-LOOP-X
                           UNTIL NOT WCLB3-IO-OK
                           
ANF002*MP0044                 PERFORM  2650-CLAIM-EVNT-STRT-DT-CHK
ANF002*MP0044                     THRU 2650-CLAIM-EVNT-STRT-DT-CHK-X
ANF002*MP0044
ANF002*MP0044             IF  WS-CLM-RPT-WRIT-YES
ANF002*MP0044                 PERFORM  3000-CREATE-CLAIM-OUTPUT-REC
ANF002*MP0044                     THRU 3000-CREATE-CLAIM-OUTPUT-REC-X
ANF002*MP0044             END-IF
ANF002*MP0044                                                  
                       PERFORM  3000-CREATE-CLAIM-OUTPUT-REC
                           THRU 3000-CREATE-CLAIM-OUTPUT-REC-X
               ELSE
      *MSG: NO BENEFIT RECORD (@1) FOUND FOR CLAIM (@2)
                   MOVE 'ZSCFSA0005'        TO WGLOB-MSG-REF-INFO
                   MOVE WCLB3-KEY           TO WGLOB-MSG-PARM (1)
                   MOVE RCLMA-CLM-ID        TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF

           PERFORM  CLB3-3000-END-BROWSE
               THRU CLB3-3000-END-BROWSE-X
           END-IF.

       2500-PROC-EACH-BNFT-REC-X.
           EXIT.
      /
      *---------------
       2600-CLBD-LOOP.
      *---------------
      *
      * IF THERE IS A BREAK IN AGGREGATION NUMBER THEN CREATE AN
      * EXTRACT RECORD.
ANF002*MP0044*CHECK CLAIM PAID DATE > 1/4/2006.
ANF002*MP0044*CHECK CLAIM PAID DATE < 30/11/2007.
ANF002*MP0044
ANF002*MP0044     PERFORM  2650-CLAIM-EVNT-STRT-DT-CHK
ANF002*MP0044         THRU 2650-CLAIM-EVNT-STRT-DT-CHK-X.
ANF002*MP0044
ANF002*MP0044     IF  WS-CLM-RPT-WRIT-NO
ANF002*MP0044         PERFORM  CLB3-2000-READ-NEXT
ANF002*MP0044             THRU CLB3-2000-READ-NEXT-X
ANF002*MP0044         GO TO 2600-CLBD-LOOP-X
ANF002*MP0044     END-IF.
ANF002*MP0044
MP0044*PAYMENT DAYS SET TO ZERO FOR SURGERY AND CANCER SURGERY. 
MP0044     MOVE RCLBN-BNFT-NM-ID TO WS-BNFT-ID.

           IF  RCLBD-CLM-AGG-NUM NOT = WS-CLM-AGG-NUM

               IF  WS-CLM-AGG-NUM = ZEROES
                   CONTINUE
               ELSE

                   PERFORM  3000-CREATE-CLAIM-OUTPUT-REC
                       THRU 3000-CREATE-CLAIM-OUTPUT-REC-X
               END-IF

               MOVE ZEROES                  TO WS-CALC-MULTIPLIER
               MOVE RCLBD-CLM-AGG-NUM       TO WS-CLM-AGG-NUM
               MOVE WWKDT-HIGH-DT           TO WS-STRT-DT
               MOVE WWKDT-LOW-DT            TO WS-END-DT

           END-IF.

           IF  RCLBD-CLBD-STAT-PAID
           OR  RCLBD-CLBD-STAT-PAYBL

               IF  RCLBD-EVNT-STRT-DT < WS-STRT-DT
                   MOVE RCLBD-EVNT-STRT-DT  TO WS-STRT-DT
               END-IF

               IF  RCLBD-EVNT-END-DT > WS-END-DT
                   MOVE RCLBD-EVNT-END-DT   TO WS-END-DT
               END-IF

MP0044*         COMPUTE WS-CALC-MULTIPLIER
MP0044*                                  =  WS-CALC-MULTIPLIER
MP0044*                                  + (RCLBD-EVNT-MULT-AMT
MP0044*                                  *  RCLBD-EVNT-UNIT-QTY)
ANU003*MP0044         IF  WS-BNFT-VALID
ANU003*MP0044             MOVE ZERO                TO RCFSA-CALC-MULTIPLIER
ANU003*MP0044         ELSE              
ANU003*MP0044             COMPUTE WS-CALC-MULTIPLIER
ANU003*MP0044                                      =  WS-CALC-MULTIPLIER
ANU003*MP0044                                      + (RCLBD-EVNT-MULT-AMT
ANU003*MP0044                                      *  RCLBD-EVNT-UNIT-QTY)
ANU003*MP0044         END-IF

ANU003         COMPUTE WS-CALC-MULTIPLIER
ANU003                                  =  WS-CALC-MULTIPLIER
ANU003                                  + (RCLBD-EVNT-MULT-AMT
ANU003                                  *  RCLBD-EVNT-UNIT-QTY)

           END-IF.
           
           PERFORM  CLB3-2000-READ-NEXT
               THRU CLB3-2000-READ-NEXT-X.


       2600-CLBD-LOOP-X.
           EXIT.
      /
ANF002*MP0044*----------------------------
ANF002*MP0044 2650-CLAIM-EVNT-STRT-DT-CHK.
ANF002*MP0044*----------------------------
ANF002*MP0044*
ANF002*MP0044*CHECK CLAIM PAID DATE > 1/4/2006.
ANF002*MP0044*CHECK CLAIM PAID DATE < 30/11/2007.
ANF002*MP0044      
ANF002*MP0044     IF  (RCLBD-EVNT-STRT-DT <= WS-CLAIM-EVNT-STRT-DT
ANF002*MP0044     OR  RCLBD-EVNT-STRT-DT >= WS-CLAIM-EVNT-END-DT)
ANF002*MP0044         SET WS-CLM-RPT-WRIT-NO       TO TRUE
ANF002*MP0044     ELSE
ANF002*MP0044         SET WS-CLM-RPT-WRIT-YES TO TRUE
ANF002*MP0044     END-IF. 

ANF002*MP0044 2650-CLAIM-EVNT-STRT-DT-CHK-X.
ANF002*MP0044     EXIT.
ANF002*MP0044/                               
      *----------------------------
       3000-CREATE-CLAIM-OUTPUT-REC.
      *----------------------------

      * MOVE VALUES TO THE DETAIL RECORD.

           INITIALIZE RCFSA-SEQ-REC-INFO.
ANF002     SET WS-CLM-RPT-WRIT-NO   TO TRUE.           

      *    CALC-MULTIPLIER SHOULD BE GREATER THAN ZERO.

MP0044*     IF  WS-CALC-MULTIPLIER <= ZERO
MP0044*         GO TO 3000-CREATE-CLAIM-OUTPUT-REC-X
MP0044*     END-IF.
ANU003*MP0044
ANU003*MP0044     IF  (WS-CALC-MULTIPLIER <= ZERO AND NOT WS-BNFT-VALID)
ANU003*MP0044         GO TO 3000-CREATE-CLAIM-OUTPUT-REC-X
ANU003*MP0044     END-IF.

ANU003     IF  WS-CALC-MULTIPLIER <= ZERO
ANU003         GO TO 3000-CREATE-CLAIM-OUTPUT-REC-X
ANU003     END-IF.
ANU003
           MOVE 2                           TO RCFSA-DATA-TYP.
           MOVE 500                         TO RCFSA-LRG-PROD-CD.
           MOVE 500                         TO RCFSA-SMALL-PROD-CD.
           MOVE RPOL-POL-ID                 TO RCFSA-POL-ID-R.
           MOVE RCVG-CVG-NUM                TO RCFSA-CVG-NUM.
           MOVE RCVG-PLAN-ID                TO RCFSA-PLAN-ID-R.
           MOVE RCLMA-CLM-ID                TO RCFSA-CLM-ID.
           MOVE RCLBN-BNFT-NM-ID            TO RCFSA-BNFT-NM-ID.

      * GET PAYMENT HISTORY DETAILS.
           PERFORM  5000-GET-PAYMENT-HIST
               THRU 5000-GET-PAYMENT-HIST-X.
ANF002
ANF002     IF WS-CLM-RPT-WRIT-NO
ANF002        GO TO 3000-CREATE-CLAIM-OUTPUT-REC-X
ANF002     END-IF.

           IF  WS-STRT-DT NOT = WWKDT-HIGH-DT
               MOVE WS-STRT-DT              TO RCFSA-EVNT-STRT-DT
           END-IF.

           IF  WS-END-DT NOT = WWKDT-LOW-DT
               MOVE WS-END-DT               TO RCFSA-EVNT-END-DT
           END-IF.

ANU003     IF  WS-BNFT-VALID
ANU003         MOVE ZERO                TO RCFSA-CALC-MULTIPLIER
ANU003     ELSE
ANU003         MOVE WS-CALC-MULTIPLIER          TO RCFSA-CALC-MULTIPLIER.
ANU003     END-IF.
ANU003
ANU003*     MOVE WS-CALC-MULTIPLIER          TO RCFSA-CALC-MULTIPLIER.
           
           IF  RCLBN-CLBN-FINAL-MAJ-CD = '99'
               MOVE RCLBN-CLBN-FINAL-MAJ-CD TO RCFSA-DISEASE-CD-R (2:2)

               MOVE ZERO                    TO RCFSA-DISEASE-CD-R (1:1)
           ELSE
               MOVE RCLBN-CLBN-FINAL-MAJ-CD TO RCFSA-DISEASE-CD-R
           END-IF.

           MOVE RCLI-CLI-BTH-DT             TO RCFSA-INSRD-BTH-DT.

      * IF INSURED IS MALE, SET TO 1. IF INSURED IS FEMALE, SET TO 2.
           EVALUATE TRUE
               WHEN RCLI-CLI-SEX-MALE
                    MOVE 1                  TO RCFSA-INSRD-SEX-CD
               WHEN RCLI-CLI-SEX-FEMALE
                    MOVE 2                  TO RCFSA-INSRD-SEX-CD
           END-EVALUATE.

           IF  WS-INSRD-NO

      * GET POLICY OWNER NAME DETAILS.
           PERFORM  5200-GET-POL-HLDR-NAME
               THRU 5200-GET-POL-HLDR-NAME-X
           END-IF.

      * IF POLICY OWNER IS SAME AS INSURED,SET THIS INDICATOR

           IF  RPOLC-CLI-ID = RCLMA-CLMA-INSRD-CLI-ID
               SET WS-INSRD-YES             TO TRUE
           END-IF.

           MOVE L2435-CLI-NM-COMPRESSED     TO RCFSA-POL-HLDR-NAME.

      * IF THE POLICY IS A CORPORATE POLICY, UPDATE RECIPIENT DETAILS
      * WITH POLICY OWNER DETAILS.
ANF002* CORRECT THE COMPANY CHECK
ANF002*    IF  RCLI-CLI-SEX-COMPANY
ANF002     IF  L2435-CLI-SEX-COMPANY
               MOVE 1                       TO RCFSA-CO-INS-CD
               MOVE RCFSA-POL-HLDR-NAME     TO RCFSA-RECIP-NAME
MP0044         PERFORM  5600-GET-POL-HLDR-ADDR-REC
MP0044             THRU 5600-GET-POL-HLDR-ADDR-REC-X
MP0044         MOVE 1                       TO WS-CORP-POL
               
           END-IF.

           IF  WS-INSRD-NO

      * GET INSURED NAME DETAILS
           PERFORM  5500-GET-INSRD-NAME
               THRU 5500-GET-INSRD-NAME-X
           END-IF.

           MOVE L2435-CLI-NM-COMPRESSED     TO RCFSA-INSRD-NAME.
           

      * IF DISEASE CODE IS BETWEEN 010 AND 017, SET TO 2
           IF  RCFSA-DISEASE-CD-R > '009'
           AND RCFSA-DISEASE-CD-R < '018'
               MOVE 2                       TO RCFSA-INSRD-DTH-STAT
           END-IF.
           
MP0044* GET INSURED CLIENT ID
MP0044
MP0044     PERFORM  5800-GET-INSRD-REC
MP0044         THRU 5800-GET-INSRD-REC-X.
MP0044           
MP0044* IF THE POLICY IS NOT CORPORATE POLICY,GET INSURED ADDRESS DETAILS.
MP0044
MP0044     IF  WS-CORP-POL NOT = 1
MP0044         PERFORM  5700-GET-INSRD-ADDR-REC
MP0044             THRU 5700-GET-INSRD-ADDR-REC-X
MP0044     END-IF.
MP0044           
MP0044     MOVE RCLIA-CLI-ADDR-LOC-CD       TO RCFSA-RECIP-ADDR-LOC-CD.           

      * UPDATE RECIPIENT DETAILS WITH INSURED DETAILS, IF THE POLICY
      * IS NOT A CORPORATE POLICY
           IF  RCFSA-CO-INS-CD NOT = 1
               MOVE RCFSA-INSRD-NAME        TO RCFSA-RECIP-NAME
           END-IF.

           PERFORM  CFSA-1000-WRITE
               THRU CFSA-1000-WRITE-X.

           ADD +1                           TO WS-REC-CTR-OUT.

       3000-CREATE-CLAIM-OUTPUT-REC-X.
           EXIT.
      /
      *----------------------
       5000-GET-PAYMENT-HIST.
      *----------------------

      * READ ALL CLAP (PAYMENT HISTORY) AND FIND PAYMENT DATE

           MOVE LOW-VALUES                  TO WCLA2-KEY.
           MOVE RCLMA-CLM-ID                TO WCLA2-CLM-ID.
           MOVE RCLBN-POL-ID                TO WCLA2-POL-ID.
           MOVE WWKDT-LOW-DT                TO WCLA2-FBNK-REMIT-DT.

           MOVE WCLA2-KEY                   TO WCLA2-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT               TO
                                            WCLA2-ENDBR-FBNK-REMIT-DT.

           PERFORM  CLA2-1000-BROWSE
               THRU CLA2-1000-BROWSE-X.

           PERFORM
               UNTIL NOT WCLA2-IO-OK

               PERFORM  CLA2-2000-READ-NEXT
                   THRU CLA2-2000-READ-NEXT-X

               IF  WCLA2-IO-OK
                   PERFORM  5100-MOVE-DT-TO-REC
                       THRU 5100-MOVE-DT-TO-REC-X
               END-IF

           END-PERFORM.

           PERFORM  CLA2-3000-END-BROWSE
               THRU CLA2-3000-END-BROWSE-X.

       5000-GET-PAYMENT-HIST-X.
           EXIT.
      /
      *--------------------
       5100-MOVE-DT-TO-REC.
      *--------------------

      * FIRST CHECK STATUS OF CLAH, IF REVERSED IGNORE THIS CLAP
ANF002*CHECK CLAIM PAID DATE > 1/4/2006.
ANF002*CHECK CLAIM PAID DATE < 30/11/2007.
      

           MOVE RCLAP-CLM-ID                TO WCLAH-CLM-ID.
           MOVE RCLAP-APROV-SEQ-NUM         TO WCLAH-APROV-SEQ-NUM.

           PERFORM  CLAH-1000-READ
               THRU CLAH-1000-READ-X.

           IF  NOT RCLAH-CLAH-STAT-ACTIVE
               GO TO 5100-MOVE-DT-TO-REC-X
           END-IF.
           
ANF002*    MOVE RCLAP-FBNK-REMIT-DT         TO RCFSA-JOURNAL-DT.
ANF002     PERFORM  5150-CLAIM-EVNT-STRT-DT-CHK
ANF002         THRU 5150-CLAIM-EVNT-STRT-DT-CHK-X.
ANF002
ANF002     IF WS-CLM-RPT-WRIT-YES
ANF002        MOVE RCLAP-FBNK-REMIT-DT         TO RCFSA-JOURNAL-DT
ANF002     END-IF.

       5100-MOVE-DT-TO-REC-X.
           EXIT.
      /
ANF002*----------------------------
ANF002 5150-CLAIM-EVNT-STRT-DT-CHK.
ANF002*----------------------------
ANF002*
ANF002*CHECK CLAIM PAID DATE > 1/4/2006.
ANF002*CHECK CLAIM PAID DATE < 30/11/2007.
ANF002      
ANF002     IF  (RCLAP-FBNK-REMIT-DT <= WS-CLAIM-EVNT-STRT-DT
ANF002     OR  RCLAP-FBNK-REMIT-DT >= WS-CLAIM-EVNT-END-DT)
ANF002         SET WS-CLM-RPT-WRIT-NO       TO TRUE
ANF002     ELSE
ANF002         SET WS-CLM-RPT-WRIT-YES TO TRUE
ANF002     END-IF. 

ANF002 5150-CLAIM-EVNT-STRT-DT-CHK-X.
ANF002     EXIT.
ANF002/                               
      *-----------------------
       5200-GET-POL-HLDR-NAME.
      *-----------------------

      * GET THE POLICY OWNER DETAILS
           PERFORM  5300-GET-POLC-REC
               THRU 5300-GET-POLC-REC-X.

           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.

           MOVE RPOLC-CLI-ID                TO L2435-CLI-ID.

           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.

           IF  L2435-RETRN-CLI-NOT-FOUND
      *MSG: CLIENT (@1) DOES NOT EXIST
               MOVE 'XS00000076'            TO WGLOB-MSG-REF-INFO
               MOVE L2435-CLI-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       5200-GET-POL-HLDR-NAME-X.
           EXIT.
      /
      *------------------
       5300-GET-POLC-REC.
      *------------------

           MOVE LOW-VALUES                  TO WPOLC-KEY.
           MOVE RPOL-POL-ID                 TO WPOLC-POL-ID.
           MOVE 'O'                         TO WPOLC-POL-CLI-REL-TYP-CD.

           MOVE HIGH-VALUES                 TO WPOLC-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WPOLC-ENDBR-POL-ID.
           MOVE 'O'                         TO
                                        WPOLC-ENDBR-POL-CLI-REL-TYP-CD.

           PERFORM  POLC-1000-BROWSE
               THRU POLC-1000-BROWSE-X.

           IF  WPOLC-IO-OK
               PERFORM  POLC-2000-READ-NEXT
                   THRU POLC-2000-READ-NEXT-X

               PERFORM  5400-GET-PRIM-OWNER-REC
                   THRU 5400-GET-PRIM-OWNER-REC-X
                   UNTIL NOT WPOLC-IO-OK
                   OR RPOLC-POL-CLI-REL-SUB-CD = 'P'

               IF NOT WPOLC-IO-OK
      *MSG: POLICY RECORD (@1) FOR CLAIM RECORD (@2) NOT FOUND
                   MOVE 'ZSCFSA0003'        TO WGLOB-MSG-REF-INFO
                   MOVE RPOL-POL-ID         TO WGLOB-MSG-PARM (1)
                   MOVE RCLMA-CLM-ID        TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
               PERFORM  POLC-3000-END-BROWSE
                   THRU POLC-3000-END-BROWSE-X
           END-IF.

       5300-GET-POLC-REC-X.
           EXIT.
      /
      *------------------------
       5400-GET-PRIM-OWNER-REC.
      *------------------------

      * GET PRIMARY POLICY OWNER ID.

           IF  NOT WPOLC-IO-OK
               GO TO 5400-GET-PRIM-OWNER-REC-X
           END-IF.

           IF  RPOLC-POL-CLI-REL-SUB-CD NOT = 'P'
               PERFORM  POLC-2000-READ-NEXT
                   THRU POLC-2000-READ-NEXT-X
               GO TO 5400-GET-PRIM-OWNER-REC-X
           END-IF.

       5400-GET-PRIM-OWNER-REC-X.
           EXIT.
      /
      *--------------------
       5500-GET-INSRD-NAME.
      *--------------------

           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.

           MOVE RCLMA-CLMA-INSRD-CLI-ID     TO L2435-CLI-ID.

           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.

           IF  L2435-RETRN-CLI-NOT-FOUND
      *MSG: CLIENT (@1) DOES NOT EXIST
               MOVE 'XS00000076'            TO WGLOB-MSG-REF-INFO
               MOVE L2435-CLI-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 5500-GET-INSRD-NAME-X
           END-IF.


       5500-GET-INSRD-NAME-X.
           EXIT.
      /
MP0044*------------------------
MP0044  5600-GET-POL-HLDR-ADDR-REC.
MP0044*------------------------
MP0044
MP0044     INITIALIZE RCLIA-REC-INFO.
MP0044     MOVE LOW-VALUES            TO WCLIA-KEY.
MP0044     MOVE RPOLC-CLI-ID          TO WCLIA-CLI-ID.
MP0044     MOVE HIGH-VALUES           TO WCLIA-ENDBR-KEY.
MP0044     MOVE RPOLC-CLI-ID          TO WCLIA-ENDBR-CLI-ID.
MP0044     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-CLI-ADDR-TYP-CD.
ANF001     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-ENDBR-CLI-ADDR-TYP-CD.
ANF001     MOVE WS-CLI-ADDR-GR-CD     TO WCLIA-CLI-ADDR-GR-CD.
ANF001     MOVE WS-CLI-ADDR-GR-CD     TO WCLIA-ENDBR-CLI-ADDR-GR-CD.
MP0044
MP0044     PERFORM  CLIA-1000-BROWSE
MP0044         THRU CLIA-1000-BROWSE-X.
MP0044
MP0044     IF  WCLIA-IO-OK
MP0044         PERFORM  CLIA-2000-READ-NEXT
MP0044             THRU CLIA-2000-READ-NEXT-X
MP0044
MP0044         IF  NOT WCLIA-IO-OK
MP0044*MSG: CLIENT ADDRESS RECORD (@1) FOR POLICY RECORD (@2) NOT FOUND
MP0044             MOVE 'ZSCFSA0006'             TO WGLOB-MSG-REF-INFO
MP0044             MOVE RPOLC-CLI-ID             TO WGLOB-MSG-PARM (1)
MP0044             MOVE RPOL-POL-ID              TO WGLOB-MSG-PARM (2)
MP0044             PERFORM  0260-1000-GENERATE-MESSAGE
MP0044                 THRU 0260-1000-GENERATE-MESSAGE-X
MP0044         END-IF
MP0044
MP0044         PERFORM  CLIA-3000-END-BROWSE
MP0044             THRU CLIA-3000-END-BROWSE-X
MP0044
MP0044     END-IF.

MP0044 5600-GET-POL-HLDR-ADDR-REC-X.
MP0044     EXIT.

MP0044*------------------------
MP0044 5700-GET-INSRD-ADDR-REC.
MP0044*------------------------
MP0044
MP0044     INITIALIZE RCLIA-REC-INFO.
MP0044     MOVE LOW-VALUES            TO WCLIA-KEY.
MP0044     MOVE RCVGC-INSRD-CLI-ID    TO WCLIA-CLI-ID.
ANF001*MP0044     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-CLI-ADDR-TYP-CD.
MP0044     MOVE HIGH-VALUES           TO WCLIA-ENDBR-KEY.
MP0044     MOVE RCVGC-INSRD-CLI-ID    TO WCLIA-ENDBR-CLI-ID.
ANF001     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-CLI-ADDR-TYP-CD.
ANF001     MOVE WS-CLI-ADDR-TYP-CD    TO WCLIA-ENDBR-CLI-ADDR-TYP-CD.
ANF001     MOVE WS-CLI-ADDR-GR-CD     TO WCLIA-CLI-ADDR-GR-CD.
ANF001     MOVE WS-CLI-ADDR-GR-CD     TO WCLIA-ENDBR-CLI-ADDR-GR-CD.
MP0044
MP0044     PERFORM  CLIA-1000-BROWSE
MP0044         THRU CLIA-1000-BROWSE-X.
MP0044
MP0044     IF  WCLIA-IO-OK
MP0044         PERFORM  CLIA-2000-READ-NEXT
MP0044             THRU CLIA-2000-READ-NEXT-X
MP0044
MP0044         IF  NOT WCLIA-IO-OK
MP0044*MSG: CLIENT ADDRESS RECORD (@1) FOR POLICY RECORD (@2) NOT FOUND
MP0044             MOVE 'ZSCFSA0006'        TO WGLOB-MSG-REF-INFO
MP0044             MOVE RCVGC-INSRD-CLI-ID  TO WGLOB-MSG-PARM (1)
MP0044             MOVE RPOL-POL-ID         TO WGLOB-MSG-PARM (2)
MP0044             PERFORM  0260-1000-GENERATE-MESSAGE
MP0044                 THRU 0260-1000-GENERATE-MESSAGE-X
MP0044         END-IF
MP0044
MP0044         PERFORM  CLIA-3000-END-BROWSE
MP0044             THRU CLIA-3000-END-BROWSE-X
MP0044     END-IF.

MP0044 5700-GET-INSRD-ADDR-REC-X.
MP0044     EXIT.
MP0044/

MP0044*------------------
MP0044 5800-GET-INSRD-REC.
MP0044*------------------
MP0044
MP0044* BROWSE CVGC TABLE TO GET INSURED DETAILS FOR PARTICULAR COVERAGE
MP0044
MP0044     INITIALIZE RCVGC-REC-INFO.
MP0044     MOVE LOW-VALUES                 TO WCVGC-KEY.
MP0044     MOVE RPOL-POL-ID                TO WCVGC-POL-ID.
MP0044     MOVE RCVG-CVG-NUM               TO WCVGC-CVG-NUM.
MP0044     MOVE 'P'                        TO WCVGC-CVG-CLI-REL-TYP-CD.
MP0044
MP0044     MOVE HIGH-VALUES                TO WCVGC-ENDBR-KEY.
MP0044     MOVE RPOL-POL-ID                TO WCVGC-ENDBR-POL-ID.
MP0044     MOVE RCVG-CVG-NUM               TO WCVGC-ENDBR-CVG-NUM.
MP0044     MOVE 'P'                        TO
MP0044                                WCVGC-ENDBR-CVG-CLI-REL-TYP-CD.       
MP0044
MP0044     PERFORM  CVGC-1000-BROWSE
MP0044         THRU CVGC-1000-BROWSE-X.
MP0044
MP0044     IF  WCVGC-IO-OK
MP0044         PERFORM  CVGC-2000-READ-NEXT
MP0044             THRU CVGC-2000-READ-NEXT-X
MP0044
MP0044         IF  NOT WCVGC-IO-OK
MP0044*MSG: COVERAGE CLIENT RELATIONSHIP RECORD (@1) FOR
MP0044*     POLICY RECORD (@2) NOT FOUND
MP0044             MOVE 'ZSCFSB0005'        TO WGLOB-MSG-REF-INFO
MP0044             MOVE RCVG-CVG-NUM        TO WGLOB-MSG-PARM (1)
MP0044             MOVE RPOL-POL-ID         TO WGLOB-MSG-PARM (2)
MP0044             PERFORM  0260-1000-GENERATE-MESSAGE
MP0044                 THRU 0260-1000-GENERATE-MESSAGE-X
MP0044         END-IF
MP0044
MP0044         PERFORM  CVGC-3000-END-BROWSE
MP0044             THRU CVGC-3000-END-BROWSE-X
MP0044
MP0044     END-IF.

MP0044 5800-GET-INSRD-REC-X.
MP0044     EXIT.
MP0044/


      *--------------
       9000-FINALIZE.
      *--------------

           PERFORM  9100-PRINT-TOTALS
               THRU 9100-PRINT-TOTALS-X.

           PERFORM  CLMA-3000-END-BROWSE
               THRU CLMA-3000-END-BROWSE-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.


       9000-FINALIZE-X.
           EXIT.
      /
      *------------------
       9100-PRINT-TOTALS.
      *------------------

      *MSG : TOTAL RECORDS READ---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.

           MOVE 'TOTAL RECORDS READ   ---->'
                                            TO WS-ERROR-CTR-LABEL.
           MOVE WS-REC-CTR-IN               TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG : TOTAL RECORDS WRITTEN---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.

           MOVE 'TOTAL RECORDS WRITTEN---->'
                                            TO WS-ERROR-CTR-LABEL.
           MOVE WS-REC-CTR-OUT              TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       9100-PRINT-TOTALS-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  CFSA-4000-CLOSE
               THRU CFSA-4000-CLOSE-X.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.


       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************

       COPY XCPL0035.

       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
       COPY CCPL2435.
       COPY CCPS2435.
      /
       COPY CCPPCCC.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL0290.
       COPY XCPS0290.
      /
       COPY XCPL1640.
      /
       COPY XCPL1660.
      /
      *****************************************************************
      * FILE HANDLING ROUTINES
      *****************************************************************

       COPY XCSLFILE REPLACING ==:ID:==  BY CFSA
                               ==':PGM:'== BY =='ZSRQCFSA'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CFSA.
       COPY XCSASEQ  REPLACING ==:ID:==  BY CFSA.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
      * POLICY TABLES
      *
       COPY CCPNPOL.
      /
       COPY CCPBPOLC.
      /
      * COVERAGE TABLES
      *
       COPY CCPNCVG.
      /
MP0044 COPY CCPBCVGC.
MP0044/
      
      * CLIENT TABLES
      *
       COPY CCPNCLI.
      /
MP0044 COPY CCPBCLIA.
MP0044/
      
      * CLAIMS TABLES
      *
      * CLMA IS THE TABLE THAT DRIVES THIS WHOLE PROCESS
      *
       COPY CCPBCLMA.
      /
       COPY CCPBCLA2.
      /
       COPY CCPBCLB3.
      /
       COPY CCPBCLBN.
      /
       COPY CCPNCLAH.
      /
      *****************************************************************
      * ERROR HANDLING ROUTINES
      *****************************************************************

       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCFSA                     **
      *****************************************************************
