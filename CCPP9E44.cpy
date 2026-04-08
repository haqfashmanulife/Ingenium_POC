      *****************************************************************
      **  MEMBER :  CCPP9E44                                         **
      **  REMARKS:  DEFERRED MATURITY PAYMENT                        **
      **                                                             **
      **  DOMAIN :  PR                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
UY3093**  11JUL23  CTS    DEFERRED MATURITY PAYMENT                  **
UY3066**  09JAN24  CTS    SAVINGS RIDER CHANGES                      **
S29763**  20JUN24  CTS    FIX FOR JIRA NO UDS3-29763                 **
S30686**  19JUL24  CTS    FIX FOR ROUNDING ISSUE IN INT VALUE        **
S50077**  09MAY25  CTS    FIX FOR JIRA NO UDS3-50077                 **
S50514**  09AUG25  CTS    FIX FOR JIRA NO UDS3-50514                 **
      *****************************************************************

      *-------------------
       9E44-0000-MAINLINE.
      *--------------------

           INITIALIZE L9E44-OUTPUT-PARM-INFO.
           INITIALIZE W9E44-WORK-AREA.
           INITIALIZE WGLOB-MSG-ERROR-SW.
           INITIALIZE WGLOB-MSG-SEVRTY-CD.
       
           PERFORM  0292-0000-INIT-PARM-INFO
               THRU 0292-0000-INIT-PARM-INFO-X. 
      
           PERFORM  ACCT-1000-BUILD-PARM-INFO
               THRU ACCT-1000-BUILD-PARM-INFO-X.
           MOVE 'P'                         TO LACCT-SRC-CD.
           
           SET L9E44-RETRN-OK               TO TRUE.
      *
      * PROCESS THE REQUEST
      *
           EVALUATE TRUE

               WHEN L9E44-RQST-GET-DEF-PRCES
                    PERFORM  9E44-2000-DEF-MAT-PRCES
                        THRU 9E44-2000-DEF-MAT-PRCES-X

               WHEN OTHER
                    SET  L9E44-RETRN-INVALID-REQUEST 
                                            TO TRUE
                    MOVE L9E44-RETRN-CD     TO WGLOB-ERR-RETRN-CD
                    PERFORM  0030-5000-LOGIC-ERROR
                        THRU 0030-5000-LOGIC-ERROR-X

           END-EVALUATE.

       9E44-0000-MAINLINE-X.
           EXIT.
      /
      *--------------------------
       9E44-1100-DEF-MAT-DETAILS.
      *--------------------------
      **IF PAYMENT IS REQUESTED WITHIN ONE MONTH FROM DEFERMENT START DATE
      **THEN NO INTEREST CAPITALIZATION WILL BE DONE.
            
UY3066*CHECK FOR SAVING RIDER
UY3066
UY3066     SET W9E44-SVNG-CVG-NO               TO TRUE.
UY3066     PERFORM  
UY3066         VARYING I FROM RPOL-POL-CVG-REC-CTR-N BY -1 
UY3066         UNTIL I < 1
UY3066         OR W9E44-SVNG-CVG-YES
UY3066         IF  WCVGS-CVG-INS-TYP-TRAD-SVNG (I)
UY3066         AND WCVGS-CVG-STAT-MATURED (I)
UY3066             SET W9E44-SVNG-CVG-YES   TO TRUE
UY3066             MOVE I                   TO W9E44-SVNG-CVG-NUM
UY3066         END-IF
UY3066     END-PERFORM.
UY3066 
UY3066     IF W9E44-SVNG-CVG-YES 
UY3066        MOVE WCVGS-CVG-MAT-XPRY-DT (W9E44-SVNG-CVG-NUM)
UY3066                                      TO L1680-INTERNAL-1
UY3066     ELSE
              MOVE RPOL-POL-CEAS-DT         TO L1680-INTERNAL-1
UY3066     END-IF.

           MOVE L9E44-EFF-DT                TO L1680-INTERNAL-2.
           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.
      
           IF  L1680-NUMBER-OF-YEARS = 0
           AND L1680-NUMBER-OF-MONTHS = 0
              IF L1680-TOTAL-DAYS <= 31
           
               MOVE RPOL-MAT-DEFR-AMT       TO L9E44-MAT-DEFR-AMT
               MOVE RPOL-MAT-DEFR-INT-AMT   TO L9E44-MAT-DEFR-INT-AMT
               
               COMPUTE L9E44-REMIT-AMT = L9E44-MAT-DEFR-AMT
                                       + L9E44-MAT-DEFR-INT-AMT
               
               GO TO 9E44-1100-DEF-MAT-DETAILS-X    
               
           END-IF. 

           MOVE RPOL-MAT-DEFR-INT-DT    TO L1680-INTERNAL-1.
           MOVE ZEROES                  TO L1680-NUMBER-OF-DAYS.
           MOVE ZEROES                  TO L1680-NUMBER-OF-MONTHS.
           MOVE 1                       TO L1680-NUMBER-OF-YEARS.
      
           PERFORM  1680-4000-SUB-YMD-FROM-DATE
               THRU 1680-4000-SUB-YMD-FROM-DATE-X.
            
           MOVE L1680-INTERNAL-2            TO W9E44-PREV-ANNV-DT
               
           IF  L9E44-RQST-GET-DEF-PRCES
               IF  W9E44-PREV-ANNV-DT > L9E44-EFF-DT
               AND L9E44-EVNT-ACTV-CD ='P'
      * ERROR MSG : PROCESS DATE CANNOT BE LESS THAN LAST INTEREST CAPT
      *  DATE
                MOVE 'CC9E441002'                TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
                SET L9E44-RETRN-ERROR       TO TRUE 
                GO TO 9E44-1100-DEF-MAT-DETAILS-X
               END-IF
S50077*               IF  RPOL-MAT-DEFR-INT-DT < L9E44-EFF-DT 
S50077*S11956         AND RPOL-MAT-DEFR-DT NOT = WWKDT-ZERO-DT
S50077*S29763         AND RPOL-MAT-DEFR-DT <> RPOL-MAT-DEFR-INT-DT
S50077*               AND L9E44-EVNT-ACTV-CD ='P'
S50077*      * ERROR MSG : PROCESS DATE CANNOT BE HIGHER THAN NEXT 
S50077*      * INTEREST CAPT. DATE
S50077*                MOVE 'CC9E441003'                TO WGLOB-MSG-REF-INFO
S50077*                PERFORM  0260-1000-GENERATE-MESSAGE
S50077*                    THRU 0260-1000-GENERATE-MESSAGE-X
S50077*                SET L9E44-RETRN-ERROR       TO TRUE 
S50077*                GO TO 9E44-1100-DEF-MAT-DETAILS-X
S50077*               END-IF
S29763
S29763         IF  RPOL-MAT-DEFR-DT = RPOL-MAT-DEFR-INT-DT 
S29763         AND RPOL-MAT-DEFR-DT NOT = WWKDT-ZERO-DT
S29763         AND RPOL-MAT-DEFR-INT-DT < L9E44-EFF-DT 
S29763             MOVE RPOL-MAT-DEFR-INT-DT TO L9E44-EFF-DT
S29763         END-IF 
S29763
           END-IF

           MOVE RPOL-MAT-DEFR-AMT           TO W9E44-MAT-DEFR-AMT.
           MOVE RPOL-MAT-DEFR-INT-AMT       TO W9E44-MAT-DEFR-INT-AMT.
           
           MOVE W9E44-MAT-DEFR-AMT          TO L9E44-MAT-DEFR-AMT.
           
           MOVE W9E44-PREV-ANNV-DT          TO L1680-INTERNAL-1.
           MOVE L9E44-EFF-DT                TO L1680-INTERNAL-2.
           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.
           MOVE L1680-NUMBER-OF-YEARS       TO W9E44-NO-OF-YEARS.
           MOVE L1680-NUMBER-OF-MONTHS      TO W9E44-NO-OF-MONTHS.
           MOVE L1680-NUMBER-OF-DAYS        TO W9E44-NO-OF-DAYS.
           
           MOVE ZEROES                      TO I.
           PERFORM  PLIN-1000-PLAN-HEADER-IN
               THRU PLIN-1000-PLAN-HEADER-IN-X.
         
           MOVE W9E44-MAT-DEFR-INT-AMT      TO L9E44-MAT-DEFR-INT-AMT
           COMPUTE W9E44-PRINCIPAL-AMT      = W9E44-MAT-DEFR-AMT
                                            + W9E44-MAT-DEFR-INT-AMT


           IF  W9E44-NO-OF-DAYS > 0
           OR  W9E44-NO-OF-MONTHS > 0
           OR  L9E44-EFF-DT = RPOL-MAT-DEFR-INT-DT
               IF  L9E44-RQST-GET-DEF-PRCES
S11956         AND RPOL-MAT-DEFR-DT NOT = WWKDT-ZERO-DT
                   PERFORM  9E44-1105-GET-INT
                       THRU 9E44-1105-GET-INT-X
               END-IF 
           END-IF.
           
           IF  L9E44-EVNT-ACTV-DEFR-PAYMT
           AND L9E44-EFF-DT =  W9E44-PREV-ANNV-DT
           AND L9E44-EFF-DT NOT = RPOL-POL-CEAS-DT
               IF  L9E44-RQST-GET-DEF-PRCES
                   PERFORM  9E44-1105-GET-INT
                       THRU 9E44-1105-GET-INT-X
                       
               END-IF              
           END-IF. 
           
           COMPUTE L9E44-REMIT-AMT = L9E44-MAT-DEFR-AMT
                                   + L9E44-MAT-DEFR-INT-AMT.

       9E44-1100-DEF-MAT-DETAILS-X.
           EXIT.
      /
      *-------------------
       9E44-1105-GET-INT.
      *-------------------
      
           MOVE L9E44-EFF-DT                TO W9E44-ACRU-TO-DT
           
           IF  L9E44-EVNT-ACTV-DEFR-PAYMT
S30686*         MOVE L9E44-EFF-DT            TO L1680-INTERNAL-1
S30686*         MOVE ZEROES                  TO L1680-NUMBER-OF-YEARS
S30686*         MOVE ZEROES                  TO L1680-NUMBER-OF-MONTHS
S30686*         MOVE 1                       TO L1680-NUMBER-OF-DAYS
S30686*         PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
S30686*             THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
S30686*         MOVE L1680-INTERNAL-2        TO W9E44-ACRU-TO-DT 
S30686
S30686**THE INTEREST IS CALCULATED TILL REMITTANCE DATE+1 BUSINESS DAY**
S30686         MOVE L9E44-EFF-DT                TO L9215-INTERNAL-1
S30686         MOVE +1                          TO L9215-NUMBER-OF-DAYS
S30686         
S30686         PERFORM  9215-1000-GET-FUTURE-BUS-DT
S30686             THRU 9215-1000-GET-FUTURE-BUS-DT-X
S30686         
S30686         IF  L9215-RETRN-ERROR
S30686*MSG:    FUTURE BUSINESS DATES NOT SET UP. PLEASE CONTACT SYSTEM
S30686*        ADMINISTRATOR.
S30686           MOVE 'CC9E441006'           TO WGLOB-MSG-REF-INFO
S30686           PERFORM  0260-1000-GENERATE-MESSAGE
S30686               THRU 0260-1000-GENERATE-MESSAGE-X
S30686           SET L9E44-RETRN-ERROR       TO TRUE 
S30686         ELSE
S30686             MOVE L9215-INTERNAL-2        TO W9E44-ACRU-TO-DT
S30686         END-IF 
           END-IF. 
            
           MOVE RPH-KEY                 TO WPD-KEY
           PERFORM  PDIN-1000-PLAN-DEFAULTS-IN
               THRU PDIN-1000-PLAN-DEFAULTS-IN-X
               
S49747*           IF  RPD-USYS-MIGR-TYP-CD = 'DHY'
S49747     IF  RPOL-USYS-MIGR-TYP-CD = 'DHY'
               MOVE 'DHYSRV'            TO W9E44-PDF-INT-RT-ID
           ELSE
S49747*               IF  RPD-USYS-MIGR-TYP-CD = 'MLJ'
S49747     IF  RPOL-USYS-MIGR-TYP-CD = 'MLJ'
                   MOVE 'TDSRVB'        TO W9E44-PDF-INT-RT-ID
               END-IF
           END-IF
           
           PERFORM  9E44-1100-ADV-PMT-ACRU-PDF
               THRU 9E44-1100-ADV-PMT-ACRU-PDF-X

           ADD  W9E44-ACRU-TOT-AMT      TO W9E44-PRINCIPAL-AMT
                                           L9E44-MAT-DEFR-INT-AMT.

       9E44-1105-GET-INT-X.
           EXIT.
      *-----------------------------
       9E44-1100-ADV-PMT-ACRU-PDF.
      *-----------------------------
      
           IF  W9E44-PDF-INT-RT-ID = SPACES
               GO TO 9E44-1100-ADV-PMT-ACRU-PDF-X
           END-IF.
  
           MOVE W9E44-ACRU-TO-DT            TO L1660-INTERNAL-DATE     
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE         TO W9E44-ACRU-TO-IDT-NUM.
      
      * BUILD THE KEY FOR BROWSE
      
           MOVE LOW-VALUES                  TO WIR-KEY.
           MOVE HIGH-VALUES                 TO WIR-ENDBR-KEY.
           MOVE W9E44-PDF-INT-RT-ID         TO WIR-INT-RT-ID.
           MOVE W9E44-PDF-INT-RT-ID         TO WIR-ENDBR-INT-RT-ID.
           MOVE W9E44-ACRU-TO-IDT-NUM       TO WIR-INT-RT-IDT-NUM-N.
           MOVE '9999999'                   TO WIR-ENDBR-INT-RT-IDT-NUM.
           MOVE 000000000.00                TO WIR-INT-RT-MAX-AMT.
           MOVE ZEROES                      TO WIR-INT-RT-DPOS-TRM-DUR.
           MOVE 9999999999999.99            TO 
                                            WIR-ENDBR-INT-RT-MAX-AMT.
      
           PERFORM  IR-1000-BROWSE
               THRU IR-1000-BROWSE-X.
             
           PERFORM  IR-2000-READ-NEXT
               THRU IR-2000-READ-NEXT-X.  
               
           PERFORM  9E44-1402-GET-IR-RATE
               THRU 9E44-1402-GET-IR-RATE-X.
      
           PERFORM  9E44-1403-INT-CALC-FORMULA
               THRU 9E44-1403-INT-CALC-FORMULA-X
               UNTIL RIR-INT-RT-EFF-DT < W9E44-PREV-ANNV-DT
               OR  WIR-IO-EOF.      
      
           PERFORM  IR-3000-END-BROWSE
               THRU IR-3000-END-BROWSE-X.
      
      * ROUND OFF TO ZERO DECIMALS
           MOVE W9E44-ACRU-TOT-AMT          TO L0289-CRCY-AMT.
           MOVE RPOL-POL-CRCY-CD            TO L0289-CRCY-CD.
           MOVE ZEROES                      TO L0289-DCML-PRECSN.
           PERFORM  0289-1000-CRCY-RND
               THRU 0289-1000-CRCY-RND-X.
           MOVE L0289-CRCY-AMT              TO  W9E44-ACRU-TOT-AMT.
      
       9E44-1100-ADV-PMT-ACRU-PDF-X.
           EXIT.
      / 
      *----------------------
       9E44-1402-GET-IR-RATE.
      *----------------------
      
           IF  WIR-IO-OK
               COMPUTE W9E44-INT-RT =
                            RIR-INIT-DPOS-INT-PCT / 100  
               IF  RIR-INT-RT-EFF-DT < W9E44-ACRU-TO-DT
               AND RIR-INT-RT-EFF-DT > W9E44-PREV-ANNV-DT
                   MOVE RIR-INT-RT-EFF-DT   TO L1680-INTERNAL-1 
               ELSE
                   MOVE W9E44-PREV-ANNV-DT     TO L1680-INTERNAL-1 
               END-IF
               MOVE W9E44-ACRU-TO-DT           TO L1680-INTERNAL-2
               
               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X
                   
               IF  L1680-TOTAL-DAYS = 366
               AND L9E44-EVNT-ACTV-DEFR-MAT-PAYMT
                   MOVE 365             TO L1680-TOTAL-DAYS
               END-IF 
                   
               IF  L1680-TOTAL-DAYS = 367
               AND L9E44-EVNT-ACTV-DEFR-PAYMT
                   MOVE 366             TO L1680-TOTAL-DAYS
               END-IF 
               
               COMPUTE W9E44-ACRU-PDF-INT = 
                              (W9E44-PRINCIPAL-AMT * W9E44-INT-RT)
                            * (L1680-TOTAL-DAYS/365)                          
           END-IF.

S30686* ROUND OFF TO ZERO DECIMALS
S30686     MOVE W9E44-ACRU-PDF-INT          TO L0289-CRCY-AMT.
S30686     MOVE RPOL-POL-CRCY-CD            TO L0289-CRCY-CD.
S30686     MOVE ZEROES                      TO L0289-DCML-PRECSN.
S30686     PERFORM  0289-1000-CRCY-RND
S30686         THRU 0289-1000-CRCY-RND-X.
S30686     MOVE L0289-CRCY-AMT              TO  W9E44-ACRU-PDF-INT. 
S30686           
           COMPUTE W9E44-ACRU-TOT-AMT =  W9E44-ACRU-PDF-INT
                                       + W9E44-ACRU-TOT-AMT.   
      
       9E44-1402-GET-IR-RATE-X.
           EXIT.
      *---------------------------
       9E44-1403-INT-CALC-FORMULA.
      *---------------------------
      
           MOVE RIR-INT-RT-EFF-DT       TO W9E44-HOLD-INT-EFF-DT. 
           PERFORM  IR-2000-READ-NEXT
              THRU  IR-2000-READ-NEXT-X.
           IF  WIR-IO-EOF
               GO TO 9E44-1403-INT-CALC-FORMULA-X
           END-IF.
      
      * CALCULATE THE NUMBER OF DAYS THIS INTEREST RATE APPLIES
           COMPUTE W9E44-INT-RT = RIR-INIT-DPOS-INT-PCT / 100. 
           MOVE W9E44-HOLD-INT-EFF-DT   TO L1680-INTERNAL-1.
      *     MOVE 1                      TO L1680-NUMBER-OF-DAYS.
           MOVE ZEROES                  TO L1680-NUMBER-OF-DAYS.
           MOVE ZEROES                  TO L1680-NUMBER-OF-MONTHS.
           MOVE ZEROES                  TO L1680-NUMBER-OF-YEARS.
           PERFORM  1680-4000-SUB-YMD-FROM-DATE
               THRU 1680-4000-SUB-YMD-FROM-DATE-X.        
           MOVE L1680-INTERNAL-2            TO W9E44-HOLD-INT-EFF-DT.
           IF  RIR-INT-RT-EFF-DT < W9E44-PREV-ANNV-DT
               MOVE W9E44-PREV-ANNV-DT      TO L1680-INTERNAL-1
           ELSE
               MOVE RIR-INT-RT-EFF-DT       TO L1680-INTERNAL-1
           END-IF.
           
           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.
               
           IF  L1680-TOTAL-DAYS = 366
           AND L9E44-EVNT-ACTV-DEFR-MAT-PAYMT
               MOVE 365             TO L1680-TOTAL-DAYS
           END-IF 
               
           IF  L1680-TOTAL-DAYS = 367
           AND L9E44-EVNT-ACTV-DEFR-PAYMT
               MOVE 366             TO L1680-TOTAL-DAYS
           END-IF 
           
           COMPUTE W9E44-ACRU-PDF-INT = 
                          (W9E44-PRINCIPAL-AMT * W9E44-INT-RT)
                        * (L1680-TOTAL-DAYS/365).    

S30686* ROUND OFF TO ZERO DECIMALS
S30686     MOVE W9E44-ACRU-PDF-INT          TO L0289-CRCY-AMT.
S30686     MOVE RPOL-POL-CRCY-CD            TO L0289-CRCY-CD.
S30686     MOVE ZEROES                      TO L0289-DCML-PRECSN.
S30686     PERFORM  0289-1000-CRCY-RND
S30686         THRU 0289-1000-CRCY-RND-X.
S30686     MOVE L0289-CRCY-AMT              TO  W9E44-ACRU-PDF-INT. 
S30686      
           COMPUTE W9E44-ACRU-TOT-AMT = W9E44-ACRU-PDF-INT
                                      + W9E44-ACRU-TOT-AMT.                   
                             
       9E44-1403-INT-CALC-FORMULA-X.
           EXIT.   
      /     
      *------------------------
       9E44-2000-DEF-MAT-PRCES.
      *------------------------
 
           PERFORM  9E44-1100-DEF-MAT-DETAILS
               THRU 9E44-1100-DEF-MAT-DETAILS-X.
           IF  L9E44-PRCES-TYP-EDIT-ONLY
           OR  L9E44-RETRN-ERROR
               GO TO 9E44-2000-DEF-MAT-PRCES-X
           END-IF.
           PERFORM  9E44-2100-DEF-MAT-PMT-PRCES
               THRU 9E44-2100-DEF-MAT-PMT-PRCES-X.
      
       9E44-2000-DEF-MAT-PRCES-X. 
           EXIT.   
      /
      *------------------------------
       9E44-2100-DEF-MAT-PMT-PRCES.
      *------------------------------
     
           MOVE RPOL-POL-BASE-CVG-NUM       TO W9E44-CVG-NUM.
           
      *REMITTANCE PROCESS - FBNK CREATION**
           IF  L9E44-REMIT-AMT > ZERO 
           AND L9E44-PAYO-MTHD-CD-FBNK
               PERFORM  9E44-2125-FBNK-CREATION
                   THRU 9E44-2125-FBNK-CREATION-X
               IF  L9E44-RETRN-ERROR
                   GO TO 9E44-2100-DEF-MAT-PMT-PRCES-X
               END-IF
           END-IF.          

      *ACCOUNTING FOR DEFERRED MATURITY PAYMENT 
XXXXXX*    IF  RPOL-MAT-DEFR-AMT > ZERO
XXXXXX*    AND L9E44-PAYO-MTHD-CD-FBNK
XXXXXX*        PERFORM  9E44-2126-DEF-MAT-ACCT
XXXXXX*            THRU 9E44-2126-DEF-MAT-ACCT-X
XXXXXX*    END-IF. 

UY3066     IF  L9E44-REMIT-AMT > ZERO
UY3066     AND W9E44-SVNG-CVG-YES
UY3066     AND L9E44-PAYO-MTHD-CD-MCSH
UY3066         PERFORM  9E44-2127-OS-MAT-ACCT
UY3066             THRU 9E44-2127-OS-MAT-ACCT-X
UY3066     END-IF.

      * CREATE DEFERRED MAT PAYMENT CDSA RECORD AT COVERAGE LEVEL**
           IF  L9E44-REMIT-AMT > ZERO
               PERFORM  9E44-1205-WRITE-CDSA
                   THRU 9E44-1205-WRITE-CDSA-X           
           END-IF.
		   
UY3109     IF  L9E44-MAT-DEFR-AMT > 0
UY3109         PERFORM  9A79-1000-BUILD-PARM-INFO
UY3109             THRU 9A79-1000-BUILD-PARM-INFO-X
UY3109         SET L9A79-DEFR-ACCT-YES     TO TRUE
UY3109         COMPUTE L9A79-TRXN-AMT = L9E44-MAT-DEFR-AMT
UY3109                                   
UY3109         PERFORM  9A79-6040-MAT-DEFR-ACCT
UY3109             THRU 9A79-6040-MAT-DEFR-ACCT-X
UY3109     END-IF.
UY3109     IF  L9E44-MAT-DEFR-INT-AMT > 0
UY3109         PERFORM  9A79-1000-BUILD-PARM-INFO
UY3109             THRU 9A79-1000-BUILD-PARM-INFO-X
UY3109         SET L9A79-DEFR-ACCT-YES     TO TRUE
UY3109         COMPUTE L9A79-TRXN-AMT = L9E44-MAT-DEFR-INT-AMT
UY3109                                   
UY3109         PERFORM  9A79-6040-MAT-DEFR-ACCT
UY3109             THRU 9A79-6040-MAT-DEFR-ACCT-X
UY3109     END-IF.
           
PNR011
PNR011**GENERATE THE PRTX ENTRIES**
PNR011     PERFORM  9E44-1206-GENERATE-PRTX
PNR011         THRU 9E44-1206-GENERATE-PRTX-X.
PNR011
PNR011   
      
      *SET BELOW TPOL FIELDS TO ZERO ONCE PAYMENT IS DONE
           MOVE ZEROES                      TO RPOL-MAT-DEFR-AMT.
           MOVE ZEROES                      TO RPOL-MAT-DEFR-INT-AMT.
           MOVE WWKDT-ZERO-DT               TO RPOL-MAT-DEFR-INT-DT.
           MOVE WWKDT-ZERO-DT               TO RPOL-MAT-DEFR-DT.
      
      *MSG: DEFER MATURITY PAYMENT PROCESSING COMPLETED FOR POLICY @1
           MOVE RPOL-POL-ID                 TO WGLOB-MSG-PARM (1).
           MOVE 'CC9E441004'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X. 

       9E44-2100-DEF-MAT-PMT-PRCES-X.
           EXIT.
      
      *------------------------
       9E44-2125-FBNK-CREATION.
      *------------------------
       
           PERFORM  9966-1000-BUILD-PARM-INFO
               THRU 9966-1000-BUILD-PARM-INFO-X.
       
           MOVE RPOL-POL-CRCY-CD            TO L9966-ORIG-PMT-CRCY-CD
                                               L9966-PMT-CRCY-CD.
                                                       
           MOVE L9E44-REMIT-AMT             TO L9966-FB-AMT
                                               L9966-ORIG-PMT-AMT.
           MOVE L9E44-REMIT-AMT             TO L9966-BNFT-PMT-AMT.
           MOVE L9E44-MAT-DEFR-INT-AMT      TO L9966-DEFR-MAT-INT-AMT.
           MOVE L9E44-PAYE-CLI-FRST-NM      TO L9966-PAYE-CLI-FRST-NM.
           MOVE L9E44-PAYE-CLI-LAST-NM      TO L9966-PAYE-CLI-LAST-NM.
           MOVE L9E44-PAYE-CO-NM            TO L9966-PAYE-CO-NM.
           MOVE L9E44-CLI-ADDR-LOC-CD       TO L9966-CLI-ADDR-LOC-CD.
           MOVE L9E44-CLI-PSTL-CD           TO L9966-CLI-PSTL-CD.
           MOVE L9E44-CLI-ADDR-ADDL-TXT     TO L9966-CLI-ADDR-ADDL-TXT.
           MOVE L9E44-DV-CLI-ADDR           TO L9966-DV-CLI-ADDR.
           MOVE L9E44-MRF-IND               TO L9966-MRF-IND.
           MOVE L9E44-BNK-ID                TO L9966-BNK-ID.
           MOVE L9E44-BNK-BR-ID             TO L9966-BNK-BR-ID.
           MOVE L9E44-BNK-ACCT-ID           TO L9966-BNK-ACCT-ID.
           MOVE L9E44-BNK-ACCT-TYP-CD       TO L9966-BNK-ACCT-TYP-CD.
           MOVE L9E44-BNK-ACCT-HLDR-NM      TO L9966-BNK-ACCT-HLDR-NM.
           MOVE L9E44-PAYO-MTHD-CD          TO L9966-FBNK-CREAT-TYP-CD.
           MOVE WGLOB-PROCESS-DATE          TO L9966-GAIN-LOSS-EFF-DT.
           MOVE RPOL-POL-BASE-CVG-NUM       TO L9966-CVG-NUM-N.
           MOVE L9E44-EFF-DT                TO L9966-FB-EFF-DATE.
           MOVE L9E44-CO-RECV-DT            TO L9966-CO-RECV-DT.
           SET  L9966-CAT-MAT-DEFR          TO TRUE.
      
           IF  L9E44-CO-RECV-DT >= RPOL-POL-CEAS-DT
               MOVE L9E44-CO-RECV-DT         TO L9966-DLAY-INT-CALC-DT
           ELSE 
               MOVE RPOL-POL-CEAS-DT         TO L9966-DLAY-INT-CALC-DT
S50514         IF  W9E44-SVNG-CVG-YES 
S50514             MOVE WCVGS-CVG-MAT-XPRY-DT (W9E44-SVNG-CVG-NUM)
S50514                                      TO L9966-DLAY-INT-CALC-DT
S50514         END-IF
           END-IF.
      
           PERFORM  9966-1000-APPROVE-PMT
               THRU 9966-1000-APPROVE-PMT-X.
      
           IF  NOT L9966-RETRN-OK
               SET L9E44-RETRN-ERROR        TO TRUE
           ELSE
               MOVE L9966-REMIT-AMT         TO L9E44-TOT-REMIT-AMT
           END-IF.
       
       9E44-2125-FBNK-CREATION-X.
           EXIT.
      /
      *-----------------------
       9E44-2126-DEF-MAT-ACCT.
      *-----------------------
       
           PERFORM  2090-1000-BUILD-PARM-INFO
               THRU 2090-1000-BUILD-PARM-INFO-X.
       
           SET L2090-OS-DISB-TYPE-MATURITY  TO TRUE.        

               COMPUTE L2090-OS-DISB-CHG-AMT = 
                                            RPOL-MAT-DEFR-AMT *(-1).
           
           PERFORM  2090-1000-GEN-DISB-ACCT
               THRU 2090-1000-GEN-DISB-ACCT-X.
       
           IF L2090-RETRN-OK
               PERFORM  2090-2000-UPDT-POL-DISB-AREA
                   THRU 2090-2000-UPDT-POL-DISB-AREA-X
           END-IF.

       9E44-2126-DEF-MAT-ACCT-X.
           EXIT.
      /  
UY3066*----------------------
UY3066 9E44-2127-OS-MAT-ACCT.
UY3066*----------------------
UY3066 
UY3066     PERFORM  2090-1000-BUILD-PARM-INFO
UY3066         THRU 2090-1000-BUILD-PARM-INFO-X.
UY3066 
UY3066     SET L2090-OS-DISB-TYPE-MATURITY  TO TRUE.        
UY3066
UY3066     COMPUTE L2090-OS-DISB-CHG-AMT = L9E44-REMIT-AMT * (-1).
UY3066     
UY3066     PERFORM  2090-1000-GEN-DISB-ACCT
UY3066         THRU 2090-1000-GEN-DISB-ACCT-X.
UY3066 
UY3066     IF L2090-RETRN-OK
UY3066         PERFORM  2090-2000-UPDT-POL-DISB-AREA
UY3066             THRU 2090-2000-UPDT-POL-DISB-AREA-X
UY3066     END-IF.
UY3066
UY3066 9E44-2127-OS-MAT-ACCT-X.
UY3066     EXIT.
UY3066/  
      *---------------------
       9E44-1205-WRITE-CDSA. 
      *---------------------

           IF L9E44-PAYO-MTHD-CD-FBNK
              COMPUTE W9E44-DLAY-INT-AMT =  L9E44-TOT-REMIT-AMT
                                          - L9E44-MAT-DEFR-AMT 
                                          - L9E44-MAT-DEFR-INT-AMT
              IF  W9E44-DLAY-INT-AMT < ZERO                              
      *       ERROR MSG : DELAY INTEREST CAN NOT BE NEGATIVE 
                  MOVE 'CC9E441005'                TO WGLOB-MSG-REF-INFO
                  PERFORM  0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                  SET L9E44-RETRN-ERROR        TO TRUE     
                  GO TO 9E44-1205-WRITE-CDSA-X                     
              END-IF 
           END-IF.
           
           PERFORM  2600-1000-BUILD-PARM-INFO
               THRU 2600-1000-BUILD-PARM-INFO-X.
      
           MOVE RPOL-POL-ID                 TO L2600-POL-ID.
           MOVE L9E44-EFF-DT                TO L2600-CDA-EFF-DT.
           COMPUTE L2600-CDA-TOT-TRXN-AMT = L9E44-REMIT-AMT * (-1)
           
           IF  L9E44-CO-RECV-DT >= RPOL-POL-CEAS-DT
               MOVE L9E44-CO-RECV-DT         TO L2600-DLAY-INT-STRT-DT
           ELSE 
               MOVE RPOL-POL-CEAS-DT         TO L2600-DLAY-INT-STRT-DT
S50514         IF  W9E44-SVNG-CVG-YES 
S50514             MOVE WCVGS-CVG-MAT-XPRY-DT (W9E44-SVNG-CVG-NUM)
S50514                                      TO L2600-DLAY-INT-STRT-DT
S50514         END-IF
           END-IF.
           
           MOVE W9E44-DLAY-INT-AMT          TO L2600-DLAY-INT-AMT   
           MOVE L9E44-MAT-DEFR-INT-AMT      TO L2600-SPLT-INT-AMT             
           
           SET L2600-CDA-TYP-DEFR-MAT       TO TRUE.     
           SET L2600-CDA-STAT-ACTIVE        TO TRUE.
           SET L2600-CDA-CREAT-BY-SYSTEM    TO TRUE.
      
           PERFORM  2600-1000-WRITE-CDSA
               THRU 2600-1000-WRITE-CDSA-X.
      
           IF NOT L2600-RETRN-OK
               SET L9E44-RETRN-ERROR        TO TRUE
           END-IF.

S47190     IF  W9E44-SVNG-CVG-YES
S47190         CONTINUE
S47190     ELSE
S47190         GO TO 9E44-1205-WRITE-CDSA-X
S47190     END-IF.
S47190
S47190     PERFORM  2600-1000-BUILD-PARM-INFO
S47190         THRU 2600-1000-BUILD-PARM-INFO-X.
S47190
S47190     MOVE RPOL-POL-ID                 TO L2600-POL-ID.
S47190     MOVE L9E44-EFF-DT                TO L2600-CDA-EFF-DT.
S47190     COMPUTE L2600-CDA-TOT-TRXN-AMT = RPOL-MAT-DEFR-AMT.
S47190     MOVE L9E44-EFF-DT                TO L2600-DLAY-INT-STRT-DT.
S47190     MOVE W9E44-SVNG-CVG-NUM          TO L2600-CVG-NUM-N.
S47190     MOVE ZEROES                      TO L2600-DLAY-INT-AMT.
S47190     MOVE ZEROES                      TO L2600-SPLT-INT-AMT.
S47190     
S47190     SET L2600-CDA-TYP-WITHDRAWAL     TO TRUE.
S47190     SET L2600-CDA-STAT-ACTIVE        TO TRUE.
S47190     SET L2600-CDA-CREAT-BY-SYSTEM    TO TRUE.
S47190
S47190     PERFORM  2600-1000-WRITE-CDSA
S47190         THRU 2600-1000-WRITE-CDSA-X.
S47190
S47190     IF NOT L2600-RETRN-OK
S47190        SET L9E44-RETRN-ERROR      TO TRUE
S47190     END-IF.

       9E44-1205-WRITE-CDSA-X.
           EXIT. 
      /
PNR011*---------------------------
PNR011 9E44-1206-GENERATE-PRTX.
PNR011*---------------------------
PNR011
PNR011**GENERATE THE PRTX ENTRIES**
PNR011     PERFORM  0303-1000-BUILD-PARM-INFO
PNR011         THRU 0303-1000-BUILD-PARM-INFO-X.
PNR011
PNR011     MOVE L9E44-EFF-DT             TO
PNR011                                  L0303-TRNXT-TRXN-EFF-DT.
PNR011     MOVE RPOL-POL-ID                 TO L0303-POL-ID.
PNR011     MOVE RPOL-SBSDRY-CO-ID           TO L0303-SBSDRY-CO-ID.
PNR011     MOVE RPOL-MAT-DEFR-AMT           TO L0303-TRNXT-TRXN-AMT.
PNR011*    MOVE RPOL-MAT-DEFR-INT-AMT       TO L0303-TRNXT-VAR-1-INFO.
PNR011     MOVE L9E44-MAT-DEFR-INT-AMT      TO L0303-TRNXT-VAR-2-INFO.
PNR011     MOVE '1B'                        TO L0303-TRNXT-VAR-1-INFO.
PNR011
PNR011     IF  RPOL-USYS-MIGR-TYP-STR3
PNR011     AND W9E44-SVNG-CVG-YES
PNR011         
PNR011         SET L0303-TRNXT-TYP-SRMPA-NOTI
PNR011                                      TO TRUE
PNR011         SET L0303-SRMPA-DOC          TO TRUE
PNR011     END-IF.
PNR011
PNR011*CREATE THE PRINT EXTRACT
PNR011     PERFORM  0303-1000-WRITE-PRTX-TRAN
PNR011         THRU 0303-1000-WRITE-PRTX-TRAN-X.
PNR011
PNR011     IF NOT L0303-RETRN-OK
PNR011         SET L9E44-RETRN-ERROR         TO TRUE
PNR011     END-IF.
PNR011
PNR011 9E44-1206-GENERATE-PRTX-X.
PNR011     EXIT.
PNR011/
      *****************************************************************
      **                 END OF COPYBOOK CCPP9E44                    **
      *****************************************************************
