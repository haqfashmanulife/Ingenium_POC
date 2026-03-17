      *****************************************************************
      **  MEMBER :  XSDUBRCD                                         **
      **  REMARKS:  BARCODE CALCULATION UTILITY                      **
      **            FACILITATES THE COMPUTATION OF BARCODE -         **
      **            GS-128 AND CUSTOMER VALUE BARCODE ON THE BASIS   **
      **            OF REQUEST.                                      **
      **  DOMAIN :  PO                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
26869M**  16SEP22  CTS    BARCODE CALCULATION UTILITY PROGRAM        **
J18959**  11JAN24  CTS    FIX FOR PAYMENT DATE                       **
R19010**  10APR24  CTS    INC06735417 - BAR CODE SETTING             **
UY3001**  10APR25  CTS    STREAM 3 CHANGES RETROFIT                  **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSDUBRCD.

       COPY XCWWCRHT.

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDUBRCD'.

       COPY SQLCA.


       01  WS-WORK-AREA.
           05  WS-PRCES-DT                  PIC X(10).
           05  WS-43-DGT-DATA               PIC X(43).
           05  WS-44DGT-DATA.
               10  WS-FIXED-DATA            PIC X(14). 
               10  WS-CRT-DT-YR             PIC X(01).
               10  WS-CRT-DT-MO             PIC X(02).
               10  WS-CRT-DT-DY             PIC X(02).
               10  WS-LRG-PROD-CD           PIC X(03).
               10  WS-POL-ID                PIC X(07).
               10  WS-FIXED-VAR             PIC X(01).
               10  WS-PMT-DUE-YR            PIC X(02).
               10  WS-PMT-DUE-MO            PIC X(02).
               10  WS-PMT-DUE-DY            PIC X(02).
               10  WS-REV-STMP-FLG          PIC X(01).
               10  WS-PMT-AMT               PIC X(06).
               10  WS-CHK-DGT               PIC X(01).
               10  WS-CHK-DGT-N             REDEFINES
                   WS-CHK-DGT               PIC 9(01).
           05  WS-1DGT-ARRAY-LN             OCCURS 43 TIMES.
               10  WS-1DGT-ARRAY            PIC X(01).
               10  WS-1DGT-ARRAY-N          REDEFINES
                   WS-1DGT-ARRAY            PIC 9(01).
           05  WS-2DGT-ARRAY-LN             OCCURS 22 TIMES.
               10  WS-2DGT-ARRAY            PIC X(02).
               10  WS-2DGT-ARRAY-N          REDEFINES
                   WS-2DGT-ARRAY            PIC 9(02).
           05  WS-SUM-A                     PIC 9(03).
           05  WS-VAR-A                     PIC 9(03).
           05  WS-VAR-B                     PIC 9(03).
           05  WS-VAR-C                     PIC X(03).
           05  WS-VAR-C-N                   REDEFINES
               WS-VAR-C                     PIC 9(03).
           05  WS-VARC-LST-DGT              PIC X(01).
           05  WS-VARC-LST-DGT-N            REDEFINES
               WS-VARC-LST-DGT              PIC 9(01).
           05  WS-SCC-VALU                  PIC X(02).
           05  WS-START-C                   PIC 9(03).
           05  WS-FNC1                      PIC 9(03).
           05  WS-VAR1                      PIC X(02).
           05  WS-VAR1-N                    REDEFINES
               WS-VAR1                      PIC 9(02).
           05  WS-VAR2                      PIC 9(04).
           05  WS-VAR3                      PIC 9(06).
           05  WS-VAR4                      PIC 9(06).
           05  WS-DIV                       PIC 9(03).
           05  WS-REMAINDER                 PIC 9(02).
           05  WS-CLI-PSTL-CD               PIC X(07).
           05  WS-PSTL-CD-PRT1              PIC X(03).
           05  WS-PSTL-CD-PRT2              PIC X(05).
           05  WS-PRT1-LEN                  PIC 9(01).
           05  WS-PRT2-LEN                  PIC 9(01).
           05  WS-PSTL-CD-LEN               PIC 9(01).
           05  WS-NGHBRHD-TXT-LEN           PIC 9(02).
           05  WS-NGHBRHD-TXT-NUM           PIC X(10).
           05  WS-NUM-VALU-END              PIC X(01).
               88  WS-NUM-VALU-END-YES      VALUE '1'.
               88  WS-NUM-VALU-END-NO       VALUE '0'.
           05  WS-SAMAKATA-KANA-TXT         PIC X(72).
           05  WS-SAMAKATA-KANA-LEN         PIC 9(02).
           05  WS-SMKT-ARRAY-LN             OCCURS 72 TIMES.
               10  WS-SMKT-ARRAY            PIC X(01).
           05  WS-SAMAKATA-EDIT-TXT         PIC X(72).
           05  WS-SMKT-ARRAY1-LN            OCCURS 72 TIMES.
               10  WS-SMKT-ARRAY1           PIC X(01).
           05  WS-ADDR-DSPL-NUM             PIC X(13).
           05  WS-ADDR-ARRAY-LN             OCCURS 13 TIMES.
               10  WS-ADDR-ARRAY            PIC X(01).
               10  WS-ADDR-ARRAY-N          REDEFINES
                   WS-ADDR-ARRAY            PIC 9(01).
           05  WS-CB-CHK-DGT                PIC X(02).
           05  WS-CB-CHK-DGT-N              REDEFINES
               WS-CB-CHK-DGT                PIC 9(02).
           05  WS-PSTL-ADDR-TXT             PIC X(20).
           05  WS-PREV-CONS-CHAR-IND        PIC X(01).
               88  WS-PREV-CONS-CHAR-YES    VALUE '1'.
               88  WS-PREV-CONS-CHAR-NO     VALUE '0'.
           05  WS-CTR                       PIC S9(04) COMP.
           05  K                            PIC S9(04) COMP.
           05  WS-CHAR1-SEQ-NUM             PIC X(02).
           05  WS-CHAR1-SEQ-NUM-N           REDEFINES
               WS-CHAR1-SEQ-NUM             PIC 9(02).
           05  WS-CHAR2-SEQ-NUM             PIC X(02).
           05  WS-CHAR2-SEQ-NUM-N           REDEFINES
               WS-CHAR2-SEQ-NUM             PIC 9(02).
           05  WS-CHAR-DIFF                 PIC 9(02).
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCWWINDX.
       COPY XCWTBRCD.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY NCFWTTAB.
       COPY NCFRTTAB.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY XCWLDTLK.
       COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL0290.
       COPY CCWL2430.
       COPY CCWL2440.
       COPY XCWL0005.
      /
      ****************************************************************
      *  INPUT PARAMETER INFORMATION                                 *
      ****************************************************************

      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWLBRCD.
       COPY CCFRPOL.
      /
      ********************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  LBRCD-PARM-INFO
                                  RPOL-REC-INFO.

      *------------------
       BRCD-0000-MAINLINE.
      *------------------
      *
      * INITIALIZATION
      *
           INITIALIZE LBRCD-OUTPUT-PARM-INFO.
           INITIALIZE WS-WORK-AREA.
      *
      * PROCESS THE REQUEST
      *
           EVALUATE TRUE

              WHEN LBRCD-RQST-GS128-BARCD
                   PERFORM  1000-GS128-BARCD-CALC
                       THRU 1000-GS128-BARCD-CALC-X

              WHEN LBRCD-RQST-CUST-BARCD
                   PERFORM  2000-CUST-BARCD-CALC
                       THRU 2000-CUST-BARCD-CALC-X

              WHEN OTHER
                   SET  LBRCD-RETRN-INVALID-REQUEST TO TRUE
                   MOVE LBRCD-RETRN-CD      TO WGLOB-ERR-RETRN-CD
                    PERFORM  0030-5000-LOGIC-ERROR
                        THRU 0030-5000-LOGIC-ERROR-X

           END-EVALUATE.

       BRCD-0000-MAINLINE-X.
           GOBACK.
      /
      *---------------------
       1000-GS128-BARCD-CALC.
      *---------------------

      * COMPUTE TOTAL APL BALANCE AMOUNT
           COMPUTE LBRCD-TOT-APL-BAL-AMT    =  LBRCD-CURR-APL-AMT
                                            +  LBRCD-OLD-APL-BAL-AMT
                                            +  LBRCD-CURR-INT-APL-AMT.

           IF  LBRCD-TOT-APL-BAL-AMT > 1000000
      *MSGS: BARCODE IS OUT OF PRINT TARGET AREA FOR POL (@1)
               MOVE 'XSBRCD0001'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-POL-ID             TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET LBRCD-RETRN-ERROR        TO TRUE
               GO TO  1000-GS128-BARCD-CALC-X
           END-IF.

      * COMPUTE 44-DIGIT BARCODE DATA
           PERFORM  1100-44-DGT-BARCD-DATA
               THRU 1100-44-DGT-BARCD-DATA-X.

      *COMPUTATION OF SYMBOL CHECK CHARACTER (SCC)
           PERFORM  1130-CALC-SCC-VALU
               THRU 1130-CALC-SCC-VALU-X.

      *EDITTING BARCODE DATA FOR MAGELLAN
           PERFORM  1140-FTCH-MAG-BARCD
               THRU 1140-FTCH-MAG-BARCD-X.

      *COMPUTATION OF BARCODE VISUAL CHECK FIELD (LINE 1)
           PERFORM  1150-BARCD-VSL-UPPR
               THRU 1150-BARCD-VSL-UPPR-X.

      *COMPUTATION OF BARCODE VISUAL CHECK FIELD (LINE 2)
           PERFORM  1160-BARCD-VSL-LOWR
               THRU 1160-BARCD-VSL-LOWR-X.

       1000-GS128-BARCD-CALC-X.
           EXIT.
      /
      *----------------------
       1100-44-DGT-BARCD-DATA.
      *----------------------

           INITIALIZE  WS-WORK-AREA.
           MOVE '91908199020080'            TO WS-FIXED-DATA.

R19010*           MOVE WGLOB-PROCESS-DATE          TO WS-PRCES-DT.
R19010     MOVE LBRCD-APPL-CTL-PRCES-DT     TO WS-PRCES-DT.
           MOVE WS-PRCES-DT(4:1)            TO WS-CRT-DT-YR.
           MOVE WS-PRCES-DT(6:2)            TO WS-CRT-DT-MO.
           MOVE WS-PRCES-DT(9:2)            TO WS-CRT-DT-DY.

      * GET LARGE PRODUCT CODE
           PERFORM  1110-GET-LRG-PROD-CD
               THRU 1110-GET-LRG-PROD-CD-X.

           MOVE RPOL-POL-ID(1:7)            TO WS-POL-ID.
           MOVE '0'                         TO WS-FIXED-VAR.

      *COMPUTE PAYMENT DUE YEAR
           PERFORM  1120-CALC-PMT-DUE-DT
               THRU 1120-CALC-PMT-DUE-DT-X.

      *REVENUE STAMP FLAG
           IF  LBRCD-TOT-APL-BAL-AMT < 50000
               MOVE '0'                     TO WS-REV-STMP-FLG
           ELSE
               MOVE '1'                     TO WS-REV-STMP-FLG
           END-IF.

      *PAYMENT AMOUNT
      *FORMATTING PAYMENT AMOUNT BY TRUNCATING LEADING ZEROS
           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.

           COMPUTE L0290-INPUT-NUMBER = LBRCD-TOT-APL-BAL-AMT.
           MOVE 0                           TO L0290-PRECISION.
           MOVE LENGTH OF WS-PMT-AMT        TO L0290-MAX-OUT-LEN.

           SET L0290-LEAD-ZEROS-SUPPRESS    TO TRUE.
           SET L0290-SIGN-SUPPRESS          TO TRUE.

           PERFORM  0290-1000-NUMERIC-FORMAT
               THRU 0290-1000-NUMERIC-FORMAT-X.

           MOVE L0290-OUTPUT-DATA           TO WS-PMT-AMT.
           INSPECT WS-PMT-AMT REPLACING LEADING SPACE BY ZERO.

      *CONCATENATING STRING TO GET FIRST 43-DIGIT DATA
           STRING    WS-FIXED-DATA          DELIMITED BY SIZE
                     WS-CRT-DT-YR           DELIMITED BY SIZE
                     WS-CRT-DT-MO           DELIMITED BY SIZE
                     WS-CRT-DT-DY           DELIMITED BY SIZE
                     WS-LRG-PROD-CD         DELIMITED BY SIZE
                     WS-POL-ID              DELIMITED BY SIZE
                     WS-FIXED-VAR           DELIMITED BY SIZE
                     WS-PMT-DUE-YR          DELIMITED BY SIZE
                     WS-PMT-DUE-MO          DELIMITED BY SIZE
                     WS-PMT-DUE-DY          DELIMITED BY SIZE
                     WS-REV-STMP-FLG        DELIMITED BY SIZE
                     WS-PMT-AMT             DELIMITED BY SIZE
                    INTO  WS-43-DGT-DATA
           END-STRING.

      *MOVING 43 DIGIT DATA TO SINGLE DIGIT ARRAY
           INITIALIZE  I.
           INITIALIZE  J.
           PERFORM 
               VARYING  I FROM 1 BY 1
               UNTIL I > 43
               MOVE WS-43-DGT-DATA (I:1)    TO WS-1DGT-ARRAY (I)
UY3001         IF  WS-43-DGT-DATA (I:1) <> SPACES
UY3001             CONTINUE
UY3001         ELSE
UY3001             MOVE ZERO                 TO WS-1DGT-ARRAY-N (I)
UY3001         END-IF
           END-PERFORM.

      *CHECK DIGIT COMPUTATION LOGIC = MODULUS 10 / WEIGHT 3
           PERFORM
               VARYING  I FROM 1 BY 2
               UNTIL I > 43
               COMPUTE WS-SUM-A = WS-SUM-A + WS-1DGT-ARRAY-N (I)
           END-PERFORM.

           COMPUTE WS-VAR-A = WS-SUM-A * 3.

           PERFORM
               VARYING  J FROM 2 BY 2
               UNTIL J > 43
               COMPUTE WS-VAR-B = WS-VAR-B + WS-1DGT-ARRAY-N (J)
           END-PERFORM.

           COMPUTE WS-VAR-C-N = WS-VAR-A + WS-VAR-B.
           MOVE WS-VAR-C (3:1)              TO WS-VARC-LST-DGT.

           IF  WS-VARC-LST-DGT-N = ZERO
               MOVE ZERO                    TO WS-CHK-DGT-N
           ELSE
               COMPUTE WS-CHK-DGT-N = 10 - WS-VARC-LST-DGT-N
           END-IF.

       1100-44-DGT-BARCD-DATA-X.
           EXIT.
      /
      *---------------------
       1110-GET-LRG-PROD-CD.
      *---------------------

           MOVE RPOL-PLAN-ID                TO WTTAB-ETBL-VALU-ID.
           
           PERFORM  RDLG-1000-EDIT
               THRU RDLG-1000-EDIT-X.
               
           IF  WTTAB-IO-OK
               MOVE RTTAB-TTBL-VALU-TXT     TO WS-LRG-PROD-CD
           ELSE
      *MSGS: LARGE PRODUCT CODE NOT FOUND FOR PLAN(@1) POLICY (@2)
               MOVE 'XSBRCD0002'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-PLAN-ID            TO WGLOB-MSG-PARM (1)
               MOVE RPOL-POL-ID             TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET LBRCD-RETRN-ERROR        TO TRUE
           END-IF.

       1110-GET-LRG-PROD-CD-X.
           EXIT.
      /
      *---------------------
       1120-CALC-PMT-DUE-DT.
      *---------------------
J18959     IF NOT RPOL-POL-BILL-MODE-MONTHLY
J18959         MOVE LBRCD-APL-DT            TO L1680-INTERNAL-1
J18959         MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
J18959         MOVE 03                      TO L1680-NUMBER-OF-MONTHS
J18959         MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
J18959     ELSE
J18959         IF  LBRCD-CURR-APL-AMT = ZEROS
J18959             IF  RPOL-TRAD-PD-TO-DT-NUM(1:7) < LBRCD-APL-DT(1:7)
J18959                 MOVE LBRCD-APL-DT    TO L1680-INTERNAL-1
J18959                 MOVE 31              TO L1680-INT-DD-1
J18959                 MOVE 01              TO L1680-NUMBER-OF-MONTHS
J18959                 MOVE ZERO            TO L1680-NUMBER-OF-YEARS
J18959                 MOVE ZERO            TO L1680-NUMBER-OF-DAYS
J18959             ELSE
J18959                 MOVE LBRCD-APL-DT    TO L1680-INTERNAL-1
J18959                 MOVE 31              TO L1680-INT-DD-1
J18959                 MOVE 02              TO L1680-NUMBER-OF-MONTHS
J18959                 MOVE ZERO            TO L1680-NUMBER-OF-YEARS
J18959                 MOVE ZERO            TO L1680-NUMBER-OF-DAYS
J18959             END-IF
J18959         ELSE
J18959             MOVE LBRCD-APL-DT        TO L1680-INTERNAL-1
J18959             MOVE 31                  TO L1680-INT-DD-1
J18959             MOVE 03                  TO L1680-NUMBER-OF-MONTHS
J18959             MOVE ZERO                TO L1680-NUMBER-OF-YEARS
J18959             MOVE ZERO                TO L1680-NUMBER-OF-DAYS
J18959         END-IF
J18959     END-IF.
J18959*           MOVE LBRCD-APL-DT                TO L1680-INTERNAL-1.
J18959*           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
J18959*           MOVE +3                          TO L1680-NUMBER-OF-MONTHS.
J18959*           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.

           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.

           MOVE L1680-INT-YYYY-2 (3:2)      TO WS-PMT-DUE-YR.
           MOVE L1680-INT-MM-2              TO WS-PMT-DUE-MO.
J18959     MOVE L1680-INT-DD-2              TO WS-PMT-DUE-DY.


J18959*           EVALUATE RPOL-POL-BILL-MODE-CD
J18959*               WHEN '01'
J18959*      * PAYMENT DUE DATE IS MONTH-END DAY OF 3 MONTHS AFTER APL DATE
J18959*                     MOVE 31                TO L1680-INT-DD-2
J18959*                     MOVE L1680-INTERNAL-2  TO L1680-INTERNAL-1
J18959*                     MOVE ZERO              TO L1680-NUMBER-OF-YEARS
J18959*                     MOVE ZERO              TO L1680-NUMBER-OF-MONTHS
J18959*                     MOVE ZERO              TO L1680-NUMBER-OF-DAYS
J18959*                     PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
J18959*                         THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
J18959*                     MOVE L1680-INT-DD-2    TO WS-PMT-DUE-DY
J18959*
J18959*               WHEN '06'
J18959*               WHEN '12'
J18959*      * PREMIUM DUE DATE IS MONTHIVERSARY DATE THAT IS 3 MONTHS AFTER APL DATE
J18959*                     MOVE RPOL-POL-ISS-EFF-DT-DY
J18959*                                            TO L1680-INT-DD-2
J18959*                     MOVE L1680-INT-DD-2    TO WS-PMT-DUE-DY
J18959*
J18959*           END-EVALUATE.

       1120-CALC-PMT-DUE-DT-X.
           EXIT.
      /
      *------------------
       1130-CALC-SCC-VALU.
      *------------------

           MOVE 105                         TO WS-START-C.
           MOVE 102                         TO WS-FNC1.

      *MOVING 44 DIGIT DATA TO SINGLE DIGIT ARRAY
           MOVE 1                           TO J.
           PERFORM 
               VARYING  I FROM 1 BY 2
               UNTIL I > 44
               MOVE WS-44DGT-DATA (I:2)     TO WS-2DGT-ARRAY (J)
               COMPUTE J = J + 1
           END-PERFORM.


           MOVE 2                           TO I.
           PERFORM
               VARYING  J FROM 1 BY 1
               UNTIL J > 22

               MOVE  WS-2DGT-ARRAY (J)      TO WS-VAR1
               COMPUTE WS-VAR2 = WS-VAR1-N * I
               COMPUTE WS-VAR3 = WS-VAR3 + WS-VAR2
               COMPUTE I = I + 1
           END-PERFORM.

      *BELOW HAS BEEN CODED TO CALCULATE TOTAL VALUE AFTER APPLYING WEIGHT
           COMPUTE WS-VAR4 = WS-START-C
                           + WS-FNC1
                           + WS-VAR3.

      *DIVIDING TOTAL VALUE AFTER APPLYING WEIGHT BY 103 AND GETTING THE REMAINDER
           DIVIDE  WS-VAR4 BY 103
                   GIVING WS-DIV
                   REMAINDER WS-REMAINDER.

      *COMPUTING ORIGINAL VALUE THAT CORROSPONDS TO REMAINDER: 
      *WHICH BEING THE SYMBOL CHECK CHARACTER
           MOVE WS-REMAINDER                TO WS-SCC-VALU.

       1130-CALC-SCC-VALU-X.
           EXIT.
      /
      *-------------------
       1140-FTCH-MAG-BARCD.
      *-------------------

           STRING    '{'
                     '>!/'
               INTO  LBRCD-GS128-BARCD-VALU
           END-STRING.

           INITIALIZE WS-CTR.

      *FETCHING 128 CHARACTER STRING CONVERSION FOR 44-DIGIT BARCODE DATA
           PERFORM
               VARYING  I FROM 1 BY 1
               UNTIL I > 22

               PERFORM VARYING WS-CTR FROM +1 BY +1
                 UNTIL WS-2DGT-ARRAY (I) = 
                       TBRCD-128CS-NUMBER (WS-CTR, 1)
                    OR WS-CTR > TBRCD-128CS-ENTRIES
                   CONTINUE
               END-PERFORM

               STRING LBRCD-GS128-BARCD-VALU       
                            DELIMITED BY SPACES
                      TBRCD-128CS-NUMBER (WS-CTR, 2) 
                            DELIMITED BY SPACES
                      TBRCD-128CS-NUMBER (WS-CTR, 3) 
                            DELIMITED BY SPACES
                 INTO LBRCD-GS128-BARCD-VALU
               END-STRING

           END-PERFORM.  	  

      *BELOW HAS BEEN CODED TO COMPUTE 128 CHARACTER STRING CONVERSION FOR SCC
           INITIALIZE WS-CTR.

           PERFORM VARYING WS-CTR FROM +1 BY +1
             UNTIL WS-SCC-VALU = TBRCD-128CS-NUMBER (WS-CTR, 1)
                OR WS-CTR > TBRCD-128CS-ENTRIES
               CONTINUE
           END-PERFORM.

           STRING LBRCD-GS128-BARCD-VALU  
                        DELIMITED BY SPACES
                  TBRCD-128CS-NUMBER (WS-CTR, 2) 
                        DELIMITED BY SPACES
                  TBRCD-128CS-NUMBER (WS-CTR, 3) 
                        DELIMITED BY SPACES
             INTO LBRCD-GS128-BARCD-VALU
           END-STRING.

      *APPEND STOP CHARACTER (128 CHARACTER STRING CONVERSION)
           STRING LBRCD-GS128-BARCD-VALU  DELIMITED BY SPACES
                  ')'         INTO  LBRCD-GS128-BARCD-VALU
           END-STRING.

       1140-FTCH-MAG-BARCD-X.
           EXIT.
      /
      *--------------------
       1150-BARCD-VSL-UPPR.
      *--------------------

           MOVE '('                         TO 
                                         LBRCD-VSL-LN-1-BARCD (1:1).
           MOVE WS-44DGT-DATA (1:2)         TO 
                                         LBRCD-VSL-LN-1-BARCD (2:2).
           MOVE ')'                         TO 
                                         LBRCD-VSL-LN-1-BARCD (4:1).
           MOVE WS-44DGT-DATA (3:6)         TO 
                                         LBRCD-VSL-LN-1-BARCD (5:6).
           MOVE '-'                         TO 
                                         LBRCD-VSL-LN-1-BARCD (11:1).
           MOVE WS-44DGT-DATA (9:22)        TO 
                                         LBRCD-VSL-LN-1-BARCD (12:22).

       1150-BARCD-VSL-UPPR-X.
           EXIT.
      /
      *--------------------
       1160-BARCD-VSL-LOWR.
      *--------------------

           MOVE WS-44DGT-DATA (31:6)        TO 
                                         LBRCD-VSL-LN-2-BARCD (1:6).
           MOVE '-'                         TO 
                                         LBRCD-VSL-LN-2-BARCD (7:1).
           MOVE WS-44DGT-DATA (37:1)        TO 
                                         LBRCD-VSL-LN-2-BARCD (8:1).
           MOVE '-'                         TO 
                                         LBRCD-VSL-LN-2-BARCD (9:1).
           MOVE WS-44DGT-DATA (38:6)        TO 
                                         LBRCD-VSL-LN-2-BARCD (10:6).
           MOVE '-'                         TO 
                                         LBRCD-VSL-LN-2-BARCD (16:1).
           MOVE WS-44DGT-DATA (44:1)        TO 
                                         LBRCD-VSL-LN-2-BARCD (17:1).

       1160-BARCD-VSL-LOWR-X.
           EXIT.
      /
      *---------------------
       2000-CUST-BARCD-CALC.
      *---------------------

      * GET OWNER INFORMATION
           MOVE ZEROES                      TO I.

           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.

           PERFORM  2430-2100-GET-OWNER
               THRU 2430-2100-GET-OWNER-X.

           MOVE SPACES                      TO L2440-INPUT-PARM-INFO.

           IF  L2430-RETRN-OK
               MOVE L2430-CLI-ID            TO L2440-CLI-ID
               MOVE L2430-CLI-ADDR-TYP-CD   TO L2440-CLI-ADDR-TYP-CD
           END-IF.   

      *  GET OWNERS PRIMARY ADDRESS
           IF  L2440-CLI-ADDR-TYP-CD  =  'PR'
               PERFORM  2440-1000-PRIMARY-ADDRESS
                   THRU 2440-1000-PRIMARY-ADDRESS-X
           ELSE
               PERFORM  2440-2000-OTHER-ADDRESS
                   THRU 2440-2000-OTHER-ADDRESS-X
           END-IF.

           IF NOT L2440-RETRN-OK
      *MSGS: CLIENT (@1) ADDRESS NOT FOUND FOR POLICY (@2)
               MOVE 'XSBRCD0003'            TO WGLOB-MSG-REF-INFO
               MOVE L2430-CLI-ID            TO WGLOB-MSG-PARM (1)
               MOVE RPOL-POL-ID             TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET LBRCD-RETRN-ERROR        TO TRUE
              GO TO 2000-CUST-BARCD-CALC-X
           END-IF.


      *POSTAL CODE CHECK
           UNSTRING L2440-CLI-PSTL-CD DELIMITED BY '-'
           INTO WS-PSTL-CD-PRT1, WS-PSTL-CD-PRT2.

           INITIALIZE  WS-PRT1-LEN,
                       WS-PRT2-LEN.
           INSPECT WS-PSTL-CD-PRT1 TALLYING 
                   WS-PRT1-LEN FOR CHARACTERS
                  BEFORE INITIAL SPACE.
           INSPECT WS-PSTL-CD-PRT2 TALLYING 
                   WS-PRT2-LEN FOR CHARACTERS
                  BEFORE INITIAL SPACE.
           COMPUTE WS-PSTL-CD-LEN = WS-PRT1-LEN
                                  + WS-PRT2-LEN.

           STRING WS-PSTL-CD-PRT1
                  WS-PSTL-CD-PRT2
                  DELIMITED BY ' '    INTO WS-CLI-PSTL-CD
           END-STRING.

           IF NOT L2440-ADDR-STAT-COMPLETE
           OR WS-PSTL-CD-LEN NOT = 7
           OR WS-CLI-PSTL-CD (6:2) = '00'
      *MSGS: CUSTOMER BARCODE VALUE IS NOT SUBJECT TO PRINTING FOR POLICY (@1)
               MOVE 'XSBRCD0004'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-POL-ID             TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET LBRCD-RETRN-ERROR        TO TRUE
               GO TO  2000-CUST-BARCD-CALC-X
           END-IF.


      *CLIENT NGHBRHD-TXT CHECK
           INITIALIZE  I.
           INITIALIZE  J.
           INITIALIZE  K.
           INITIALIZE  WS-NGHBRHD-TXT-LEN.
           SET WS-NUM-VALU-END-NO           TO TRUE.

           INSPECT L2440-CLI-KA-NGHBRHD-TXT  TALLYING 
                   WS-NGHBRHD-TXT-LEN    FOR CHARACTERS 
                   BEFORE '  '.

      *CREATING SINGLE-DIGIT ARRAY FOR CLI-KA-NGHBRHD-TXT
           PERFORM 
               VARYING  I FROM 1 BY 1
               UNTIL I > WS-NGHBRHD-TXT-LEN
               MOVE L2440-CLI-KA-NGHBRHD-TXT (I:1) 
                                            TO WS-1DGT-ARRAY (I)
           END-PERFORM.

      *GET NUMERICAL VALUE AT THE END OF CLI-KA-NGHBRHD-TXT
           PERFORM  2100-NGHBRHD-TXT-NUM
               THRU 2100-NGHBRHD-TXT-NUM-X
                 VARYING  I FROM WS-NGHBRHD-TXT-LEN BY -1
                 UNTIL I = 0
                 OR WS-NUM-VALU-END-YES.


      *EXTRACTION OF DATA POST STREET NUMBER FROM SAMAKATA-BU KANA ADDRESS
           PERFORM  2200-EXTRCT-SAMAKATABU-ADDR
               THRU 2200-EXTRCT-SAMAKATABU-ADDR-X.

      *CONCATENATING NGHBRHD-TXT AND SAMAKATA-TXT VALUE
           IF  WS-NGHBRHD-TXT-NUM = SPACES
               MOVE WS-SAMAKATA-EDIT-TXT    TO  WS-ADDR-DSPL-NUM
           ELSE
               STRING WS-NGHBRHD-TXT-NUM    DELIMITED BY SPACES
                      '-'
                      WS-SAMAKATA-EDIT-TXT  DELIMITED BY SPACES
                      INTO  WS-ADDR-DSPL-NUM
           END-IF.

      *FORMATTING OF ADDRESS DISPLAY NUMBER
           PERFORM  2300-ADDR-DSP-NUM-EDIT
               THRU 2300-ADDR-DSP-NUM-EDIT-X.

      *CALCULATION OF CHECK DIGIT
           PERFORM  2400-CALC-CHK-DGT
               THRU 2400-CALC-CHK-DGT-X.


      *COMPUTE FINAL CUSTOMER BARCODE VALUE
           STRING '('
                   WS-CLI-PSTL-CD
                   WS-ADDR-DSPL-NUM
                   WS-CHK-DGT
                  ')'
                  INTO LBRCD-CLI-BARCD-VALU-TXT
           END-STRING.


       2000-CUST-BARCD-CALC-X.
           EXIT.
      /
      *---------------------
       2100-NGHBRHD-TXT-NUM.
      *---------------------

           IF  WS-1DGT-ARRAY (I) IS NUMERIC
               COMPUTE J = J + 1
           ELSE
               IF  I NOT = WS-NGHBRHD-TXT-LEN
                   COMPUTE K = I + 1
                   MOVE L2440-CLI-KA-NGHBRHD-TXT (K:J)
                                            TO WS-NGHBRHD-TXT-NUM
               END-IF
               SET WS-NUM-VALU-END-YES      TO TRUE
           END-IF.

       2100-NGHBRHD-TXT-NUM-X.
           EXIT.
      /
      *---------------------------
       2200-EXTRCT-SAMAKATABU-ADDR.
      *---------------------------

      *GETTING COMPLETE SAMAKATA-BU ADDRESS
           STRING L2440-CLI-ADDR-ADDL-TXT
                  L2440-CLI-ADDL-TXT-MORE
                  DELIMITED BY '  '    INTO WS-SAMAKATA-KANA-TXT
           END-STRING.

           INITIALIZE  I.
           INITIALIZE  J.
           INITIALIZE  K.
           INITIALIZE  WS-SAMAKATA-KANA-LEN.

           INSPECT WS-SAMAKATA-KANA-TXT  TALLYING 
                   WS-SAMAKATA-KANA-LEN  FOR CHARACTERS 
                   BEFORE '  '.

      *CONVERTING SAMAKATA-TXT TO UPPER CASE
           PERFORM  0005-1000-BUILD-PARM-INFO
               THRU 0005-1000-BUILD-PARM-INFO-X.

           SET L0005-FORCE-UPPER            TO TRUE.
           MOVE WS-SAMAKATA-KANA-TXT        TO L0005-INPUT-STRING.

           PERFORM  0005-1000-CONVERT-STRING
               THRU 0005-1000-CONVERT-STRING-X.

           IF  L0005-RETRN-OK
               MOVE L0005-OUTPUT-STRING     TO WS-SAMAKATA-KANA-TXT
           END-IF.

      *CREATING SINGLE-DIGIT ARRAY FOR SAMAKATABU-KANA ADDRESS
           PERFORM 
               VARYING  I FROM 1 BY 1
               UNTIL I > WS-SAMAKATA-KANA-LEN
               MOVE WS-SAMAKATA-KANA-TXT (I:1) 
                                            TO WS-SMKT-ARRAY (I)
           END-PERFORM.

      *BELOW IS CODED TO REPLACE ALL IGNORING CHARACTERS IN ADDRESS STRING WITH '#' SIGN
      *'#' IS REPLACED INSTEAD OF SPACES AS CONCATINATION WITH SPACES IS GIVING ISSUE.
           PERFORM  2210-EDIT-SAMAKATA-CHAR
               THRU 2210-EDIT-SAMAKATA-CHAR-X
                 VARYING  I FROM 1 BY 1
                 UNTIL I > WS-SAMAKATA-KANA-LEN.

      *REPLACING MULTIPLE '#' IN STRING WITH SINGLE '#'
           PERFORM  2220-FORMAT-SAMAKATA
               THRU 2220-FORMAT-SAMAKATA-X
                 VARYING  I FROM 1 BY 1
                 UNTIL I > WS-SAMAKATA-KANA-LEN.

      *REPLACING '#' WITH HYPHEN
      *NO SPACE BEFORE AND AFTER ALPHABET
      *SAMAKATA LENGTH REDUCES POST FORMATTING, HENCE COMPUTING LENGTH AGAIN
           INITIALIZE  WS-SAMAKATA-KANA-LEN.

           INSPECT WS-SAMAKATA-EDIT-TXT TALLYING 
                   WS-SAMAKATA-KANA-LEN FOR CHARACTERS 
                   BEFORE '  '.

      *CREATING SINGLE-DIGIT ARRAY FOR EDITED SAMAKATABU-KANA ADDRESS
           PERFORM 
               VARYING  I FROM 1 BY 1
               UNTIL I > WS-SAMAKATA-KANA-LEN
               MOVE WS-SAMAKATA-EDIT-TXT (I:1) 
                                            TO WS-SMKT-ARRAY1 (I)
           END-PERFORM.

           INITIALIZE WS-SAMAKATA-EDIT-TXT.
           INITIALIZE  I.
           INITIALIZE  J.
           INITIALIZE  K.

           PERFORM  2230-FORMAT-SAMAKATA-1
               THRU 2230-FORMAT-SAMAKATA-1-X
                 VARYING  I FROM 1 BY 1
                 UNTIL I > WS-SAMAKATA-KANA-LEN.

      *FURTHER BELOW IS CODED TO CHECK CONSECUTIVE ALPHABETS
           PERFORM  2240-FORMAT-SAMAKATA-2
               THRU 2240-FORMAT-SAMAKATA-2-X.

       2200-EXTRCT-SAMAKATABU-ADDR-X.
           EXIT.
      /
      *-----------------------
       2210-EDIT-SAMAKATA-CHAR.
      *-----------------------.

           IF NOT (WS-SMKT-ARRAY (I) IS NUMERIC
           OR  WS-SMKT-ARRAY (I) IS ALPHABETIC 
           OR  WS-SMKT-ARRAY (I) = '-')
               MOVE '#'                     TO WS-SMKT-ARRAY (I)
           END-IF.

           IF  WS-SMKT-ARRAY (I) = '&'
           OR  WS-SMKT-ARRAY (I) = '/'
           OR  WS-SMKT-ARRAY (I) = '.'
           OR  WS-SMKT-ARRAY (I) = '·'
           OR  WS-SMKT-ARRAY (I) = ' '
               MOVE '#'                     TO WS-SMKT-ARRAY (I)
           END-IF.

           COMPUTE J = I - 1.
           IF  WS-SMKT-ARRAY (I) = 'F'
           AND WS-SMKT-ARRAY (J) IS NUMERIC
               MOVE '#'                     TO WS-SMKT-ARRAY (I)
           END-IF.

       2210-EDIT-SAMAKATA-CHAR-X.
           EXIT.
      /
      *---------------------
       2220-FORMAT-SAMAKATA.
      *---------------------

           COMPUTE J = I + 1.

           IF  WS-SMKT-ARRAY (I) = '#'

               IF  WS-SMKT-ARRAY (J) = '#'
               OR  WS-SMKT-ARRAY (J) = ' '
                   CONTINUE
               ELSE
                   STRING WS-SAMAKATA-EDIT-TXT  DELIMITED BY '  '
                          '#'
                          INTO  WS-SAMAKATA-EDIT-TXT
                   END-STRING
               END-IF

           ELSE
               STRING WS-SAMAKATA-EDIT-TXT  DELIMITED BY '  '
                      WS-SMKT-ARRAY (I)     DELIMITED BY SIZE
                      INTO  WS-SAMAKATA-EDIT-TXT
               END-STRING
           END-IF.

       2220-FORMAT-SAMAKATA-X.
           EXIT.
      /
      *-----------------------
       2230-FORMAT-SAMAKATA-1.
      *-----------------------

           COMPUTE K = I + 1.
           COMPUTE J = I - 1.

           IF  WS-SMKT-ARRAY1 (I) = '#'
           OR  WS-SMKT-ARRAY1 (I) = '-'

               IF  WS-SMKT-ARRAY1 (K) IS ALPHABETIC
               OR  WS-SMKT-ARRAY1 (J) IS ALPHABETIC
                   CONTINUE
               ELSE
                   STRING WS-SAMAKATA-EDIT-TXT  DELIMITED BY SPACES
                          '-'
                          INTO  WS-SAMAKATA-EDIT-TXT
                   END-STRING
               END-IF

           ELSE
               STRING WS-SAMAKATA-EDIT-TXT  DELIMITED BY SPACES
                      WS-SMKT-ARRAY1 (I)    DELIMITED BY SIZE
                      INTO  WS-SAMAKATA-EDIT-TXT
               END-STRING
           END-IF.


       2230-FORMAT-SAMAKATA-1-X.
           EXIT.
      /
      *-----------------------
       2240-FORMAT-SAMAKATA-2.
      *-----------------------

           INITIALIZE  WS-SAMAKATA-KANA-LEN.
           SET WS-PREV-CONS-CHAR-NO         TO TRUE.

           INSPECT WS-SAMAKATA-EDIT-TXT TALLYING 
                   WS-SAMAKATA-KANA-LEN FOR CHARACTERS 
                   BEFORE '  '.

      *CREATING SINGLE-DIGIT ARRAY FOR FURTHER EDITED SAMAKATABU-KANA ADDRESS
           PERFORM 
               VARYING  I FROM 1 BY 1
               UNTIL I > WS-SAMAKATA-KANA-LEN
               INITIALIZE  WS-SMKT-ARRAY (I)
               MOVE WS-SAMAKATA-EDIT-TXT (I:1) 
                                            TO WS-SMKT-ARRAY (I)
           END-PERFORM.

           INITIALIZE WS-SAMAKATA-EDIT-TXT.
           INITIALIZE  K.

           PERFORM  2241-CHK-ADJ-CHAR
               THRU 2241-CHK-ADJ-CHAR-X
                 VARYING  I FROM 1 BY 1
                 UNTIL I > WS-SAMAKATA-KANA-LEN.

       2240-FORMAT-SAMAKATA-2-X.
           EXIT.
      /
      *-----------------
       2241-CHK-ADJ-CHAR.
      *-----------------

           COMPUTE K = I + 1.

           IF  WS-SMKT-ARRAY (I) IS ALPHABETIC

               IF  WS-SMKT-ARRAY (K) IS ALPHABETIC
                   PERFORM  2242-CHK-CONSCUTVE-CHAR
                       THRU 2242-CHK-CONSCUTVE-CHAR-X
               ELSE
                   IF  WS-PREV-CONS-CHAR-YES
                       SET WS-PREV-CONS-CHAR-NO    
                                            TO TRUE
                   ELSE
                       STRING WS-SAMAKATA-EDIT-TXT  
                                    DELIMITED BY SPACES
                              WS-SMKT-ARRAY (I)  
                                    DELIMITED BY SIZE
                       INTO  WS-SAMAKATA-EDIT-TXT
                   END-IF
               END-IF

           ELSE
               STRING WS-SAMAKATA-EDIT-TXT  DELIMITED BY SPACES
                      WS-SMKT-ARRAY (I)     DELIMITED BY SIZE
                      INTO  WS-SAMAKATA-EDIT-TXT
               END-STRING
           END-IF.

       2241-CHK-ADJ-CHAR-X.
           EXIT.
      /
      *-----------------------
       2242-CHK-CONSCUTVE-CHAR.
      *-----------------------

      *FETCHING SEQUENCE NUMBER FOR 'I' POSITION OF ALPHABET

           INITIALIZE WS-CTR.

           PERFORM VARYING WS-CTR FROM +1 BY +1
              UNTIL WS-SMKT-ARRAY (I) =
                    TBRCD-CONVERSION-LETTER (WS-CTR, 1)
                 OR WS-CTR > TBRCD-NUMBER-ENTRIES
               CONTINUE
           END-PERFORM.

           STRING TBRCD-CONVERSION-LETTER (WS-CTR, 2)
                  TBRCD-CONVERSION-LETTER (WS-CTR, 3)
                  INTO WS-CHAR1-SEQ-NUM
           END-STRING.


      *FETCHING SEQUENCE NUMBER FOR 'I+1' POSITION OF ALPHABET

           INITIALIZE WS-CTR.

           PERFORM VARYING WS-CTR FROM +1 BY +1
              UNTIL WS-SMKT-ARRAY (K) =
                    TBRCD-CONVERSION-LETTER (WS-CTR, 1)
                 OR WS-CTR > TBRCD-NUMBER-ENTRIES
               CONTINUE
           END-PERFORM.

           STRING TBRCD-CONVERSION-LETTER (WS-CTR, 2)
                  TBRCD-CONVERSION-LETTER (WS-CTR, 3)
                  INTO WS-CHAR2-SEQ-NUM
           END-STRING.

      *COMPUTE DIFFERENCE OF SEQUENCE NUMBER OF 'I' AND 'I+1' POSITION 
      *OF ALPHABET. IF DIFFERENCE IS FOUND TO BE 1, THEY ARE CONSECUTIVE
      *CHARACTERS AND HENCE TO BE IGNORED.
           COMPUTE WS-CHAR-DIFF = WS-CHAR2-SEQ-NUM-N 
                                - WS-CHAR1-SEQ-NUM-N.

           IF  WS-CHAR-DIFF = 01
               SET WS-PREV-CONS-CHAR-YES    TO TRUE
           ELSE
               SET WS-PREV-CONS-CHAR-NO     TO TRUE
           END-IF.

       2242-CHK-CONSCUTVE-CHAR-X.
           EXIT.
      /
      *-----------------------
       2300-ADDR-DSP-NUM-EDIT.
      *-----------------------

           INITIALIZE  WS-SAMAKATA-KANA-LEN.

           INSPECT WS-ADDR-DSPL-NUM TALLYING 
                   WS-SAMAKATA-KANA-LEN FOR CHARACTERS 
                   BEFORE INITIAL SPACE.

      *CREATING SINGLE-DIGIT ARRAY FOR ADDRESS DISPLAY NUMBER
           PERFORM 
               VARYING  I FROM 1 BY 1
               UNTIL I > WS-SAMAKATA-KANA-LEN
               MOVE WS-ADDR-DSPL-NUM (I:1) 
                                            TO WS-ADDR-ARRAY (I)
           END-PERFORM.


           INITIALIZE WS-ADDR-DSPL-NUM.
           INITIALIZE WS-CTR.

      *GETTING COMPLETE 13-DIGIT ADDRESS DISPLAY NUMBER
           PERFORM
               VARYING  I FROM 1 BY 1
               UNTIL I > 13

               IF  WS-ADDR-ARRAY (I) IS ALPHABETIC
               AND WS-ADDR-ARRAY (I) NOT = ' '
                   PERFORM VARYING WS-CTR FROM +1 BY +1
                      UNTIL WS-ADDR-ARRAY (I) =
                            TBRCD-ADDR-DISP-LETTER (WS-CTR, 1)
                         OR WS-CTR > TBRCD-NUMBER-ENTRIES
                       CONTINUE
                   END-PERFORM

                   STRING WS-ADDR-DSPL-NUM      DELIMITED BY SPACES
                          TBRCD-ADDR-DISP-LETTER (WS-CTR, 2)
                          TBRCD-ADDR-DISP-LETTER (WS-CTR, 3)
                     INTO WS-ADDR-DSPL-NUM
                   END-STRING
               END-IF

               IF  WS-ADDR-ARRAY (I) IS NUMERIC
               OR  WS-ADDR-ARRAY (I) = '-'
                   STRING WS-ADDR-DSPL-NUM   DELIMITED BY SPACES
                          WS-ADDR-ARRAY (I)  DELIMITED BY SIZE
                          INTO  WS-ADDR-DSPL-NUM
                   END-STRING
               END-IF

               IF  WS-ADDR-ARRAY (I) = ' '
                   STRING WS-ADDR-DSPL-NUM DELIMITED BY SPACES
                          'd'
                          INTO  WS-ADDR-DSPL-NUM
                   END-STRING
               END-IF

           END-PERFORM.


       2300-ADDR-DSP-NUM-EDIT-X.
           EXIT.
      /
      *-----------------
       2400-CALC-CHK-DGT.
      *-----------------

      *CONCATENATE POSTAL CODE + ADDRESS DISPLAY NUMBER FOR CALCULATING CHECK DIGIT
           STRING  WS-CLI-PSTL-CD
                   WS-ADDR-DSPL-NUM
                  INTO WS-PSTL-ADDR-TXT
           END-STRING.

      *MOVING FINAL 20-DIGIT POSTAL CODE + ADDRESS DISPLAY NUMBER TO SINGLE DIGIT ARRAY
           PERFORM 
               VARYING  I FROM 1 BY 1
               UNTIL I > 20
               INITIALIZE WS-ADDR-ARRAY (I)
               MOVE WS-PSTL-ADDR-TXT (I:1) 
                                            TO WS-ADDR-ARRAY (I)
           END-PERFORM.


           PERFORM
               VARYING  J FROM 1 BY 1
               UNTIL J > 20

      *CHECKING 13-DIGIT DATA FROM WS-CHK-DGT-TABLE ARRAY (IN XCWTBRCD COPYBOOK)
      *TO COMPUTE CUSTOMER BARCODE CHECK DIGIT
               INITIALIZE WS-CTR

               PERFORM VARYING WS-CTR FROM +1 BY +1
                  UNTIL WS-ADDR-ARRAY (J) =
                        TBRCD-CHK-DGT-LETTER (WS-CTR, 1)
                     OR WS-CTR > TBRCD-CHK-DGT-ENTRIES
                   CONTINUE
               END-PERFORM

               STRING TBRCD-CHK-DGT-LETTER (WS-CTR, 2)
                      TBRCD-CHK-DGT-LETTER (WS-CTR, 3)
                 INTO WS-VAR1
               END-STRING

               COMPUTE WS-VAR2 = WS-VAR2 + WS-VAR1-N

           END-PERFORM.

      *DIVIDING TOTAL VALUE BY 19 AND GETTING THE REMAINDER
           DIVIDE  WS-VAR2 BY 19
                   GIVING WS-DIV
                   REMAINDER WS-REMAINDER.

           COMPUTE WS-CB-CHK-DGT-N = 19 - WS-REMAINDER.

      *COMPUTING ORIGINAL VALUE THAT CORROSPONDS TO REMAINDER: 
      *WHICH BEING THE CHECK DIGIT FOR CUSTOMER VALUE BARCODE
           INITIALIZE WS-CTR.

           PERFORM VARYING WS-CTR FROM +1 BY +1
              UNTIL (WS-CB-CHK-DGT (1:1) = 
                     TBRCD-CHK-DGT-LETTER (WS-CTR, 2)
                AND  WS-CB-CHK-DGT (2:1) = 
                     TBRCD-CHK-DGT-LETTER (WS-CTR, 3))
                 OR WS-CTR > TBRCD-CHK-DGT-ENTRIES
                CONTINUE
           END-PERFORM.

           MOVE TBRCD-CHK-DGT-LETTER (WS-CTR, 1) 
                                            TO WS-CHK-DGT.

       2400-CALC-CHK-DGT-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY CCPERDLG.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
       COPY XCPL1660.
       COPY XCPL1670.
       COPY XCPL1680.
       COPY XCPL0260.
       COPY XCPS0290.
       COPY XCPL0290.
       COPY CCPL2430.
       COPY CCPS2430.
       COPY CCPL2440.
       COPY XCPL0005.
       COPY XCPS0005.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY NCPNTTAB.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *
      *****************************************************************
      **                 END OF PROGRAM XSDUBRCD                     **
      *****************************************************************