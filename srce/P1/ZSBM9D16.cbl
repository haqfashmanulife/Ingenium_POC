      *****************************************************************
      **  MEMBER :  ZSBM9D16                                         **
      **  REMARKS:  CREATES CAPL RECORDS FOR THE APL POLICIES        **
      **            WITH APL AMOUNT IN TPOLL GREATER THAN ZEROS      **
      **                                                             **
      **  DOMAIN :  AG                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
M166T2**  02OCT10  CTS    INITIAL VERSION                            **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9D16.

       COPY XCWWCRHT.
      /
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9D16'.
      /
       COPY SQLCA.
       01  WS-PGM-WORK-AREA.
       
           05  WS-USER-M166T2                        PIC X(08)
                                                     VALUE 'M166T2'.
           05  WS-INPUT-REC-INFO                     PIC X(40).
           05  WS-COMM-BAL-AMT                       PIC S9(13)V99 
                                                     COMP-3.
           05  WS-REPAY-AMT                          PIC S9(13)V99 
                                                     COMP-3.
           05  WS-REPAY-MODE                         PIC 9(02).
           05  WS-PAR-REPAY-AMT                      PIC S9(13)V99 
                                                     COMP-3.
           05  WS-COMM-PAYBL-AMT                     PIC S9(13)V99 
                                                     COMP-3.
           05  WS-INT-AMT                            PIC S9(13)V9(02) 
                                                     COMP-3.
           05  WS-LOAN-INCR-DECR-AMT                 PIC S9(13)V9(02) 
                                                     COMP-3.
           05  WS-LOAN-INT-AMT                       PIC S9(13)V9(02) 
                                                     COMP-3.
           05  WS-POL-LOAN-TRXN-AMT                  PIC S9(13)V9(02) 
                                                     COMP-3.
           05  WS-REPAY-IND                          PIC X(01).
               88  WS-REPAY-YES                      VALUE 'Y'.
               88  WS-REPAY-NO                       VALUE 'N'.
           05  WS-CAPL-REC-IND                       PIC X(01).
               88  WS-CAPL-REC-FOUND                 VALUE 'Y'.
               88  WS-CAPL-REC-FOUND-NO              VALUE 'N'.
           05  WS-PREV-COMM-PAY-STAT-CD              PIC X(01).
               88 WS-PREV-COMM-PAY-STAT-ACTIVE       VALUE 'A'.
               88 WS-PREV-COMM-PAY-STAT-REVERSED     VALUE 'R'.
       01  WS-MSGS-TXT                               PIC X(80).
               88  WS-MSGS-ZS9D160001                    VALUE
              'ONE-TIME TRANSITION JOB WHICH CREATES CAPL RECORDS'.
               88  WS-MSGS-ZS9D160002                    VALUE
              'NO RECORDS TO PROCESS'.
               88  WS-MSGS-ZS9D160003                    VALUE
              'PROCESSING POLICY NO '. 
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY CCFWCAPL.   
       COPY CCFRCAPL.
      /       
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFRLHST.
       COPY CCFWLHST.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    9D16
                               ==':ID:'==  BY =='9D16'==.
      /
       COPY ZCSR9D16.
      /
      ***********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ***********************************************************   
       COPY XCWL1680.
       COPY XCWL1670.
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0035.
      /
       COPY XCWL0040.
      /
       COPY XCWL1660.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      /
      *--------------
       0000-MAINLINE.
      *--------------
        
           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.
      
           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.
      
           PERFORM  2000-PRCES-INPUT-RECORDS
               THRU 2000-PRCES-INPUT-RECORDS-X
               UNTIL W9D16-SEQ-IO-EOF.    
                     
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
      
           PERFORM  9D16-1000-OPEN-INPUT
               THRU 9D16-1000-OPEN-INPUT-X.
      
       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE WPGWS-CRNT-PGM-ID           TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-0000-INIT-PARM-INFO
               THRU 0010-0000-INIT-PARM-INFO-X.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

      ***  GET THE SYSTEM ID ***
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

      *** GET THE PROGRAM DESCRIPTION ***
           SET  WS-MSGS-ZS9D160001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.

           MOVE ZERO                        TO L0040-ERROR-CNT.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE WS-USER-M166T2              TO WGLOB-USER-ID.

           PERFORM  9D16-1000-READ
               THRU 9D16-1000-READ-X.

           IF  NOT W9D16-SEQ-IO-OK
      *MSG: NO RECORDS TO PROCESS
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9D160002      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.

       1000-INITIALIZE-X.
           EXIT.
      /
      *-------------------------
       2000-PRCES-INPUT-RECORDS.
      *-------------------------
      
           INITIALIZE WS-INPUT-REC-INFO.
           INITIALIZE WS-PGM-WORK-AREA.
           INITIALIZE WCAPL-KEY.
           INITIALIZE RCAPL-REC-INFO.
           
           MOVE R9D16-SEQ-REC-INFO          TO WS-INPUT-REC-INFO.
      
      *MSG: PROCESSING POLICY NO @1
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9D160003          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  R9D16-POL-ID              INTO L0040-INPUT-LINE.
                  
           PERFORM  0040-3000-WRITE-OTHER      
               THRU 0040-3000-WRITE-OTHER-X.       
                  
           MOVE R9D16-POL-ID                TO WPOL-POL-ID.
                
           PERFORM  POL-1000-READ       
               THRU POL-1000-READ-X.
               
           IF RPOL-POL-CSTAT-CD = 'E'
           OR R9D16-LOAN-STAT-CD = 'R'
              MOVE RPOL-POL-PREV-MPREM-AMT  TO 
                    RPOL-POL-MPREM-AMT
           END-IF.         
           
           IF  ( R9D16-LOAN-TRXN-CD = 'F' 
           OR   R9D16-LOAN-TRXN-CD = 'H')
           AND R9D16-LOAN-STAT-CD = 'R'
               PERFORM 9D16-1000-READ
                  THRU 9D16-1000-READ-X
           GO TO 2000-PRCES-INPUT-RECORDS-X
           END-IF.
           
           MOVE R9D16-POL-ID                 TO WLHST-POL-ID.
           MOVE 'A'                          TO WLHST-POL-LOAN-ID.
           MOVE R9D16-LOAN-EFF-DT            TO WLHST-POL-LOAN-EFF-DT
           MOVE R9D16-LOAN-SEQ-NUM           TO WLHST-POL-LOAN-SEQ-NUM.
           
           PERFORM  LHST-1000-READ
               THRU LHST-1000-READ-X.
                
           MOVE  RLHST-LOAN-INCR-DECR-AMT   TO WS-LOAN-INCR-DECR-AMT.
           MOVE  RLHST-LOAN-INT-AMT         TO WS-LOAN-INT-AMT.
           MOVE  RLHST-POL-LOAN-TRXN-AMT    TO
                                            WS-POL-LOAN-TRXN-AMT.
                
           PERFORM  3000-PROCESS-CAPL-REC
               THRU 3000-PROCESS-CAPL-REC-X.
          
            PERFORM 9D16-1000-READ
               THRU 9D16-1000-READ-X.

       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *-----------------------
       3000-PROCESS-CAPL-REC.
      *-----------------------
           
      ** IF THE POLICY HAS NEW APL AND ADITIONAL APL
       
           IF  (R9D16-LOAN-TRXN-CD = 'N'
           OR   R9D16-LOAN-TRXN-CD = 'S')
           AND  R9D16-LOAN-STAT-CD = 'A'
               PERFORM  3100-CREAT-CAPL-REC
                   THRU 3100-CREAT-CAPL-REC-X
               GO TO 3000-PROCESS-CAPL-REC-X
           END-IF.
           
      ** IF THE POLICY HAS APL REVERSAL
       
           IF  R9D16-LOAN-TRXN-CD = 'N'
           AND R9D16-LOAN-STAT-CD = 'R'
               PERFORM  3400-UPDT-CAPL-APL-REV
                   THRU 3400-UPDT-CAPL-APL-REV-X
               GO TO 3000-PROCESS-CAPL-REC-X
           END-IF.
           
      ** IF THE POLICY HAS APL INTEREST CAPTALIZATION
       
           IF  R9D16-LOAN-TRXN-CD = 'X'
           AND R9D16-LOAN-STAT-CD = 'A'
               PERFORM  3500-UPDT-CAPL-APL-INT
                   THRU 3500-UPDT-CAPL-APL-INT-X
               GO TO 3000-PROCESS-CAPL-REC-X
           END-IF.
           
      ** IF THE POLICY IS REPAYMENT AND ACTIVE
       
           IF  (R9D16-LOAN-TRXN-CD = 'P'
           OR   R9D16-LOAN-TRXN-CD = 'F'
           OR   R9D16-LOAN-TRXN-CD = 'H')
           AND  R9D16-LOAN-STAT-CD = 'A'
               PERFORM  3600-UPDT-CAPL-REP-REC
                   THRU 3600-UPDT-CAPL-REP-REC-X
               GO TO 3000-PROCESS-CAPL-REC-X 
           END-IF.
          
       3000-PROCESS-CAPL-REC-X.
           EXIT.
      /
      *---------------------
       3100-CREAT-CAPL-REC.
      *---------------------
     
      ** BUILD KEYS TO BROWSE TATXN TO POPULATE THE SEQUENCE NUMBER
       
           
           PERFORM  3200-GET-CAPL-SEQ-NUM
               THRU 3200-GET-CAPL-SEQ-NUM-X.
                     
           COMPUTE WCAPL-SEQ-NUM = WCAPL-SEQ-NUM + 1.
           
           IF WS-CAPL-REC-FOUND
           AND NOT R9D16-LOAN-TRXN-CD = 'S'
               MOVE LOW-VALUES                  TO WCAPL-KEY
               MOVE HIGH-VALUES                 TO WCAPL-ENDBR-KEY
               
               MOVE R9D16-POL-ID                TO WCAPL-POL-ID
                                                WCAPL-ENDBR-POL-ID
                                                
               MOVE 999                         TO WCAPL-ENDBR-SEQ-NUM
               MOVE ZEROES                      TO WCAPL-SEQ-NUM
               
               PERFORM  CAPL-1000-BROWSE
                   THRU CAPL-1000-BROWSE-X
                   
               IF NOT WCAPL-IO-OK
                  GO TO 3100-CREAT-CAPL-REC-X
               END-IF
                      
               PERFORM  CAPL-2000-READ-NEXT   
                   THRU CAPL-2000-READ-NEXT-X 
               
               IF  WCAPL-IO-OK   
                   MOVE RCAPL-SEQ-NUM        TO WCAPL-SEQ-NUM
                   MOVE RCAPL-POL-ID         TO WCAPL-POL-ID
               ELSE   
                   PERFORM  CAPL-3000-END-BROWSE   
                       THRU CAPL-3000-END-BROWSE-X   
                   GO TO 3100-CREAT-CAPL-REC-X   
               END-IF
               
               PERFORM  CAPL-3000-END-BROWSE  
                   THRU CAPL-3000-END-BROWSE-X
                   
               PERFORM  CAPL-1000-READ-FOR-UPDATE
                   THRU CAPL-1000-READ-FOR-UPDATE-X
                   
               IF NOT WCAPL-IO-OK
                  GO TO 3100-CREAT-CAPL-REC-X
               END-IF
               
               MOVE R9D16-POL-ID            TO RCAPL-POL-ID
               SET  RCAPL-COMM-PAY-STAT-ACTIVE
                                            TO TRUE
               MOVE SPACES                  TO 
                                           RCAPL-PREV-COMM-PAY-STAT-CD                                            
               IF  R9D16-LOAN-STAT-CD = 'R'
                   SET  RCAPL-COMM-PAY-STAT-REVERSED  
                                            TO TRUE
                   MOVE 'A'                 TO 
                                           RCAPL-PREV-COMM-PAY-STAT-CD
               END-IF                                            
               MOVE R9D16-LOAN-EFF-DT       TO RCAPL-APL-EFF-DT
               MOVE RPOL-POL-BILL-MODE-CD   TO RCAPL-POL-BILL-MODE-CD
               MOVE RPOL-POL-MPREM-AMT      TO RCAPL-POL-MPREM-AMT
               MOVE WS-LOAN-INCR-DECR-AMT   TO RCAPL-COMM-PAYBL-AMT
               MOVE ZEROES                  TO 
                                           RCAPL-PREV-COMM-PAYBL-AMT
               MOVE ZEROES                  TO RCAPL-COMM-BAL-AMT
               MOVE ZEROES                  TO 
                                           RCAPL-PREV-COMM-BAL-AMT
               
               PERFORM  3300-GET-APL-PD-TO-DT
                   THRU 3300-GET-APL-PD-TO-DT-X
         
               PERFORM  CAPL-2000-REWRITE
                   THRU CAPL-2000-REWRITE-X
           ELSE
               MOVE R9D16-POL-ID            TO RCAPL-POL-ID
               SET  RCAPL-COMM-PAY-STAT-ACTIVE
                                            TO TRUE
               MOVE SPACES                  TO 
                                           RCAPL-PREV-COMM-PAY-STAT-CD                  
               IF  R9D16-LOAN-STAT-CD = 'R'
                   SET  RCAPL-COMM-PAY-STAT-REVERSED  
                                            TO TRUE
                   MOVE 'A'                 TO 
                                           RCAPL-PREV-COMM-PAY-STAT-CD
               END-IF                                                                                     
               MOVE R9D16-LOAN-EFF-DT       TO RCAPL-APL-EFF-DT
               MOVE RPOL-POL-BILL-MODE-CD   TO RCAPL-POL-BILL-MODE-CD
               MOVE RPOL-POL-MPREM-AMT      TO RCAPL-POL-MPREM-AMT
               MOVE WS-LOAN-INCR-DECR-AMT   TO RCAPL-COMM-PAYBL-AMT
               MOVE ZEROES                  TO 
                                         RCAPL-PREV-COMM-PAYBL-AMT
               MOVE ZEROES                  TO RCAPL-COMM-BAL-AMT
               MOVE ZEROES                  TO 
                                         RCAPL-PREV-COMM-BAL-AMT
           
               PERFORM  3300-GET-APL-PD-TO-DT
                   THRU 3300-GET-APL-PD-TO-DT-X
         
               PERFORM  CAPL-1000-WRITE
                   THRU CAPL-1000-WRITE-X
           END-IF.
         
       3100-CREAT-CAPL-REC-X.
           EXIT.
      /
      *-----------------------
       3200-GET-CAPL-SEQ-NUM.
      *-----------------------
      
      
           MOVE HIGH-VALUES                 TO WCAPL-KEY.
           MOVE LOW-VALUES                  TO WCAPL-ENDBR-KEY.
      
           MOVE R9D16-POL-ID                TO WCAPL-POL-ID
                                            WCAPL-ENDBR-POL-ID.
                                            
           MOVE ZERO                        TO WCAPL-ENDBR-SEQ-NUM.
           MOVE 999                         TO WCAPL-SEQ-NUM.
        
           PERFORM  CAPL-1000-BROWSE-PREV
               THRU CAPL-1000-BROWSE-PREV-X.
                          
           IF NOT WCAPL-IO-OK
               MOVE '000'                   TO WCAPL-SEQ-NUM
               SET WS-CAPL-REC-FOUND-NO     TO TRUE
           ELSE
               PERFORM  CAPL-2000-READ-PREV
                   THRU CAPL-2000-READ-PREV-X
                         
               IF  WCAPL-IO-OK
                   MOVE RCAPL-SEQ-NUM       TO WCAPL-SEQ-NUM
                   SET WS-CAPL-REC-FOUND    TO TRUE
               ELSE
                   MOVE '000'               TO WCAPL-SEQ-NUM
                   SET WS-CAPL-REC-FOUND-NO TO TRUE
               END-IF
                     
               PERFORM  CAPL-3000-END-BROWSE-PREV
                   THRU CAPL-3000-END-BROWSE-PREV-X
                     
           END-IF.
      
       3200-GET-CAPL-SEQ-NUM-X.
           EXIT.
      /
      *------------------------
       3300-GET-APL-PD-TO-DT.
      *------------------------
      
           IF  RPOL-POL-BILL-MODE-MONTHLY
               MOVE RCAPL-APL-EFF-DT        TO L1680-INTERNAL-1
               MOVE ZERO                    TO L1680-INT-DD-1
               MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
               MOVE 01                      TO L1680-NUMBER-OF-MONTHS
               MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X
               MOVE RPOL-POL-ISS-EFF-DT-DY  TO L1680-INT-DD-2   
               MOVE L1680-INTERNAL-2        TO RCAPL-APL-PD-TO-DT
           END-IF.
           
           IF  RPOL-POL-BILL-MODE-SEMI-ANN           
           OR  RPOL-POL-BILL-MODE-ANNUALLY        
               MOVE RCAPL-APL-EFF-DT        TO L1680-INTERNAL-1      
               MOVE ZERO                    TO L1680-INT-DD-1                   
               MOVE ZERO                    TO L1680-NUMBER-OF-DAYS      
               MOVE 02                      TO L1680-NUMBER-OF-MONTHS      
               MOVE ZERO                    TO L1680-NUMBER-OF-YEARS      
               PERFORM  1680-4000-SUB-YMD-FROM-DATE      
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X
               MOVE RPOL-POL-ISS-EFF-DT-DY  TO L1680-INT-DD-2 
               MOVE L1680-INTERNAL-2        TO RCAPL-APL-PD-TO-DT
           END-IF.
           
       3300-GET-APL-PD-TO-DT-X.
           EXIT.
      /
      *------------------------ 
       3400-UPDT-CAPL-APL-REV.
      *------------------------
      
      	   MOVE LOW-VALUES                  TO WCAPL-KEY.
           MOVE HIGH-VALUES                 TO WCAPL-ENDBR-KEY.
           
           MOVE R9D16-POL-ID                TO WCAPL-POL-ID
                                            WCAPL-ENDBR-POL-ID.
           MOVE 999                         TO WCAPL-ENDBR-SEQ-NUM.
           MOVE ZERO                        TO WCAPL-SEQ-NUM.
           
           PERFORM  CAPL-1000-BROWSE
               THRU CAPL-1000-BROWSE-X.
               
           IF  NOT WCAPL-IO-OK 
               GO TO  3400-UPDT-CAPL-APL-REV-X
           END-IF.
               
           PERFORM  CAPL-2000-READ-NEXT   
               THRU CAPL-2000-READ-NEXT-X. 
               
          IF  WCAPL-IO-OK
              MOVE RCAPL-POL-ID            TO WCAPL-POL-ID
              MOVE RCAPL-SEQ-NUM           TO WCAPL-SEQ-NUM
          ELSE
              PERFORM CAPL-3000-END-BROWSE
                  THRU CAPL-3000-END-BROWSE-X
              PERFORM  3100-CREAT-CAPL-REC
                  THRU 3100-CREAT-CAPL-REC-X                     
              GO TO 3400-UPDT-CAPL-APL-REV-X
          END-IF. 
           
           PERFORM  CAPL-3000-END-BROWSE 
               THRU CAPL-3000-END-BROWSE-X.
           
           PERFORM  CAPL-1000-READ-FOR-UPDATE
               THRU CAPL-1000-READ-FOR-UPDATE-X.
      
           IF NOT WCAPL-IO-OK
               GO TO 3400-UPDT-CAPL-APL-REV-X
           ELSE
               
               SET  RCAPL-COMM-PAY-STAT-REVERSED 
                                            TO TRUE
               SET  WS-PREV-COMM-PAY-STAT-ACTIVE 
                                            TO TRUE
               MOVE WS-PREV-COMM-PAY-STAT-CD
                                            TO 
                                      RCAPL-PREV-COMM-PAY-STAT-CD
               MOVE RCAPL-COMM-PAYBL-AMT    TO WS-COMM-PAYBL-AMT
               MOVE RCAPL-PREV-COMM-PAYBL-AMT
                                            TO RCAPL-COMM-PAYBL-AMT
               MOVE WS-COMM-PAYBL-AMT       TO 
                                      RCAPL-PREV-COMM-PAYBL-AMT
               MOVE RCAPL-COMM-BAL-AMT      TO WS-COMM-BAL-AMT
               MOVE RCAPL-PREV-COMM-BAL-AMT TO RCAPL-COMM-BAL-AMT
               MOVE WS-COMM-BAL-AMT         TO RCAPL-PREV-COMM-BAL-AMT
           END-IF.
            
           PERFORM  CAPL-2000-REWRITE
               THRU CAPL-2000-REWRITE-X.
          
       3400-UPDT-CAPL-APL-REV-X.
           EXIT.
      /
      *-----------------------
       3500-UPDT-CAPL-APL-INT.
      *-----------------------
      
           MOVE LOW-VALUES                  TO WCAPL-KEY.
           MOVE HIGH-VALUES                 TO WCAPL-ENDBR-KEY.
           
           MOVE R9D16-POL-ID                TO WCAPL-POL-ID
                                            WCAPL-ENDBR-POL-ID.
           MOVE 999                         TO WCAPL-ENDBR-SEQ-NUM.
           MOVE ZERO                        TO WCAPL-SEQ-NUM.
           
           PERFORM  CAPL-1000-BROWSE
               THRU CAPL-1000-BROWSE-X.
               
            IF NOT WCAPL-IO-OK    
               GO TO 3500-UPDT-CAPL-APL-INT-X
            END-IF. 
            
           PERFORM  CAPL-2000-READ-NEXT   
               THRU CAPL-2000-READ-NEXT-X.
               
          IF  WCAPL-IO-OK
              MOVE RCAPL-POL-ID            TO WCAPL-POL-ID
              MOVE RCAPL-SEQ-NUM           TO WCAPL-SEQ-NUM
          ELSE
               PERFORM CAPL-3000-END-BROWSE
                  THRU CAPL-3000-END-BROWSE-X
              GO TO 3500-UPDT-CAPL-APL-INT-X
          END-IF. 
           
           
           PERFORM  CAPL-3000-END-BROWSE 
               THRU CAPL-3000-END-BROWSE-X.
           
           PERFORM  CAPL-1000-READ-FOR-UPDATE
               THRU CAPL-1000-READ-FOR-UPDATE-X.
           
           IF  WCAPL-IO-NOT-FOUND
               GO TO 3500-UPDT-CAPL-APL-INT-X 
           END-IF. 
         
           MOVE RCAPL-COMM-PAYBL-AMT        TO 
                                           RCAPL-PREV-COMM-PAYBL-AMT.
          
           ADD  WS-LOAN-INCR-DECR-AMT   TO 
                                           RCAPL-COMM-PAYBL-AMT
            
           PERFORM  CAPL-2000-REWRITE
               THRU CAPL-2000-REWRITE-X.
               
       3500-UPDT-CAPL-APL-INT-X.
          EXIT. 
      /          
      *-----------------------
       3600-UPDT-CAPL-REP-REC.
      *-----------------------
      
           MOVE LOW-VALUES                  TO WCAPL-KEY.
           MOVE HIGH-VALUES                 TO WCAPL-ENDBR-KEY.
          
           MOVE RPOL-POL-ID                 TO WCAPL-POL-ID
                                            WCAPL-ENDBR-POL-ID.
           MOVE 999                         TO WCAPL-ENDBR-SEQ-NUM.
           MOVE ZERO                        TO WCAPL-SEQ-NUM.
           
           PERFORM  CAPL-1000-BROWSE
               THRU CAPL-1000-BROWSE-X.
           
           IF NOT WCAPL-IO-OK
              GO TO 3600-UPDT-CAPL-REP-REC-X
           END-IF.
           
           PERFORM  CAPL-2000-READ-NEXT
               THRU CAPL-2000-READ-NEXT-X.
           
           IF  WCAPL-IO-OK
               MOVE RCAPL-POL-ID            TO WCAPL-POL-ID
               MOVE RCAPL-SEQ-NUM           TO WCAPL-SEQ-NUM
           ELSE    
               PERFORM  CAPL-3000-END-BROWSE    
                   THRU CAPL-3000-END-BROWSE-X    
               GO TO 3600-UPDT-CAPL-REP-REC-X
           END-IF. 
           
           PERFORM  CAPL-3000-END-BROWSE
               THRU CAPL-3000-END-BROWSE-X.
          
            PERFORM  CAPL-1000-READ-FOR-UPDATE
                THRU CAPL-1000-READ-FOR-UPDATE-X.
          
            IF  WCAPL-IO-NOT-FOUND
                GO TO 3600-UPDT-CAPL-REP-REC-X
            END-IF.
          
            PERFORM  3700-MOVE-CAPL-VAL
                THRU 3700-MOVE-CAPL-VAL-X.
               
       3600-UPDT-CAPL-REP-REC-X.
           EXIT.               
      /               
      *--------------------
       3700-MOVE-CAPL-VAL.
      *--------------------
       
           MOVE RCAPL-COMM-PAYBL-AMT        TO 
                                            RCAPL-PREV-COMM-PAYBL-AMT.
           
           MOVE WS-POL-LOAN-TRXN-AMT        TO 
                                            WS-REPAY-AMT.
                                            
           COMPUTE WS-REPAY-AMT = WS-REPAY-AMT
                                 + RCAPL-COMM-BAL-AMT.
                                 
           IF  RCAPL-COMM-PAYBL-AMT > WS-REPAY-AMT
               SET WS-REPAY-NO           TO TRUE
               IF  RCAPL-POL-MPREM-AMT > WS-REPAY-AMT
                   MOVE WS-REPAY-AMT     TO RCAPL-COMM-BAL-AMT
           
                   PERFORM  CAPL-2000-REWRITE
                       THRU CAPL-2000-REWRITE-X
                   GO TO  3700-MOVE-CAPL-VAL-X
               END-IF
           
               COMPUTE WS-REPAY-MODE = WS-REPAY-AMT 
                                   / RCAPL-POL-MPREM-AMT
               COMPUTE WS-PAR-REPAY-AMT  = WS-REPAY-MODE 
                                   * RCAPL-POL-MPREM-AMT
               COMPUTE WS-COMM-PAYBL-AMT = RCAPL-COMM-PAYBL-AMT
                                        - WS-PAR-REPAY-AMT
               COMPUTE RCAPL-COMM-BAL-AMT = WS-REPAY-AMT
                                      - WS-PAR-REPAY-AMT
               MOVE RCAPL-COMM-PAYBL-AMT    TO 
                             RCAPL-PREV-COMM-PAYBL-AMT
               MOVE WS-COMM-PAYBL-AMT       TO RCAPL-COMM-PAYBL-AMT
               MOVE RPOL-POL-MPREM-AMT      TO RCAPL-POL-MPREM-AMT
           
           ELSE 
               COMPUTE WS-REPAY-AMT =  WS-REPAY-AMT
                                      - RCAPL-COMM-PAYBL-AMT
               MOVE RCAPL-COMM-PAYBL-AMT    TO 
                                           RCAPL-PREV-COMM-PAYBL-AMT
               MOVE RCAPL-COMM-BAL-AMT      TO 
                                           RCAPL-PREV-COMM-BAL-AMT
               MOVE ZEROES                  TO 
                                           RCAPL-COMM-PAYBL-AMT
               MOVE ZEROES                  TO 
                                           RCAPL-COMM-BAL-AMT
               MOVE RCAPL-COMM-PAY-STAT-CD  TO 
                                           RCAPL-PREV-COMM-PAY-STAT-CD
               SET  RCAPL-COMM-PAY-STAT-HISTORY 
                                            TO TRUE
               MOVE RPOL-POL-MPREM-AMT      TO RCAPL-POL-MPREM-AMT                                            
           END-IF.
           
           PERFORM  CAPL-2000-REWRITE
               THRU CAPL-2000-REWRITE-X.
               
       3700-MOVE-CAPL-VAL-X.
           EXIT.
      /           
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  9D16-4000-CLOSE
               THRU 9D16-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
            EXIT.
      /
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
      / 
       COPY CCPACAPL.
       COPY CCPBCAPL.
       COPY CCPVCAPL.
       COPY CCPUCAPL.
       COPY CCPNPOL.
      /
       COPY CCPNLHST.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 9D16
                                ==':PGM:'== BY =='ZSRQ9D16'==.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY  ==9D16==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9D16.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
      /
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPL0030.
      /
       COPY XCPL0035.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
      /
       COPY XCPL1680.
      *****************************************************************
      *                END OF PROGRAM ZSBM9D16                        *
      ******************************************************************