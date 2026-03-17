
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    ZSBMCWSA.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMCWSA                                         **
      **  REMARKS:  POLICY EXTRACT PROGRAM                           **
      **                                                             **
      **  GENERATE THE CWS DATA FOR SUL PRODUCTS                     **
      **                                                             **
      **  DOMAIN :  CL                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE        AUTH.  DESCRIPTION                             **
23823B**  12DEC22     CTS    INITIAL DRAFT                           **
CM1546**  17FEB23     CTS    CMCSE-1546 FIX FOR REMAINING EXPENSE    ** 
CM1546**                     MATURITY AND DESP CASE                  **
CM1597**  09MAR23     CTS    CMCSE-1597 FIX FOR CSV DURING FREELOOK  **
CM1609**  21MAR23     CTS    CMCSE-1609 FIX FOR ADVANCE PAYMENT CASE **
R17859**  25MAR23     CTS    FIX FOR HYBRID PREPAYMENT SCENARIO      **
      *****************************************************************

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCWSA'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.
           05 WS-CONTROL-CARDS.
               10 WS-DATA-TYP-IND           PIC X(01).
                  88 WS-DATA-TYP-INITIAL    VALUE '1'.
                  88 WS-DATA-TYP-ADHOC      VALUE '3'.
               10  FILLER                   PIC X(01).
               10  WS-TRXN-STRT-DT          PIC X(10).
               10  FILLER                   PIC X(01).
               10  WS-TRXN-END-DT           PIC X(10).
               10  FILLER                   PIC X(01).
               10  WS-POLICY-ID             PIC X(07).

       05  WS-CONTROL-CARDS1.
           10 CTL-REC                           PIC X(06).
           10 FILLER                            PIC X(01).
           10 CTL-START-POLICY                  PIC X(10).
           10 FILLER                            PIC X.
           10 CTL-FINISH-POLICY                 PIC X(10).
           10 FILLER                            PIC X.
           10 CTL-INSTANCE-ID                   PIC X(03).
           10 FILLER                            PIC X(46).

       01  WS-DEFAULT-AREA.
           05 POLICY-NUM-ALL-9          PIC X(07) VALUE '9999999'.
       

       01  WS-WORK-AREA.
           05 WS-CHRG-AMT               PIC S9(13)V99 COMP-3.
           05 WS-AMT-1                  PIC S9(13)V99 COMP-3.
           05 WS-OVR-SHRT-PREM-AMT      PIC S9(13)V99 COMP-3.
           05 WS-UNEARN-PREM-AMT        PIC S9(13)V99 COMP-3.
           05 WS-PD-PREM-AMT            PIC S9(13)V99 COMP-3.
           05 WS-TOT-DED-AMT            PIC S9(13)V99 COMP-3.
           05 WS-ADV-PMT-END-DT         PIC X(10).
           05 WS-NO-OF-MODE             PIC 9(02).     
           05 WS-TOT-CSV-AMT            PIC S9(13)V99 COMP-3.
           05 WS-ACUM-VALU-AMT          PIC S9(13)V99 COMP-3.
           05 WS-HOLD-POL-ISS-EFF-DT    PIC X(10).
           05 WS-PRE-MAT-PERI-CD        PIC X(01).
              88 WS-PRE-MAT-PERI-YES    VALUE 'Y'.
              88 WS-PRE-MAT-PERI-NO     VALUE 'N'.
           05 WS-PRE-MAT-PERI-CD        PIC X(01).
              88 WS-PRE-RPU-PERI-YES    VALUE 'Y'.
              88 WS-PRE-RPU-PERI-NO     VALUE 'N'.
           05 WS-STAT-CHNG-CD           PIC X(01).
              88 WS-STAT-CHNG-YES       VALUE 'Y'.
              88 WS-STAT-CHNG-NO        VALUE 'N'.
           05 WS-HOLD-POL-STAT-CD       PIC X(01).
           05 WS-HOLD-CVG-STAT-CD       PIC X(01).
           05 WS-HOLD-PLAN-ID           PIC X(05).
           05 WS-DEP-STRT-DT            PIC X(10).
           05 WS-HOLD-STBL-1-CD         PIC X(02).
           05 WS-STBL-1-CD              PIC X(02).
           05 WS-FACE-AMT               PIC 9(15).
           05 WS-POL-MPREM-AMT          PIC 9(15).
           05 WS-FIRST-FA-CHK-IND       PIC X(01).
              88  WS-FIRST-FA-CHK-YES   VALUE 'Y'.
              88  WS-FIRST-FA-CHK-NO    VALUE 'N'.
           05 WS-SKIP-FA-CHK-IND        PIC X(01).
              88  WS-SKIP-FA-CHK-YES    VALUE 'Y'.
              88  WS-SKIP-FA-CHK-NO     VALUE 'N'.
           05 WS-HOLD-MPREM-AMT         PIC 9(15).
           05 WS-SKIP-CDSA-IND          PIC X(01).
              88  WS-SKIP-CDSA-YES      VALUE 'Y'.    
              88  WS-SKIP-CDSA-NO       VALUE 'N'.
           05 WS-HOLD-PRCES-DT          PIC X(10).
           05 WS-HOLD-CVG-RT-AGE        PIC X(03).
           05 WS-CVG-RT-AGE             PIC X(03).
           05 WS-HOLD-BILL-MODE-CD      PIC X(02).
           05 WS-POL-BILL-MODE-CD       PIC X(02).
CM1597     05 WS-FRST-XFER-DT           PIC X(10).
R17859     05 WS-ADV-PMT-ANNV-DT.
R17859        10 WS-ADV-PMT-ANNV-YYYY   PIC X(04).
R17859        10 FILLER                 PIC X(01).
R17859        10 WS-ADV-PMT-ANNV-MM     PIC X(02).
R17859        10 FILLER                 PIC X(01).
R17859        10 WS-ADV-PMT-ANNV-DD     PIC X(02).

       01 WS-PRCES-AREA.
           05 WS-PRCES-POL-ID           PIC X(10).
           05 WS-PRCES-DT               PIC X(10).
           05 WS-START-POLICY           PIC X(10).
           05 WS-FINISH-POLICY          PIC X(10).
           05 WS-INSTANCE-ID            PIC X(03).

       01 WS-RETURN-CD                         PIC X(02).
          88 WS-RETURN-ERROR                   VALUE '01'.
          
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      
       COPY CCWWCCC.
       COPY CCWWINDX.
       COPY CCWL0950.
       COPY CCWL9215.
       COPY XCWWWKDT.
       COPY XCWLDTLK.
       COPY CCWL0010.
       COPY XCWL0290.
       COPY CCWL0182.
       COPY CCWL9307.
       COPY XCWL1660.
       
       
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************

       COPY CCFWMAST.
       COPY CCFRMAST.
       
       COPY CCFRDH.
       COPY CCFWDH.
       COPY CCFWDH4.
       
       COPY XCSWBCF.
       COPY XCSRBCF.
       
       COPY XCSWOCF.
       COPY XCSROCF.
       
       COPY CCFWPOL.
       COPY CCFRPOL.
       COPY CCFWPOLB.       
       
       COPY CCWWCVGS.
       
       COPY CCFWPH.
       COPY CCFRPH.

       COPY CCFWCVG.
       COPY CCFRCVG.

       COPY NCFWTTAB.
       COPY NCFRTTAB.

       COPY CCFRETAB.
       COPY CCFWETAB.
       
       COPY CCFRCDSA.
       COPY CCFWCDSA.
       
       COPY CCFRPHST.
       COPY CCFWPHS3.
       COPY CCFWPHST.
       
CM1597 COPY SCFWFC.
CM1597 COPY SCFRFC.
       
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
      
       COPY ZCSRCWSA.
       COPY XCWL2490.
       COPY XCWL0040.
       COPY XCWL1670.
       COPY XCWLPTR.
       COPY XCWL1680.
       COPY XCWL0280.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY CWSA
                              ==':ID:'==  BY =='CWSA'==.
       
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB. 
       COPY XCWTFCMD.
       COPY CCWLPGA.

      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  1100-OPEN-FILES
               THRU 1100-OPEN-FILES-X.

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

           IF  WS-POLICY-ID = POLICY-NUM-ALL-9
               PERFORM  2000-PROCESS-INITIAL-POL
                   THRU 2000-PROCESS-INITIAL-POL-X
           ELSE
               PERFORM  3000-PROCESS-ADHOC-POL
                   THRU 3000-PROCESS-ADHOC-POL-X
                   UNTIL NOT WBCF-SEQ-IO-OK
           END-IF.
               
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.
               
           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *------------------ 
       1000-INITIALIZE.
      *------------------
      
           MOVE SPACES                      TO WS-CONTROL-CARDS
                                               WS-PRCES-AREA.


      * READ AND PROCESS COMPANY CONTROL CARD FROM BATCH CONTROL FILE
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

      ** READ PARM CARD ZIPACWSA **
           
           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO       TO WS-CONTROL-CARDS
               MOVE WS-POLICY-ID            TO WS-PRCES-POL-ID
               MOVE WS-TRXN-STRT-DT         TO WS-PRCES-DT
           ELSE
      *MSG:'JOB TERMINATED - CONTROL CARD READ FAILED'
               MOVE 'ZSCWSA0006'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.

           IF  WMAST-IO-OK
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           ELSE 
      *    MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'CS00000061'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.
                

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
               
           MOVE WPGWS-CRNT-PGM-ID           TO L2490-TXT-SRC-ID.

           PERFORM  1200-INIT-OCF-TITLES
               THRU 1200-INIT-OCF-TITLES-X.
               
           PERFORM  1300-CHECK-START-DT
               THRU 1300-CHECK-START-DT-X.
               
           MOVE WS-PRCES-DT                 TO WS-TRXN-STRT-DT.
               

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

           PERFORM  CWSA-3000-OPEN-OUTPUT
               THRU CWSA-3000-OPEN-OUTPUT-X.
               
       1100-OPEN-FILES-X.
           EXIT.
      /
      *-----------------------
       1200-INIT-OCF-TITLES.
      *-----------------------

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.

      *MSG: ZSBMCWSA PROCESSING MESSAGES
           MOVE 'ZSCWSA0002'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-PROGRAM-DESC.

      *MSG: GET THE SYSTEM ID FOR THE HEADING
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

      *MSG: GET THE DETAIL HEADINGS 'RUN MESSAGES'
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

           MOVE SPACES                      TO L0040-SBSDRY-CO-NAME.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       1200-INIT-OCF-TITLES-X.
           EXIT.
      /
      *----------------------
       1300-CHECK-START-DT.
      *----------------------

      *GET NEXT BUSINESS DAY IF START DATE IS NOT BUSINESS DAY
      
           PERFORM  9215-1000-BUILD-PARM-INFO
               THRU 9215-1000-BUILD-PARM-INFO-X.

           MOVE  WS-PRCES-DT                TO L9215-INTERNAL-1.

           PERFORM  9215-9000-GET-BSDT-DAY-DT
               THRU 9215-9000-GET-BSDT-DAY-DT-X.
             
           IF  L9215-RETRN-OK
           AND L9215-BUS-DY-NO
               MOVE 1                       TO L9215-NUMBER-OF-DAYS   
               PERFORM  9215-1000-GET-FUTURE-BUS-DT
                   THRU 9215-1000-GET-FUTURE-BUS-DT-X
                   
               MOVE L9215-INTERNAL-2        TO WS-PRCES-DT
           
           END-IF.
      
       1300-CHECK-START-DT-X.
           EXIT.
      /
      *--------------------------
       2000-PROCESS-INITIAL-POL.
      *--------------------------

           PERFORM  2050-CHK-POL-RANGE
               THRU 2050-CHK-POL-RANGE-X.
               
           MOVE LOW-VALUES                  TO WPOLB-KEY.
           MOVE WS-START-POLICY             TO WPOLB-POL-ID.
           MOVE WWKDT-LOW-DT                TO WPOLB-VCF-LAST-UPDT-DT.
           MOVE HIGH-VALUES                 TO WPOLB-ENDBR-KEY.
           MOVE WS-FINISH-POLICY            TO WPOLB-ENDBR-POL-ID.
           MOVE WWKDT-HIGH-DT               TO
                                         WPOLB-ENDBR-VCF-LAST-UPDT-DT.

           SET  WPOLB-POL-BUS-CLAS-TRAD     TO TRUE.
           MOVE WPOLB-POL-BUS-CLAS-CD       TO
                                         WPOLB-ENDBR-POL-BUS-CLAS-CD.

           PERFORM  POLB-1000-BROWSE
               THRU POLB-1000-BROWSE-X.

           IF NOT WPOLB-IO-OK
               GO TO 2000-PROCESS-INITIAL-POL-X
           END-IF.

           PERFORM  POLB-2000-READ-NEXT
               THRU POLB-2000-READ-NEXT-X.


           PERFORM  2100-CREATE-INIT-EXTRACT
               THRU 2100-CREATE-INIT-EXTRACT-X
               UNTIL NOT WPOLB-IO-OK.

           PERFORM  POLB-3000-END-BROWSE
               THRU POLB-3000-END-BROWSE-X.                      
           
       2000-PROCESS-INITIAL-POL-X.
           EXIT.
      /
      *---------------------
       2050-CHK-POL-RANGE.
      *---------------------

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO       TO WS-CONTROL-CARDS1
           ELSE
      *MSG:'POLICY RANGES NOT FOUND - CONTROL CARD READ FAILED'
               MOVE 'ZSCWSA0007'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

           MOVE CTL-START-POLICY            TO WS-START-POLICY.
           MOVE CTL-FINISH-POLICY           TO WS-FINISH-POLICY.
           MOVE CTL-INSTANCE-ID             TO WS-INSTANCE-ID.
      
      **   MSG:'RUN INSTANCE NUMBER   : @1'
           MOVE 'ZSCWSA0008'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-INSTANCE-ID              TO WGLOB-MSG-PARM (1).
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X.
      
      **   MSG:'STARTING POLICY NUMBER: @1'
           MOVE 'ZSCWSA0009'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-START-POLICY             TO WGLOB-MSG-PARM (1).
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X.
      
      **   MSG:'ENDING POLICY NUMBER  : @1'
           MOVE 'ZSCWSA0010'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-FINISH-POLICY            TO WGLOB-MSG-PARM (1).
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X.
      
       2050-CHK-POL-RANGE-X.
           EXIT.
      
      *-------------------------
       2100-CREATE-INIT-EXTRACT.
      *-------------------------

           MOVE RPOL-POL-ID                 TO WS-PRCES-POL-ID.
           MOVE WS-TRXN-STRT-DT             TO WS-PRCES-DT.
      
           PERFORM  4000-PROCESS-POL
               THRU 4000-PROCESS-POL-X.

           PERFORM  POLB-2000-READ-NEXT
               THRU POLB-2000-READ-NEXT-X.
      
       2100-CREATE-INIT-EXTRACT-X.
           EXIT.
      /       
      *--------------------------
       3000-PROCESS-ADHOC-POL.
      *--------------------------      
           
           MOVE WS-TRXN-STRT-DT             TO WS-PRCES-DT.

           MOVE WS-PRCES-POL-ID             TO WPOL-POL-ID.
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
               
           IF  WPOL-IO-OK         
               PERFORM  4000-PROCESS-POL
                   THRU 4000-PROCESS-POL-X
           END-IF.
      
      ** READ PARM CARD ZIPACWSA **
           
           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO       TO WS-CONTROL-CARDS
               MOVE WS-POLICY-ID            TO WS-PRCES-POL-ID
               MOVE WS-TRXN-STRT-DT         TO WS-PRCES-DT               
               
               PERFORM  1300-CHECK-START-DT
                   THRU 1300-CHECK-START-DT-X

               MOVE WS-PRCES-DT             TO WS-TRXN-STRT-DT
           END-IF.
           
       3000-PROCESS-ADHOC-POL-X.
           EXIT.
      /     
      *---------------------- 
       4000-PROCESS-POL.
      *----------------------

           INITIALIZE WS-WORK-AREA.
                    
           SET  WS-PRE-MAT-PERI-NO          TO TRUE.
           SET  WS-STAT-CHNG-NO             TO TRUE.
           SET  WS-PRE-RPU-PERI-NO          TO TRUE.
           SET  WS-FIRST-FA-CHK-NO          TO TRUE.
           SET  WS-SKIP-FA-CHK-NO           TO TRUE.

      * SKIP OTHER THAN TRAD SEG FUND POL (SUL/SULV2/SULV3)

           IF NOT RPOL-POL-INS-TYP-TRAD-SEG-FND
               GO TO 4000-PROCESS-POL-X
           END-IF.
      
           IF  RPOL-POL-STAT-PREM-PAYING
           OR  RPOL-POL-STAT-PAID-UP-LIFE
           OR  RPOL-POL-STAT-LAPSED
               CONTINUE
           ELSE
               GO TO 4000-PROCESS-POL-X
           END-IF.
           
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
               
      *MSG: 'PROCESSING POLICY (@1)'
           MOVE 'ZSCWSA0003'                TO WGLOB-MSG-REF-INFO.
           MOVE RPOL-POL-ID                 TO WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           MOVE RPOL-POL-MPREM-AMT          TO WS-HOLD-MPREM-AMT.

           IF  RPOL-ORIG-POL-ISS-EFF-DT <> WWKDT-ZERO-DT
           AND WS-PRCES-DT < RPOL-POL-ISS-EFF-DT
               
               SET WS-PRE-MAT-PERI-YES      TO TRUE

               MOVE WCVGS-CVG-STBL-1-CD (RPOL-POL-BASE-CVG-NUM) 
                                            TO WS-HOLD-STBL-1-CD
                                               WS-STBL-1-CD
                                               
               MOVE WCVGS-CVG-RT-AGE (RPOL-POL-BASE-CVG-NUM)
                                            TO WS-HOLD-CVG-RT-AGE
                                               WS-CVG-RT-AGE

                                               
               MOVE RPOL-POL-BILL-MODE-CD   TO
                                            WS-HOLD-BILL-MODE-CD
                                            WS-POL-BILL-MODE-CD
               
               PERFORM  4050-CHECK-STBL-CHNG
                  THRU  4050-CHECK-STBL-CHNG-X

               MOVE  RPOL-POL-ISS-EFF-DT    TO WS-HOLD-POL-ISS-EFF-DT

               MOVE  RPOL-ORIG-POL-ISS-EFF-DT 
                                            TO RPOL-POL-ISS-EFF-DT
                             WCVGS-CVG-ISS-EFF-DT(RPOL-POL-BASE-CVG-NUM)
               MOVE  RPOL-PLAN-ID           TO WS-HOLD-PLAN-ID
               MOVE  RPOL-ORIG-PLAN-ID      TO RPOL-PLAN-ID
                                    WCVGS-PLAN-ID(RPOL-POL-BASE-CVG-NUM)
               MOVE WS-STBL-1-CD            TO
                             WCVGS-CVG-STBL-1-CD (RPOL-POL-BASE-CVG-NUM) 

               MOVE WS-CVG-RT-AGE           TO
                             WCVGS-CVG-RT-AGE (RPOL-POL-BASE-CVG-NUM)
                             
               MOVE WCVGS-ORIG-PREM-AMT (RPOL-POL-BASE-CVG-NUM)
                                            TO RPOL-POL-MPREM-AMT
               MOVE WS-POL-BILL-MODE-CD     TO RPOL-POL-BILL-MODE-CD

           END-IF.
           
           IF  RPOL-POL-ISS-EFF-DT > WS-TRXN-END-DT
               GO TO 4000-PROCESS-POL-X
           END-IF.
           
           
           IF  RPOL-POL-STAT-PAID-UP-LIFE
           AND WS-PRCES-DT < RPOL-POL-RPU-EFF-DT
           
               SET WS-PRE-RPU-PERI-YES      TO TRUE
               MOVE WCVGS-CVG-STBL-1-CD (RPOL-POL-BASE-CVG-NUM) 
                                            TO WS-HOLD-STBL-1-CD
                                               WS-STBL-1-CD

               PERFORM  4050-CHECK-STBL-CHNG
                  THRU  4050-CHECK-STBL-CHNG-X

               MOVE  RPOL-PLAN-ID           TO WS-HOLD-PLAN-ID
               MOVE  RPOL-ORIG-PLAN-ID      TO RPOL-PLAN-ID
                                 WCVGS-PLAN-ID(RPOL-POL-BASE-CVG-NUM)
               MOVE WS-STBL-1-CD            TO
                             WCVGS-CVG-STBL-1-CD (RPOL-POL-BASE-CVG-NUM)
                                                          
               MOVE WCVGS-PRE-RPU-PREM-AMT (RPOL-POL-BASE-CVG-NUM)
                                            TO RPOL-POL-MPREM-AMT
               MOVE RPOL-POL-CSTAT-CD       TO WS-HOLD-POL-STAT-CD
               MOVE WCVGS-CVG-CSTAT-CD(RPOL-POL-BASE-CVG-NUM)
                                            TO WS-HOLD-CVG-STAT-CD
               MOVE '1'                     TO RPOL-POL-CSTAT-CD
                           WCVGS-CVG-CSTAT-CD(RPOL-POL-BASE-CVG-NUM)
                             
           END-IF.
           
           IF  RPOL-POL-STAT-LAPSED           
               MOVE RPOL-POL-CSTAT-CD       TO WS-HOLD-POL-STAT-CD
               MOVE WCVGS-CVG-CSTAT-CD(RPOL-POL-BASE-CVG-NUM)
                                            TO WS-HOLD-CVG-STAT-CD
               MOVE '1'                     TO RPOL-POL-CSTAT-CD
                           WCVGS-CVG-CSTAT-CD(RPOL-POL-BASE-CVG-NUM)
               SET WS-STAT-CHNG-YES         TO TRUE
           END-IF.

           IF  RPOL-POL-ISS-EFF-DT > WS-PRCES-DT
               MOVE RPOL-POL-ISS-EFF-DT     TO WS-PRCES-DT
               PERFORM  1300-CHECK-START-DT
                   THRU 1300-CHECK-START-DT-X 
           END-IF.

           PERFORM  4060-CHK-CDSA-DTL
               THRU 4060-CHK-CDSA-DTL-X.

CM1597     MOVE RPOL-POL-ID                 TO WFC-POL-ID.
CM1597     MOVE RPOL-POL-BASE-CVG-NUM       TO WFC-CVG-NUM-N.
CM1597
CM1597     PERFORM  FC-1000-READ
CM1597         THRU FC-1000-READ-X.
CM1597
CM1597     IF  WFC-IO-OK
CM1597         MOVE RFC-EARLST-CIA-DT       TO WS-FRST-XFER-DT
CM1597     END-IF.

           PERFORM  4100-DATA-PRCES-PARA
               THRU 4100-DATA-PRCES-PARA-X
               UNTIL WS-PRCES-DT > WS-TRXN-END-DT.
               
           IF  WS-STAT-CHNG-YES
               MOVE WS-HOLD-POL-STAT-CD     TO RPOL-POL-CSTAT-CD
               MOVE WS-HOLD-CVG-STAT-CD     TO 
                          WCVGS-CVG-CSTAT-CD(RPOL-POL-BASE-CVG-NUM)
           END-IF.
            

       4000-PROCESS-POL-X.
           EXIT.
      /
      *---------------------
       4050-CHECK-STBL-CHNG.
      *---------------------
      
           IF  WS-PRE-MAT-PERI-YES
               MOVE RPOL-POL-ISS-EFF-DT     TO L1660-INTERNAL-DATE
           ELSE
               MOVE RPOL-POL-RPU-EFF-DT     TO L1660-INTERNAL-DATE
           END-IF.

           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.

           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.
      *  SET UP ENDBROWSE KEY
      *
           MOVE RPOL-POL-ID                 TO WPHST-POL-ID.
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                       WPHST-ENDBR-PCHST-SEQ-NUM.

           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.

           IF  NOT WPHST-IO-OK
               GO TO 4050-CHECK-STBL-CHNG-X
           END-IF.

           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.

           PERFORM 
               UNTIL NOT WPHST-IO-OK
               
               IF  RPHST-POL-ACTV-TYP-ID='2006'
               AND RPHST-PCHST-OLD-VALU-TXT <> SPACES
                   MOVE RPHST-PCHST-OLD-VALU-TXT (1:2)
                                            TO WS-STBL-1-CD
               END-IF
               
               IF  RPHST-POL-ACTV-TYP-ID='2005'
               AND RPHST-PCHST-OLD-VALU-TXT <> SPACES
                   MOVE RPHST-PCHST-OLD-VALU-TXT (1:3)
                                            TO WS-CVG-RT-AGE
               END-IF

               IF  RPHST-POL-ACTV-TYP-ID='1004'
               AND RPHST-PCHST-OLD-VALU-TXT <> SPACES
                   MOVE RPHST-PCHST-OLD-VALU-TXT (1:2)
                                            TO WS-POL-BILL-MODE-CD
               END-IF               

               PERFORM  PHST-2000-READ-NEXT
                   THRU PHST-2000-READ-NEXT-X
               
           END-PERFORM.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.
       
       4050-CHECK-STBL-CHNG-X.
           EXIT.
      /

      *-------------------
       4060-CHK-CDSA-DTL.
      *-------------------

           SET WS-SKIP-CDSA-NO              TO TRUE.

           MOVE WS-PRCES-DT                 TO WS-HOLD-PRCES-DT.
           MOVE ZEROES                      TO WS-TOT-DED-AMT.

           MOVE WGLOB-PROCESS-DATE          TO WS-PRCES-DT.
           MOVE WWKDT-LOW-DT                TO WS-DEP-STRT-DT.
      
           PERFORM  4170-CALC-DED-AMT
               THRU 4170-CALC-DED-AMT-X.      
      
           IF  WS-TOT-DED-AMT = ZERO
               SET  WS-SKIP-CDSA-YES        TO TRUE
           END-IF.

           MOVE ZEROES                      TO WS-TOT-DED-AMT.
           MOVE WS-HOLD-PRCES-DT            TO WS-PRCES-DT.
      
      
       4060-CHK-CDSA-DTL-X.
           EXIT.
      /
             
      *--------------------
       4100-DATA-PRCES-PARA.
      *--------------------

           IF  WS-PRE-MAT-PERI-YES
           AND WS-PRCES-DT >= WS-HOLD-POL-ISS-EFF-DT
               MOVE WS-HOLD-POL-ISS-EFF-DT  TO RPOL-POL-ISS-EFF-DT
                             WCVGS-CVG-ISS-EFF-DT(RPOL-POL-BASE-CVG-NUM)
               MOVE  WS-HOLD-PLAN-ID        TO RPOL-PLAN-ID
                                    WCVGS-PLAN-ID(RPOL-POL-BASE-CVG-NUM)
               MOVE WS-HOLD-STBL-1-CD       TO
                             WCVGS-CVG-STBL-1-CD (RPOL-POL-BASE-CVG-NUM)
               MOVE WS-HOLD-CVG-RT-AGE      TO
                             WCVGS-CVG-RT-AGE (RPOL-POL-BASE-CVG-NUM)                             
               MOVE WS-HOLD-MPREM-AMT       TO RPOL-POL-MPREM-AMT
               MOVE WS-HOLD-BILL-MODE-CD    TO RPOL-POL-BILL-MODE-CD
               SET WS-PRE-MAT-PERI-NO       TO TRUE
               SET WS-SKIP-FA-CHK-YES       TO TRUE
           END-IF.

           IF  WS-PRE-RPU-PERI-YES
           AND WS-PRCES-DT >= RPOL-RPU-CO-RECV-DT
      *     AND WS-PRCES-DT >= RPOL-POL-RPU-EFF-DT
               MOVE  WS-HOLD-PLAN-ID        TO RPOL-PLAN-ID
                                    WCVGS-PLAN-ID(RPOL-POL-BASE-CVG-NUM)
               MOVE WS-HOLD-STBL-1-CD       TO
                             WCVGS-CVG-STBL-1-CD (RPOL-POL-BASE-CVG-NUM)
               MOVE WS-HOLD-POL-STAT-CD     TO RPOL-POL-CSTAT-CD
               MOVE WS-HOLD-CVG-STAT-CD     TO 
                          WCVGS-CVG-CSTAT-CD(RPOL-POL-BASE-CVG-NUM)
               MOVE WS-HOLD-MPREM-AMT       TO RPOL-POL-MPREM-AMT
               SET WS-PRE-RPU-PERI-NO       TO TRUE
               SET WS-SKIP-FA-CHK-YES       TO TRUE
           END-IF.
      
      *1)LARGE TYPE CODE
      
           MOVE RPOL-PLAN-ID                TO WTTAB-ETBL-VALU-ID. 
           
           PERFORM  PRLG-1000-EDIT
               THRU PRLG-1000-EDIT-X.

           IF  WTTAB-IO-OK
               MOVE RTTAB-TTBL-VALU-TXT     TO RCWSA-LRG-TYP-CD
           ELSE
      *MSGS: LARGE PRODUCT CODE NOT FOUND FOR PLAN(@1)
               MOVE 'ZSCWSA0004'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-PLAN-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE SPACES                  TO RCWSA-LRG-TYP-CD
           END-IF.   
           
      *2)SMALL TYPE CODE

           MOVE RPOL-PLAN-ID                TO WTTAB-ETBL-VALU-ID. 
           
           PERFORM  PRSM-1000-EDIT
               THRU PRSM-1000-EDIT-X.
 
           IF  WTTAB-IO-OK
               MOVE RTTAB-TTBL-VALU-TXT     TO RCWSA-SML-TYP-CD
           ELSE
      *MSGS: SMALL PRODUCT CODE NOT FOUND FOR PLAN(@1)
               MOVE 'ZSCWSA0005'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-PLAN-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE SPACES                  TO RCWSA-SML-TYP-CD
           END-IF.            
                      
      *3)POLICY ID
           MOVE WS-PRCES-POL-ID             TO RCWSA-POL-ID.
           
      *4)DATE
           MOVE WS-PRCES-DT                 TO RCWSA-TRAD-JRNL-DT.
      
      *5)DATA TYPE
          
           MOVE WS-DATA-TYP-IND             TO RCWSA-DATA-TYP-CD. 
          
           PERFORM  4110-CHK-FA-RED
               THRU 4110-CHK-FA-RED-X.

      *CALCULATE FUND VALUE AND CSV 

           MOVE ZEROS                       TO RCWSA-FUND-VALU
                                               RCWSA-CSV-AMT
                                               WS-AMT-1
                                               WS-CHRG-AMT
                                               WS-OVR-SHRT-PREM-AMT
                                               WS-TOT-CSV-AMT
                                               WS-ACUM-VALU-AMT
                                               WS-UNEARN-PREM-AMT
                                               WS-PD-PREM-AMT
                                               WS-TOT-DED-AMT.
                                               
           PERFORM  0182-1000-BUILD-PARM-INFO
               THRU 0182-1000-BUILD-PARM-INFO-X.
           
           MOVE WS-PRCES-DT                 TO L0182-EFF-DT.
           SET L0182-CALC-RESERVE           TO TRUE.
           SET L0182-PRCES-PLGR-EDITS-YES   TO TRUE.
           SET L0182-CALC-LOAN-CSV          TO TRUE.
           SET L0182-CALC-POLI              TO TRUE.
           SET L0182-CALC-ESC-NO            TO TRUE.
       
           PERFORM  0182-1000-CALC-CSV-POL
               THRU 0182-1000-CALC-CSV-POL-X.

           IF NOT L0182-RETRN-OK
               GO TO 4100-DATA-PRCES-PARA-X
           END-IF.

      *CALCULATE SURRENDER CHARGE FOR TVI            
           MOVE L0182-CVG-SURR-CHRG-AMT (RPOL-POL-BASE-CVG-NUM)
                                            TO WS-CHRG-AMT.
                                            
      *GET THE POLICY UNEARNED PREMIUM AMOUNT
                         
           MOVE ZEROS                       TO  L9307-UNEARN-PREM.
           
           PERFORM  9307-0000-BUILD-PARM-INFO
               THRU 9307-0000-BUILD-PARM-INFO-X.
          
           IF  RPOL-ADV-PMT-TYP-CD <> SPACES
CM1609     AND WS-PRCES-DT >= RPOL-ADV-PMT-EFF-DT
               MOVE WS-PRCES-DT             TO L9307-EFF-DT
               MOVE RPOL-ADV-PMT-TYP-CD     TO L9307-ADV-PMT-CD
CM1609         IF  RPOL-ADV-PMT-TYP-CD = 'L'
CM1609             PERFORM  4190-OVERRIDE-PTD
CM1609                 THRU 4190-OVERRIDE-PTD-X
CM1609         END-IF
CM1609
R17859         IF  RPOL-ADV-PMT-TYP-CD = 'H'
R17859             MOVE RPOL-ADV-PMT-ANNV-DT
R17859                                      TO WS-ADV-PMT-ANNV-DT
R17859             PERFORM  4195-RECALC-ADV-PMT-ANNV
R17859                 THRU 4195-RECALC-ADV-PMT-ANNV-X
R17859         END-IF
R17859
               PERFORM  9307-4000-UNEARN-PREM-CALC 
                   THRU 9307-4000-UNEARN-PREM-CALC-X
      *CALCUALTE THE FINAL UNEARNED PREMIUM AMOUNT TILL PROCESSING DATE
               IF NOT L9307-RETRN-OK
                   MOVE ZERO                TO L9307-UNEARN-PREM
                   MOVE WWKDT-ZERO-DT       TO L9307-EFF-DT
               ELSE
                   PERFORM  4300-CALC-FINAL-UNEARN-PREM
                       THRU 4300-CALC-FINAL-UNEARN-PREM-X
               END-IF
               IF  L9307-EFF-DT > RPOL-POL-PD-TO-DT-NUM
                   MOVE ZEROES              TO L9307-UNEARN-PREM
               END-IF
               COMPUTE  WS-UNEARN-PREM-AMT = L9307-UNEARN-PREM
           ELSE
           
               IF  WS-PRCES-DT >= RPOL-POL-PREM-SUSP-DT
                   MOVE RPOL-POL-PREM-SUSP-AMT
                                            TO WS-UNEARN-PREM-AMT
               END-IF
               
               IF  WS-PRCES-DT >= RPOL-OVR-SHRT-PREM-DT
                   MOVE RPOL-OVR-SHRT-PREM-AMT
                                            TO WS-OVR-SHRT-PREM-AMT
               END-IF
           END-IF.
                      
                                            
           COMPUTE WS-AMT-1 = WS-UNEARN-PREM-AMT
                             + WS-OVR-SHRT-PREM-AMT. 
                                            
           MOVE L0182-CVG-ACUM-VALU-AMT (RPOL-POL-BASE-CVG-NUM)
                                            TO WS-ACUM-VALU-AMT.
           
           COMPUTE WS-TOT-CSV-AMT = WS-ACUM-VALU-AMT - WS-CHRG-AMT.
                                  
           IF  WS-TOT-CSV-AMT < ZEROES
               MOVE ZEROES                  TO WS-TOT-CSV-AMT
           END-IF.

           COMPUTE WS-TOT-CSV-AMT = WS-TOT-CSV-AMT + WS-AMT-1.

      *7)CSV
           MOVE WS-TOT-CSV-AMT              TO RCWSA-CSV-AMT.

CM1597     IF  WS-PRCES-DT < WS-FRST-XFER-DT 
CM1597         MOVE RPOL-POL-MPREM-AMT      TO RCWSA-CSV-AMT
CM1597     END-IF.
           
      *6)FUND VALUE                                            
           MOVE WS-ACUM-VALU-AMT            TO RCWSA-FUND-VALU.

      *8)REMAINING EXPENSE

           MOVE WWKDT-LOW-DT                TO WS-DEP-STRT-DT.
           
           IF  WS-PRE-MAT-PERI-NO
           AND NOT RPOL-ORIG-POL-ISS-EFF-DT = WWKDT-ZERO-DT
               MOVE RPOL-POL-ISS-EFF-DT     TO WS-DEP-STRT-DT
           END-IF.
           
           PERFORM  4150-CALC-PD-PREM
               THRU 4150-CALC-PD-PREM-X.
               
           PERFORM  4170-CALC-DED-AMT
               THRU 4170-CALC-DED-AMT-X.
      

           COMPUTE RCWSA-REMN-XPNS-AMT = WS-PD-PREM-AMT
                                       - WS-TOT-DED-AMT.
      *   
      *FILE WRITE PROCESS
      
           PERFORM  CWSA-1000-WRITE
               THRU CWSA-1000-WRITE-X.
               
           PERFORM  4200-GET-PRCES-DT
               THRU 4200-GET-PRCES-DT-X.
       
       4100-DATA-PRCES-PARA-X.
           EXIT.
      /
      *------------------
       4110-CHK-FA-RED.
      *------------------      

           IF  WS-SKIP-FA-CHK-YES
               GO TO 4110-CHK-FA-RED-X
           END-IF.
      
           MOVE ZEROES                      TO WS-FACE-AMT.
           
           MOVE RPOL-POL-ID                 TO WPHS3-POL-ID.
           MOVE '2010'                      TO WPHS3-POL-ACTV-TYP-ID.
           MOVE 'A'                         TO WPHS3-PCHST-STAT-CD.
           
           IF  WS-FIRST-FA-CHK-NO
               MOVE WGLOB-PROCESS-DATE      TO WPHS3-PCHST-EFF-DT
           ELSE
               MOVE WS-PRCES-DT             TO WPHS3-PCHST-EFF-DT
           END-IF.
           
           MOVE WPHS3-KEY                   TO WPHS3-ENDBR-KEY.
           MOVE WS-PRCES-DT                 TO WPHS3-ENDBR-PCHST-EFF-DT.
                
           PERFORM  PHS3-1000-BROWSE-PREV
               THRU PHS3-1000-BROWSE-PREV-X.
      
           IF  NOT WPHS3-IO-OK
               GO TO 4110-CHK-FA-RED-X
           END-IF.
      
           PERFORM  PHS3-2000-READ-PREV
               THRU PHS3-2000-READ-PREV-X.


           IF  WPHS3-IO-EOF           
           AND WS-FIRST-FA-CHK-NO
               SET  WS-SKIP-FA-CHK-YES      TO TRUE            
           END-IF. 
           
           PERFORM  
               UNTIL WPHS3-IO-EOF
      
               IF  WPHS3-IO-OK
                   IF  RPHST-PCHST-EFF-DT > WS-PRCES-DT
                       MOVE RPHST-PCHST-OLD-VALU-TXT 
                                            TO L0280-INPUT-DATA
                   ELSE
                       MOVE RPHST-PCHST-NEW-VALU-TXT 
                                            TO L0280-INPUT-DATA
                   END-IF
                       
                   MOVE LENGTH OF RPHST-PCHST-OLD-VALU-TXT
                                            TO L0280-INPUT-SIZE
                   MOVE LENGTH OF WS-FACE-AMT    
                                            TO L0280-LENGTH
                   MOVE 0                   TO L0280-PRECISION
                   PERFORM  0280-1000-NUMERIC-EDIT
                       THRU 0280-1000-NUMERIC-EDIT-X
                   MOVE L0280-OUTPUT        TO WS-FACE-AMT
               END-IF
      
               PERFORM  PHS3-2000-READ-PREV
                   THRU PHS3-2000-READ-PREV-X
      
           END-PERFORM.
           
           PERFORM  PHS3-3000-END-BROWSE-PREV
               THRU PHS3-3000-END-BROWSE-PREV-X.      


           SET  WS-FIRST-FA-CHK-YES         TO TRUE.
           
           IF  WS-FACE-AMT <> ZEROES
               MOVE RPOL-POL-ISS-EFF-DT     TO L1680-INTERNAL-1
               MOVE WCVGS-CVG-MAT-XPRY-DT (RPOL-POL-BASE-CVG-NUM)
                                            TO L1680-INTERNAL-2
                                            
               IF WS-HOLD-POL-STAT-CD = 'B'
                  MOVE WCVGS-PREV-MAT-XPRY-DT (RPOL-POL-BASE-CVG-NUM)
                                            TO L1680-INTERNAL-2
               END-IF
               
               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X
                   
               IF  L1680-NUMBER-OF-YEARS <> ZEROS
                   COMPUTE WS-POL-MPREM-AMT = WS-FACE-AMT 
                                   / (12 * L1680-NUMBER-OF-YEARS)
                   MOVE  WS-POL-MPREM-AMT       TO RPOL-POL-MPREM-AMT
               END-IF
               
           END-IF.
      
       4110-CHK-FA-RED-X.
           EXIT.
      /      
      *-----------------
       4150-CALC-PD-PREM.
      *-----------------      
      
           MOVE LOW-VALUES                  TO WDH4-KEY.
           MOVE HIGH-VALUES                 TO WDH4-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WDH4-POL-ID
                                               WDH4-ENDBR-POL-ID.
           MOVE WS-DEP-STRT-DT              TO WDH4-TRXN-PRCES-DT.
           MOVE WS-PRCES-DT                 TO 
                                        WDH4-ENDBR-TRXN-PRCES-DT.
           
           PERFORM  DH4-1000-BROWSE
               THRU DH4-1000-BROWSE-X.
      
           PERFORM  DH4-2000-READ-NEXT
               THRU DH4-2000-READ-NEXT-X.
      
           IF  WDH4-IO-OK
               PERFORM  4160-PRCES-DEP-AMT
                   THRU 4160-PRCES-DEP-AMT-X
                   UNTIL WDH4-IO-EOF
           END-IF.
      
           PERFORM  DH4-3000-END-BROWSE
               THRU DH4-3000-END-BROWSE-X.

       4150-CALC-PD-PREM-X.
           EXIT.
      /
      *-------------------
       4160-PRCES-DEP-AMT.
      *-------------------
            
           IF  RDH-COLCT-MTHD-DSCNT
           OR  RDH-COLCT-MTHD-INT
           OR  (RDH-COLCT-MTHD-SURR
           AND RDH-COLCT-CATG-CD-REF)
               PERFORM  DH4-2000-READ-NEXT
                   THRU DH4-2000-READ-NEXT-X
               GO TO 4160-PRCES-DEP-AMT-X
           END-IF.
      
           IF  RDH-COLCT-MTHD-MAT
CM1546*     AND RDH-COLCT-CATG-CD-DSCNT
CM1546     AND NOT RDH-COLCT-CATG-CD-DEP
               PERFORM  DH4-2000-READ-NEXT
                   THRU DH4-2000-READ-NEXT-X
               GO TO 4160-PRCES-DEP-AMT-X
           END-IF.
      
           ADD RDH-TRXN-AMT             TO WS-PD-PREM-AMT                   
                     
           PERFORM  DH4-2000-READ-NEXT
               THRU DH4-2000-READ-NEXT-X.                 
      
       4160-PRCES-DEP-AMT-X.
           EXIT.
      /
      *--------------------       
       4170-CALC-DED-AMT.
      *--------------------

           IF  WS-SKIP-CDSA-YES
               GO TO 4170-CALC-DED-AMT-X
           END-IF.

           MOVE LOW-VALUES                  TO WCDSA-KEY.
           MOVE HIGH-VALUES                 TO WCDSA-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WCDSA-POL-ID.
           MOVE ZEROS                       TO WCDSA-POL-PAYO-NUM.
           MOVE WS-PRCES-DT                 TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE         TO WCDSA-CDA-EFF-IDT-NUM.
           MOVE +000                        TO WCDSA-CDA-SEQ-NUM.

           MOVE WCDSA-KEY                   TO WCDSA-ENDBR-KEY.
           MOVE WS-DEP-STRT-DT              TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE         TO
                                        WCDSA-ENDBR-CDA-EFF-IDT-NUM.
           MOVE +999                        TO WCDSA-ENDBR-CDA-SEQ-NUM.
           MOVE HIGH-VALUES                 TO WCDSA-ENDBR-CDA-TYP-CD.      

           PERFORM  CDSA-1000-BROWSE
               THRU CDSA-1000-BROWSE-X.

           IF NOT WCDSA-IO-OK
               GO TO 4170-CALC-DED-AMT-X
           END-IF.

           PERFORM  CDSA-2000-READ-NEXT
               THRU CDSA-2000-READ-NEXT-X.

           IF  WCDSA-IO-OK 
               PERFORM  4180-CALC-WTHDR-AMT
                   THRU 4180-CALC-WTHDR-AMT-X
                   UNTIL WCDSA-IO-EOF
           END-IF.
           
           PERFORM  CDSA-3000-END-BROWSE
               THRU CDSA-3000-END-BROWSE-X.

       4170-CALC-DED-AMT-X.
           EXIT.
      /
      *---------------------
       4180-CALC-WTHDR-AMT.
      *---------------------
      
      *TO INCLUDE THE RIDER SURRENDER PROCESS IN THE PAID 
      *PREMIUM CALCULATION
           IF  RCDSA-CDA-TYP-WTHDR 
           OR  RCDSA-CDA-TYP-SURR-TRMN
               CONTINUE
           ELSE
               PERFORM  CDSA-2000-READ-NEXT
                   THRU CDSA-2000-READ-NEXT-X           
               GO TO 4180-CALC-WTHDR-AMT-X 
           END-IF. 
      
           IF  RPOL-POL-STAT-PREM-PAYING
           OR  RPOL-POL-STAT-PAID-UP-LIFE
               CONTINUE       
           ELSE
               IF  RPOL-POL-CEAS-DT = RCDSA-CDA-EFF-DT
                   PERFORM  CDSA-2000-READ-NEXT
                       THRU CDSA-2000-READ-NEXT-X           
                   GO TO 4180-CALC-WTHDR-AMT-X   
               END-IF
           END-IF.
           
           IF  (RCDSA-CDA-EFF-DT >= WS-DEP-STRT-DT)
           AND (RCDSA-CDA-EFF-DT <= WS-PRCES-DT)
               CONTINUE
           ELSE
               PERFORM  CDSA-2000-READ-NEXT
                   THRU CDSA-2000-READ-NEXT-X           
               GO TO 4180-CALC-WTHDR-AMT-X 
           END-IF.
      
           IF  RCDSA-CDA-STAT-ACTIVE
               ADD RCDSA-CDA-TOT-TRXN-AMT   TO WS-TOT-DED-AMT
           END-IF
           PERFORM  CDSA-2000-READ-NEXT
               THRU CDSA-2000-READ-NEXT-X.      
      
       4180-CALC-WTHDR-AMT-X.
           EXIT.
      /
CM1609*-------------------
CM1609 4190-OVERRIDE-PTD.
CM1609*-------------------
CM1609     
CM1609     MOVE WS-PRCES-DT                 TO L1680-INTERNAL-1.
CM1609     MOVE 01                          TO L1680-INT-DD-1.
CM1609     MOVE ZEROES                      TO L1680-NUMBER-OF-YEARS.
CM1609     MOVE RPOL-POL-BILL-MODE-CD-N     TO L1680-NUMBER-OF-MONTHS.
CM1609     MOVE ZEROES                      TO L1680-NUMBER-OF-DAYS.
CM1609     
CM1609     PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
CM1609         THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
CM1609     
CM1609     MOVE L1680-INTERNAL-2            TO RPOL-POL-PD-TO-DT-NUM.
CM1609     
CM1609 4190-OVERRIDE-PTD-X.
CM1609     EXIT.
R17859/
R17859*-------------------------
R17859 4195-RECALC-ADV-PMT-ANNV.
R17859*-------------------------
R17859
R17859     MOVE WS-PRCES-DT(1:4)            TO WS-ADV-PMT-ANNV-YYYY.
R17859
R17859     IF  WS-PRCES-DT >= WS-ADV-PMT-ANNV-DT
R17859         MOVE WS-ADV-PMT-ANNV-DT      TO L1680-INTERNAL-1
R17859         MOVE 1                       TO L1680-NUMBER-OF-YEARS
R17859         MOVE ZEROES                  TO L1680-NUMBER-OF-MONTHS
R17859         MOVE ZEROES                  TO L1680-NUMBER-OF-DAYS         
R17859         PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
R17859             THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
R17859         
R17859         MOVE L1680-INTERNAL-2        TO WS-ADV-PMT-ANNV-DT
R17859     END-IF.
R17859
R17859     MOVE WS-ADV-PMT-ANNV-DT          TO RPOL-ADV-PMT-ANNV-DT.
R17859
R17859 4195-RECALC-ADV-PMT-ANNV-X.
R17859   EXIT.
R17859/
      *--------------------
       4200-GET-PRCES-DT.
      *-------------------
           
           PERFORM  9215-1000-BUILD-PARM-INFO
               THRU 9215-1000-BUILD-PARM-INFO-X.

           MOVE WS-PRCES-DT                 TO L9215-INTERNAL-1.
           MOVE 1                           TO L9215-NUMBER-OF-DAYS.           

           PERFORM  9215-1000-GET-FUTURE-BUS-DT
               THRU 9215-1000-GET-FUTURE-BUS-DT-X
           
           IF  L9215-RETRN-OK
               MOVE L9215-INTERNAL-2        TO WS-PRCES-DT
           END-IF.

       4200-GET-PRCES-DT-X.
           EXIT.

      *---------------------------
       4300-CALC-FINAL-UNEARN-PREM.
      *---------------------------
      
      * GET ADVANCE PAYMENT END DURATION DATE
      
           MOVE RPOL-ADV-PMT-STRT-DT        TO L1680-INTERNAL-1.
           MOVE ZEROES                      TO L1680-NUMBER-OF-DAYS.
           MOVE ZEROES                      TO L1680-NUMBER-OF-YEARS.
           
           COMPUTE L1680-NUMBER-OF-MONTHS 
                                        = RPOL-POL-BILL-MODE-CD-N
                                        * RPOL-ADV-PMT-DUR-N.
      
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
      
           MOVE L1680-INTERNAL-2            TO WS-ADV-PMT-END-DT.
           
           IF  WS-ADV-PMT-END-DT < RPOL-TRAD-PD-TO-DT-NUM
               MOVE WS-ADV-PMT-END-DT       TO L1680-INTERNAL-1
               MOVE RPOL-TRAD-PD-TO-DT-NUM  TO L1680-INTERNAL-2
               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X
               COMPUTE WS-NO-OF-MODE  = ((L1680-NUMBER-OF-YEARS * 12)
                                      + L1680-NUMBER-OF-MONTHS)
                                      / RPOL-POL-BILL-MODE-CD-N
               COMPUTE L9307-UNEARN-PREM = L9307-UNEARN-PREM
                                         + (RPOL-POL-MPREM-AMT
                                         * WS-NO-OF-MODE)
           END-IF.
           
       4300-CALC-FINAL-UNEARN-PREM-X.
           EXIT.
      / 
      
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
 
           PERFORM  CWSA-4000-CLOSE
               THRU CWSA-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
      
       9999-CLOSE-FILES-X.
           EXIT.

      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************

       COPY XCPL0260.
       
       COPY CCPS0950.
       COPY CCPL0950.
      
       COPY XCPL2490.
       COPY XCPS2490.

       COPY XCPL0040.
       
       COPY CCPS9215.
       COPY CCPL9215.
       
       COPY CCPSPGA.

       COPY CCPS0010.
       COPY CCPL0010.
       
       COPY XCPS0290.
       COPY XCPL0290.
       
       COPY CCPS0182.
       COPY CCPL0182.
       
       COPY XCPL1680.
       COPY XCPL1660.
       
       COPY CCPL9307.
       COPY CCPS9307.       
       
       COPY CCPEPRSM.
       COPY CCPEPRLG.
       
       COPY XCPL0280.
       
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************

       COPY CCPPCCC.
       COPY CCPNPOL.       
       COPY NCPPCVGS.
       COPY CCPNMAST.
       COPY CCPNCVG.
       COPY NCPNTTAB.
       COPY CCPBETAB.
       COPY CCPBDH4.
       COPY CCPBCDSA.
       COPY CCPBPOLB.
       COPY CCPVPHS3.
       COPY CCPBPHST.
CM1597 COPY SCPNFC.

      *****************************************************************
      *  FILE I/O PROCESS MODULE                                      *
      *****************************************************************

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
       COPY XCSNSEQ  REPLACING ==:ID:==  BY CWSA.
       COPY XCSLFILE REPLACING ==:ID:==  BY CWSA
                              ==':PGM:'== BY =='ZSRQCWSA'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CWSA.
       COPY XCSASEQ  REPLACING ==:ID:==  BY CWSA.


      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM CSBMCWSA                     **
      *****************************************************************
