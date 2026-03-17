      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM3931.

       COPY XCWWCRHT.
       
      *****************************************************************
      **  MEMBER : ZSBM3931                                          **
      **  REMARKS: APOLOGY REPORT                                    **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
P03931**  30MAR06  CTS    NEW PROGRAM FOR GENERATING A LIST OF       **
      **                  POLICIES, TO WHICH A WRONG NOTICE WAS SENT **
      **                  AS PART OF PROD.BUG P03931. THIS PROGRAM   **
      **                  WILL CHECK THE NECESSARY CONDITIONS FOR    **
      **                  ALL POLICIES IN THE TPOL TABLE.            **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       COPY ZCSS3931.
      /
      **********************
       DATA DIVISION.
      **********************
      
       FILE SECTION.

       COPY ZCSD3931.
       COPY ZCSR3931.
      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM3931'.

       COPY SQLCA.

       COPY XCWL0035.

       COPY ZCSW3931.
      /
      ***  PRINT LINES
       
       01  WS-MAIN-HDG.
           05  WS-CO-ID-H              PIC X(05)
                                       VALUE 'CO_ID'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-POL-ID-H             PIC X(10)
                                       VALUE 'POL_ID    '.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-INSRD-CLI-ID-H       PIC X(12)
                                       VALUE 'INSRD_CLI_ID'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-POL-ISSUE-EFF-DT-H   PIC X(10)
                                       VALUE 'ISS_EFF_DT'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-BASE-PLAN-H          PIC X(07)
                                       VALUE 'PLAN_ID'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-POL-CSTAT-CD-H       PIC X(11)
                                       VALUE 'POL_STAT_CD'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-CLI-BTH-DT-H         PIC X(10)
                                       VALUE 'CLI_BTH_DT'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-BNFY-SEQ-NUM-H       PIC X(07)
                                       VALUE 'SEQ_NUM'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-BNFY-NM-H            PIC X(25)
                                       VALUE 'BNFY_NM                 '.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-BNFY-TYP-CD-H        PIC X(06)
                                       VALUE 'TYP_CD'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-BNFY-DESGNT-CD-H     PIC X(09)
                                       VALUE 'DESGNT_CD'.
           05  FILLER                  PIC X(01) VALUE SPACES.
           05  WS-BNFY-PRCDS-PCT-H     PIC X(09)
                                       VALUE 'PRCDS_PCT'.
            
       01  WS-DET-LINE-OUT.
           05  WS-CO-ID                PIC X(05).
           05  FILLER                  PIC X(01).
           05  WS-POL-ID               PIC X(10).
           05  FILLER                  PIC X(01).
           05  WS-INSRD-CLI-ID         PIC X(12).
           05  FILLER                  PIC X(01).
           05  WS-POL-ISSUE-EFF-DT     PIC X(10).
           05  FILLER                  PIC X(01).
           05  WS-BASE-PLAN            PIC X(07).
           05  FILLER                  PIC X(01).
           05  WS-POL-CSTAT-CD         PIC X(11).
           05  FILLER                  PIC X(01).
           05  WS-CLI-BTH-DT           PIC X(10).
           05  FILLER                  PIC X(01).
           05  WS-BNFY-SEQ-NUM         PIC X(07).
           05  FILLER                  PIC X(01).
           05  WS-BNFY-NM              PIC X(25).
           05  FILLER                  PIC X(01).
           05  WS-BNFY-TYP-CD          PIC X(06).
           05  FILLER                  PIC X(01).
           05  WS-BNFY-DESGNT-CD       PIC X(09).
           05  FILLER                  PIC X(01).
           05  WS-BNFY-PRCDS-PCT       PIC X(09).
           
       01  MISCELLANEOUS.
           05  WS-POL-ISS-EFF-DT.              
               10 WS-POL-ISS-EFF-DT-YY PIC X(04).
               10 FILLER               PIC X(01).
               10 WS-POL-ISS-EFF-DT-MM PIC X(02).
               10 FILLER               PIC X(01).
               10 WS-POL-ISS-EFF-DT-DY PIC X(02).
                 
           05  WS-POLICY-WRITE-IND     PIC X(01) VALUE 'Y'.
               88 WS-POLICY-WRITE-NO   VALUE 'N'.
                 
           05  WS-INS-NUM-IND          PIC X(01) VALUE ' '.
               88 WS-INS-NUM-ZERO      VALUE '0'.
               88 WS-INS-NUM-ONE       VALUE '1'.
               88 WS-INS-NUM-TWO       VALUE '2'.
                  
           05  WS-CLI-ID-FOUND-IND     PIC X(01) VALUE ' '.
               88 WS-CLI-ID-FOUND-YES  VALUE 'Y'.
               88 WS-CLI-ID-FOUND-NO   VALUE 'N'.
                                                  
           05  WS-CVG-ACTIVE-IND       PIC X(01) VALUE ' '.
               88 WS-CVG-ACTIVE-YES    VALUE 'Y'.
               88 WS-CVG-ACTIVE-NO     VALUE 'N'.
                                                   
           05  WS-TEMP-FORMAT-N        PIC S9(03).
           05  WS-TEMP-FORMAT          REDEFINES
               WS-TEMP-FORMAT-N        PIC X(03).
                   
           05  WS-FLEXA-DATE           PIC X(10).
             
           05  WS-CVGS-PLAN-ID         PIC X(06).
               88 WS-CVGS-PLAN-VALUE   VALUE '41900' '42000' '42100'
                                             '42200' '42300' '42400'
                                             '42500' '42600' '42700'
                                             '42800' '43000' '43100'
                                             '43200' '43300' '43400'
                                             '43500' '43600' '43700'
                                             '43800' '43900' '44000'
                                             '44100' '44200' '44300'
                                             '44400' '44500' '44600'
                                             '44700' '44800' '44900'
                                             '45000' '45100' '45200'
                                             '45300' '45400' '45500'
                                             '45600' '45700' '45800' 
                                             '45900' '46000' '46100'
                                             '46200'.
                                              
           05  WS-TEMP-ARRAY                 OCCURS 99 TIMES.
               10 WS-ARRAY-SEQ-REC-INFO. 
                  15 WS-ARRAY-CLI-ID         PIC X(10).
                  15 WS-ARRAY-BNFY-NM        PIC X(25).
                  15 WS-ARRAY-BNFY-SEQ-NUM   PIC X(03).
                  15 WS-ARRAY-BNFY-TYP-CD    PIC X(01).
                  15 WS-ARRAY-BNFY-DESGNT-CD PIC X(01).
                  15 WS-ARRAY-BNFY-PRCDS-PCT PIC X(03).
                  15 WS-ARRAY-INSRD-IND      PIC X(01) VALUE SPACES.
                     88 WS-ARRAY-INSRD-SECOND VALUE '1'.
                     88 WS-ARRAY-INSRD-THIRD  VALUE '2'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
       COPY XCWTFCMD.
      /
       COPY XCWWWKDT.
       COPY XCWLDTLK.
      /
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
       COPY XCWL1680.
       COPY XCWL1670. 
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY CCFWCVG.
       COPY CCFRCVG.
       COPY CCWWCVGS.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWCVGC.
       COPY CCFRCVGC.
      /
       COPY CCFWBENE.
       COPY CCFRBENE.
      /
       COPY CCFWCLI.
       COPY CCFRCLI.
      /
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0290.
      /
       COPY XCWL1640.
      /
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

           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.

           IF  WPOL-IO-OK  
             
               PERFORM  3000-PROCESS-RECORDS
                   THRU 3000-PROCESS-RECORDS-X
                   UNTIL WPOL-IO-EOF

           END-IF.
                    
           PERFORM  POL-3000-TBL-END-BROWSE
               THRU POL-3000-TBL-END-BROWSE-X.
                                           
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  3931-4000-OPEN-OUTPUT
               THRU 3931-4000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       2000-INITIALIZE.
      *----------------

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

      **** INITIALIZE OCF HEADINGS ****

      * GET THE SYSTEM ID***
           MOVE 'XS00000145'           TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
               
      * GET THE DETAIL HEADINGS 'ERROR MESSAGES'***
           MOVE 'XS00000019'           TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
               
      * WRITE THE HEADER FIRST  
         
           MOVE WS-MAIN-HDG            TO R3931-SEQ-REC-INFO.
             
           PERFORM  3931-2000-WRITE
               THRU 3931-2000-WRITE-X.
                 
      * START BROWSING POLICY TABLE                                             

           MOVE LOW-VALUES             TO WPOL-KEY.        
           MOVE HIGH-VALUES            TO WPOL-ENDBR-KEY.  
            
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

           IF  NOT WPOL-IO-OK
               
               PERFORM  POL-3000-TBL-END-BROWSE
                   THRU POL-3000-TBL-END-BROWSE-X
                            
      ** MSG: 'NO RECORDS TO PROCESS IN POLICY TABLE'
               MOVE 'ZS39310001'       TO WGLOB-MSG-REF-INFO 

               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X 
       
               GO TO 2000-INITIALIZE-X
                 
           END-IF.

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
 
       2000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       3000-PROCESS-RECORDS.
      *---------------------
                   
           PERFORM  4000-PRCES-INDV-POLICY
               THRU 4000-PRCES-INDV-POLICY-X.

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
                
       3000-PROCESS-RECORDS-X.
           EXIT.
      /
      *-----------------------
       4000-PRCES-INDV-POLICY.
      *-----------------------
 
           INITIALIZE WS-FLEXA-DATE.
           INITIALIZE WS-INS-NUM-IND.
           INITIALIZE WS-POLICY-WRITE-IND.
           
           MOVE SPACES                      TO WS-DET-LINE-OUT.
           MOVE ZERO                        TO JJ.
            
           IF  RPOL-POL-ISS-EFF-DT >= '2004-12-30'
               GO TO 4000-PRCES-INDV-POLICY-X
           END-IF.
              
           MOVE RPOL-POL-ISS-EFF-DT         TO WS-POL-ISS-EFF-DT. 
                 
      * MOST OF THE 'IF' CONDITION HAS GOT AN 'ELSE' CONDITION ALSO
      * FOR BETTER UNDERSTANDING OF CODE.
                                           
      * SKIP THIS POLICY IF POL-ISS-EFF-DT NOT BETWEEN OCT 9TH AND
      * DEC 29TH.
          
           IF  (WS-POL-ISS-EFF-DT-MM = '10'  
           AND WS-POL-ISS-EFF-DT-DY >= '09') 
           OR  WS-POL-ISS-EFF-DT-MM  = '11'
           OR  (WS-POL-ISS-EFF-DT-MM = '12'
           AND WS-POL-ISS-EFF-DT-DY <= '29')
               CONTINUE
           ELSE
               GO TO 4000-PRCES-INDV-POLICY-X 
           END-IF.
              
           PERFORM  4100-CALC-FLEXA-DATE 
               THRU 4100-CALC-FLEXA-DATE-X.
                              
           IF  WS-POLICY-WRITE-NO
               GO TO 4000-PRCES-INDV-POLICY-X
           END-IF.
                     
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
                                                  
           PERFORM  4200-INIT-CLI-ARRAY 
               THRU 4200-INIT-CLI-ARRAY-X
               VARYING I FROM 1 BY 1
               UNTIL   I > 99.
                                
           PERFORM  4300-CHECK-MED-RIDERS
               THRU 4300-CHECK-MED-RIDERS-X
               VARYING I FROM 1 BY 1
               UNTIL   I > RPOL-POL-CVG-REC-CTR-N.
                 
      * THE COUNTER JJ WILL GET UPDATED FOR EVERY UNIQUE INSURED 
      * IN THE ARRAY. POLICY SHOULD BE CAPTURED ONLY IF THE 
      * NUMBER OF UNIQUE INSUREDS >= 3
        
           IF  JJ < 3
               GO TO 4000-PRCES-INDV-POLICY-X
           EXIT.

      * IF THE DEATH BENEFICIARY NAME OF ALL THE THIRD AND DOWNWARD
      * INSURED'S ARE SPACES, THEN EXCLUDE SUCH POLICIES.
                                                           
           MOVE ZERO                        TO J.
           MOVE ZERO                        TO JJ.
           PERFORM  6000-CHECK-THIRD-INSRDS  
               THRU 6000-CHECK-THIRD-INSRDS-X
               VARYING I FROM 1 BY 1                               
               UNTIL WS-ARRAY-CLI-ID (I) = SPACES.
                 
           IF  JJ = J
           AND I >= 4
               GO TO 4000-PRCES-INDV-POLICY-X
           END-IF.
                    
           PERFORM  8000-WRITE-RECS
               THRU 8000-WRITE-RECS-X
               VARYING I FROM 1 BY 1
               UNTIL WS-ARRAY-CLI-ID (I) = SPACES. 

       4000-PRCES-INDV-POLICY-X.
           EXIT.
      /
      *---------------------
       4100-CALC-FLEXA-DATE.
      *--------------------- 
           
      * POL-PREV-ANN-DUR IS ADDED TO ISS-EFF-DT TO GET THE FLEXA
      * DATE OF THE POLICY.
                             
           MOVE RPOL-POL-ISS-EFF-DT         TO L1680-INTERNAL-1.
           MOVE RPOL-POL-PREV-ANNV-DUR-N    TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                        TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.
            
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
                
           IF  L1680-VALID
               MOVE L1680-INTERNAL-2        TO WS-FLEXA-DATE
           ELSE 
               SET  WS-POLICY-WRITE-NO      TO TRUE
               GO TO 4100-CALC-FLEXA-DATE-X
           END-IF.
                    
           IF  RPOL-POL-STAT-PREM-PAYING
           OR  (RPOL-POL-STAT-LAPSED
           AND RPOL-POL-STAT-CHNG-DT > WS-FLEXA-DATE
           AND RPOL-POL-PREV-STAT-PREM-PAY)
               CONTINUE 
           ELSE 
               SET  WS-POLICY-WRITE-NO      TO TRUE 
           END-IF.
          
       4100-CALC-FLEXA-DATE-X.
           EXIT.
      /
      *--------------------
       4200-INIT-CLI-ARRAY.
      *--------------------
       
           MOVE SPACES                  TO WS-ARRAY-CLI-ID (I).          
           MOVE SPACES                  TO WS-ARRAY-BNFY-NM (I).     
           MOVE SPACES                  TO WS-ARRAY-BNFY-SEQ-NUM (I). 
           MOVE SPACES                  TO WS-ARRAY-BNFY-TYP-CD (I).    
           MOVE SPACES                  TO WS-ARRAY-BNFY-DESGNT-CD (I).  
           MOVE SPACES                  TO WS-ARRAY-BNFY-PRCDS-PCT (I).  
            
       4200-INIT-CLI-ARRAY-X.
           EXIT.
      /
      *----------------------
       4300-CHECK-MED-RIDERS.
      *----------------------

      * START BROWSING THE TCVGC TABLE FOR EVERY POLICY-ID AND  
      * CVG-NUM COMBINATION.
                              
           MOVE LOW-VALUES             TO WCVGC-KEY. 
           MOVE RPOL-POL-ID            TO WCVGC-POL-ID.
           MOVE I                      TO WCVGC-CVG-NUM-N.
           MOVE WCVGC-KEY              TO WCVGC-ENDBR-KEY.
           MOVE HIGH-VALUES            TO WCVGC-ENDBR-CVG-CLI-REL-TYP-CD.
           MOVE HIGH-VALUES            TO WCVGC-ENDBR-INSRD-CLI-ID.
                    
           PERFORM  CVGC-1000-BROWSE
               THRU CVGC-1000-BROWSE-X.
                 
           IF  NOT WCVGC-IO-OK
            
               SET  WS-POLICY-WRITE-NO TO TRUE  
                
               PERFORM  CVGC-3000-END-BROWSE
                   THRU CVGC-3000-END-BROWSE-X
                                                
               GO TO 4300-CHECK-MED-RIDERS-X 
                 
           END-IF.
              
           PERFORM  CVGC-2000-READ-NEXT
               THRU CVGC-2000-READ-NEXT-X.
                                            
           IF  WCVGC-IO-OK                                   
                 
               PERFORM  4310-BROWSE-THRU-CVGC   
                   THRU 4310-BROWSE-THRU-CVGC-X  
                   UNTIL WCVGC-IO-EOF   
                     
           END-IF.
                    
           PERFORM  CVGC-3000-END-BROWSE
               THRU CVGC-3000-END-BROWSE-X.
                 
       4300-CHECK-MED-RIDERS-X.
           EXIT.
      /
      *----------------------
       4310-BROWSE-THRU-CVGC.
      *----------------------

      * EXCLUDE THE POLICY ITSELF WHEN THE SECOND INSURED
      * HAS ONLY MEDICAL RIDERS

           IF  RCVGC-CVG-NUM = '01'
               IF  RCVGC-CVG-CLI-REL-TYP-CD = 'P'
      **           PRIMARY INSURED
                   SET  WS-INS-NUM-ZERO     TO TRUE
               ELSE
      **           SECOND INSURED
                   SET  WS-INS-NUM-ONE      TO TRUE
               END-IF
           ELSE
      **       OTHER INSURED
               SET  WS-INS-NUM-TWO          TO TRUE
           END-IF.

           IF  WS-INS-NUM-ONE
           AND WCVGS-PLAN-ID (I)             = WS-CVGS-PLAN-ID

               SET  WS-POLICY-WRITE-NO      TO TRUE

           END-IF.
              
      * ONLY RIDERS WHICH WERE NOT SURRENDERED DURING FLEXA
      * REPORT DATE SHOULD BE CAPTURED.
                                         
           IF  WCVGS-CVG-STAT-PREM-PAYING (I)
           OR  (WCVGS-CVG-STAT-SURRENDERED (I)
           AND WCVGS-CVG-PREV-STAT-PREM-PAY (I)
           AND WCVGS-CVG-STAT-EFF-DT (I) > WS-FLEXA-DATE)
               SET  WS-CVG-ACTIVE-YES       TO TRUE
           ELSE
               SET  WS-CVG-ACTIVE-NO        TO TRUE
           END-IF.

           IF  NOT WS-POLICY-WRITE-NO  
           AND WS-CVG-ACTIVE-YES
             
               PERFORM  5000-UPDATE-CLI-ARRAY
                   THRU 5000-UPDATE-CLI-ARRAY-X
                     
           END-IF.
                    
           PERFORM  CVGC-2000-READ-NEXT
               THRU CVGC-2000-READ-NEXT-X.
                                            
       4310-BROWSE-THRU-CVGC-X.
           EXIT.
      /
      *----------------------
       5000-UPDATE-CLI-ARRAY.
      *----------------------
           
           INITIALIZE WS-CLI-ID-FOUND-IND.
                                          
      * MATCH THE CURRENT CLIENT-ID WITH THE EXISTING CLIENT-ID'S 
      * IN THE ARRAY. UPDATE THE ARRAY ONLY IF A MATCH IS NOT 
      * FOUND. FOR POLICIES WITH SECOND INSURED, IT IS ENOUGH IF 
      * WE UPDATE THE ARRAY WITH HIS/HER INFORMATION.
        
           PERFORM  5100-CHECK-CLI-ARRAY
               THRU 5100-CHECK-CLI-ARRAY-X
               VARYING J FROM 1 BY 1
               UNTIL WS-CLI-ID-FOUND-YES
               OR WS-CLI-ID-FOUND-NO.
                 
           IF  WS-CLI-ID-FOUND-NO
            
               PERFORM  5200-GET-BENE-DETAILS
                   THRU 5200-GET-BENE-DETAILS-X
                     
           END-IF.
             
       5000-UPDATE-CLI-ARRAY-X.
           EXIT.
      /
      *---------------------
       5100-CHECK-CLI-ARRAY.
      *---------------------
        
           IF  RCVGC-INSRD-CLI-ID = WS-ARRAY-CLI-ID (J)
            
               SET  WS-CLI-ID-FOUND-YES     TO TRUE
                 
           ELSE
            
               IF  WS-ARRAY-CLI-ID (J)       = SPACES
                    
                   SET  WS-CLI-ID-FOUND-NO  TO TRUE     
                   ADD  +1                  TO JJ
               
               END-IF
                       
           END-IF.
             
       5100-CHECK-CLI-ARRAY-X.
           EXIT.
      /
      *----------------------
       5200-GET-BENE-DETAILS.
      *----------------------
           
           MOVE RPOL-POL-ID                 TO WBENE-POL-ID.
           MOVE RCVGC-INSRD-CLI-ID          TO WBENE-INSRD-CLI-ID.
           MOVE ZERO                        TO WBENE-BNFY-SEQ-NUM.
           MOVE WBENE-KEY                   TO WBENE-ENDBR-KEY.
           MOVE 999                         TO WBENE-ENDBR-BNFY-SEQ-NUM.

           PERFORM  BENE-1000-BROWSE
               THRU BENE-1000-BROWSE-X.

           IF  WBENE-IO-OK

               PERFORM  BENE-2000-READ-NEXT
                   THRU BENE-2000-READ-NEXT-X
                     
               IF  WBENE-IO-OK
                
                   COMPUTE J = J - 2
                                      
                   PERFORM  5210-READ-THRU-BENE
                       THRU 5210-READ-THRU-BENE-X
                       UNTIL WBENE-IO-EOF                            
                         
               END-IF 
                        
           END-IF.

           PERFORM  BENE-3000-END-BROWSE
               THRU BENE-3000-END-BROWSE-X.

       5200-GET-BENE-DETAILS-X.
           EXIT.
      /
      *-------------------- 
       5210-READ-THRU-BENE.
      *--------------------
       
           COMPUTE J = J + 1.  
                            
           MOVE SPACES
             TO WS-ARRAY-SEQ-REC-INFO (J).
           MOVE RCVGC-INSRD-CLI-ID               TO WS-ARRAY-CLI-ID (J).
           MOVE RBENE-BNFY-NM                    TO WS-ARRAY-BNFY-NM (J).
           MOVE RBENE-BNFY-SEQ-NUM                                 
             TO WS-TEMP-FORMAT-N.
           MOVE WS-TEMP-FORMAT
             TO WS-ARRAY-BNFY-SEQ-NUM (J).
           MOVE RBENE-BNFY-TYP-CD
             TO WS-ARRAY-BNFY-TYP-CD (J).
           MOVE RBENE-BNFY-DESGNT-CD
             TO WS-ARRAY-BNFY-DESGNT-CD (J).
           MOVE RBENE-BNFY-PRCDS-PCT
             TO WS-TEMP-FORMAT-N.
           MOVE WS-TEMP-FORMAT
             TO WS-ARRAY-BNFY-PRCDS-PCT (J).
             
      * IDENTIFY THE SECOND INSURED.

           IF  WS-INS-NUM-ONE
               SET  WS-ARRAY-INSRD-SECOND (J)    TO TRUE
           ELSE

      * IDENTIFY THE THIRD INSURED

               IF  WS-INS-NUM-TWO
                   SET  WS-ARRAY-INSRD-THIRD (J) TO TRUE
               ELSE
                   MOVE SPACES
                     TO WS-ARRAY-INSRD-IND (J)
               END-IF

           END-IF.

           PERFORM  BENE-2000-READ-NEXT
               THRU BENE-2000-READ-NEXT-X.
                                            
       5210-READ-THRU-BENE-X.
           EXIT.
      /
      *------------------------
       6000-CHECK-THIRD-INSRDS.
      *------------------------
             
           IF  WS-ARRAY-INSRD-THIRD (I)
               ADD +1                   TO J
           END-IF.
             
           IF  WS-ARRAY-INSRD-THIRD (I) 
           AND WS-ARRAY-BNFY-NM (I) = SPACES
               ADD +1                   TO JJ
           END-IF.
             
       6000-CHECK-THIRD-INSRDS-X.
           EXIT.
      /
      *----------------
       8000-WRITE-RECS.
      *----------------
        
      * ONLY SECOND INSURED'S INFORMATION IS REQUIRED TO BE WRITTEN 
      * ON THE FILE.
        
           IF  NOT WS-ARRAY-INSRD-SECOND (I)
               GO TO 8000-WRITE-RECS-X
           END-IF.
                    
           MOVE SPACES                  TO R3931-SEQ-REC-INFO.

           MOVE RPOL-POL-ID             TO WS-POL-ID.
           MOVE RPOL-CO-ID              TO WS-CO-ID.
           MOVE WS-ARRAY-CLI-ID (I)     TO WS-INSRD-CLI-ID.
           MOVE RPOL-POL-ISS-EFF-DT     TO WS-POL-ISSUE-EFF-DT.
           MOVE RPOL-PLAN-ID            TO WS-BASE-PLAN.
           MOVE RPOL-POL-CSTAT-CD       TO WS-POL-CSTAT-CD.
           MOVE WS-ARRAY-BNFY-SEQ-NUM (I)
             TO WS-BNFY-SEQ-NUM.
           MOVE WS-ARRAY-BNFY-NM (I)
             TO WS-BNFY-NM.
           MOVE WS-ARRAY-BNFY-TYP-CD (I)
             TO WS-BNFY-TYP-CD.
           MOVE WS-ARRAY-BNFY-DESGNT-CD (I)
             TO WS-BNFY-DESGNT-CD.
           MOVE WS-ARRAY-BNFY-PRCDS-PCT (I)
             TO WS-BNFY-PRCDS-PCT.

           MOVE WS-ARRAY-CLI-ID (I)     TO WCLI-CLI-ID.

           PERFORM  CLI-1000-READ
               THRU CLI-1000-READ-X.

           IF  WCLI-IO-OK
               MOVE RCLI-CLI-BTH-DT     TO WS-CLI-BTH-DT
           END-IF.

           MOVE  WS-DET-LINE-OUT        TO R3931-SEQ-REC-INFO.
             
           PERFORM  3931-2000-WRITE
               THRU 3931-2000-WRITE-X.
      
       8000-WRITE-RECS-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
        
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
                  
           PERFORM  3931-5000-CLOSE
               THRU 3931-5000-CLOSE-X.
                
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
                 
       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY CCPPCCC.
       COPY NCPPCVGS.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
      /
       COPY XCPL0035.
       COPY XCPL0260.
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
       COPY XCPL1680.
      /
       COPY XCPL0030.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULE                                      *
      *****************************************************************
      /
       COPY CCPTPOL.
      /
       COPY CCPBCVGC.
      /
       COPY CCPBBENE.
      /
       COPY CCPNCLI.
      /
       COPY CCPNCVG.
      /
       COPY ZCPI3931.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      *****************************************************************
      **                 END OF PROGRAM ZSBM3931                     **
      *****************************************************************
