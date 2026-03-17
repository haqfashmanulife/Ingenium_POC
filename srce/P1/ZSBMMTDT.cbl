      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMMTDT.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBMMTDT                                          **
      **  REMARKS: UPDATE PREMIUM PAYMENT PERIOD IN MOVEMENT EXTRACT **
      **  DOMAIN :  AC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  20AUG14  CTS    UPDATE PREMIUM PAYMENT PERIOD IN MOVEMENT  **
      **                  EXTRACT                                    **
MP266B**  05FEB14  CTS    UPDATED FOR AUTO/FAC RE FLAG               **      
UYS019**  06DEC22  CTS    UPDATED LARDE CODE IN MOVEMENT EXTRACT     **
UYCR61**  24MAY23  CTS    UPDATE THE NEW FIELD WITH DEFAULT VALUE    **
27547S**  18AUG24  CTS    UPDATE THE NEW FIELD WITH DEFAULT VALUE    **
BEVC39**  20AUG24  CTS    CHANGES FOR VALUATION TVA1 FIELD REMOVE    **
29746O**  20FEB25  CTS    UPDATE THE NEW FIELDS WITH DEFAULT VALUE   **
UY3V1A**  17MAY25  CTS    UPDATE THE NEW FIELDS WITH DEFAULT VALUE   ** 
M2025H**  24MAR25  CTS    CHANGES FOR FRA VALUATION MORTGAGE 2025    **
NVCV01**  25JUL25  CTS    CHANGES FOR ONTARIO VALUATION              **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT MVMT-DATA-FILE ASSIGN     TO ZSMVMT
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WMVMT-SEQ-FILE-STATUS.

      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       FD  MVMT-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
           
MP266B*       01  RMVMT-SEQ-REC-INFO               PIC X(753).
UYS019*MP266B    01  RMVMT-SEQ-REC-INFO            PIC X(754).
27547S*UYS019    01  RMVMT-SEQ-REC-INFO            PIC X(1145).
BEVC39*27547S    01  RMVMT-SEQ-REC-INFO            PIC X(1183).
29746O*BEVC39    01  RMVMT-SEQ-REC-INFO            PIC X(1171).
UY3V1A*29746O        01  RMVMT-SEQ-REC-INFO               PIC X(1163).
M2025H*UY3V1A        01  RMVMT-SEQ-REC-INFO               PIC X(1191).
NVCV01*M2025H        01  RMVMT-SEQ-REC-INFO               PIC X(1555).
NVCV01        01  RMVMT-SEQ-REC-INFO               PIC X(1636).


      *------------------------
       WORKING-STORAGE SECTION.
      *------------------------

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMMTDT'.

       COPY SQLCA.

UYS019 01  WORK-AREAS.
UYS019     05 WS-BASE-PLAN-FND                   PIC X(01).
UYS019         88 WS-BASE-PLAN-FND-YES         VALUE 'Y'.

       01  WMVMT-SEQ-IO-WORK-AREA.
           05  WMVMT-SEQ-FILE-NAME          PIC X(04)
                                            VALUE 'MVMT'.
           05  WMVMT-SEQ-IO-COMMAND         PIC X(02).
           05  WMVMT-SEQ-FILE-STATUS        PIC X(02).
           05  WMVMT-SEQ-IO-STATUS          PIC 9(01).
               88  WMVMT-SEQ-IO-OK          VALUE 0.
               88  WMVMT-SEQ-IO-NOT-FOUND   VALUE 7.
               88  WMVMT-SEQ-IO-EOF         VALUE 8.
               88  WMVMT-SEQ-IO-ERROR       VALUE 9.
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
MP266B COPY CCWWPLAN.      
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

       COPY XCSWSEQ  REPLACING ==:ID:==  BY MTDT
                               ==':ID:'==  BY =='MTDT'==.
      /
       COPY CCSRMTDT.
      / 
       COPY CCWWTMVM.
      / 
       COPY CCFWPOL.
       COPY CCFRPOL.
       COPY CCWWCVGS.      
       COPY CCFWCVG.
       COPY CCFRCVG.
UYS019 COPY NCFRTTAB.
UYS019 COPY NCFWTTAB.
UYS019 COPY CCFWPH.
UYS019 COPY CCFRPH.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************
       COPY CCWL0010.
      /
       COPY CCWL0950.
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
       COPY XCWL1670.
      /
       COPY XCWL1680.
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

           PERFORM  1000-INIT-FOR-COMPANY
               THRU 1000-INIT-FOR-COMPANY-X.

           PERFORM  2000-PROCESS-TRANSACTIONS
               THRU 2000-PROCESS-TRANSACTIONS-X
               UNTIL WMVMT-SEQ-IO-EOF.

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

           MOVE ZERO                        TO WMVMT-SEQ-IO-STATUS.

           OPEN INPUT MVMT-DATA-FILE.

           IF WMVMT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.
           
           PERFORM  MTDT-3000-OPEN-OUTPUT
               THRU MTDT-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------
       1000-INIT-FOR-COMPANY.
      *----------------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBMMTDT'                  TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  1100-INIT-OCF-TITLES
               THRU 1100-INIT-OCF-TITLES-X.

       1000-INIT-FOR-COMPANY-X.
           EXIT.
      /
      *---------------------
       1100-INIT-OCF-TITLES.
      *---------------------
      *
      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT
      *
           MOVE ZERO                        TO L0040-ERROR-CNT.
      *
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       1100-INIT-OCF-TITLES-X.
           EXIT.
      /      
      *--------------------------
       2000-PROCESS-TRANSACTIONS.
      *--------------------------
      
           PERFORM  2500-MVMT-READ
               THRU 2500-MVMT-READ-X.
               
           IF NOT WMVMT-SEQ-IO-OK
               GO TO 2000-PROCESS-TRANSACTIONS-X
           END-IF.

       2000-PROCESS-TRANSACTIONS-X.
           EXIT.
      /
      *---------------
       2500-MVMT-READ.
      *---------------

           MOVE ZERO                        TO WMVMT-SEQ-IO-STATUS.

           READ MVMT-DATA-FILE
                AT END
                  MOVE 8                    TO WMVMT-SEQ-IO-STATUS
                  GO TO 2500-MVMT-READ-X.

           IF  RMVMT-SEQ-REC-INFO EQUAL HIGH-VALUES
               MOVE 8                       TO WMVMT-SEQ-IO-STATUS
           END-IF.

           IF WMVMT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.

BEVC39*          MOVE RMVMT-SEQ-REC-INFO          TO WTMVM-REC-INFO.

29746O*BEVC39    MOVE RMVMT-SEQ-REC-INFO (1:1151)     TO 
29746O*BEVC39                               WTMVM-REC-INFO (1:1151).
29746O*BEVC39    MOVE RMVMT-SEQ-REC-INFO (1160:12)    TO 
29746O*BEVC39                               WTMVM-REC-INFO(1152:12).    
29746O
29746O     MOVE RMVMT-SEQ-REC-INFO           TO WTMVM-REC-INFO. 
29746O      
           
           IF NOT WTMVM-REC-TYP-DTL
               GO TO 2500-MVMT-READ-X
           END-IF.
           
           PERFORM  3000-LOAD-POL-CVGS
               THRU 3000-LOAD-POL-CVGS-X.
               
           IF NOT WPOL-IO-OK
               GO TO 2500-MVMT-READ-X
           END-IF.
           
BEVC39*MP266B*           PERFORM  3500-PREM-PAYMENT-PERIOD
BEVC39*MP266B*               THRU 3500-PREM-PAYMENT-PERIOD-X.
BEVC39*MP266B
BEVC39*UYS019*MP266B     PERFORM  3500-UPDATE-REINS-FLAG
BEVC39*UYS019*MP266B         THRU 3500-UPDATE-REINS-FLAG-X.
BEVC39*UYS019     MOVE RPOL-PLAN-ID         TO WTTAB-ETBL-VALU-ID.
BEVC39*UYS019        
BEVC39*UYS019     PERFORM  PRLG-1000-EDIT
BEVC39*UYS019         THRU PRLG-1000-EDIT-X.
BEVC39*UYS019      
BEVC39*UYS019     IF  WTTAB-IO-OK
BEVC39*UYS019         MOVE RTTAB-TTBL-VALU-TXT     
BEVC39*                                     TO WTMVM-LRG-PRODUCT-CD
BEVC39*UYS019     END-IF.
BEVC39*UYCR61     MOVE WWKDT-ZERO-DT               TO 
BEVC39*UYCR61                                WTMVM-FACE-AMT-RED-STRT-DT. 
29746O*27547S     MOVE ZEROES                      TO WTMVM-BNFT-PERI-MONTH.  
UY3V1A*29746O     MOVE ZEROES                      TO WTMVM-ACUM-RATIO
UY3V1A*29746O                                         WTMVM-CVG-ACCT-VALU
UY3V1A*29746O                                         WTMVM-ACUM-PREM-RSRV.
UY3V1A*29746O     MOVE SPACES                      TO 
UY3V1A*29746O                                      WTMVM-AUTO-CPN-PMT-CVG-IND.
M2025H*UY3V1A
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-P2-PREMIUM.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-STEP-PERIOD.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ANNTY-PLAN-CODE.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-ANNTY-STYL-SER-PTRN.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                    WTMVM-ANNTY-LMPSM-PMT-DT.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                    WTMVM-ANNTY-DFRD-STRT-DT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ANNTY-DFRD-PER.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                  WTMVM-SRVIVL-STS-SPSE-ANNITY.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-DEFR-SURV-BNFT-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-DEC-DEF-SURV-BNFT.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-INT-DEF-SURV-BNFT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-DEF-CLM-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-DEC-DEF-CLM-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-INT-DEF-CLM-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-TAX-QAL-AMT-BAL. 
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-INT-TAX-QAL-AMT-BAL.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-TAX-QAL-AMT-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-DEC-TAX-QAL-AMT-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-INT-TAX-QAL-AMT-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ACCUM-DIV-BAL.
M2025H*UY3V1A     MOVE ZEROES                      
M2025H*UY3V1A                                      TO WTMVM-INT-ACCUM-DIV-BAL.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ACC-DIV-TOT.
M2025H*UY3V1A     MOVE ZEROES
M2025H*UY3V1A                                      TO WTMVM-DEC-ACC-DIV-TOT.
M2025H*UY3V1A     MOVE ZEROES
M2025H*UY3V1A                                      TO WTMVM-INT-ACC-DIV-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-CNVR-FUND-BAL
M2025H*UY3V1A                                  WTMVM-INT-CNVR-FUND-BAL-CURR
M2025H*UY3V1A                                  WTMVM-CNVR-FUND-TOT
M2025H*UY3V1A                                  WTMVM-DEC-CNVR-FUND-PREM
M2025H*UY3V1A                                  WTMVM-DEC-ON-CNVR-FUND-OTHER
M2025H*UY3V1A                                  WTMVM-INT-CNVR-FUND-BAL-TOT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ADJ-DP1-AMT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ADJ-2DP1-AMT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ADJ-DP2-AMT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ADJ-2DP2-AMT
M2025H*S46201     MOVE ZEROES                      TO WTMVM-ANNTY-FUND-EST-DT.
M2025H*UY3V1A     MOVE ZEROES                      TO
M2025H*UY3V1A                                   WTMVM-CANCR-LMPSM-PMT-IND.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                   WTMVM-CANCR-LMPSM-PMT-DT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-INCR-PUR-SRVL-INS.
M2025H*UY3V1A     MOVE ZEROES                      TO
M2025H*UY3V1A                                      WTMVM-INCR-PUR-WL-INS-N.
M2025H*UY3V1A     MOVE ZEROES                      TO 
M2025H*UY3V1A                                      WTMVM-FACE-AMT-END-INS-N.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-POL-ID-ING.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ING-ANTY-STAT.
M2025H*UY3V1A     MOVE ZEROES                      TO WTMVM-ING-INQ-POL-ID. 
M2025H*UY3V1A
NVCV01*M2025H
NVCV01*M2025H     MOVE SPACES                      TO WTMVM-PREM-SUSP-CD.
NVCV01*M2025H     MOVE ZEROES                      TO WTMVM-TOT-PAID-PREM.
NVCV01*M2025H     MOVE ZEROES                      TO WTMVM-TRIGR-PCT.
NVCV01*M2025H     MOVE ZEROES                      TO WTMVM-PREM-SUSP-STRT-DT.
NVCV01*M2025H     MOVE ZEROES                      TO WTMVM-PREM-RESUM-STRT-DT.
NVCV01     MOVE ZEROES                      TO  
NVCV01                                       WTMVM-ACUM-XPCT-XPNS-GMDB.
NVCV01     MOVE ZEROES                      TO WTMVM-ACUM-DSCNT-AMT.
NVCV01     MOVE ZEROES                      TO WTMVM-GUAR-MIN-DB.
NVCV01     MOVE ZEROES                      TO WTMVM-NET-PREM.

           MOVE WTMVM-REC-INFO              TO RMTDT-SEQ-REC-INFO.

           PERFORM  MTDT-1000-WRITE
               THRU MTDT-1000-WRITE-X.

       2500-MVMT-READ-X.
           EXIT.
      /  
      *-------------------
       3000-LOAD-POL-CVGS.
      *-------------------
           INITIALIZE WPOL-KEY.

           MOVE WTMVM-POL-ID                TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF NOT WPOL-IO-OK
               GO TO 3000-LOAD-POL-CVGS-X
           END-IF.
           
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.                 

       3000-LOAD-POL-CVGS-X.
           EXIT.
      /     
MP266B*      *-------------------------
MP266B*       3500-PREM-PAYMENT-PERIOD.
MP266B*      *-------------------------
MP266B*      
MP266B*           IF  WCVGS-CVG-INS-TYP-WHOLE-LIFE (WTMVM-CVG-NUM) 
MP266B*           OR  RPOL-POL-INS-TYP-MEDIC-INS
MP266B*           
MP266B*               IF  WCVGS-CVG-STBL-3-07-WL (WTMVM-CVG-NUM)
MP266B*               OR  (RPOL-POL-BILL-TYP-SINGLE
MP266B*               AND RPOL-POL-INS-TYP-WHOLE-LIFE)
MP266B*                   GO TO 3500-PREM-PAYMENT-PERIOD-X
MP266B*               END-IF
MP266B*
MP266B*               MOVE WCVGS-CVG-UL-PU-DT (WTMVM-CVG-NUM)
MP266B*                                            TO L1680-INTERNAL-1
MP266B*               MOVE WCVGS-CVG-ISS-EFF-DT (WTMVM-CVG-NUM)
MP266B*                                            TO L1680-INTERNAL-2
MP266B*               PERFORM  1680-2000-COMP-DAYS-BETWEEN
MP266B*                   THRU 1680-2000-COMP-DAYS-BETWEEN-X
MP266B*               MOVE L1680-NUMBER-OF-YEARS   TO L0290-INPUT-NUMBER
MP266B*               MOVE ZEROES                  TO L0290-PRECISION
MP266B*               MOVE LENGTH OF WTMVM-PREM-PYMT-PERI
MP266B*                                            TO L0290-MAX-OUT-LEN
MP266B*               SET L0290-SIGN-SUPPRESS      TO TRUE
MP266B*               SET L0290-LEAD-ZEROS-DISPLAY TO TRUE
MP266B*               PERFORM  0290-1000-NUMERIC-FORMAT
MP266B*                   THRU 0290-1000-NUMERIC-FORMAT-X
MP266B*               MOVE L0290-OUTPUT-DATA       TO WTMVM-PREM-PYMT-PERI
MP266B*               
MP266B*           END-IF.
MP266B*      
MP266B*       3500-PREM-PAYMENT-PERIOD-X.
MP266B*           EXIT.
MP266B*      / 
MP266B
UYS019*MP266B*-------------------------
UYS019*MP266B 3500-UPDATE-REINS-FLAG.
UYS019*MP266B*-------------------------
UYS019*MP266B
UYS019*MP266B     IF  WCVGS-AUTO-REINS-CO-ID (WTMVM-CVG-NUM) NOT = SPACES
UYS019*MP266B     AND WCVGS-CVG-REINS-YES (WTMVM-CVG-NUM)
UYS019*MP266B*AUTO-REINSURANCE
UYS019*MP266B         MOVE 1                       TO WTMVM-AUTO-FAC-RE-FLAG
UYS019*MP266B     ELSE
UYS019*MP266B         IF WCVGS-CVG-REINS-YES (WTMVM-CVG-NUM)
UYS019*MP266B*FACULTATIVE REINSURANCE
UYS019*MP266B            MOVE 2                    TO WTMVM-AUTO-FAC-RE-FLAG
UYS019*MP266B          ELSE
UYS019*MP266B*NON-REINSURANCE
UYS019*MP266B            MOVE ZEROES               TO WTMVM-AUTO-FAC-RE-FLAG
UYS019*MP266B          END-IF
UYS019*MP266B     END-IF.
UYS019*MP266B     MOVE WCVGS-PLAN-ID (WTMVM-CVG-NUM) 
UYS019*MP266B                                      TO WPLAN-PLAN-ID.
UYS019*MP266B     IF  WPLAN-PLAN-ARM2
UYS019*MP266B     AND RPOL-POL-ISS-EFF-DT >= '2015-03-01'
UYS019*MP262B         MOVE '01'                    TO WTMVM-COINS-ALLOW-FLAG
UYS019*MP266B     ELSE
UYS019*MP266B         MOVE ZEROS                   TO WTMVM-COINS-ALLOW-FLAG
UYS019*MP266B     END-IF.
UYS019*MP266B
UYS019*MP266B 3500-UPDATE-REINS-FLAG-X.
UYS019*MP266B     EXIT.
UYS019*MP266B/ 
UYS019*MP266B
      *-----------------------
       9700-HANDLE-ERROR.
      *-----------------------

           MOVE WMVMT-SEQ-FILE-NAME          TO WGLOB-TABLE-NAME.
           MOVE WMVMT-SEQ-FILE-STATUS        TO WGLOB-SEQ-FILE-STATUS.
           MOVE WMVMT-SEQ-IO-COMMAND         TO WGLOB-IO-COMMAND.
           PERFORM  0030-3000-QSAM-ERROR
               THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                        TO WMVMT-SEQ-IO-STATUS.

           CLOSE MVMT-DATA-FILE.

           IF WMVMT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.

           PERFORM  MTDT-4000-CLOSE
               THRU MTDT-4000-CLOSE-X.

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
       COPY XCPL1680.
      / 
      *****************************************************************
      * FILE HANDLING ROUTINES
      *****************************************************************

       COPY XCSLFILE REPLACING ==:ID:==  BY MTDT
                               ==':PGM:'== BY =='CSRQMTDT'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY MTDT.
       COPY XCSASEQ  REPLACING ==:ID:==  BY MTDT.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY CCPNPOL.
      /
       COPY CCPNCVG.
       COPY NCPPCVGS.
UYS019 COPY CCPNPH.
UYS019 COPY CCPEPRLG.
UYS019 COPY NCPNTTAB.
UYS019 COPY CCPPPLIN.
      / 
      *****************************************************************
      * ERROR HANDLING ROUTINES
      *****************************************************************

       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSBMMTDT                     **
      *****************************************************************
